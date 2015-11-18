From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2015 22:47:10 +0100
Subject: [Buildroot] [git commit] core: check host executables have
	appropriate RPATH
Message-ID: <20151118222837.C898F81EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c0c38522605413170a10c45ac08d46c4ed076af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we build our host programs, and they depend on a host library we
also build, we want to ensure that program actually uses that library at
runtime, and not the one from the system.

We currently ensure that in two ways:
  - we add a RPATH tag that points to our host library directory,
  - we export LD_LIBRARY_PATH to point to that same directory.

With these two in place, we're pretty much confident that our host
libraries will be used by our host programs.

However, it turns our that not all the host programs we build end up
with an RPATH tag:
  - some packages do not use our $(HOST_LDFLAGS)
  - some packages' build system are oblivious to those LDFLAGS

In this case, there are two situations:
  - the program is not linked to one of our host libraries: it in fact
    does not need an RPATH tag [0]
  - the program actually uses one of our host libraries: in that case it
    should have had an RPATH tag pointing to the host directory.

For libraries, they only need an RPATH if they depend on another library
that is not installed in the standard library path. However, any system
library will already be in the standard library path, and any library we
install ourselves is in $(HOST_DIR)/usr/lib so already in RPATH.

We add a new support script that checks that all ELF executables have
a proper DT_RPATH (or DT_RUNPATH) tag when they link to our host
libraries, and reports those file that are missing an RPATH. If a file
missing an RPATH is an executable, the script aborts; if only libraries
are are missing an RPATH, the script does not abort.

[0] Except if it were to dlopen() it, of course, but the only program
I'm aware of that does that is openssl, and it has a correct RPATH tag.

[Peter: reworded as suggested by Arnout, fix HOT_DIR typo in comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk           |    8 ++++
 support/scripts/check-host-rpath |   71 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 08f4f31..357a5c7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -87,6 +87,14 @@ define step_pkg_size
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
+# This hook checks that host packages that need libraries that we build
+# have a proper DT_RPATH or DT_RUNPATH tag
+define check_host_rpath
+	$(if $(filter install-host,$(2)),\
+		$(if $(filter end,$(1)),support/scripts/check-host-rpath $(3) $(HOST_DIR)))
+endef
+GLOBAL_INSTRUMENTATION_HOOKS += check_host_rpath
+
 # User-supplied script
 ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 define step_user
diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
new file mode 100755
index 0000000..dc9e17f
--- /dev/null
+++ b/support/scripts/check-host-rpath
@@ -0,0 +1,71 @@
+#!/usr/bin/env bash
+
+# This script scans $(HOST_DIR)/{bin,sbin} for all ELF files, and checks
+# they have an RPATH to $(HOST_DIR)/usr/lib if they need libraries from
+# there.
+
+# Override the user's locale so we are sure we can parse the output of
+# readelf(1) and file(1)
+export LC_ALL=C
+
+main() {
+    local pkg="${1}"
+    local hostdir="${2}"
+    local file ret
+
+    # Remove duplicate and trailing '/' for proper match
+    hostdir="$( sed -r -e 's:/+:/:g;' <<<"${hostdir}" )"
+
+    ret=0
+    while read file; do
+        elf_needs_rpath "${file}" "${hostdir}" || continue
+        check_elf_has_rpath "${file}" "${hostdir}" && continue
+        if [ ${ret} -eq 0 ]; then
+            ret=1
+            printf "***\n"
+            printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
+        fi
+        printf "***   %s\n" "${file}"
+    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -exec file {} + 2>/dev/null \
+              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
+                      -e 's//\1/'                                                  \
+            )
+
+    return ${ret}
+}
+
+elf_needs_rpath() {
+    local file="${1}"
+    local hostdir="${2}"
+    local lib
+
+    while read lib; do
+        [ -e "${hostdir}/usr/lib/${lib}" ] && return 0
+    done < <( readelf -d "${file}"                                         \
+              |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
+                     -e 's//\1/;'                                          \
+            )
+
+    return 1
+}
+
+check_elf_has_rpath() {
+    local file="${1}"
+    local hostdir="${2}"
+    local rpath dir
+
+    while read rpath; do
+        for dir in ${rpath//:/ }; do
+            # Remove duplicate and trailing '/' for proper match
+            dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
+            [ "${dir}" = "${hostdir}/usr/lib" ] && return 0
+        done
+    done < <( readelf -d "${file}"                                              \
+              |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
+                      -e 's//\3/;'                                              \
+            )
+
+    return 1
+}
+
+main "${@}"
