From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 12 Feb 2016 23:31:18 +0100
Subject: [Buildroot] [autobuilder] autobuild-run: add exception for Nios2
	toolchain using GCC 4.9.3
Message-ID: <1455316278-7521-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This issue has been fixed with GCC 5.3.

Fixes:
http://autobuild.buildroot.net/results/4e2/4e2b3207fb56941aa84b5d2cd53ba91bb2c20e17

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ca5bdfc..2f6e950 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -473,6 +473,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This Nios2 toolchain trigger a compiler bug with gcc 4.9.3
+    if 'BR2_PACKAGE_LIBCAP_NG=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2015.11-rc1-71-g90d1299.tar.bz2"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.4.3
