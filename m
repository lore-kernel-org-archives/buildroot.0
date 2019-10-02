From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Oct 2019 06:26:25 +0200
Subject: [Buildroot] [PATCH 3/4] package/libcurl: fix static build on ARM
 Cortex-M
In-Reply-To: <20191002042626.26676-1-bernd.kuhls@t-online.de>
References: <20191002042626.26676-1-bernd.kuhls@t-online.de>
Message-ID: <20191002042626.26676-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see
http://lists.busybox.net/pipermail/buildroot/2019-June/253203.html

Fixes:
http://autobuild.buildroot.net/results/aa0/aa0a9348afa068fc2a0ea54a84694b0ecc45e0b0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcurl/libcurl.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8384210d48..e85d159fa8 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -30,6 +30,12 @@ else
 LIBCURL_CONF_OPTS += --disable-threaded-resolver
 endif
 
+# workaround for elf2flt bug
+# https://github.com/uclinux-dev/elf2flt/issues/11
+ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_STATIC_LIBS),yy)
+LIBCURL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_VERBOSE),y)
 LIBCURL_CONF_OPTS += --enable-verbose
 else
-- 
2.20.1
