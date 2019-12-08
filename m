From: Quentin Rameau <quinq@fifth.space>
Date: Mon, 9 Dec 2019 00:37:56 +0100
Subject: [Buildroot] [PATCH] package/busybox/udhcpc.script: fix network
 interface tag comments
Message-ID: <20191208233756.GA30928@fifth.space>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Per Linux man-pages resolv.conf(5): "Lines that contain a semicolon (;)
or hash character (#) in the first column are treated as comments."
---
 package/busybox/udhcpc.script | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 711963f974..35b4bead85 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -37,7 +37,7 @@ case "$1" in
 		# drop info from this interface
 		# resolv.conf may be a symlink to /tmp/, so take care
 		TMPFILE=$(mktemp)
-		grep -vE "# $interface\$" $RESOLV_CONF > $TMPFILE
+		sed "/^# $interface$/{N;d;}" $RESOLV_CONF > $TMPFILE
 		cat $TMPFILE > $RESOLV_CONF
 		rm -f $TMPFILE
 
@@ -75,7 +75,7 @@ case "$1" in
 		# drop info from this interface
 		# resolv.conf may be a symlink to /tmp/, so take care
 		TMPFILE=$(mktemp)
-		grep -vE "# $interface\$" $RESOLV_CONF > $TMPFILE
+		sed "/^# $interface$/{N;d;}" $RESOLV_CONF > $TMPFILE
 		cat $TMPFILE > $RESOLV_CONF
 		rm -f $TMPFILE
 
@@ -87,11 +87,11 @@ case "$1" in
 		fi
 
 		[ -n "$search_list" ] &&
-			echo "search $search_list # $interface" >> $RESOLV_CONF
+			printf '%s\n' "# $interface" "search $search_list" >> $RESOLV_CONF
 
 		for i in $dns ; do
 			echo adding dns $i
-			echo "nameserver $i # $interface" >> $RESOLV_CONF
+			printf '%s\n' "# $interface" "nameserver $i" >> $RESOLV_CONF
 		done
 		;;
 esac
-- 
2.24.0
