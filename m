From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Apr 2016 20:58:39 +0200
Subject: [Buildroot] [git commit] busybox: Support option 119 in udhcpc
	default script.
Message-ID: <20160424185959.C0953817DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5e143dcfb007d53aa872dafa968bfb078c9d724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* package/busybox/udhcpc.script: Use $search instead of $domain if
  that is defined.

Note that for this to work, not only has CONFIG_FEATURE_UDHCP_RFC3397
be enabled in Busybox' configuration but also the option has to be
requested using the "-O search" command-line option (one can set it in
CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS, for instance).

[Peter: add comment with reference to rfc3359/option 119 for clarity]
Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 50c52e6..ad110d3 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -56,7 +56,16 @@ case "$1" in
 		cat $TMPFILE > $RESOLV_CONF
 		rm -f $TMPFILE
 
-		[ -n "$domain" ] && echo "search $domain # $interface" >> $RESOLV_CONF
+		# prefer rfc3359 domain search list (option 119) if available
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
