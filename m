From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Dec 2013 09:23:29 -0300
Subject: [Buildroot] [PATCH] ulogd: link conditionally to libpthread
Message-ID: <1386678209-6815-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpthread is only needed for the database backends so don't link
against it if it's not available.

Fixes:
http://autobuild.buildroot.net/results/527/527d9d4f42af0ffc110e4f52701df279f466a89a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/ulogd-01-pthread-conditional.patch | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/ulogd/ulogd-01-pthread-conditional.patch

diff --git a/package/ulogd/ulogd-01-pthread-conditional.patch b/package/ulogd/ulogd-01-pthread-conditional.patch
new file mode 100644
index 0000000..b33e0bc
--- /dev/null
+++ b/package/ulogd/ulogd-01-pthread-conditional.patch
@@ -0,0 +1,45 @@
+From 389bade377e6e7335304636ea1ebd0a81b0c235e Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 10 Dec 2013 09:11:00 -0300
+Subject: [PATCH ulogd] ulogd: use AC_SEARCH_LIBS for libpthread
+
+Some uClibc-based toolchains lack threading support, so use
+AC_SEARCH_LIB instead of AC_CHECK_LIB to check for libpthread
+availability and link conditionally if found since it's only used for
+the database backends.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac    | 3 ++-
+ src/Makefile.am | 4 ++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7f5ffa9..5e45aaa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -39,7 +39,8 @@ AC_CHECK_FUNCS(socket strerror)
+ regular_CFLAGS="-Wall -Wextra -Wno-unused-parameter"
+ AC_SUBST([regular_CFLAGS])
+ 
+-AC_CHECK_LIB(pthread, pthread_create)
++AC_SEARCH_LIBS([pthread_create], [pthread], [libpthread_LIBS="$LIBS"; LIBS=""])
++AC_SUBST([libpthread_LIBS])
+ 
+ dnl Check for the right nfnetlink version
+ PKG_CHECK_MODULES([LIBNFNETLINK], [libnfnetlink >= 1.0.1])
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 1097468..998e776 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -7,5 +7,5 @@ AM_CFLAGS = ${regular_CFLAGS}
+ sbin_PROGRAMS = ulogd
+ 
+ ulogd_SOURCES = ulogd.c select.c timer.c rbtree.c conffile.c hash.c addr.c
+-ulogd_LDADD   = ${libdl_LIBS}
+-ulogd_LDFLAGS = -export-dynamic -lpthread
++ulogd_LDADD   = ${libdl_LIBS} ${libpthread_LIBS}
++ulogd_LDFLAGS = -export-dynamic
+-- 
+1.8.3.2
+
-- 
1.8.3.2
