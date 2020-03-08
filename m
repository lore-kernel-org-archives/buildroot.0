From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:16:09 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add userdb
 support
Message-ID: <20200308140402.9CE9A8FD13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb619c5831f8671dfd13d2520d6dbd088d244af0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

systemd-userdbd is a system service that multiplexes user/group lookups
to all local services that provide JSON user/group record definitions
to the system. In addition it synthesizes JSON user/group records from
classic UNIX/glibc NSS user/group records in order to provide full
backwards compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 12 ++++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6f5f5c3346..bd638477a0 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -403,6 +403,18 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
 
+config BR2_PACKAGE_SYSTEMD_USERDB
+	bool "enable userdb daemon"
+	help
+	  systemd-userdbd is a system service that multiplexes
+	  user/group lookups to all local services that provide JSON
+	  user/group record definitions to the system. In addition it
+	  synthesizes JSON user/group records from classic UNIX/glibc
+	  NSS user/group records in order to provide full backwards
+	  compatibility.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-userdbd.service.html
+
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c7a253bbe4..22165de2c1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -41,7 +41,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dnobody-group=nogroup \
 	-Didn=true \
-	-Duserdb=false \
 	-Dhomed=false \
 	-Dnss-systemd=true
 
@@ -311,6 +310,12 @@ else
 SYSTEMD_CONF_OPTS += -Drepart=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_USERDB),y)
+SYSTEMD_CONF_OPTS += -Duserdb=true
+else
+SYSTEMD_CONF_OPTS += -Duserdb=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
