From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 15 Jan 2015 11:57:27 +0100
Subject: [Buildroot] [PATCH] autobuild-run: do not build python using a
	non-working toolchain
Message-ID: <1421319447-9659-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python package can't be built using this uClibc toolchain due to a
problem with redefinitions:

setregid.c:(.text+0x0): multiple definition of
`setregid'setregid.c:(.text+0x0): multiple definition of `setregid'

Reported upstream:
  http://lists.busybox.net/pipermail/uclibc/2014-October/048699.html

Fixes:
  http://autobuild.buildroot.net/results/74d/74deae1f7c81e319d1e7d00177f7c8e2c97b8ce8/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index b27b2fc..fb61a1d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -306,6 +306,10 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
+    # This MIPS uClibc toolchain fails to build the python package
+    if 'BR2_PACKAGE_PYTHON=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.11.tar.bz2"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.0.5
