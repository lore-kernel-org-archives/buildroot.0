From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:33 -0300
Subject: [Buildroot] [PATCH 15/26] ntp: don't test if the binary exists in
 the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-16-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Replace the DAEMON variable, which was used only once, by the full path
of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/ntp/S49ntp | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index b4047fceda..35e58746b4 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -1,10 +1,6 @@
 #! /bin/sh
 
 NAME=ntpd
-DAEMON=/usr/sbin/$NAME
-
-# Gracefully exit if the package has been removed.
-test -x $DAEMON || exit 0
 
 # Read config file if it is present.
 if [ -r /etc/default/$NAME ]
@@ -15,7 +11,7 @@ fi
 case "$1" in
   start)
     printf "Starting $NAME: "
-    start-stop-daemon -S -q -x $DAEMON -- -g
+    start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
     [ $? = 0 ] && echo "OK" || echo "FAIL"
     ;;
   stop)
-- 
2.14.3
