From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:30:06 +0100
Subject: [Buildroot] [git commit] package/exim: Add support for SMTP AUTH
	through Dovecot
Message-ID: <20141030213316.A2FF5B23B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee6789f0cda2ad43921b728a9f1d4922c7380f0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index f6016fa..b6fe202 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -48,6 +48,13 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
 	$(call exim-config-unset,EXIM_MONITOR)
 endef
 
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
@@ -65,6 +72,7 @@ endef
 else # CUSTOM_CONFIG
 define EXIM_CONFIGURE_CMDS
 	$(EXIM_USE_DEFAULT_CONFIG_FILE)
+	$(EXIM_USE_DEFAULT_CONFIG_FILE_DOVECOT)
 	$(EXIM_CONFIGURE_TOOLCHAIN)
 endef
 endif # CUSTOM_CONFIG
