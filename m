From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 23:09:24 +0200
Subject: [Buildroot] [PATCH] toolchain: add option to copy the gconv
	libraries
Message-ID: <1405458564-32091-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
Change v3 -> v4:
  - fix superfluous semi-colon before '||'

Changes v2 -> v3:
  - properly fail if a specified lib is missing (e.g. typo)

Changes v1 -> v2:
  - add option to install only a select list of gconv libs (Thomas)
  - rename the option (Thomas)
---
 Makefile                      | 20 ++++++++++++++++++++
 toolchain/toolchain-common.in | 22 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Makefile b/Makefile
index 1af51de..2fb7478 100644
--- a/Makefile
+++ b/Makefile
@@ -551,6 +551,26 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
+GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
+define COPY_GCONV_LIBS
+	$(Q)$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
+				  $(TARGET_DIR)/usr/lib/gconv/gconv-modules
+	$(Q)if [ -z "$(GCONV_LIBS)" ]; then \
+		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
+				   $(TARGET_DIR)/usr/lib/gconv \
+		|| exit 1; \
+	else \
+		for l in $(GCONV_LIBS); do \
+			$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/$${l}.so \
+					      $(TARGET_DIR)/usr/lib/gconv/$${l}.so \
+			|| exit 1; \
+		done; \
+	fi
+endef
+TARGET_FINALIZE_HOOKS += COPY_GCONV_LIBS
+endif
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
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
1.9.1
