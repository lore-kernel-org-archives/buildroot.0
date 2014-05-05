From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 May 2014 23:17:09 +0200
Subject: [Buildroot] [PATCHv2 09/10] gcc: disable libsanitizer for musl
In-Reply-To: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1399324630-3830-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A build issue affects libsanitizer on musl toolchains, even with
previous versions of gcc such as 4.8.x, so we disable building
libsanitizer when working with musl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3274821..741bb84 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -122,8 +122,9 @@ ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
 endif
 
-# libsanitizer requires wordexp, not in default uClibc config
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
+# libsanitizer requires wordexp, not in default uClibc config. Also
+# doesn't build properly with musl.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libsanitizer
 endif
 
-- 
1.9.2
