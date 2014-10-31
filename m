From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Oct 2014 22:15:20 +0100
Subject: [Buildroot] [PATCH v4 2/2] package/exim: Add ClamAV support
In-Reply-To: <1414790120-11704-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414790120-11704-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1414790120-11704-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
v4: rebased
v3: skipped
v2: skipped

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b6fe202..77f51e3 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -55,6 +55,13 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT
 endef
 endif
 
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
@@ -73,6 +80,7 @@ else # CUSTOM_CONFIG
 define EXIM_CONFIGURE_CMDS
 	$(EXIM_USE_DEFAULT_CONFIG_FILE)
 	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
+	$(EXIM_USE_DEFAULT_CONFIG_FILE_CLAMAV)
 	$(EXIM_CONFIGURE_TOOLCHAIN)
 endef
 endif # CUSTOM_CONFIG
-- 
1.7.10.4
