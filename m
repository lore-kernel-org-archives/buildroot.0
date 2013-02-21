From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Feb 2013 10:59:06 +0100
Subject: [Buildroot] [git commit] matchbox-wm: fix mbtheme build issue when
	png support is disabled
Message-ID: <20130221100115.01E3F9AAAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32ceab7ec0584be334618576e52b214aa2c3c04e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c02af7b66ae2c14d94edaa940f9edfcde9a9fad5

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../matchbox-wm/matchbox-wm-defaulttheme.patch     |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/matchbox-wm/matchbox-wm-defaulttheme.patch b/package/matchbox/matchbox-wm/matchbox-wm-defaulttheme.patch
new file mode 100644
index 0000000..b4da664
--- /dev/null
+++ b/package/matchbox/matchbox-wm/matchbox-wm-defaulttheme.patch
@@ -0,0 +1,47 @@
+[PATCH] fix mbtheme build issue when png support is disabled
+
+DEFAULTTHEME{,NAME} is not defined when png support is disabled, leading
+to compile errors in mbtheme.c:
+
+mbtheme.c: In function 'show_parse_error':
+mbtheme.c:2422:28: error: 'DEFAULTTHEME' undeclared (first use in this function)
+mbtheme.c:2422:28: note: each undeclared identifier is reported only once for each function it appears in
+mbtheme.c: In function 'mbtheme_init':
+mbtheme.c:2448:30: error: 'DEFAULTTHEME' undeclared (first use in this function)
+mbtheme.c:2470:25: error: 'DEFAULTTHEMENAME' undeclared (first use in this function)
+
+Fix it by unconditionally defining them as the values used are the same
+in png / !png cases anyway.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/structs.h |    9 ---------
+ 1 file changed, 9 deletions(-)
+
+Index: matchbox-window-manager-1.2/src/structs.h
+===================================================================
+--- matchbox-window-manager-1.2.orig/src/structs.h
++++ matchbox-window-manager-1.2/src/structs.h
+@@ -81,8 +81,6 @@
+ 
+ #define GENERIC_ICON        PKGDATADIR "/mbnoapp.xpm"
+ 
+-#ifdef MB_HAVE_PNG
+-
+ #define DEFAULT_THEME       DATADIR "/themes/Default/matchbox/theme.xml"
+ 
+ #define DEFAULTTHEME       DATADIR "/themes/Default/matchbox/theme.xml"
+@@ -91,13 +89,6 @@
+ 
+ #define DEFAULTTHEMENAME  "Default"
+ 
+-#else
+-
+-#define DEFAULT_THEME       DATADIR "/themes/Default/matchbox/theme.xml"
+-#define DEFAULT_THEME_NAME  "Default"
+-
+-#endif
+-
+ #define CONFDEFAULTS       PKGDATADIR "/defaults"
+ 
+ /* Simple Macros  */
