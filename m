From: Christopher McCrory <chrismcc@gmail.com>
Date: Tue, 27 Feb 2018 03:50:22 -0800
Subject: [Buildroot] [PATCH 2/2] apache init script
Message-ID: <20180227115022.8802-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches and installs the included init script.  The script mostly works, but could use a little more editing.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/apache/0003-init-script.patch | 56 +++++++++++++++++++++++++++++++++++
 package/apache/apache.mk              |  6 ++++
 2 files changed, 62 insertions(+)
 create mode 100644 package/apache/0003-init-script.patch

diff --git a/package/apache/0003-init-script.patch b/package/apache/0003-init-script.patch
new file mode 100644
index 0000000000..1d7a6a022a
--- /dev/null
+++ b/package/apache/0003-init-script.patch
@@ -0,0 +1,56 @@
+--- apache-2.4.29/build/rpm/httpd.init.orig	2018-02-26 01:04:07.243097556 -0800
++++ apache-2.4.29/build/rpm/httpd.init	2018-02-26 01:50:18.311683909 -0800
+@@ -22,7 +22,7 @@
+ # description: The Apache HTTP Server is an efficient and extensible  \
+ #             server implementing the current HTTP standards.
+ # processname: httpd
+-# pidfile: /var/run/httpd.pid
++# pidfile: /var/logs/httpd.pid
+ # config: /etc/sysconfig/httpd
+ #
+ ### BEGIN INIT INFO
+@@ -36,7 +36,7 @@
+ ### END INIT INFO
+ 
+ # Source function library.
+-. /etc/rc.d/init.d/functions
++#. /etc/rc.d/init.d/functions
+ 
+ # What were we called? Multiple instances of the same daemon can be
+ # created by creating suitably named symlinks to this startup script
+@@ -58,13 +58,13 @@
+ # work correctly with a thread-based MPM; notably PHP will refuse to start.
+ 
+ httpd=${HTTPD-/usr/sbin/httpd}
+-pidfile=${PIDFILE-/var/run/${prog}.pid}
+-lockfile=${LOCKFILE-/var/lock/subsys/${prog}}
++pidfile=${PIDFILE-/var/logs/httpd.pid}
++lockfile=${LOCKFILE-/var/lock/httpd}
+ RETVAL=0
+ 
+ # check for 1.3 configuration
+ check13 () {
+-	CONFFILE=/etc/httpd/conf/httpd.conf
++	CONFFILE=/etc/apache2/httpd.conf
+ 	GONE="(ServerType|BindAddress|Port|AddModule|ClearModuleList|"
+ 	GONE="${GONE}AgentLog|RefererLog|RefererIgnore|FancyIndexing|"
+ 	GONE="${GONE}AccessConfig|ResourceConfig)"
+@@ -85,7 +85,8 @@
+ start() {
+         echo -n $"Starting $prog: "
+         check13 || exit 1
+-        LANG=$HTTPD_LANG daemon --pidfile=${pidfile} $httpd $OPTIONS
++        LANG=$HTTPD_LANG start-stop-daemon -S -q --pidfile=${pidfile} -x $httpd -- $OPTIONS
++
+         RETVAL=$?
+         echo
+         [ $RETVAL = 0 ] && touch ${lockfile}
+@@ -93,7 +94,7 @@
+ }
+ stop() {
+ 	echo -n $"Stopping $prog: "
+-	killproc -p ${pidfile} -d 10 $httpd
++	start-stop-daemon -K -p ${pidfile}
+ 	RETVAL=$?
+ 	echo
+ 	[ $RETVAL = 0 ] && rm -f ${lockfile} ${pidfile}
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 010ec31c33..5921d48b18 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -82,6 +82,12 @@ define APACHE_FIX_STAGING_APACHE_CONFIG
 endef
 APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
 
+define APACHE_INSTALL_INIT_SCRIPT
+	$(INSTALL) -D -m 0755 $(@D)/build/rpm/httpd.init \
+	 $(TARGET_DIR)/etc/init.d/S85httpd
+endef
+APACHE_POST_INSTALL_TARGET_HOOKS += APACHE_INSTALL_INIT_SCRIPT
+
 define APACHE_CLEANUP_TARGET
 	$(RM) -rf $(TARGET_DIR)/usr/manual $(TARGET_DIR)/usr/build
 endef
-- 
2.14.3
