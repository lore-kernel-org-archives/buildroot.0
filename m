From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 16:42:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/exim: Add ClamAV support
In-Reply-To: <1411915333-5976-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411915333-5976-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1411915333-5976-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index f6016fa..9ae94c3 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -48,6 +48,13 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(call exim-config-unset,EXIM_MONITOR)
 endef
 
+ifeq ($(BR2_PACKAGE_CLAMAV),y)
+EXIM_DEPENDENCIES += clamav
+define EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV
+	$(call exim-config-change,WITH_CONTENT_SCAN,yes)
+endef
+endif
+
 define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,CC,$(TARGET_CC))
 	$(call exim-config-add,CFLAGS,$(TARGET_CFLAGS))
@@ -65,6 +72,7 @@ endef
 else # CUSTOM_CONFIG
 define EXIM_CONFIGURE_CMDS
 	$(EXIM_USE_DEFAULT_CONFIG_FILE)
+	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
 	$(EXIM_CONFIGURE_TOOLCHAIN)
 endef
 endif # CUSTOM_CONFIG
-- 
1.7.10.4
