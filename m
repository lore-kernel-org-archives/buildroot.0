From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 11:43:25 +0200
Subject: [Buildroot] [PATCH] autobuild-run: Add an exception for CS nios2
	2016.05 with boost package.
Message-ID: <1477734205-13453-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain is affected by PR19405 and instead of adding a toolchain
dependency on boost package and it's reverse dependencies, use an
autobuilder exception.

https://sourceware.org/bugzilla/show_bug.cgi?id=19405

Fixes:
http://autobuild.buildroot.net/results/620/620b1cc2165a6d55c180b890fdb652f3a03e1ded

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index d78f836..19c1600 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -492,6 +492,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # The cs nios2 2016.05 toolchain is affected by PR19405
+    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
+       'BR2_PACKAGE_BOOST=y\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.5.5
