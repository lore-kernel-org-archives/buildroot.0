From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:39:36 +0200
Subject: [Buildroot] [git commit] pango: remove initscript
Message-ID: <20151015074025.D833D81D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c59216f154e83521628068bb12994fe28894894
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pango-querymodules is deprecated/removed, so ditch the initscript.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/S25pango |   20 --------------------
 package/pango/pango.mk |    5 -----
 2 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/package/pango/S25pango b/package/pango/S25pango
deleted file mode 100644
index 9af9307..0000000
--- a/package/pango/S25pango
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-#
-# run pango-querymodules if needed
-
-FILE=/etc/pango/pango.modules
-
-case "$1" in
-     start|"")
-	if [ ! -f $FILE ] ; then
-	   mkdir -p /etc/pango
-	   /usr/bin/pango-querymodules > "$FILE"
-	fi
-	;;
-    stop)
-	;;
-    *)
-	echo "Usage: $0 {start|stop}" >&2
-	exit 1
-	;;
-esac
\ No newline at end of file
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 19d6509..6c96cd3 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -97,10 +97,5 @@ PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
 PANGO_CONF_OPTS += --with-xft
 endif
 
-define PANGO_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/pango/S25pango \
-		$(TARGET_DIR)/etc/init.d/S25pango
-endef
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
