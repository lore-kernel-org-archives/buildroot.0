From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 15 Apr 2015 17:39:06 +0200
Subject: [Buildroot] [PATCH 2/3] ejabberd: allow one to change SPOOLDIR
	location
In-Reply-To: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
References: <1429112347-17009-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1429112347-17009-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, ejabberd saves the mnesia database into /var/lib/ejabberd.
Otherwise, one might want to change this location (e.g., if /var/lib is
read-only). Add an option in the init script to offer this possibility.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/S50ejabberd | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index 925a072..a471078 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -3,11 +3,16 @@
 # Start/stop ejabberd
 #
 
+NAME=ejabberd
 USER=ejabberd
 RUNDIR=/var/run/ejabberd
+SPOOLDIR=/var/lib/ejabberd
+
+# Read configuration variable file if it is present.
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
 
 mkrundir() {
-    install -d -o "$USER" -g "$USER" "$RUNDIR"
+    install -d -o "$USER" -g "$USER" "$RUNDIR" "$SPOOLDIR"
 }
 
 # Run ejabberdctl as user $USER.
@@ -19,7 +24,7 @@ case "$1" in
     start)
         mkrundir || exit 1
         echo -n "Starting ejabberd... "
-        ctl start
+        ctl start --spool "$SPOOLDIR"
         ;;
     stop)
         echo -n "Stopping ejabberd... "
-- 
2.1.0
