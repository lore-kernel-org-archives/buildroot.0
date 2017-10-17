From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:30:34 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] support/check-rpath:
	recognise PIE
Message-ID: <20171017090325.B0A2A7FCDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e6fb50dc0829bec9e26e9bfdf0034c017606d47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

We sanity-check the host executables that they have a correct RPATH
pointing to the host libraries.

This is currently done by looking for all files in $(HOST_DIR) that
match the 'ELF executable' pattern (a bit more complex, but that's
idea).

However, when an executable is built with -fPIE of -fpie, it no longer
appears to be an 'ELF executable', but it rather looks like an 'ELF
sheard object' (like if it were an library.

So, we miss those files.

It turns out that the problem is a real one, because quite a few
mainline distros, expecially those based on Debian for example, have
already switched to generating PIE code by default, and thus we miss on
a whole class of systems..

We fix that by simply looking if we can find an ELF interpreter in each
file. If we there is one, this is an ELF executable; if not, it may be
anything else: we don't care (not even about ELF libraries).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-host-rpath | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 74a25ba..169628d 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -18,6 +18,7 @@ main() {
 
     ret=0
     while read file; do
+        is_elf "${file}" || continue
         elf_needs_rpath "${file}" "${hostdir}" || continue
         check_elf_has_rpath "${file}" "${hostdir}" && continue
         if [ ${ret} -eq 0 ]; then
@@ -26,14 +27,18 @@ main() {
             printf "*** ERROR: package %s installs executables without proper RPATH:\n" "${pkg}"
         fi
         printf "***   %s\n" "${file}"
-    done < <( find "${hostdir}"/{bin,sbin} -type f -exec file {} + 2>/dev/null \
-              |sed -r -e '/^([^:]+):.*\<ELF\>.*\<executable\>.*/!d'                \
-                      -e 's//\1/'                                                  \
-            )
+    done < <( find "${hostdir}"/{bin,sbin} -type f 2>/dev/null )
 
     return ${ret}
 }
 
+is_elf() {
+    local f="${1}"
+
+    readelf -l "${f}" 2>/dev/null \
+    |grep -E 'Requesting program interpreter:' >/dev/null 2>&1
+}
+
 elf_needs_rpath() {
     local file="${1}"
     local hostdir="${2}"
