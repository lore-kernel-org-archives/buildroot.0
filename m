From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 22:38:34 +0100
Subject: [Buildroot] [git commit] support/scripts/check-host-rpath: document
 existing functions
Message-ID: <20190117213835.7AD9F8434C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1e294cc15e42929b87c2ac184d368df66a701d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout Vandecappelle, let's document the
elf_needs_rpath() and check_elf_has_rpath() functions, before we make
them a bit more complicated with per-package directory support.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-host-rpath | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index 6c5767da05..c8939569e2 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -39,6 +39,11 @@ is_elf() {
     |grep -E 'Requesting program interpreter:' >/dev/null 2>&1
 }
 
+# This function tells whether a given ELF executable (first argument)
+# needs a RPATH pointing to the host library directory or not. It
+# needs such an RPATH if at least of the libraries used by the ELF
+# executable is available in the host library directory. This function
+# returns 0 when a RPATH is needed, 1 otherwise.
 elf_needs_rpath() {
     local file="${1}"
     local hostdir="${2}"
@@ -54,6 +59,13 @@ elf_needs_rpath() {
     return 1
 }
 
+# This function checks whether at least one of the RPATH of the given
+# ELF executable (first argument) properly points to the host library
+# directory (second argument), either through an absolute RPATH or a
+# relative RPATH. Having such a RPATH will make sure the ELF
+# executable will find at runtime the shared libraries it depends
+# on. This function returns 0 when a proper RPATH was found, or 1
+# otherwise.
 check_elf_has_rpath() {
     local file="${1}"
     local hostdir="${2}"
