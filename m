From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 22:03:04 +0200
Subject: [Buildroot] [autobuild] autobuild-run: add
	br-sh4-full-2015.05/opencv exception
Message-ID: <1435262584-1192-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid the following build failures:

  /tmp/ccCR4s15.s: Assembler messages:
  /tmp/ccCR4s15.s:19880: Error: pcrel too far

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
This patch is related to this series:
  http://lists.busybox.net/pipermail/buildroot/2015-June/130838.html
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 340cb63..9388795 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -475,6 +475,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This sh4 toolchain fails to build opencv package
+    if 'BR2_PACKAGE_OPENCV=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2015.05.tar.bz2"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.4.4
