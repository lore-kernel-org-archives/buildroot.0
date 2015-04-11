From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 20:01:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: Add optional OpenSSL support
Message-ID: <1428775279-20078-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index f39445d..967b782 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -62,6 +62,14 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+EXIM_DEPENDENCIES += openssl
+define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
+	$(call exim-config-change,SUPPORT_TLS,yes)
+	$(call exim-config-change,TLS_LIBS,-lssl -lcrypto)
+endef
+endif
+
 # this specific toolchain lacks libnsl
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
 define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
@@ -89,6 +97,7 @@ define EXIM_CONFIGURE_CMDS
 	$(EXIM_USE_DEFAULT_CONFIG_FILE)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
+	$(EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL)
 	$(EXIM_CONFIGURE_TOOLCHAIN)
 endef
 endif # CUSTOM_CONFIG
-- 
1.7.10.4
