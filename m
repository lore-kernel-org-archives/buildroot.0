From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:46:43 +0200
Subject: [Buildroot] [git commit] package/gcc: disable libsanitizer for
	uClibc
Message-ID: <20140424132247.C529E9C969@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=554e29e267e6b36a0fd78c82cbad2c82d939eb7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsanitizer requires wordexp() support which we lack in our current
default uClibc configurations (and it's fat & big).
Hence disable it when the toolchain is uClibc-based.
It only affects gcc 4.9+ since it's default on now for supported
platforms.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
