From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:31:15 +0200
Subject: [Buildroot] [git commit] systemd: add SMACK support option.
Message-ID: <20140608143130.BEC489CF1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0fd391744d6773527419f23bd6321d18f70c32f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new configuration option is available in systemd menu, to enable
support for SMACK.

For this feature to properly work, systemd requires attr (build
dependency, also used for other features) and smack (runtime dependency).

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  |   14 ++++++++++++++
 package/systemd/systemd.mk |   13 +++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ce14415..58f76a5 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -118,4 +118,18 @@ config BR2_PACKAGE_SYSTEMD_COMPAT
 
 	  This option enables the installation of compatibility *.pc files.
 
+config BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT
+	bool "enable SMACK support"
+	select BR2_PACKAGE_ATTR
+	select BR2_PACKAGE_SMACK
+	help
+	  Enable support for SMACK, the Simple Mandatory Access Control
+	  Kernel, a minimal approach to Access Control implemented as a kernel
+	  LSM.
+
+	  This feature requires a kernel >= 3.8.
+
+	  When this feature is enabled, Systemd mounts smackfs and manages
+	  security labels for sockets.
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ca51ddf..6de7887 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -63,6 +63,13 @@ else
 SYSTEMD_CONF_OPT += --disable-acl
 endif
 
+ifeq ($(BR2_PACKAGE_ATTR),y)
+SYSTEMD_CONF_OPT += --enable-attr
+SYSTEMD_DEPENDENCIES += attr
+else
+SYSTEMD_CONF_OPT += --disable-attr
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SYSTEMD_CONF_OPT += --enable-gudev
 SYSTEMD_DEPENDENCIES += libglib2
@@ -105,6 +112,12 @@ else
 SYSTEMD_CONF_OPT += --disable-timesyncd
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT),y)
+SYSTEMD_CONF_OPT += --enable-smack
+else
+SYSTEMD_CONF_OPT += --disable-smack
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPT += LIBS=-lrt
 SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
