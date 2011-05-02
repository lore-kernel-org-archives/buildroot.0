From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2011 16:08:22 -0300
Subject: [Buildroot] [PATCH 2/3] libxml2: fixup configure options
In-Reply-To: <1304363303-14984-1-git-send-email-gustavo@zacarias.com.ar>
References: <1304363303-14984-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1304363303-14984-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some configure options changed so adjust.
Forcibly disabling threads isn't good and also it's detected by
configure when there are no threads.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxml2/libxml2.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 2a267b2..8f2878d 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -12,10 +12,7 @@ ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
-LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
-		--enable-static \
-		--without-debugging --without-python \
-		--without-threads
+LIBXML2_CONF_OPT = --with-gnu-ld --without-python --without-debug
 
 define LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
@@ -26,9 +23,7 @@ LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
 
 HOST_LIBXML2_DEPENDENCIES = host-pkg-config
 
-HOST_LIBXML2_CONF_OPT = \
-		--enable-shared --without-debugging --without-python \
-		--without-threads
+HOST_LIBXML2_CONF_OPT = --without-debug --without-python
 
 define LIBXML2_REMOVE_CONFIG_SCRIPTS
 	$(RM) -f $(TARGET_DIR)/usr/bin/xml2-config
-- 
1.7.3.4
