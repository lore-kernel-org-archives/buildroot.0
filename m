From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 15:49:36 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: add homed support
Message-ID: <20200308214936.61309-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-homed is a system service that may be used to create,
remove, change or inspect home directories.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 15 +++++++++++++++
 package/systemd/systemd.mk |  8 +++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bd638477a0..3c688d9e41 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -188,6 +188,21 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
 
+config BR2_PACKAGE_SYSTEMD_HOMED
+	bool "enable home daemon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
+	depends on BR2_USE_MMU # cryptsetup -> lvm2
+	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
+	select BR2_PACKAGE_CRYPTSETUP
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-homed is a system service that may be used to create,
+	  remove, change or inspect home directories.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
+
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 22165de2c1..fd036d18a8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -41,7 +41,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dnobody-group=nogroup \
 	-Didn=true \
-	-Dhomed=false \
 	-Dnss-systemd=true
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -279,6 +278,13 @@ else
 SYSTEMD_CONF_OPTS += -Dimportd=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_HOMED),y)
+SYSTEMD_CONF_OPTS += -Dhomed=true
+SYSTEMD_DEPENDENCIES += cryptsetup openssl
+else
+SYSTEMD_CONF_OPTS += -Dhomed=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_HOSTNAMED),y)
 SYSTEMD_CONF_OPTS += -Dhostnamed=true
 else
-- 
2.20.1
