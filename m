From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Thu, 31 Mar 2016 09:34:43 +0200
Subject: [Buildroot] [PATCH] busybox: Support option 119 in udhcpc default
	script.
Message-ID: <20160331073442.GA1046@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* package/busybox/udhcpc.script: Use $search instead of $domain if
  that is defined.

Note that for this to work, not only has CONFIG_FEATURE_UDHCP_RFC3397
be enabled in Busybox' configuration but also the option has to be
requested using the "-O search" command-line option (one can set it in
CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS, for instance).

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/busybox/udhcpc.script | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 50c52e6..d8e6490 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -56,7 +56,15 @@ case "$1" in
 		cat $TMPFILE > $RESOLV_CONF
 		rm -f $TMPFILE
 
-		[ -n "$domain" ] && echo "search $domain # $interface" >> $RESOLV_CONF
+		if [ -n "$search" ]; then
+			search_list=$search
+		elif [ -n "$domain" ]; then
+			search_list=$domain
+		fi
+
+		[ -n "$search_list" ] &&
+			echo "search $search_list # $interface" >> $RESOLV_CONF
+
 		for i in $dns ; do
 			echo adding dns $i
 			echo "nameserver $i # $interface" >> $RESOLV_CONF
-- 
2.5.0
