From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 12 Oct 2016 20:42:46 -0700
Subject: [Buildroot] [PATCH 2/3] inadyn: do not install default conf file
In-Reply-To: <20161013034247.21603-1-bluemrp9@gmail.com>
References: <20161013034247.21603-1-bluemrp9@gmail.com>
Message-ID: <20161013034247.21603-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/inadyn/S70inadyn      |  4 ++--
 package/inadyn/inadyn.conf    | 11 -----------
 package/inadyn/inadyn.mk      |  6 ------
 package/inadyn/inadyn.service |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 package/inadyn/inadyn.conf

diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
index ca7b414..a66c3bd 100644
--- a/package/inadyn/S70inadyn
+++ b/package/inadyn/S70inadyn
@@ -5,8 +5,8 @@
 
 CONFIG=/etc/inadyn.conf
 
-# check if CONFIG exists, print message & exit if it doesn't
-[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
+# check if CONFIG exists, exit silently if it does not
+[ ! -f $CONFIG ] && exit 1
 
 # Allow a few customizations from a config file. Especially inadyn
 # must be explicitly enabled by adding ENABLED="yes" in this file.
diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
deleted file mode 100644
index ab8aa36..0000000
--- a/package/inadyn/inadyn.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-# Basic configuration file for inadyn
-#
-# /etc/inadyn.conf
-pidfile /var/run/inadyn.pid
-update_period_sec 600 # Check for a new IP every 600 seconds
-username test		# replace 'test' with your username
-password test		# replace 'test' with your password
-dyndns_system default at dyndns.org   # replace w/ your provider
-
-alias test.homeip.net
-# replace 'test.homeip.net' with yourdomainname for actual (non-test) use
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 8ceca4c..cf071da 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -19,12 +19,6 @@ else
 INADYN_CONF_OPTS += --disable-ssl
 endif
 
-define INADYN_INSTALL_SAMPLE_CONFIG
-	$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
-		$(TARGET_DIR)/etc/inadyn.conf
-endef
-INADYN_POST_INSTALL_TARGET_HOOKS += INADYN_INSTALL_SAMPLE_CONFIG
-
 define INADYN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/inadyn/S70inadyn \
 		$(TARGET_DIR)/etc/init.d/S70inadyn
diff --git a/package/inadyn/inadyn.service b/package/inadyn/inadyn.service
index abc0a1e..199ad62 100644
--- a/package/inadyn/inadyn.service
+++ b/package/inadyn/inadyn.service
@@ -3,7 +3,7 @@ Description=DDNS client
 After=syslog.target network.target
 
 [Service]
-ExecStart=/usr/bin/inadyn
+ExecStart=test -f /etc/inadyn.conf && /usr/bin/inadyn
 Restart=always
 
 [Install]
-- 
2.9.3
