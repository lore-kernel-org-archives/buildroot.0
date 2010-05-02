From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] tslib: fix plugin linking
Message-ID: <20100502074443.7ED368A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec45e2bad4e26d193f3c1ff5ffafe82f98161d14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes error: "Couldnt load module pthres" and similar.

Original patch: svn://svn.berlios.de/tslib/trunk at 56.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../tslib-1.0-link-plugins-against-libts.patch     |   48 ++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/tslib/tslib-1.0-link-plugins-against-libts.patch

diff --git a/package/tslib/tslib-1.0-link-plugins-against-libts.patch b/package/tslib/tslib-1.0-link-plugins-against-libts.patch
new file mode 100644
index 0000000..d60b6a1
--- /dev/null
+++ b/package/tslib/tslib-1.0-link-plugins-against-libts.patch
@@ -0,0 +1,48 @@
+commit 12435b337ea074bd31ccb03aff58c7eefa86f31c
+Author: kergoth <kergoth@a933c7a4-9bf7-0310-9141-a2e45189604d>
+Date:   Sat Nov 1 20:46:07 2008 +0000
+
+    Link plugins against libts
+    
+    Some plugins use tslib functions. Link those plugins against libts.
+    The problem is easy to see with LDFLAGS="-Wl,-no-undefined".
+    Without this change DirectFB in unable to use tslib because symbols
+    in the tslib plugins can't be resolved.
+    
+    Signed-off-by: Ville Syrjala <syrjala@sci.fi>
+    Signed-off-by: Chris Larson <clarson@kergoth.com>
+    
+    git-svn-id: svn://svn.berlios.de/tslib/trunk/tslib at 56 a933c7a4-9bf7-0310-9141-a2e45189604d
+
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index 3b902c2..4c4ef8b 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -114,15 +114,19 @@ pluginexec_LTLIBRARIES = \
+   
+ variance_la_SOURCES	= variance.c
+ variance_la_LDFLAGS	= -module $(LTVSN)
++variance_la_LIBADD	= $(top_builddir)/src/libts.la
+   
+ dejitter_la_SOURCES	= dejitter.c
+ dejitter_la_LDFLAGS	= -module $(LTVSN)
++dejitter_la_LIBADD	= $(top_builddir)/src/libts.la
+   
+ linear_la_SOURCES	= linear.c
+ linear_la_LDFLAGS	= -module $(LTVSN)
++linear_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
+ pthres_la_SOURCES	= pthres.c
+ pthres_la_LDFLAGS	= -module $(LTVSN)
++pthres_la_LIBADD	= $(top_builddir)/src/libts.la
+ 
+ # hw access
+ corgi_la_SOURCES	= corgi-raw.c
+@@ -148,6 +152,7 @@ tatung_la_LDFLAGS	= -module $(LTVSN)
+ 
+ input_la_SOURCES	= input-raw.c
+ input_la_LDFLAGS	= -module $(LTVSN)
++input_la_LIBADD		= $(top_builddir)/src/libts.la
+ 
+ linear_h2200_la_SOURCES	= linear-h2200.c
+ linear_h2200_la_LDFLAGS	= -module $(LTVSN)
-- 
1.6.3.3
