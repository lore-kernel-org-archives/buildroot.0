From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 16:41:56 -0300
Subject: [Buildroot] [PATCH] gcc: disable libsanitizer for sparc
Message-ID: <1429126916-21809-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Normally libsanitizer handles the different functionalities gracefully for
each architecture, but it doesn't seem to be the case for SPARC.
Since in general it doesn't support anything for SPARC just disable it.

Fixes bug #7951.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 24fd7b8..be242cb 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -126,6 +126,12 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
+# libsanitizer is broken for SPARC
+# https://bugs.busybox.net/show_bug.cgi?id=7951
+ifeq ($(BR2_sparc),y)
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
+endif
+
 ifeq ($(BR2_GCC_ENABLE_TLS),y)
 HOST_GCC_COMMON_CONF_OPTS += --enable-tls
 else
-- 
2.0.5
