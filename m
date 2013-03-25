From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 08:51:55 +0100
Subject: [Buildroot] [PATCH] openswan: add missing TARGET_MAKE_ENV
Message-ID: <1364197915-10874-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openswan needs host-bison. The dependency was already there, but the
build was not executed with $(TARGET_MAKE_ENV) in the environment, and
therefore $(HOST_DIR)/usr/bin was not in the PATH.

While we're at it, add licensing informations to openswan.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openswan/openswan.mk |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 781dc00..153d659 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -6,6 +6,9 @@
 
 OPENSWAN_VERSION = 2.6.38
 OPENSWAN_SITE = http://download.openswan.org/openswan
+OPENSWAN_LICENSE = GPLv2+, BSD-3c
+OPENSWAN_LICENSE_FILES = COPYING LICENSE
+
 OPENSWAN_DEPENDENCIES = host-bison gmp iproute2
 OPENSWAN_MAKE_OPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
 	USERCOMPILE="$(TARGET_CFLAGS)" INC_USRLOCAL=/usr \
@@ -25,11 +28,13 @@ endif
 endif
 
 define OPENSWAN_BUILD_CMDS
-	$(MAKE) -C $(@D) $(OPENSWAN_MAKE_OPT) programs
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(OPENSWAN_MAKE_OPT) programs
 endef
 
 define OPENSWAN_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
