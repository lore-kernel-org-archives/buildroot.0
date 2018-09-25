From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:31:21 +0200
Subject: [Buildroot] [git commit] irqbalance: bump to version 1.4.0
Message-ID: <20180925204029.6ED0288DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2193a01e67234148f6787b5680dddb089946fc63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add hash for license file
- Add optional ncurses and systemd dependencies
- Remove --without-glib2 option, see:
  https://github.com/Irqbalance/irqbalance/commit/1d2f6a9b6c6ef3b195f28af5f0271cf83ed02818

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/irqbalance/irqbalance.hash |  3 ++-
 package/irqbalance/irqbalance.mk   | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 032c49152f..9bbbc7e4fb 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3  irqbalance-v1.0.9.tar.gz
+sha256 62de71510a2496fcf027efb0b288dd48e53e9efc931fa573c95580cad6264d07  irqbalance-v1.4.0.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 410e40a131..31f6a427c6 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = v1.0.9
+IRQBALANCE_VERSION = v1.4.0
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
@@ -12,9 +12,6 @@ IRQBALANCE_DEPENDENCIES = host-pkgconf libglib2
 # Autoreconf needed because package is distributed without a configure script
 IRQBALANCE_AUTORECONF = YES
 
-# Local implementation of glib2 will be used if --without-glib2 is set
-IRQBALANCE_CONF_OPTS = --with-glib2
-
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 IRQBALANCE_DEPENDENCIES += libcap-ng
 IRQBALANCE_CONF_OPTS += --with-libcap-ng
@@ -22,6 +19,10 @@ else
 IRQBALANCE_CONF_OPTS += --without-libcap-ng
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+IRQBALANCE_DEPENDENCIES += ncurses
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 IRQBALANCE_DEPENDENCIES += numactl
 IRQBALANCE_CONF_OPTS += --enable-numa
@@ -29,6 +30,13 @@ else
 IRQBALANCE_CONF_OPTS += --disable-numa
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+IRQBALANCE_DEPENDENCIES += systemd
+IRQBALANCE_CONF_OPTS += --with-systemd
+else
+IRQBALANCE_CONF_OPTS += --without-systemd
+endif
+
 # This would be done by the package's autogen.sh script
 define IRQBALANCE_PRECONFIGURE
 	mkdir -p $(@D)/m4
