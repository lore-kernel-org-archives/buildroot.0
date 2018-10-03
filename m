From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Oct 2018 23:06:24 +0200
Subject: [Buildroot] [PATCH 1/1] screen: fix parallel build
Message-ID: <20181003210624.3085-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

comm.h is needed to build list_display.o and list_generic.o otherwise
parallel builds will sometimes fail

Fixes:
 - http://autobuild.buildroot.org/results/43105f14857dbe72d8878fc7b3db67f7bdca93cc
 - http://autobuild.buildroot.org/results/47f4ecbec1355285633df287fc9c4e7cccde9378

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-needed-for-list_-display-generic-.o.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch

diff --git a/package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch b/package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch
new file mode 100644
index 0000000000..f406a1afac
--- /dev/null
+++ b/package/screen/0011-comm.h-needed-for-list_-display-generic-.o.patch
@@ -0,0 +1,35 @@
+From b719314d201a3e9e1e57c65746a468c47bfc847f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 3 Oct 2018 22:29:32 +0200
+Subject: [PATCH] comm.h needed for list_{display,generic}.o
+
+comm.h is needed to build list_display.o and list_generic.o otherwise
+parallel builds will sometimes fail
+
+Fixes:
+ - http://autobuild.buildroot.org/results/43105f14857dbe72d8878fc7b3db67f7bdca93cc
+ - http://autobuild.buildroot.org/results/47f4ecbec1355285633df287fc9c4e7cccde9378
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://savannah.gnu.org/bugs/index.php?54776]
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index af5938b..e6d5247 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -265,7 +265,7 @@  braille.h
+ viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.h osdef.h ansi.h acls.h \
+  comm.h layer.h term.h image.h display.h window.h extern.h \
+  braille.h
+-list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
+-list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
++list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
++list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
+ list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
+ 
+-- 
+2.17.1
+
-- 
2.17.1
