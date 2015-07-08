From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:15 +0200
Subject: [Buildroot] [PATCH 02/11] ejabberd: simplify init script by
	patching ejabberdctl
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-3-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let a user modify environment variables used in ejabberdctl by loading
a default configuration file.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/0009-fix-ejabberdctl.patch | 21 +++++++++++++++++++
 package/ejabberd/S50ejabberd                | 32 +++++++++++++----------------
 2 files changed, 35 insertions(+), 18 deletions(-)
 create mode 100644 package/ejabberd/0009-fix-ejabberdctl.patch

diff --git a/package/ejabberd/0009-fix-ejabberdctl.patch b/package/ejabberd/0009-fix-ejabberdctl.patch
new file mode 100644
index 0000000..9ae23ac
--- /dev/null
+++ b/package/ejabberd/0009-fix-ejabberdctl.patch
@@ -0,0 +1,21 @@
+Description: fix ejabberdctl
+ Change default values so ejabberdctl run commands as ejabberd user
+ Also add a way for the user to change default values.
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+
+diff --git a/ejabberdctl.template b/ejabberdctl.template
+index 79f4438..df0abba 100755
+--- a/ejabberdctl.template
++++ b/ejabberdctl.template
+@@ -14,7 +14,10 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
+ ERL={{erl}}
+ IEX={{bindir}}/iex
+ EPMD={{bindir}}/epmd
+-INSTALLUSER={{installuser}}
++INSTALLUSER=ejabberd
++
++# Read default configuration file if present.
++[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
+ 
+ # check the proper system user is used if defined
+ if [ "$INSTALLUSER" != "" ] ; then
diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index ff38d92..2161ead 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -3,30 +3,26 @@
 # Start/stop ejabberd
 #
 
-NAME=ejabberd
-USER=ejabberd
+CTL=/usr/sbin/ejabberdctl
+DEFAULT=/etc/default/ejabberd
+INSTALLUSER=ejabberd
 RUNDIR=/var/run/ejabberd
-SPOOLDIR=/var/lib/ejabberd
 
-# Read configuration variable file if it is present.
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+# Read default configuration file if present.
+[ -r "$DEFAULT" ] && . "$DEFAULT"
 
+# Create RUNDIR.
 mkrundir() {
-    install -d -o "$USER" -g "$USER" "$RUNDIR" "$SPOOLDIR"
-}
-
-# Run ejabberdctl as user $USER.
-ctl() {
-    su $USER -c "ejabberdctl $*"
+    install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
 }
 
 case "$1" in
     start)
         mkrundir || exit 1
         echo -n "Starting ejabberd... "
-        ctl start --spool "$SPOOLDIR"
+        "$CTL" start
         # Wait until ejabberd is up and running.
-        if ctl started; then
+        if "$CTL" started; then
             echo "done"
         else
             echo "failed"
@@ -34,23 +30,23 @@ case "$1" in
         ;;
     stop)
         echo -n "Stopping ejabberd... "
-        ctl stop > /dev/null
-        if [ $? -eq 3 ] || ctl stopped; then
+        "$CTL" stop > /dev/null
+        if [ $? -eq 3 ] || "$CTL" stopped; then
             echo "OK"
         else
             echo "failed"
         fi
         ;;
     status)
-        ctl status
+        "$CTL" status
         ;;
     restart|force-reload)
-        "$0" stop
+        "$0" stop || true
         "$0" start
         ;;
     live)
         mkrundir || exit 1
-        ctl live
+        "$CTL" live
         ;;
     *)
         echo "Usage: $0 {start|stop|status|restart|force-reload|live}"
-- 
2.1.4
