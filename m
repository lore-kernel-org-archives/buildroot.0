From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 05:00:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssh
Message-ID: <20080924120057.507283C375@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 05:00:57 -0700 (Wed, 24 Sep 2008)
New Revision: 23462

Log:
openssh: convert to Makefile.autotools.in and bump version to 5.1p1

This patch converts building of OpenSSH to use Makefile.autotools.in instead
and in the same process bump to latest upstream version 5.1p1.

The openssh.path is also cleaned up a bit to reflect the new release, i.e. some
of the patch is already applied/fixed upstream.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>


Modified:
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssh/openssh.patch


Changeset:
Modified: trunk/buildroot/package/openssh/openssh.mk
===================================================================
--- trunk/buildroot/package/openssh/openssh.mk	2008-09-24 11:57:47 UTC (rev 23461)
+++ trunk/buildroot/package/openssh/openssh.mk	2008-09-24 12:00:57 UTC (rev 23462)
@@ -3,86 +3,19 @@
 # openssh
 #
 #############################################################
-OPENSSH_VERSION=4.6p1
+OPENSSH_VERSION=5.1p1
 OPENSSH_SITE=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_DIR=$(BUILD_DIR)/openssh-$(OPENSSH_VERSION)
-OPENSSH_SOURCE=openssh-$(OPENSSH_VERSION).tar.gz
 
-$(DL_DIR)/$(OPENSSH_SOURCE):
-	$(WGET) -P $(DL_DIR) $(OPENSSH_SITE)/$(OPENSSH_SOURCE)
+OPENSSH_CONF_ENV = LD=$(TARGET_CC)
+OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
+		--disable-utmpx --disable-wtmp --disable-wtmpx --without-x
 
-$(OPENSSH_DIR)/.unpacked: $(DL_DIR)/$(OPENSSH_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(OPENSSH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(OPENSSH_DIR) package/openssh/ openssh\*.patch
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
+OPENSSH_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(OPENSSH_DIR)/.configured: $(OPENSSH_DIR)/.unpacked
-	(cd $(OPENSSH_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		LD=$(TARGET_CROSS)gcc \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/sbin \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/usr/include \
-		--disable-lastlog --disable-utmp \
-		--disable-utmpx --disable-wtmp --disable-wtmpx \
-		--without-x \
-		--disable-strip \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
+OPENSSH_DEPENDENCIES = zlib openssl
 
-$(OPENSSH_DIR)/ssh: $(OPENSSH_DIR)/.configured
-	$(MAKE) -C $(OPENSSH_DIR)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/scp
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/sftp
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/sftp-server
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh-add
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh-agent
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh-keygen
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh-keyscan
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh-keysign
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/ssh-rand-helper
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(OPENSSH_DIR)/sshd
+$(eval $(call AUTOTARGETS,package,openssh))
 
-$(TARGET_DIR)/usr/bin/ssh: $(OPENSSH_DIR)/ssh
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) install
-	mkdir -p $(TARGET_DIR)/etc/init.d
-	cp package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/
-	chmod a+x $(TARGET_DIR)/etc/init.d/S50sshd
-	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-openssh: openssl zlib $(TARGET_DIR)/usr/bin/ssh
-
-openssh-source: $(DL_DIR)/$(OPENSSH_SOURCE)
-
-openssh-clean:
-	-$(MAKE) -C $(OPENSSH_DIR) clean
-	-$(MAKE) CC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) uninstall
-
-openssh-dirclean:
-	rm -rf $(OPENSSH_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_OPENSSH)),y)
-TARGETS+=openssh
-endif
+$(OPENSSH_HOOK_POST_INSTALL):
+	$(INSTALL) -D -m 755 package/openssh/S50sshd $(TARGET_DIR)/etc/init.d/S50sshd
+	touch $@

Modified: trunk/buildroot/package/openssh/openssh.patch
===================================================================
--- trunk/buildroot/package/openssh/openssh.patch	2008-09-24 11:57:47 UTC (rev 23461)
+++ trunk/buildroot/package/openssh/openssh.patch	2008-09-24 12:00:57 UTC (rev 23462)
@@ -10,84 +10,8 @@
  PATHS= -DSSHDIR=\"$(sysconfdir)\" \
  	-D_PATH_SSH_PROGRAM=\"$(SSH_PROGRAM)\" \
 
---- openssh-3.6.1p1/S50sshd	Fri Sep 27 05:21:58 2002
-+++ openssh-3.6.1p1/S50sshd	Mon Mar 17 14:55:00 2003
-@@ -0,0 +1,64 @@
-+#!/bin/sh
-+#
-+# sshd        Starts sshd.
-+#
-+
-+# Make sure the ssh-keygen progam exists
-+[ -f /usr/bin/ssh-keygen ] || exit 0
-+
-+# Check for the SSH1 RSA key
-+if [ ! -f /etc/ssh_host_key ] ; then
-+	echo Generating RSA Key...
-+	/usr/bin/ssh-keygen -t rsa1 -f /etc/ssh_host_key -C '' -N ''
-+fi
-+
-+# Check for the SSH2 RSA key
-+if [ ! -f /etc/ssh_host_rsa_key ] ; then
-+	echo Generating RSA Key...
-+	/usr/bin/ssh-keygen -t rsa -f /etc/ssh_host_rsa_key -C '' -N ''
-+fi
-+
-+# Check for the SSH2 DSA key
-+if [ ! -f /etc/ssh_host_dsa_key ] ; then
-+	echo Generating DSA Key...
-+	echo THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
-+	echo
-+        /usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
-+fi
-+                
-+umask 077
-+
-+start() {
-+ 	echo -n "Starting sshd: "
-+	/usr/sbin/sshd
-+	touch /var/lock/sshd
-+	echo "OK"
-+}	
-+stop() {
-+	echo -n "Stopping sshd: "
-+        killall	sshd 
-+	rm -f /var/lock/sshd
-+	echo "OK" 
-+}
-+restart() {
-+	stop
-+	start
-+}	
-+
-+case "$1" in
-+  start)
-+  	start
-+	;;
-+  stop)
-+  	stop
-+	;;
-+  restart|reload)
-+  	restart
-+	;;
-+  *)
-+	echo $"Usage: $0 {start|stop|restart}"
-+	exit 1
-+esac
-+
-+exit $?
-+
 --- openssh-4.6p1.oorig/sshd_config	2006-07-24 06:06:47.000000000 +0200
 +++ openssh-4.6p1/sshd_config	2007-06-28 15:58:49.000000000 +0200
-@@ -11,7 +11,7 @@
- # default value.
- 
- #Port 22
--#Protocol 2,1
-+Protocol 2
- #AddressFamily any
- #ListenAddress 0.0.0.0
- #ListenAddress ::
 @@ -83,9 +83,11 @@
  #AllowTcpForwarding yes
  #GatewayPorts no
@@ -102,15 +26,12 @@
  #UseLogin no
 @@ -102,8 +104,12 @@
  # no default banner path
- #Banner /some/path
+ #Banner none
  
 +ClientAliveInterval 15
 +ClientAliveCountMax 4
 +AcceptEnv LANG LC_*
 +
  # override default of no subsystems
--Subsystem	sftp	/usr/libexec/sftp-server
-+Subsystem	sftp	/usr/sbin/sftp-server
+ Subsystem	sftp	/usr/libexec/sftp-server
  
- # Example of overriding settings on a per-user basis
- #Match User anoncvs
