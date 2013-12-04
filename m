From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 14:29:11 +0100
Subject: [Buildroot] [git commit] dropbear: bump to version 2013.62
Message-ID: <20131204134702.129279BEE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=408743d29d892e4612dc199811b17d252aa8c881
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2013.62 with ECC support.
Switch the initscript to on-demand key generation and add systemd unit
file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dropbear/S50dropbear      |   21 +++------------------
 package/dropbear/dropbear.mk      |   18 +++++++++++++-----
 package/dropbear/dropbear.service |   10 ++++++++++
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index 991a121..d94310c 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -3,34 +3,20 @@
 # Starts dropbear sshd.
 #
 
-# Make sure the dropbearkey progam exists
-[ -f /usr/bin/dropbearkey ] || exit 0
-
 start() {
  	echo -n "Starting dropbear sshd: "
 	# Make sure dropbear directory exists
 	if [ ! -d /etc/dropbear ] ; then
 		mkdir -p /etc/dropbear
 	fi
-	# Check for the Dropbear RSA key
-	if [ ! -f /etc/dropbear/dropbear_rsa_host_key ] ; then
-		echo -n "generating rsa key... "
-		/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key > /dev/null 2>&1
-	fi
-
-	# Check for the Dropbear DSS key
-	if [ ! -f /etc/dropbear/dropbear_dss_host_key ] ; then
-		echo -n "generating dsa key... "
-		/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key > /dev/null 2>&1
-	fi
 	umask 077
-	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear
-	echo "OK"
+	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear -- -R
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
 	echo -n "Stopping dropbear sshd: "
 	start-stop-daemon -K -q -p /var/run/dropbear.pid
-	echo "OK"
+	[ $? == 0 ] && echo "OK" || echo "FAIL"
 }
 restart() {
 	stop
@@ -53,4 +39,3 @@ case "$1" in
 esac
 
 exit $?
-
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7fa9273..3ef6c8d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2013.60
+DROPBEAR_VERSION = 2013.62
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
@@ -24,8 +24,8 @@ endef
 
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
 
-define DROPBEAR_DISABLE_REVERSE_DNS
-	$(SED) 's:\(#define DO_HOST_LOOKUP\):/*\1 */:' $(@D)/options.h
+define DROPBEAR_ENABLE_REVERSE_DNS
+	$(SED) 's:.*\(#define DO_HOST_LOOKUP\).*:\1:' $(@D)/options.h
 endef
 
 define DROPBEAR_BUILD_SMALL
@@ -43,6 +43,14 @@ define DROPBEAR_DISABLE_STANDALONE
 	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 endef
 
+define DROPBEAR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
+		$(TARGET_DIR)/etc/systemd/system/dropbear.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../dropbear.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
+endef
+
 ifeq ($(BR2_USE_MMU),y)
 define DROPBEAR_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
@@ -52,8 +60,8 @@ else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
 endif
 
-ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_REVERSE_DNS
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
new file mode 100644
index 0000000..4e6c879
--- /dev/null
+++ b/package/dropbear/dropbear.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Dropbear SSH daemon
+After=syslog.target network.target auditd.service
+
+[Service]
+ExecStart=/usr/sbin/dropbear -F -R
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
