From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 17 Jul 2020 12:20:48 +0200
Subject: [Buildroot] [PATCH 1/1] treewide: replace nogroup with nobody
Message-ID: <20200717102048.346554-1-nolange79@gmail.com>
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
 package/boa/boa.conf                 | 18 +++++++++---------
 package/mosquitto/mosquitto.mk       |  2 +-
 package/oracle-mysql/oracle-mysql.mk |  2 +-
 package/systemd/systemd.mk           |  1 -
 system/skeleton/etc/group            |  2 +-
 5 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/boa/boa.conf b/package/boa/boa.conf
index e94029665f..03630c0f9a 100644
--- a/package/boa/boa.conf
+++ b/package/boa/boa.conf
@@ -7,7 +7,7 @@
 # generated parser.  If it reports an error, the line number will be
 # provided; it should be easy to spot.  The syntax of each of these
 # rules is very simple, and they can occur in any order.  Where possible
-# these directives mimic those of NCSA httpd 1.3; I saw no reason to 
+# these directives mimic those of NCSA httpd 1.3; I saw no reason to
 # introduce gratuitous differences.
 
 # $Id: boa.conf,v 1.1 2004/10/09 02:48:37 andersen Exp $
@@ -46,7 +46,7 @@ Port 80
 # Group: The group name or GID the server should run as.
 
 User nobody
-Group nogroup
+Group nobody
 
 # ServerAdmin: The email address where server problems should be sent.
 # Note: this is not currently used, except as an environment variable
@@ -68,7 +68,7 @@ ErrorLog /var/log/boa/error_log
 
 # AccessLog: The location of the access log file. If this does not
 # start with /, it is considered relative to the server root.
-# Comment out or set to /dev/null (less effective) to disable 
+# Comment out or set to /dev/null (less effective) to disable
 # Access logging.
 
 AccessLog /var/log/boa/access_log
@@ -78,7 +78,7 @@ AccessLog /var/log/boa/access_log
 #  process if the receiving end of a pipe stops reading."
 #AccessLog  "|/usr/sbin/cronolog --symlink=/var/log/boa/access_log /var/log/boa/access-%Y%m%d.log"
 
-# UseLocaltime: Logical switch.  Uncomment to use localtime 
+# UseLocaltime: Logical switch.  Uncomment to use localtime
 # instead of UTC time
 #UseLocaltime
 
@@ -88,8 +88,8 @@ AccessLog /var/log/boa/access_log
 
 #VerboseCGILogs
 
-# ServerName: the name of this server that should be sent back to 
-# clients if different than that returned by gethostname + gethostbyname 
+# ServerName: the name of this server that should be sent back to
+# clients if different than that returned by gethostname + gethostbyname
 
 #ServerName www.your.org.here
 
@@ -103,7 +103,7 @@ AccessLog /var/log/boa/access_log
 # output rules, it prepends the interface number to each access_log line.
 # You are expected to fix that problem with a postprocessing script.
 
-#VirtualHost 
+#VirtualHost
 
 # DocumentRoot: The root directory of the HTML documents.
 # Comment out to disable server non user files.
@@ -131,9 +131,9 @@ DirectoryMaker /usr/lib/boa/boa_indexer
 
 # DirectoryCache: If DirectoryIndex doesn't exist, and DirectoryMaker
 # has been commented out, the the on-the-fly indexing of Boa can be used
-# to generate indexes of directories. Be warned that the output is 
+# to generate indexes of directories. Be warned that the output is
 # extremely minimal and can cause delays when slow disks are used.
-# Note: The DirectoryCache must be writable by the same user/group that 
+# Note: The DirectoryCache must be writable by the same user/group that
 # Boa runs as.
 
 # DirectoryCache /var/spool/boa/dircache
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
index 88adf1941c..ddcf7d0cc0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -45,7 +45,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dloadkeys-path=/usr/bin/loadkeys \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dtelinit-path=/sbin/telinit \
-	-Dnobody-group=nogroup \
 	-Didn=true \
 	-Dnss-systemd=true \
 	-Dportabled=false
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
