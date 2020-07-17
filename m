From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 17 Jul 2020 23:52:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] treewide: replace nogroup with nobody
Message-ID: <20200717215208.8736-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the recommended groupname for user nobody. One practical
issue is that systemd-sysusers will otherwise create a
nobody group with gid 999.

Quote: "If the username exists on a system,then they should
be in the suggested corresponding group".

https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/usernames.html

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v2:
-   Undo whitespace changes in boa.conf
---
 package/boa/boa.conf                 | 2 +-
 package/mosquitto/mosquitto.mk       | 2 +-
 package/oracle-mysql/oracle-mysql.mk | 2 +-
 package/systemd/systemd.mk           | 1 -
 system/skeleton/etc/group            | 2 +-
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/boa/boa.conf b/package/boa/boa.conf
index e94029665f..f51c237316 100644
--- a/package/boa/boa.conf
+++ b/package/boa/boa.conf
@@ -46,7 +46,7 @@ Port 80
 # Group: The group name or GID the server should run as.
 
 User nobody
-Group nogroup
+Group nobody
 
 # ServerAdmin: The email address where server problems should be sent.
 # Note: this is not currently used, except as an environment variable
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 2a9b504eb8..cdd515e1a4 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -114,7 +114,7 @@ define MOSQUITTO_INSTALL_INIT_SYSTEMD
 endef
 
 define MOSQUITTO_USERS
-	mosquitto -1 nogroup -1 * - - - Mosquitto user
+	mosquitto -1 nobody -1 * - - - Mosquitto user
 endef
 endif
 
diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 1449c58e41..ccfa40cfb1 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -102,7 +102,7 @@ ORACLE_MYSQL_CONF_OPTS += --without-debug
 endif
 
 define ORACLE_MYSQL_USERS
-	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
+	mysql -1 nobody -1 * /var/mysql - - MySQL daemon
 endef
 
 define ORACLE_MYSQL_ADD_FOLDER
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8e01a0db5b..e88b559dbb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -38,7 +38,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dmount-path=/usr/bin/mount \
 	-Dumount-path=/usr/bin/umount \
-	-Dnobody-group=nogroup \
 	-Didn=true \
 	-Dnss-systemd=true
 
diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 76346b35f2..6822a277bf 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -23,4 +23,4 @@ staff:x:50:
 lock:x:54:
 netdev:x:82:
 users:x:100:
-nogroup:x:65534:
+nobody:x:65534:
-- 
2.27.0
