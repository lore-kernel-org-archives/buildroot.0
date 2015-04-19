From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:11:11 +0200
Subject: [Buildroot] [git commit] ejabberd: allow one to change SPOOLDIR
	location
Message-ID: <20150419091150.EB34780489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f266a36d62b5ac3b418ab15675c72fc172ab24fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, ejabberd saves the mnesia database into /var/lib/ejabberd.
Otherwise, one might want to change this location (e.g., if /var/lib is
read-only). Add an option in the init script to offer this possibility.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/S50ejabberd |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

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
