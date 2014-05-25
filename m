From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 19:12:58 -0300
Subject: [Buildroot] [WIP PATCH 3/5] libiconv: disable preloadable for
	static builds
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401055980-28742-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the preloadable libiconv variant when building for static
targets since that's not possible.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libiconv/libiconv.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index ee313ce..d2209bc 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -8,6 +8,14 @@ LIBICONV_VERSION = 1.14
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
 
+# Preloadable libiconv is for dynamic targets only
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define LIBICONV_DISABLE_PRELOAD
+	$(SED) '/preload/d' $(@D)/Makefile.in
+endef
+endif
+LIBICONV_PRE_CONFIGURE_HOOKS += LIBICONV_DISABLE_PRELOAD
+
 # Remove not used preloadable libiconv.so
 define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
-- 
1.8.5.5
