From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 29 Sep 2014 23:26:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: Add upstream patch to
	fix build with musl
Message-ID: <1412025972-29533-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch from upstream to support building with the musl C library.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 .../libmpdclient-0001-musl-fixes.patch             | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/libmpdclient/libmpdclient-0001-musl-fixes.patch

diff --git a/package/libmpdclient/libmpdclient-0001-musl-fixes.patch b/package/libmpdclient/libmpdclient-0001-musl-fixes.patch
new file mode 100644
index 0000000..60df540
--- /dev/null
+++ b/package/libmpdclient/libmpdclient-0001-musl-fixes.patch
@@ -0,0 +1,41 @@
+From cc2ffe943dd36a4c95ec34b2f2bf413de15b7974 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fran=C3=A7ois=20Revol?= <revol@free.fr>
+Date: Fri, 11 Jul 2014 08:56:49 +0200
+Subject: POSIX says fd_set is defined by <sys/select.h>
+
+Haiku requires this.
+
+cf.
+http://pubs.opengroup.org/onlinepubs/009695399/basedefs/sys/select.h.html
+
+Also guard sys/select.h by ifndef WIN32 as Mingw32 doesn't provide it.
+We'll avoid a configure check just for this.
+
+diff --git a/src/socket.c b/src/socket.c
+index f76510c..2aa5f7f 100644
+--- a/src/socket.c
++++ b/src/socket.c
+@@ -43,6 +43,7 @@
+ #else
+ #  include <netinet/in.h>
+ #  include <arpa/inet.h>
++#  include <sys/select.h>
+ #  include <sys/socket.h>
+ #  include <netdb.h>
+ #  include <sys/un.h>
+diff --git a/src/sync.c b/src/sync.c
+index 43cfe50..0a6c9d3 100644
+--- a/src/sync.c
++++ b/src/sync.c
+@@ -33,6 +33,9 @@
+ #include <assert.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#ifndef WIN32
++#include <sys/select.h>
++#endif
+ #include <fcntl.h>
+ #include <unistd.h>
+ 
+-- 
+cgit v0.10-2-gd358
-- 
2.1.1
