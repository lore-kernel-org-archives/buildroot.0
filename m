From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 13:35:32 +0000
Subject: [Buildroot] [PATCH] autobuild-run: do not build cdrkit using an
	incompatible toolchain
Message-ID: <1424007332-29351-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This MIPS-uClibc-Static toolchain can't build cdrkit. The issue was
reported upstream on October-2014:

http://lists.busybox.net/pipermail/uclibc/2014-October/048699.html

Fixes:

  http://autobuild.buildroot.net/results/b1ec2e994c9b1f2629f37f54e04b228ad13ce3ca/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 6ca1bf0..db51c3f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -319,6 +319,10 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.11.tar.bz2"\n' in configlines:
         return False
+    # This MIPS uClibc toolchain fails to build the cdrkit package
+    if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.7.1
