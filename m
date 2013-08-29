From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 23:30:55 +0200
Subject: [Buildroot] [git commit] dbus: launch helper should be setuid root
Message-ID: <20130829221536.15B089B5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aab3a0ba792f33aae66757f0e5c3fc67e41104ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #6464

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |   12 ++++++++----
 package/dbus/dbus.mk |    4 ++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8c7c23a..4653e38 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,10 +8,14 @@
 
 	Top level menu names reordered and renamed for clarity.
 
-	Updated/fixed packages: acl, attr, bash, directfb, dvb-apps,
-	kexec, kmod, libbsd, linux-fusion, mesa3d, minidlna, openssh,
-	openssl, pulseaudio, python-setuptools, qt5, qt5webkit, redis,
-	strongswan, sunxi-mali
+	Updated/fixed packages: acl, attr, bash, dbus, directfb,
+	dvb-apps, kexec, kmod, libbsd, linux-fusion, mesa3d, minidlna,
+	openssh, openssl, pulseaudio, python-setuptools, qt5,
+	qt5webkit, redis, strongswan, sunxi-mali
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#6464: dbus-daemon-launch-helper needs setuid
 
 2013.08-rc2, Released August 16th 2013:
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7fbfb4c..d50f630 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -10,6 +10,10 @@ DBUS_LICENSE = AFLv2.1 GPLv2+
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
+define DBUS_PERMISSIONS
+/usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
+endef
+
 DBUS_DEPENDENCIES = host-pkgconf
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
