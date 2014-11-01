From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:54:34 +0100
Subject: [Buildroot] [git commit] package/exim: Add ClamAV support
Message-ID: <20141101145445.4A715B2A69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af96cc2e32076112ef12808f4ad8ffa3102f3c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exim/exim.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
