From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:16:05 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add repart
 support
Message-ID: <20200308140402.93DFD8FD13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed74dc875d496ae48ab3f690647a136547ca62ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

systemd-repart grows and adds partitions to a partition table, based on
the configuration files described in repart.d.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in  | 10 ++++++++++
 package/systemd/systemd.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c727082a1a..6f5f5c3346 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -318,6 +318,16 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-random-seed.service.html
 
+config BR2_PACKAGE_SYSTEMD_REPART
+	bool "enable repart support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-repart grows and adds partitions to a partition table,
+	  based on the configuration files described in repart.d.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-repart.html
+
 config BR2_PACKAGE_SYSTEMD_RESOLVED
 	bool "enable resolve daemon"
 	default y
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d97336b7cd..c7a253bbe4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -41,7 +41,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dnobody-group=nogroup \
 	-Didn=true \
-	-Drepart=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnss-systemd=true
@@ -305,6 +304,13 @@ else
 SYSTEMD_CONF_OPTS += -Dlocaled=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_REPART),y)
+SYSTEMD_CONF_OPTS += -Drepart=true
+SYSTEMD_DEPENDENCIES += openssl
+else
+SYSTEMD_CONF_OPTS += -Drepart=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * /var/lib/systemd/coredump - - Core Dumper
