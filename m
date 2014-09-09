From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Sep 2014 23:06:26 +0200
Subject: [Buildroot] [git commit] linenoise: install nothing on target
Message-ID: <20140909210718.1C70F9D3E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba1cc18cabd217e3ccdbaa7d993fb9f75b9853b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linenoise is a static library, so it's enough to install on staging.
and the linenoise_example executable is not really useful.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linenoise/linenoise.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 562b445..aff0c7d 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -8,6 +8,8 @@ LINENOISE_VERSION = 828b9dacc52d4ad5a15c89be8fb8691d224f9a4f
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
 LINENOISE_INSTALL_STAGING = YES
+# Static library only, nothing to install on target
+LINENOISE_INSTALL_TARGET = NO
 
 define LINENOISE_BUILD_CMDS
 	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
@@ -21,10 +23,4 @@ define LINENOISE_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(TARGET_DIR)/usr/include/linenoise.h
-	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(TARGET_DIR)/usr/lib/liblinenoise.a
-	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(TARGET_DIR)/usr/bin/linenoise_example
-endef
-
 $(eval $(generic-package))
