From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Feb 2015 17:23:09 +0100
Subject: [Buildroot] [git commit] package/libmpdclient: update to 2.10
Message-ID: <20150302222723.56F278057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a680da2834efbb15b706b7f69a7bf568e16596a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch is upstream.

Signed-off-by: Peter K??mmel <syntheticpp@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpdclient/0001-musl-fixes.patch |   41 ----------------------------
 package/libmpdclient/libmpdclient.mk       |    2 +-
 2 files changed, 1 insertions(+), 42 deletions(-)

diff --git a/package/libmpdclient/0001-musl-fixes.patch b/package/libmpdclient/0001-musl-fixes.patch
deleted file mode 100644
index 60df540..0000000
--- a/package/libmpdclient/0001-musl-fixes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cc2ffe943dd36a4c95ec34b2f2bf413de15b7974 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fran=C3=A7ois=20Revol?= <revol@free.fr>
-Date: Fri, 11 Jul 2014 08:56:49 +0200
-Subject: POSIX says fd_set is defined by <sys/select.h>
-
-Haiku requires this.
-
-cf.
-http://pubs.opengroup.org/onlinepubs/009695399/basedefs/sys/select.h.html
-
-Also guard sys/select.h by ifndef WIN32 as Mingw32 doesn't provide it.
-We'll avoid a configure check just for this.
-
-diff --git a/src/socket.c b/src/socket.c
-index f76510c..2aa5f7f 100644
---- a/src/socket.c
-+++ b/src/socket.c
-@@ -43,6 +43,7 @@
- #else
- #  include <netinet/in.h>
- #  include <arpa/inet.h>
-+#  include <sys/select.h>
- #  include <sys/socket.h>
- #  include <netdb.h>
- #  include <sys/un.h>
-diff --git a/src/sync.c b/src/sync.c
-index 43cfe50..0a6c9d3 100644
---- a/src/sync.c
-+++ b/src/sync.c
-@@ -33,6 +33,9 @@
- #include <assert.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#ifndef WIN32
-+#include <sys/select.h>
-+#endif
- #include <fcntl.h>
- #include <unistd.h>
- 
--- 
-cgit v0.10-2-gd358
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 530e4fc..db3ae05 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMPDCLIENT_VERSION_MAJOR = 2
-LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).9
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).10
 LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
 LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
 LIBMPDCLIENT_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
