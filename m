From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 13:25:33 -0300
Subject: [Buildroot] [PATCH] inadyn: bump to version 1.99.11
Message-ID: <1413476733-3580-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update initscript for the /usr/sbin -> /usr/bin change which is the
default installation directory now that it's using autotools infra.
Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/S70inadyn   | 10 ++++++----
 package/inadyn/inadyn.hash |  2 ++
 package/inadyn/inadyn.mk   | 26 ++++++++++++--------------
 3 files changed, 20 insertions(+), 18 deletions(-)
 create mode 100644 package/inadyn/inadyn.hash

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index 24d0813..02a4c0d 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -14,12 +14,14 @@ VR_INADYN=/var/run/inadyn
 
 case "$1" in
         start)
-                echo "Starting inadyn."
-                start-stop-daemon -S -x /usr/sbin/inadyn
+                echo "Starting inadyn: "
+                start-stop-daemon -S -x /usr/bin/inadyn
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
                 ;;
         stop)
-                echo  "Stopping inadyn."
-                start-stop-daemon -q -K -x /usr/sbin/inadyn
+                echo  "Stopping inadyn: "
+                start-stop-daemon -q -K -x /usr/bin/inadyn
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
                 rm -f /var/run/inadyn/inadyn.pid
                 ;;
         restart)
diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
new file mode 100644
index 0000000..e69feb2
--- /dev/null
+++ b/package/inadyn/inadyn.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	7e2bfc5df32848abd814548c87bf1d2731ffcf34ad180d8204d94239cb7ad590	inadyn-1.99.11.tar.gz
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 21e983e..74bb679 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,33 +4,31 @@
 #
 ################################################################################
 
-INADYN_VERSION = 1.99.9
+INADYN_VERSION = 1.99.11
 INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
 INADYN_LICENSE = GPLv2+
 INADYN_LICENSE_FILES = COPYING LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+INADYN_CONF_OPTS += --enable-openssl
 INADYN_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+INADYN_DEPENDENCIES += gnutls
 else
-define INADYN_DISABLE_OPENSSL
-	$(SED) '/ssl/Id' $(@D)/config.mk
-endef
+INADYN_CONF_OPTS += --disable-ssl
 endif
-INADYN_POST_PATCH_HOOKS += INADYN_DISABLE_OPENSSL
-
-define INADYN_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-endef
 
-define INADYN_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/inadyn $(TARGET_DIR)/usr/sbin/inadyn
-	$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
-		$(TARGET_DIR)/etc/inadyn.conf
+define INADYN_INSTALL_SAMPLE_CONFIG
+	@if [ ! -f $(TARGET_DIR)/etc/inadyn.conf ]; then \
+		$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
+			$(TARGET_DIR)/etc/inadyn.conf; \
+	fi
 endef
+INADYN_POST_INSTALL_TARGET_HOOKS += INADYN_INSTALL_SAMPLE_CONFIG
 
 define INADYN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/inadyn/S70inadyn \
 		$(TARGET_DIR)/etc/init.d/S70inadyn
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.0.4
