From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 14 Jan 2014 09:21:35 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain-external: Fix ld.so naming with
	uClibc and EABIhf.
In-Reply-To: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <1389687696-4824-2-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently ld-linux-armhf.so.* is added to external libs when
using an EABIhf toolchain, but this naming is not used by uClibc.
Fix by adding a check for glibc.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1084ee2..a7bfafc 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -63,7 +63,7 @@
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIB_EXTERNAL_LIBS+=libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
-ifeq ($(BR2_ARM_EABIHF),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
 LIB_EXTERNAL_LIBS+=ld-linux-armhf.so.*
 else
 LIB_EXTERNAL_LIBS+=ld*.so.*
-- 
1.8.4.2
