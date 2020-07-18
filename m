From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 14:18:33 +0200
Subject: [Buildroot] [git commit] system: replace nogroup with nobody
Message-ID: <20200718121432.32C5C83ADA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d887cc2b484a87d2e6c1d913ad28cb00200886b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we define the so-called "overflow group" as 'nogroup'.

However, one practical issue is that systemd-sysusers will otherwise
create a 'nobody' group with gid 999, because that's is what is usual to
define the overflow group: users and groups are defined in LSB (Linux
Standard Base):

    https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/usernames.html

Quoting: "If the username exists on a system,then they should be in the
suggested corresponding group".

Only Debian and derivatives depart from this custom, naming it 'nogroup'
(hence the rationale for commit 908198e756b4 (system/skeleton: remove
spurious group 'nobody').

See also commit 9c67af2c52 (system/skeleton: use uid/gid 65534 for
nobody/nogroup), and a related discussion on LWN.net (key is "overflow
UID" which also applies to GID):

    https://lwn.net/Articles/695478/

Use the recommended groupname 'nobody'. Adapt packages accordingly.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr:
  - reword commit log
  - extend commit log with more references (commits and LWN)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
index 0890ac3ac0..570841ebe3 100644
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
