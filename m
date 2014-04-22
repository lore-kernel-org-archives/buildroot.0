From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 23:29:05 +0200
Subject: [Buildroot] [git commit] acpid: bump to version 2.0.22
Message-ID: <20140422212912.A470B9C988@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d20fdb8b305c0ac80a103ad55b994a2ede077d78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to upstream sourceforge page/download.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acpid/Config.in                        |    2 +
 package/acpid/S02acpid                         |    4 +-
 package/acpid/acpid-01-dont-use-isfdtype.patch |   20 +++++++++++++++++++
 package/acpid/acpid.mk                         |   25 +++++++++++------------
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/package/acpid/Config.in b/package/acpid/Config.in
index ea9a364..5aec7f1 100644
--- a/package/acpid/Config.in
+++ b/package/acpid/Config.in
@@ -6,3 +6,5 @@ config BR2_PACKAGE_ACPID
 
 	  Acpid is designed to notify user-space programs of ACPI events,
 	  and allows you to configure specific actions for specific events.
+
+	  http://sourceforge.net/projects/acpid2/
diff --git a/package/acpid/S02acpid b/package/acpid/S02acpid
index ec686d8..c2221fc 100755
--- a/package/acpid/S02acpid
+++ b/package/acpid/S02acpid
@@ -4,12 +4,12 @@ case "$1" in
 	start)
 		echo -n "Starting acpid: "
 		start-stop-daemon -S -q -m -b -p /var/run/acpid.pid --exec /usr/sbin/acpid -- -n
-		echo "done"
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		echo -n "Stopping acpid: "
 		start-stop-daemon -K -q -p /var/run/acpid.pid
-		echo "done"
+		[ $? == 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart)
 		"$0" stop
diff --git a/package/acpid/acpid-01-dont-use-isfdtype.patch b/package/acpid/acpid-01-dont-use-isfdtype.patch
new file mode 100644
index 0000000..2fe6c21
--- /dev/null
+++ b/package/acpid/acpid-01-dont-use-isfdtype.patch
@@ -0,0 +1,20 @@
+Partially roll back upstream commit 4711119089e1ad08dad206f4fded68f1972fdeed
+since released versions of uClibc don't support isfdtype().
+
+Signed-off-by: Gustavo Zaarias <gustavo@zacarias.com.ar>
+
+diff -Nura acpid-2.0.22.orig/sock.c acpid-2.0.22/sock.c
+--- acpid-2.0.22.orig/sock.c	2014-04-22 18:04:19.706841764 -0300
++++ acpid-2.0.22/sock.c	2014-04-22 18:05:08.285479625 -0300
+@@ -53,7 +53,10 @@
+ int
+ is_socket(int fd)
+ {
+-    return (isfdtype(fd, S_IFSOCK) == 1);
++	int v;
++	socklen_t l = sizeof(int);
++
++	return (getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&v, &l) == 0);
+ }
+ 
+ /* accept a new client connection */
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index e52fba1..1f4ec31 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,24 +4,23 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.11
-ACPID_SOURCE = acpid_$(ACPID_VERSION).orig.tar.gz
-ACPID_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
+ACPID_VERSION = 2.0.22
+ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
+ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPLv2+
 ACPID_LICENSE_FILES = COPYING
 
-define ACPID_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+define ACPID_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/acpid/S02acpid \
+		$(TARGET_DIR)/etc/init.d/S02acpid
 endef
 
-define ACPID_INSTALL_TARGET_CMDS
-	install -D -m 755 $(@D)/acpid $(TARGET_DIR)/usr/sbin/acpid
-	install -D -m 755 $(@D)/acpi_listen $(TARGET_DIR)/usr/bin/acpi_listen
-	install -D -m 644 $(@D)/acpid.8 $(TARGET_DIR)/usr/share/man/man8/acpid.8
-	install -D -m 644 $(@D)/acpi_listen.8 $(TARGET_DIR)/usr/share/man/man8/acpi_listen.8
+define ACPID_SET_EVENTS
 	mkdir -p $(TARGET_DIR)/etc/acpi/events
-	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" > $(TARGET_DIR)/etc/acpi/events/powerbtn
-	$(INSTALL) -D -m 0755 package/acpid/S02acpid $(TARGET_DIR)/etc/init.d/S02acpid
+	/bin/echo -e "event=button[ /]power\naction=/sbin/poweroff" \
+		>$(TARGET_DIR)/etc/acpi/events/powerbtn
 endef
 
-$(eval $(generic-package))
+ACPID_POST_INSTALL_TARGET_HOOKS += ACPID_SET_EVENTS
+
+$(eval $(autotools-package))
