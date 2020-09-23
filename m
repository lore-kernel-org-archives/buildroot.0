From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:08:37 +0200
Subject: [Buildroot] [git commit] packages/librelp: new package
Message-ID: <20200923195925.7D70F82A2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=356a521f2a6cb1b62ae376992d5b4702a695f22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reliable Logging Protocol library.

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/librelp/Config.in    |  6 ++++++
 package/librelp/librelp.hash |  3 +++
 package/librelp/librelp.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ce19c0de9..7d1e5e4f5f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -694,6 +694,9 @@ F:	package/openldap/
 N:	David du Colombier <0intro@gmail.com>
 F:	package/x264/
 
+N:	David GOUARIN <dgouarin@gmail.com>
+F:	package/librelp/
+
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
 F:	configs/lego_ev3_defconfig
diff --git a/package/Config.in b/package/Config.in
index 20a0167dab..bbaa49f76c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1747,6 +1747,7 @@ menu "Networking"
 	source "package/libpagekite/Config.in"
 	source "package/libpcap/Config.in"
 	source "package/libpjsip/Config.in"
+	source "package/librelp/Config.in"
 	source "package/librsync/Config.in"
 	source "package/libshairplay/Config.in"
 	source "package/libshout/Config.in"
diff --git a/package/librelp/Config.in b/package/librelp/Config.in
new file mode 100644
index 0000000000..d1f1f9ed7e
--- /dev/null
+++ b/package/librelp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBRELP
+	bool "librelp"
+	help
+	  Reliable Event Logging Protocol library
+
+	  https://www.rsyslog.com/librelp/
diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
new file mode 100644
index 0000000000..ac08039b53
--- /dev/null
+++ b/package/librelp/librelp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a34c8fc98bf8eef2a5baf635a0f71813cce93b1185aa03648e31b5af60b7393f  librelp-1.2.18.tar.gz
+sha256  1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685  COPYING
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
new file mode 100644
index 0000000000..bcb4fe0ea1
--- /dev/null
+++ b/package/librelp/librelp.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# librelp
+#
+################################################################################
+
+LIBRELP_VERSION = 1.2.18
+LIBRELP_SITE = http://download.rsyslog.com/librelp
+LIBRELP_LICENSE = GPL-3.0+
+LIBRELP_LICENSE_FILES = COPYING
+LIBRELP_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBRELP_DEPENDENCIES += gnutls host-pkgconf
+LIBRELP_CONF_OPTS += --enable-tls
+else
+LIBRELP_CONF_OPTS += --disable-tls
+endif
+
+$(eval $(autotools-package))
