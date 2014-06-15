From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Jun 2014 22:37:26 +0200
Subject: [Buildroot] [PATCH v2] toolchain: add option to copy the gconv
	libraries
Message-ID: <1402864646-14963-1-git-send-email-yann.morin.1998@free.fr>
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
Changes v1->v2:
  - add option to install only a select list of gconv libs (Thomas)
  - rename the option (Thomas)

Now the patch is on the list, I won't loose it again! :-)

---
 Makefile                      | 18 ++++++++++++++++++
 toolchain/toolchain-common.in | 22 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Makefile b/Makefile
index 14fca2b..e01f40b 100644
--- a/Makefile
+++ b/Makefile
@@ -395,6 +395,9 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ifneq ($(GENERATE_LOCALE),)
 TARGETS += target-generatelocales
 endif
+ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
+TARGETS += target-copygconvlibs
+endif
 endif
 
 ifeq ($(BR2_ECLIPSE_REGISTER),y)
@@ -623,6 +626,21 @@ target-generatelocales: host-localedef toolchain
 	done
 endif
 
+GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
+
+target-copygconvlibs:
+	$(Q)$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
+				  $(TARGET_DIR)/usr/lib/gconv/gconv-modules
+	$(Q)if [ -z "$(GCONV_LIBS)" ]; then \
+		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
+				   $(TARGET_DIR)/usr/lib/gconv; \
+	else \
+		for l in $(GCONV_LIBS); do \
+			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${l}.so \
+					      $(TARGET_DIR)/usr/lib/gconv/$${l}.so; \
+		done; \
+	fi
+
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index a91d247..13de9e5 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -77,6 +77,28 @@ config BR2_GENERATE_LOCALE
 	  specified, UTF-8 is assumed. Examples of locales: en_US,
 	  fr_FR.UTF-8.
 
+config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
+	bool "Copy gconv libraries"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  The gconv libraries are used to convert between different
+	  character sets (charsets).
+
+	  Say 'y' if you need to store and/or display different charsets.
+
+config BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST
+	string "Gconv libraries to copy"
+	depends on BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
+	help
+	  Set to the list of gconv libraries to copy.
+	  Leave empty to copy all gconv libraries.
+
+	  Specify only the basename of the libraries, leave
+	  out the .so extension. Eg.:
+	    IBM850 ISO8859-15 UNICODE
+
+	  Note: the full set of gconv libs are ~8MiB (on ARM).
+
 # glibc and eglibc directly include gettext, so a separatly compiled
 # gettext isn't needed and shouldn't be built to avoid conflicts. Some
 # packages always need gettext, other packages only need gettext when
-- 
1.8.3.2
