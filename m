From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] inadyn: bump to version 1.99.11
Message-ID: <20141017121829.5EFB7B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe0261aac1aba903716321244dab013a90918acc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update initscript for the /usr/sbin -> /usr/bin change which is the
default installation directory now that it's using autotools infra.
Also add hash file.
Make the initscript use tabs instead of spaces.
Make the config file installation conditional.
Now with optional gnutls support for HTTPS.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/S70inadyn   |   35 ++++++++++++++++++-----------------
 package/inadyn/inadyn.hash |    2 ++
 package/inadyn/inadyn.mk   |   26 ++++++++++++--------------
 3 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index 24d0813..b5d7eed 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -13,23 +13,24 @@ VR_INADYN=/var/run/inadyn
 [ ! -d $VR_INADYN ] && mkdir -p $VR_INADYN
 
 case "$1" in
-        start)
-                echo "Starting inadyn."
-                start-stop-daemon -S -x /usr/sbin/inadyn
-                ;;
-        stop)
-                echo  "Stopping inadyn."
-                start-stop-daemon -q -K -x /usr/sbin/inadyn
-                rm -f /var/run/inadyn/inadyn.pid
-                ;;
-        restart)
-                "$0" stop
-                "$0" start
-                ;;
-        *)
-                echo $"Usage: $0 {start|stop|restart}"
-                exit 1
+	start)
+		echo "Starting inadyn: "
+		start-stop-daemon -S -x /usr/bin/inadyn
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		echo  "Stopping inadyn: "
+		start-stop-daemon -q -K -x /usr/bin/inadyn
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
+		rm -f /var/run/inadyn/inadyn.pid
+		;;
+	restart)
+		"$0" stop
+		"$0" start
+		;;
+		*)
+		echo $"Usage: $0 {start|stop|restart}"
+		exit 1
 esac
 
 exit $?
-
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
