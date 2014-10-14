From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Oct 2014 21:16:25 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/exim: Add support for SMTP AUTH
	through Dovecot
In-Reply-To: <1413314185-6421-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413314185-6421-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413314185-6421-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: Initial version

 package/exim/exim.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 9ae94c3..43f1a6b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -55,6 +55,13 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_DOVECOT),y)
+EXIM_DEPENDENCIES += dovecot
+define EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT
+	$(call exim-config-change,AUTH_DOVECOT,yes)
+endef
+endif
+
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
@@ -73,6 +80,7 @@ else # CUSTOM_CONFIG
 define EXIM_CONFIGURE_CMDS
 	$(EXIM_USE_DEFAULT_CONFIG_FILE)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
+	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
 	$(EXIM_CONFIGURE_TOOLCHAIN)
 endef
 endif # CUSTOM_CONFIG
-- 
1.7.10.4
