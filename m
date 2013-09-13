From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Sep 2013 11:23:41 +0200
Subject: [Buildroot] [git commit] tcping: new package
Message-ID: <20130913092351.564709B751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cccb417e8fb169569561cfa4446e43db714eab36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tcping does a TCP connect to the given ip/port combination. The user can
specify a timeout in seconds. This is useful in shell scripts running in
firewalled environments. Often SYNs are just being dropped by firewalls,
thus connection establishment will be retried several times (for minutes)
until a TCP timeout is reached. With tcping it is possible to check first
if the desired port is reachable and then start connection establishment.

http://www.linuxco.de/tcping/tcping.html

[Peter: wrap help text, pass TARGET_LDFLAGS]
Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/tcping/Config.in |   14 ++++++++++++++
 package/tcping/tcping.mk |   21 +++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aae3296..3ea4b4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -858,6 +858,7 @@ source "package/squid/Config.in"
 source "package/strongswan/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
+source "package/tcping/Config.in"
 source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tftpd/Config.in"
diff --git a/package/tcping/Config.in b/package/tcping/Config.in
new file mode 100644
index 0000000..6677b58
--- /dev/null
+++ b/package/tcping/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_TCPING
+	bool "tcping"
+	help
+	  tcping does a TCP connect to the given ip/port
+	  combination. The user can specify a timeout in seconds. This
+	  is useful in shell scripts running in firewalled
+	  environments. Often SYNs are just being dropped by
+	  firewalls, thus connection establishment will be retried
+	  several times (for minutes) until a TCP timeout is
+	  reached. With tcping it is possible to check first if the
+	  desired port is reachable and then start connection
+	  establishment.
+
+	  http://www.linuxco.de/tcping/tcping.html
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
new file mode 100644
index 0000000..ff43490
--- /dev/null
+++ b/package/tcping/tcping.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tcping
+#
+################################################################################
+
+TCPING_VERSION = 1.3.5
+TCPING_SITE = http://www.linuxco.de/tcping
+TCPING_LICENSE = GPLv3+
+TCPING_LICENSE_FILES = LICENSE
+
+define TCPING_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) tcping.linux
+endef
+
+define TCPING_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tcping $(TARGET_DIR)/usr/bin/tcping
+endef
+
+$(eval $(generic-package))
