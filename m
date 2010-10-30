From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sat, 30 Oct 2010 20:26:09 +0300
Subject: [Buildroot] [PATCH] libgtk2: Fix pixbuf loaders cache file
	generation
Message-ID: <20101030172608.28962.85426.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After libgtk was bumped to 2.22.0 default loacation of
pixbuf loaders cache changed.
Use --update-cache flag for gdk-pixbuf-query-loaders
which does waht we need.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/libgtk2/S26libgtk2 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/S26libgtk2 b/package/libgtk2/S26libgtk2
index da5cc6e..4a6cb43 100644
--- a/package/libgtk2/S26libgtk2
+++ b/package/libgtk2/S26libgtk2
@@ -2,13 +2,13 @@
 #
 # run pgdk-pixbuf-query-loaders if needed
 
-FILE=/etc/gtk-2.0/gdk-pixbuf.loaders
+FILE=/etc/gdk-loaders-cache.exists
 
 case "$1" in
     start|"")
 	if [ ! -f "$FILE" ] ; then
-	    mkdir -p /etc/gtk-2.0
-	    /usr/bin/gdk-pixbuf-query-loaders > "$FILE"
+	    /usr/bin/gdk-pixbuf-query-loaders --update-cache
+	    touch $FILE
 	fi
 	;;
     stop)
