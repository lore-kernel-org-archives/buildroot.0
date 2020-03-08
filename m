From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 03:16:40 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: add repart support
Message-ID: <20200308091640.65742-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-repart grows and adds partitions to a partition table, based on
the configuration files described in repart.d.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 9 +++++++++
 package/systemd/systemd.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c727082a1a..64d30f32aa 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -153,6 +153,15 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
 
+config BR2_PACKAGE_SYSTEMD_REPART
+	bool "enable repart support"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  systemd-repart grows and adds partitions to a partition table,
+	  based on the configuration files described in repart.d.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-repart.html
+
 config BR2_PACKAGE_SYSTEMD_COREDUMP
 	bool "enable coredump hook"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1c3b81cfcb..d05541a2f6 100644
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
-- 
2.20.1
