From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:01 +0200
Subject: [Buildroot] [PATCH v12 01/32] toolchain: add option to copy the
	gconv libraries
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The gconv libraries are used to translate between different character
sets (charsets).

In (e)glibc they are implemented by the internal implemenation of
iconv, called gconv, and are provided as dlopen-able libraries.

Some packages need them to present text to the user (eg. XBMC Gotham).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Makefile                      |    6 ++++++
 toolchain/toolchain-common.in |   10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Makefile b/Makefile
index 0b4264a..4a819a8 100644
--- a/Makefile
+++ b/Makefile
@@ -395,6 +395,9 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ifneq ($(GENERATE_LOCALE),)
 TARGETS += target-generatelocales
 endif
+ifeq ($(BR2_COPY_GCONV_LIBS),y)
+TARGETS += target-copygconvlibs
+endif
 endif
 
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
@@ -620,6 +623,9 @@ target-generatelocales: host-localedef toolchain
 	done
 endif
 
+target-copygconvlibs:
+	$(Q)cp -a $(STAGING_DIR)/usr/lib/gconv $(TARGET_DIR)/usr/lib/gconv
+
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1573e00..59ec64e 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -77,6 +77,16 @@ config BR2_GENERATE_LOCALE
 	  specified, UTF-8 is assumed. Examples of locales: en_US,
 	  fr_FR.UTF-8.
 
+config BR2_COPY_GCONV_LIBS
+	bool "copy gconv libs"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The gconv libraries are used to convert between different
+	  character sets (charsets).
+
+	  Say 'y' if you need to store and/or display different charsets.
+	  Note that the full set of gconv libraries is worth around 7MiB.
+
 # glibc and eglibc directly include gettext, so a separatly compiled
 # gettext isn't needed and shouldn't be built to avoid conflicts. Some
 # packages always need gettext, other packages only need gettext when
-- 
1.7.10.4
