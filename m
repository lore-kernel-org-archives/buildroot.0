From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 18:36:58 +0200
Subject: [Buildroot] [git commit] package/zbar: fix NLS build with musl
Message-ID: <20200829164016.900F5805B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ae517aa7a7e860c13cda7bb9d413cf5efdf4918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/b93ce5430bf22ddda94ee30882a883348617f5b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...arcam-zbar-cam-img-.c-fix-build-with-musl.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch b/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch
new file mode 100644
index 0000000000..fe62c1649c
--- /dev/null
+++ b/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch
@@ -0,0 +1,55 @@
+From ecf90fcff066c06eda1fb931d08fadf5989ecb36 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 29 Aug 2020 14:23:04 +0200
+Subject: [PATCH] zbarcam/zbar{cam,img}.c: fix build with musl
+
+setlocale is used since version 0.23.1 and
+https://git.linuxtv.org/zbar.git/commit/id=d05911f8d5fb8c1e064bd93ed9ec9f038c5da096
+
+Include locale.h to avoid the following build failure on musl:
+
+zbarcam/zbarcam.c:168:5: warning: implicit declaration of function 'setlocale'; did you mean 'setstate'? [-Wimplicit-function-declaration]
+     setlocale (LC_ALL, "");
+     ^~~~~~~~~
+     setstate
+zbarcam/zbarcam.c:168:16: error: 'LC_ALL' undeclared (first use in this function)
+     setlocale (LC_ALL, "");
+                ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b93ce5430bf22ddda94ee30882a883348617f5b1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mchehab/zbar/pull/115]
+---
+ zbarcam/zbarcam.c | 1 +
+ zbarimg/zbarimg.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/zbarcam/zbarcam.c b/zbarcam/zbarcam.c
+index 6e13c8c..b8bc732 100644
+--- a/zbarcam/zbarcam.c
++++ b/zbarcam/zbarcam.c
+@@ -36,6 +36,7 @@
+ 
+ #ifdef ENABLE_NLS
+ # include <libintl.h>
++# include <locale.h>
+ # define _(string) gettext(string)
+ #else
+ # define _(string) string
+diff --git a/zbarimg/zbarimg.c b/zbarimg/zbarimg.c
+index d05d832..52502b2 100644
+--- a/zbarimg/zbarimg.c
++++ b/zbarimg/zbarimg.c
+@@ -41,6 +41,7 @@
+ 
+ #ifdef ENABLE_NLS
+ # include <libintl.h>
++# include <locale.h>
+ # define _(string) gettext(string)
+ #else
+ # define _(string) string
+-- 
+2.28.0
+
