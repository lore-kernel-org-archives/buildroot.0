From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 22:01:46 +0100
Subject: [Buildroot] [git commit] qemu: add patch to fix SSP support
	detection
Message-ID: <20151118210152.C1F287FDDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=694fa0e332f8b3894a606619263c6ae38e4f6e20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QEMU configure script incorrectly assumes SSP is supported by the
toolchain in some cases where the compiler accepts -fstack-protector*
flags but the C library does not provide the necessary __stack_chk_*()
functions.

Even though a full compile and link test is performed by the script,
this is done with a code fragment which does not actually meet any of
the conditions required to cause the compiler to emit canary code when
the -fstack-protector-strong variant is used. As no compile or link
failure occurs in this case, a false positive is generated and a
subsequent error is seen when the probe for pthreads is performed.

The fix consists in patching the configure script to use a more
appropriate test program for the SSP support checks.

Fixes:

  http://autobuild.buildroot.net/results/efb/efbb4e940543894b8745bb405478a096c90a5ae2/
  http://autobuild.buildroot.net/results/32d/32d6d984febad2dee1f0d31c5fa0aea823297096/
  http://autobuild.buildroot.net/results/aa6/aa6e71c957fb6f07e7bded35a8e47be4dadd042c/
  ...and many others.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...se-appropriate-code-fragment-for-fstack-p.patch |   58 ++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
new file mode 100644
index 0000000..9ebe334
--- /dev/null
+++ b/package/qemu/0001-configure-use-appropriate-code-fragment-for-fstack-p.patch
@@ -0,0 +1,58 @@
+From 7b93e98143c376ed09bfd30658b8641d4a36e77e Mon Sep 17 00:00:00 2001
+From: Rodrigo Rebello <rprebello@gmail.com>
+Date: Thu, 12 Nov 2015 12:04:28 -0200
+Subject: [PATCH] configure: use appropriate code fragment for
+ -fstack-protector checks
+Cc: qemu-trivial at nongnu.org
+
+The check for stack-protector support consisted in compiling and linking
+the test program below (output by function write_c_skeleton()) with the
+compiler flag -fstack-protector-strong first and then with
+-fstack-protector-all if the first one failed to work:
+
+  int main(void) { return 0; }
+
+This caused false positives when using certain toolchains in which the
+compiler accepts -fstack-protector-strong but no support is provided by
+the C library, since in this stack-protector variant the compiler emits
+canary code only for functions that meet specific conditions (local
+arrays, memory references to local variables, etc.) and the code
+fragment under test included none of them (hence no stack protection
+code generated, no link failure).
+
+This fix modifies the test program used for -fstack-protector checks to
+meet conditions which cause the compiler to generate canary code in all
+variants.
+
+Upstream status: sent
+https://patchwork.ozlabs.org/patch/543357/
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ configure | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/configure b/configure
+index cd219d8..27d7b3c 100755
+--- a/configure
++++ b/configure
+@@ -1471,6 +1471,16 @@ for flag in $gcc_flags; do
+ done
+ 
+ if test "$stack_protector" != "no"; then
++  cat > $TMPC << EOF
++int main(int argc, char *argv[])
++{
++    char arr[64], *p = arr, *c = argv[0];
++    while (*c) {
++        *p++ = *c++;
++    }
++    return 0;
++}
++EOF
+   gcc_flags="-fstack-protector-strong -fstack-protector-all"
+   sp_on=0
+   for flag in $gcc_flags; do
+-- 
+2.1.4
+
