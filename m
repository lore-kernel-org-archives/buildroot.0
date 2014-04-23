From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:14:32 +0200
Subject: [Buildroot] [RFCv1 8/8] package/gcc: disable libsanitizer for
	uClibc and musl
In-Reply-To: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1398291272-17591-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

libsanitizer requires wordexp() support which we lack in our current
default uClibc configurations (and it's fat & big).
Hence disable it when the toolchain is uClibc-based.
It only affects gcc 4.9+ since it's default on now for supported
platforms.

Another build issue also affects libsanitizer on musl toolchains, even
with previous versions of gcc such as 4.8.x, so we disable it as well.

[Thomas: add the musl side of things.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index dff6dce..53c5174 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -125,6 +125,12 @@ ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
 endif
 
+# libsanitizer requires wordexp, not in default uClibc config. Also
+# doesn't build properly with musl.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
+HOST_GCC_COMMON_CONF_OPT += --disable-libsanitizer
+endif
+
 ifeq ($(BR2_GCC_ENABLE_TLS),y)
 HOST_GCC_COMMON_CONF_OPT += --enable-tls
 else
-- 
1.9.2
