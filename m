From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:55:23 +0200
Subject: [Buildroot] [git commit] systemd: add option to enable
	compatibility libs
Message-ID: <20140416175620.93D599C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=596b42f7d69be49558f9c791c952c9b669f80949
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since systemd 209, some libraries have been merged into libsystemd.so:

 - libsystemd-daemon.so
 - libsystemd-id128.so
 - libsystemd-journal.so
 - libsystemd-login.so

A new configuration menu entry has been added to enable the installation
of compatibility pkg-config files, so that programs that depend on them
can still be built.

[Thomas: as suggested by Yann during the review, add an else clause
with --disable-compat-libs.]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in  |   13 +++++++++++++
 package/systemd/systemd.mk |    6 ++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 095fee0..f10637a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -92,4 +92,17 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+config BR2_PACKAGE_SYSTEMD_COMPAT
+	bool "enable compatibility libraries"
+	help
+	  Since systemd 209, the following libraries have been merged into
+	  libsystemd.so:
+
+	  - libsystemd-daemon
+	  - libsystemd-id128
+	  - libsystemd-journal
+	  - libsystemd-login
+
+	  This option enables the installation of compatibility *.pc files.
+
 endif
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ecedfce..f7661ab 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -46,6 +46,12 @@ SYSTEMD_CONF_OPT += \
 	--disable-dbus \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
+SYSTEMD_CONF_OPT += --enable-compat-libs
+else
+SYSTEMD_CONF_OPT += --disable-compat-libs
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_CONF_OPT += --enable-acl
 SYSTEMD_DEPENDENCIES += acl
