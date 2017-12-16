From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 16:03:17 +0100
Subject: [Buildroot] [git commit] traceroute: new package
Message-ID: <20171216150523.AFF4780FDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c60a213177cdbfcc2a98093860656de743bc44c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested on Beaglebone Black.

Build-tested with test-pkg.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Thomas:
 - remove file removal in install command
 - use DESTDIR and prefix instead of just prefix in install command.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/traceroute/Config.in       |  8 ++++++++
 package/traceroute/traceroute.hash |  6 ++++++
 package/traceroute/traceroute.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index de600f5..af221bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1547,6 +1547,7 @@ N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
 F:	package/mongodb/
 F:	package/stella/
+F:	package/traceroute/
 F:	package/tunctl/
 F:	package/ubus/
 
diff --git a/package/Config.in b/package/Config.in
index a81408d..4fa5762 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1805,6 +1805,7 @@ endif
 	source "package/tinyhttpd/Config.in"
 	source "package/tn5250/Config.in"
 	source "package/tor/Config.in"
+	source "package/traceroute/Config.in"
 	source "package/transmission/Config.in"
 	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
diff --git a/package/traceroute/Config.in b/package/traceroute/Config.in
new file mode 100644
index 0000000..42ae5a3
--- /dev/null
+++ b/package/traceroute/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TRACEROUTE
+	bool "traceroute"
+	help
+	  A new modern implementation of the traceroute(8) utility for
+	  Linux systems. It tracks the route packets taken from an IP
+	  network on their way to a given host.
+
+	  http://traceroute.sourceforge.net/
diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
new file mode 100644
index 0000000..b952548
--- /dev/null
+++ b/package/traceroute/traceroute.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6  traceroute-2.1.0.tar.gz
+
+# Hash for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
new file mode 100644
index 0000000..5d185a2
--- /dev/null
+++ b/package/traceroute/traceroute.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# traceroute
+#
+################################################################################
+
+TRACEROUTE_VERSION = 2.1.0
+TRACEROUTE_SOURCE = traceroute-$(TRACEROUTE_VERSION).tar.gz
+TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
+
+TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
+TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB
+
+# Prefer full-featured traceroute over busybox's version
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+TRACEROUTE_DEPENDENCIES += busybox
+endif
+
+define TRACEROUTE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
+endef
+
+define TRACEROUTE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) prefix=/usr install -C $(@D)
+endef
+
+$(eval $(generic-package))
