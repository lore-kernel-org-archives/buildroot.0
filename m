From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 20:01:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: Add optional libiconv support
In-Reply-To: <1428775279-20078-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428775279-20078-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1428775279-20078-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 967b782..bb3a9fa 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -44,7 +44,6 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(call exim-config-change,TRANSPORT_LMTP,yes)
 	$(call exim-config-change,PCRE_LIBS,-lpcre)
 	$(call exim-config-change,PCRE_CONFIG,no)
-	$(call exim-config-change,HAVE_ICONV,no)
 	$(call exim-config-unset,EXIM_MONITOR)
 endef
 
@@ -62,6 +61,18 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+EXIM_DEPENDENCIES += libiconv
+define EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV
+	$(call exim-config-change,HAVE_ICONV,yes)
+	$(call exim-config-add,EXTRALIBS_EXIM,-liconv)
+endef
+else
+define EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV
+	$(call exim-config-change,HAVE_ICONV,no)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 EXIM_DEPENDENCIES += openssl
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
@@ -97,6 +108,7 @@ define EXIM_CONFIGURE_CMDS
 	$(EXIM_USE_DEFAULT_CONFIG_FILE)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
+	$(EXIM_USE_DEFAULT_CONFIG_FILE_LIBICONV)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL)
 	$(EXIM_CONFIGURE_TOOLCHAIN)
 endef
-- 
1.7.10.4
