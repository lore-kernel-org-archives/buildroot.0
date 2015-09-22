From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 22 Sep 2015 10:14:58 +0300
Subject: [Buildroot] [PATCH] kompexsqlite: don't overwrite CFLAGS and
	CXXFLAGS in makefiles
Message-ID: <1442906098-30127-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/68c1cd7ce7889cf8bad8354e8d7b04e912885cb7

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../0002-append-to-cflags-and-cxxflags.patch       | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch

diff --git a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch b/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
new file mode 100644
index 0000000..abd0dc0
--- /dev/null
+++ b/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
@@ -0,0 +1,49 @@
+From 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7 Mon Sep 17 00:00:00 2001
+From: me <noemail@nowhere.com>
+Date: Thu, 20 Nov 2014 14:37:34 -0700
+Subject: [PATCH] Append to CFLAGS and CXXFLAGS as setup by ./configure.  This
+ can allow users to Customize the SQLite build process with compile time
+ #defines rather than altering the sources.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7
+
+ Makefile-shared.mk | 4 ++--
+ Makefile-static.mk | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile-shared.mk b/Makefile-shared.mk
+index b2a4920..d15ce3c 100644
+--- a/Makefile-shared.mk
++++ b/Makefile-shared.mk
+@@ -12,10 +12,10 @@ OBJS= \
+ 	${objsdir}/sqlite3.o
+ 
+ # C Compiler Flags
+-CFLAGS= -fPIC -MMD -MP
++CFLAGS+= -fPIC -MMD -MP
+ 
+ # CC Compiler Flags
+-CPPFLAGS= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
++CPPFLAGS+= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
+ 
+ # Link Libraries and Options
+ LDLIBSOPTIONS= -shared -fPIC
+diff --git a/Makefile-static.mk b/Makefile-static.mk
+index 429a4ff..0678681 100644
+--- a/Makefile-static.mk
++++ b/Makefile-static.mk
+@@ -12,10 +12,10 @@ OBJS= \
+ 	${objsdir}/sqlite3.o
+ 
+ # C Compiler Flags
+-CFLAGS= -MMD -MP
++CFLAGS+= -MMD -MP
+ 
+ # CC Compiler Flags
+-CPPFLAGS= -I${includedir} -MMD -MP
++CPPFLAGS+= -I${includedir} -MMD -MP
+ 
+ # Link Libraries and Options
+ LDLIBSOPTIONS=
-- 
1.8.1.4
