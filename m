From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Apr 2014 22:20:17 +0200
Subject: [Buildroot] [git commit] ulogd: bump to version 2.0.4
Message-ID: <20140410204503.CAA869C6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=010745a955b6cf4c979588fafdb7506460038e0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ulogd/ulogd-01-pthread-conditional.patch |   45 ----------------------
 package/ulogd/ulogd.mk                           |    2 +-
 2 files changed, 1 insertions(+), 46 deletions(-)

diff --git a/package/ulogd/ulogd-01-pthread-conditional.patch b/package/ulogd/ulogd-01-pthread-conditional.patch
deleted file mode 100644
index b33e0bc..0000000
--- a/package/ulogd/ulogd-01-pthread-conditional.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 389bade377e6e7335304636ea1ebd0a81b0c235e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Dec 2013 09:11:00 -0300
-Subject: [PATCH ulogd] ulogd: use AC_SEARCH_LIBS for libpthread
-
-Some uClibc-based toolchains lack threading support, so use
-AC_SEARCH_LIB instead of AC_CHECK_LIB to check for libpthread
-availability and link conditionally if found since it's only used for
-the database backends.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac    | 3 ++-
- src/Makefile.am | 4 ++--
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7f5ffa9..5e45aaa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -39,7 +39,8 @@ AC_CHECK_FUNCS(socket strerror)
- regular_CFLAGS="-Wall -Wextra -Wno-unused-parameter"
- AC_SUBST([regular_CFLAGS])
- 
--AC_CHECK_LIB(pthread, pthread_create)
-+AC_SEARCH_LIBS([pthread_create], [pthread], [libpthread_LIBS="$LIBS"; LIBS=""])
-+AC_SUBST([libpthread_LIBS])
- 
- dnl Check for the right nfnetlink version
- PKG_CHECK_MODULES([LIBNFNETLINK], [libnfnetlink >= 1.0.1])
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 1097468..998e776 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -7,5 +7,5 @@ AM_CFLAGS = ${regular_CFLAGS}
- sbin_PROGRAMS = ulogd
- 
- ulogd_SOURCES = ulogd.c select.c timer.c rbtree.c conffile.c hash.c addr.c
--ulogd_LDADD   = ${libdl_LIBS}
--ulogd_LDFLAGS = -export-dynamic -lpthread
-+ulogd_LDADD   = ${libdl_LIBS} ${libpthread_LIBS}
-+ulogd_LDFLAGS = -export-dynamic
--- 
-1.8.3.2
-
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index b51da21..28ada96 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.3
+ULOGD_VERSION = 2.0.4
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
