From: Amand Tihon <amand.tihon@alrj.org>
Date: Wed, 28 Jan 2009 21:31:31 +0100
Subject: [Buildroot] [PATCH] Add radvd to the list of packages
Message-ID: <200901282131.37172.amand.tihon@alrj.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add radvd, the IPv6 router advertisement daemon.

Signed-off-by: Amand Tihon <amand.tihon@alrj.org>
---

Second try, I hope I got it right this time.
Still wondering about the installed binaries' names, hence the hack in 
$(RADVD_HOOK_POST_INSTALL). Any idea welcome.


 package/Config.in       |    1 +
 package/radvd/Config.in |    8 ++++++++
 package/radvd/S50radvd  |   18 ++++++++++++++++++
 package/radvd/radvd.mk  |   23 +++++++++++++++++++++++
 4 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 29190b2..bb16015 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ source "package/openvpn/Config.in"
 source "package/openswan/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
+source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
new file mode 100644
index 0000000..deadf7f
--- /dev/null
+++ b/package/radvd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RADVD
+	bool "radvd"
+	select BR2_PACKAGE_FLEX
+	depends on BR2_INET_IPV6
+	help
+	  IPv6 Router Advertisement Daemon.
+	
+	  http://www.litech.org/radvd/
diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
new file mode 100755
index 0000000..d3e2cd1
--- /dev/null
+++ b/package/radvd/S50radvd
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+RADVD=/usr/sbin/radvd
+
+echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
+
+echo -n "Starting radvd: "
+if [ ! -x "${RADVD}" ]; then
+	echo "missing"
+	exit 1
+fi
+
+if ${RADVD} ; then
+	echo "done"
+else
+	echo "failed"
+	exit 1
+fi
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
new file mode 100644
index 0000000..b494df3
--- /dev/null
+++ b/package/radvd/radvd.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# radvd
+#
+#############################################################
+RADVD_VERSION:=1.2
+RADVD_SOURCE:=radvd-$(RADVD_VERSION).tar.gz
+RADVD_SITE:=http://www.litech.org/radvd/dist/
+RADVD_AUTORECONF:=no
+RADVD_INSTALL_STAGING:=no
+RADVD_INSTALL_TARGET:=YES
+RADVD_DEPENDENCIES:=uclibc flex
+RADVD_MAKE:=$(MAKE1)
+
+$(eval $(call AUTOTARGETS,package,radvd))
+
+$(RADVD_HOOK_POST_INSTALL): $(RADVD_TARGET_INSTALL_TARGET)
+	mv $(TARGET_DIR)/usr/sbin/$(ARCH)-linux-radvd \
+		$(TARGET_DIR)/usr/sbin/radvd
+	mv $(TARGET_DIR)/usr/sbin/$(ARCH)-linux-radvdump \
+		$(TARGET_DIR)/usr/sbin/radvdump
+	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
+	touch $@

-- 
Amand Tihon
Rue du Ruchaux, 1 - 1490 Court-St-Etienne, Belgique
+32 479 207 743
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part.
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090128/ef650f26/attachment.pgp 
