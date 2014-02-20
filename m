From: Frank Bergmann <frank@frajasalo.de>
Date: Thu, 20 Feb 2014 22:59:37 +0100
Subject: [Buildroot] [PATCH v2 1/2] e2fsprogs: fix missing fallocate64() on
	nios2
Message-ID: <1392933578-2256-1-git-send-email-frank@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(external) nios2 toolchain is currently missing the fallocate64 system
call. Because of compiling the e2fsprogs package with _FILE_OFFSET_BITS=64,
_LARGEFILE_SOURCE and _LARGEFILE64_SOURCE the fallocate call is replaced
by fallocate64 by the glibc. Therefore fallocate is entirely disabled while
configuring the package.

Fixes http://autobuild.buildroot.org/results/70a/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/

Signed-off-by: Frank Bergmann <frank@frajasalo.de>
---
 package/e2fsprogs/e2fsprogs.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 2eb59f5..76e2d4e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -25,6 +25,10 @@ E2FSPROGS_CONF_OPT = \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
 
+ifeq ($(BR2_nios2),y)
+E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
+endif
+
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 
 E2FSPROGS_MAKE_OPT = \
-- 
1.7.10.4
