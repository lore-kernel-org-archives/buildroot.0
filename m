From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 03:39:58 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: add userdb support
Message-ID: <20200308093958.107192-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-userdbd is a system service that multiplexes user/group lookups
to all local services that provide JSON user/group record definitions
to the system. In addition it synthesizes JSON user/group records from
classic UNIX/glibc NSS user/group records in order to provide full
backwards compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/Config.in  | 11 +++++++++++
 package/systemd/systemd.mk |  7 ++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index c727082a1a..051bec5de1 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -233,6 +233,17 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
 
 	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
 
+config BR2_PACKAGE_SYSTEMD_USERDB
+	bool "enable userdb daemon"
+	help
+	  systemd-userdbd is a system service that multiplexes user/group
+	  lookups to all local services that provide JSON user/group record
+	  definitions to the system. In addition it synthesizes JSON
+	  user/group records from classic UNIX/glibc NSS user/group records
+	  in order to provide full backwards compatibility.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-userdbd.service.html
+
 config BR2_PACKAGE_SYSTEMD_LOGIND
 	bool "enable login daemon"
 	help
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1c3b81cfcb..2dfe69b4f3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -42,7 +42,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dnobody-group=nogroup \
 	-Didn=true \
 	-Drepart=false \
-	-Duserdb=false \
 	-Dhomed=false \
 	-Dnss-systemd=true
 
@@ -305,6 +304,12 @@ else
 SYSTEMD_CONF_OPTS += -Dlocaled=false
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
-- 
2.20.1
