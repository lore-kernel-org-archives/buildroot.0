From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 07:59:40 +0200
Subject: [Buildroot] [git commit] gcc: disable libsanitizer for sparc
Message-ID: <20150416055946.E08448189D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0046e533fe22240f6eda7048d2733b01adb15ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally libsanitizer handles the different functionalities gracefully for
each architecture, but it doesn't seem to be the case for SPARC.
Since in general it doesn't support anything for SPARC just disable it.

Fixes bug #7951.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
