From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: add homed support
Message-ID: <20200412133307.7BCA98E773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa62b5165ca41e4800e00a84af9026bfa5fb9155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd-homed is a system service that may be used to create, remove,
change or inspect home directories.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Thomas:
  - add missing dependency on kernel headers >= 4.12
  - add missing Config.in comment about dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 22 ++++++++++++++++++++++
 package/systemd/systemd.mk |  8 +++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8a3149ee5e..dd3b8c534d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -193,6 +193,28 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-sleep.html
 
+config BR2_PACKAGE_SYSTEMD_HOMED
+	bool "enable home daemon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
+	depends on BR2_USE_MMU # cryptsetup -> lvm2
+	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
+	select BR2_PACKAGE_CRYPTSETUP
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-homed is a system service that may be used to create,
+	  remove, change or inspect home directories.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
+
+comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS || BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0a4a84e7e2..623e942205 100644
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
