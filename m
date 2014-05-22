From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 May 2014 11:11:17 +0200
Subject: [Buildroot] [git commit branch/next] inadyn: bump to version 1.99.9
Message-ID: <20140522091455.365019CD33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41398fa8d92ef43df11fdbe49981b9f3305df4b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

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
