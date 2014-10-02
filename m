From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 21:52:31 +0200
Subject: [Buildroot] [git commit] package/libmpdclient: Add upstream patch
	to fix build with musl
Message-ID: <20141002195450.1699E9D48F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71caed48f2b6419a228747b5d9ea63c1dbe0b454
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream to support building with the musl C library.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libmpdclient-0001-musl-fixes.patch             |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

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
