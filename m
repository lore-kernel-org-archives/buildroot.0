From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 May 2014 14:14:12 -0300
Subject: [Buildroot] [PATCH] inadyn: bump to version 1.99.9
Message-ID: <1400692452-30405-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/inadyn.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 3886390..21e983e 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,11 +4,20 @@
 #
 ################################################################################
 
-INADYN_VERSION = 1.99.7
+INADYN_VERSION = 1.99.9
 INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
 INADYN_LICENSE = GPLv2+
 INADYN_LICENSE_FILES = COPYING LICENSE
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+INADYN_DEPENDENCIES += openssl
+else
+define INADYN_DISABLE_OPENSSL
+	$(SED) '/ssl/Id' $(@D)/config.mk
+endef
+endif
+INADYN_POST_PATCH_HOOKS += INADYN_DISABLE_OPENSSL
+
 define INADYN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
-- 
1.8.5.5
