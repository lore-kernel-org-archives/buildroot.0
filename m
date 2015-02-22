From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 15:31:31 +0100
Subject: [Buildroot] [PATCH v2 1/2] Apache: New package
In-Reply-To: <1423305664-29877-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423305664-29877-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150222153131.41d91e8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  7 Feb 2015 11:41:03 +0100, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: - rebased
>     - bump version to 2.4.12

Applied to next. There were however a number of issues: it simply
wasn't building here due to the absence of explicit libxml2 handling.
So it was trying to use my host libxml2 library, and failing. So I've
done the following changes:

[Thomas:
 - Don't explicitly pass CC_FOR_BUILD and CFLAGS_FOR_BUILD, those are
   already part of the default environment passed by the
   autotools-package infrastructure.
 - Explicitly disable Lua and LuaJIT support to avoid mis-detection of
   host installation.
 - Explicitly handle the optional support of libxml2, OpenSSL and
   zlib. Especially, the absence of explicit handling for libxml2 was
   causing a build failure due to the host libxml2 being detected.
 - Remove /usr/manual and /usr/build from the target. This saves 20+
   MB of target space.]

See also the full diff of my changes below. I believe there is more
room to clean up useless stuff from the target. Feel free to have a
look and send follow-up patches. Thanks!

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 026ef20..296e27e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -17,8 +17,6 @@ APACHE_AUTORECONF = YES
 APACHE_DEPENDENCIES = apr apr-util pcre
 
 APACHE_CONF_ENV= \
-	CC_FOR_BUILD="$(HOSTCC)" \
-	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 	ap_cv_void_ptr_lt_long=no \
 	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
 
@@ -33,16 +31,55 @@ APACHE_CONF_OPTS = \
 	--enable-mime-magic \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
-	--with-mpm=worker
+	--with-mpm=worker \
+	--disable-lua \
+	--disable-luajit
 
 ifeq ($(BR2_ARCH_HAS_ATOMICS),y)
 APACHE_CONF_OPTS += --enable-nonportable-atomics=yes
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+APACHE_DEPENDENCIES += libxml2
+# Apache wants the path to the header file, where it can find
+# <libxml/parser.h>.
+APACHE_CONF_OPTS += \
+	--enable-xml2enc \
+	--enable-proxy-html \
+	--with-libxml2=$(STAGING_DIR)/usr/include/libxml2
+else
+APACHE_CONF_OPTS += \
+	--disable-xml2enc \
+	--disable-proxy-html
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+APACHE_DEPENDENCIES += openssl
+APACHE_CONF_OPTS += \
+	--enable-ssl \
+	--with-ssl=$(STAGING_DIR)/usr
+else
+APACHE_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+APACHE_DEPENDENCIES += zlib
+APACHE_CONF_OPTS += \
+	--enable-deflate \
+	--with-z=$(STAGING_DIR)/usr
+else
+APACHE_CONF_OPTS += --disable-deflate
+endif
+
 define APACHE_FIX_STAGING_APACHE_CONFIG
 	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
 	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
 
+define APACHE_CLEANUP_TARGET
+	$(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build
+endef
+APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_CLEANUP_TARGET
+
 $(eval $(autotools-package))


-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
