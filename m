From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Dec 2015 15:11:27 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
Message-ID: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Recently, a few patches by Yann E. Morin have entered Buildroot
master, which make sure that all host tools (output/host/usr/bin/...)
have a correct RPATH encoded, namely
/absolute/buildroot/output/host/usr/lib.

I believe this is one step closer to having a relocatable host SDK for
Buildroot. While I'm not claiming (nor have I tested) a completely
relocatable host SDK, by changing the RPATH from an absolute path to
'$ORIGIN/../lib'.

'$ORIGIN' here is a literal string encoded in the ELF binary and
replaced at runtime by the location of the binary. So, a binary
originally created in /home/foo/buildroot/output/host/usr/bin and run
from there will expect its libraries in
/home/foo/buildroot/output/host/usr/lib, but the same binary copied
and run from /tmp/hostsdk/bin will expect its libraries in
/tmp/hostsdk/lib.

One could even set a combined RPATH:
    $ORIGIN/../lib:/absolute/buildroot/output/host/usr/lib
Then, if one copies the binary but not the entire host directory,
things still work as 'expected'.

Reliably passing the string $ORIGIN from buildroot make to each
package such that the resulting binary still has the untouched $ORIGIN
string proves to be difficult. Depending on how the package Makefile
is treating the LDFLAGS, the dollar will be expanded or not.

My original attempt was to change package/Makefile.in directly and
pass -Wl,-rpath='\$$\$$ORIGIN/../lib' which worked for most cases, but
e.g. not for host-kmod (where the combination \$$\$$ became a shell $$
which expanded to a PID). The web is full of other developers that
face the same type of problems.

The alternative solution is to change the RPATH /after/ the package is
built, e.g. using patchelf. I have successfully used
    patchelf --set-rpath '$ORIGIN/../lib' <host-binary>
(this in fact sets RUNPATH rather than RPATH, which is fine too).

Exactly how/where this fits into the build process is up for
discussion. For my proof-of-concept I have abused the check-host-rpath
script. Here, host-patchelf was first built manually, but this should
be added as an automatic dependency.
This location is unfortunate, as it is run as an instrumentation hook.
If it fails, the package seems to be installed correctly (but with an
incorrect RPATH). Instead, HOST_FOO_POST_INSTALL_HOOKS is probably the
better place.

Perhaps, a configure option should be added that enables/disables this
feature, to avoid an unnecessary host-patchelf dependency for people
that don't need it.

I'm pasting my proof-of-concept below, just for reference. In no way
is this supposed to be code ready for inclusion.

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -58,8 +58,9 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_tim
 # This hook checks that host packages that need libraries that we build
 # have a proper DT_RPATH or DT_RUNPATH tag
 define check_host_rpath
+    $(if $(filter-out host-patchelf,$(3)),\
     $(if $(filter install-host,$(2)),\
-        $(if $(filter end,$(1)),support/scripts/check-host-rpath $(3)
$(HOST_DIR)))
+        $(if $(filter end,$(1)),support/scripts/check-host-rpath $(3)
$(HOST_DIR))))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -19,6 +19,7 @@ main() {
     ret=0
     while read file; do
         elf_needs_rpath "${file}" "${hostdir}" || continue
+        set_elf_rpath "${file}" "${hostdir}"
         check_elf_has_rpath "${file}" "${hostdir}" && continue
         if [ ${ret} -eq 0 ]; then
             ret=1
@@ -49,6 +50,12 @@ elf_needs_rpath() {
     return 1
 }

+set_elf_rpath() {
+    local file="${1}"
+    local hostdir="${2}"
+    ${hostdir}/usr/bin/patchelf --set-rpath '$ORIGIN/../lib' $file
+}
+
 check_elf_has_rpath() {
     local file="${1}"
     local hostdir="${2}"
@@ -58,7 +65,7 @@ check_elf_has_rpath() {
         for dir in ${rpath//:/ }; do
             # Remove duplicate and trailing '/' for proper match
             dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
-            [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
+            [ "${dir}" = '$ORIGIN/../lib' ] && return 0
         done
     done < <( readelf -d "${file}"
          \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path:
\[(.+)\]$/!d' \


Looking forward to your feedback.

/Thomas
