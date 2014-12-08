From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 12:34:55 +0000
Subject: [Buildroot] [PATCH] autobuild-run: Do not build civetweb with a
	known non-working external MIPS toolchain
Message-ID: <1418042095-29450-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This MIPS uClibc toolchain doesn't have the needed fix in order to build
the civetweb package statically for uClibc. It fails with messages like
these ones:

 libdl.c:(.text+0x1840): undefined reference to `TLS_DTPREL_VALUE'
 libdl.c:(.text+0x1884): undefined reference to `TLS_TPREL_VALUE'

This is due to certain missing fixes in uClibc, as built by Crosstool-NG.

Related:
  http://lists.uclibc.org/pipermail/uclibc/2013-April/047708.html
  http://git.buildroot.net/buildroot/commit/?id=c0b4c45780e4ffe23101a407e7c4cde22e27815a

Fixes:
  http://autobuild.buildroot.net/results/9b5/9b5a5f5e1c4331d6ba44a12f66f74d950ee69ada/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 993c578..4ac0c7b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -310,6 +310,10 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This MIPS uClibc toolchain fails to build the civetweb package
+    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
+        return False
     # This MIPS ctng toolchain fails to build the python3 package
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-- 
1.7.1
