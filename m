From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Aug 2017 13:53:05 +0300
Subject: [Buildroot] [PATCH] faad2: fix build with musl libc
Message-ID: <b727a178e0fa5a10b77e298e7b1dbf1b32ccb40d.1502880785.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The getopt.c code declares the strncmp() routine in a non confirming way
under non GNU libc. Patch the code to make the declaration standard
conforming.

Fixes:
http://autobuild.buildroot.net/results/447/4471be349d7ad2e998a4d55afd33aa046a5d1fd2/
http://autobuild.buildroot.net/results/2a9/2a90f4f518884fb50f7ad6ab505dee7565ed869e/
http://autobuild.buildroot.net/results/6b1/6b159b766d791492bab4d897c33ce07845fb7119/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-getopt-fix-strncmp-declaration.patch      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/faad2/0001-getopt-fix-strncmp-declaration.patch

diff --git a/package/faad2/0001-getopt-fix-strncmp-declaration.patch b/package/faad2/0001-getopt-fix-strncmp-declaration.patch
new file mode 100644
index 000000000000..0e5f27e52af2
--- /dev/null
+++ b/package/faad2/0001-getopt-fix-strncmp-declaration.patch
@@ -0,0 +1,40 @@
+From 6787914efad562e4097a153988109c5c7158abf7 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 16 Aug 2017 13:35:57 +0300
+Subject: [PATCH] getopt: fix strncmp() declaration
+
+The strncmp() declaration does not conform with the standard as to the
+type of the 'n' parameter. Fix this to avoid the following build failure
+with musl libc:
+
+n file included from main.c:61:0:
+getopt.c:175:13: error: conflicting types for 'strncmp'
+ extern int  strncmp(const char *s1, const char *s2, unsigned int n);
+             ^~~~~~~
+In file included from main.c:49:0:
+.../host/x86_64-buildroot-linux-musl/sysroot/usr/include/string.h:38:5: note: previous declaration of 'strncmp' was here
+ int strncmp (const char *, const char *, size_t);
+     ^~~~~~~
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://sourceforge.net/p/faac/bugs/217/
+
+ frontend/getopt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/frontend/getopt.c b/frontend/getopt.c
+index 185d49b804dd..40c7a2242551 100644
+--- a/frontend/getopt.c
++++ b/frontend/getopt.c
+@@ -172,7 +172,7 @@ static enum
+ #if __STDC__ || defined(PROTO)
+ extern char *getenv(const char *name);
+ extern int  strcmp (const char *s1, const char *s2);
+-extern int  strncmp(const char *s1, const char *s2, unsigned int n);
++extern int  strncmp(const char *s1, const char *s2, size_t n);
+ 
+ static int my_strlen(const char *s);
+ static char *my_index (const char *str, int chr);
+-- 
+2.14.1
+
-- 
2.14.1
