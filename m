From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Apr 2014 15:13:36 -0300
Subject: [Buildroot] [PATCH] package/gcc: disable libsanitizer for uClibc
Message-ID: <1398190416-31738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsanitizer requires wordexp() support which we lack in our current
default uClibc configurations (and it's fat & big).
Hence disable it when the toolchain is uClibc-based.
It only affects gcc 4.9+ since it's default on now for supported
platforms.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index dff6dce..32219cc 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -125,6 +125,11 @@ ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
 endif
 
+# libsanitizer requires wordexp, not in default uClibc config
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC),y)
+HOST_GCC_COMMON_CONF_OPT += --disable-libsanitizer
+endif
+
 ifeq ($(BR2_GCC_ENABLE_TLS),y)
 HOST_GCC_COMMON_CONF_OPT += --enable-tls
 else
-- 
1.8.3.2
