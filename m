From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 12 Oct 2014 08:35:07 +0000
Subject: [Buildroot] [PATCH] autobuild-run: Do not build rt-test with
 external MIPS uClibc
Message-ID: <38121FAB319C3344930C920E7B51831320FD40F1@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do not allow some external MIPS uClibc toolchains to build the
rt-tests package because they do not have the necessary fixes applied.

Related:
  http://git.buildroot.net/buildroot/commit/?id=af9d0442cdc8d10e1be55beb02d422194c94a6f9
  http://git.buildroot.net/buildroot/commit/?id=a47d19d41055da20139d532a253108e9b17c7950
  http://git.buildroot.net/buildroot/commit/?id=398e590e2d55668e9ef7420cc274f0afdd174684

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7497001..02ed668 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -284,6 +284,14 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
+    # This MIPS uClibc toolchain fails to build the rt-tests package
+    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
+        return False
+    # This MIPS uClibc toolchain fails to build the rt-tests package
+    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.0.4
