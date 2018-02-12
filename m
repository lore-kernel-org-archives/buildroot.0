From: Alex B <alexbaldwinmusic@gmail.com>
Date: Mon, 12 Feb 2018 22:17:55 +0100
Subject: [Buildroot] [PATCH NEXT 1/1] Liblo - disable werror and link
 libatomic
Message-ID: <1518470275-10997-1-git-send-email-alexbaldwinmusic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex <alexbaldwinmusic@gmail.com>

This patch fixes 2 errors that were discovered by the autobuild:

1) -werror is still present, which threw up errors regarding redirecting sys/poll.h
to poll.h in the file server.c
To fix this -werror has been disbled with a conf_opt and a patch applied to
server.c that fixes the redirect.

2) On some architectures libatomic must be linked. A conf_env has been added
that links libatomic if it is present in the toolchain.

Signed-off-by: Alex <alexbaldwinmusic@gmail.com>
---
 package/liblo/0000-server.c-fixHeaderRedirects.patch | 13 +++++++++++++
 package/liblo/liblo.mk                               | 13 +++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 package/liblo/0000-server.c-fixHeaderRedirects.patch

diff --git a/package/liblo/0000-server.c-fixHeaderRedirects.patch b/package/liblo/0000-server.c-fixHeaderRedirects.patch
new file mode 100644
index 0000000..ae284d2
--- /dev/null
+++ b/package/liblo/0000-server.c-fixHeaderRedirects.patch
@@ -0,0 +1,13 @@
+diff --git a/src/server.c b/src/server.c
+index 01fa08f..11c62d2 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -51,7 +51,7 @@
+ #include <netdb.h>
+ #include <sys/socket.h>
+ #ifdef HAVE_POLL
+-#include <sys/poll.h>
++#include <poll.h>
+ #endif
+ #include <sys/un.h>
+ #include <arpa/inet.h>
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 14b0527..7332334 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -11,7 +11,16 @@ LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES

-# IPv6 support broken, issue known upstream
-LIBLO_CONF_OPTS = --disable-ipv6
+# IPv6 support broken, issue known upstream.
+# wError - not needed for release.
+LIBLO_CONF_OPTS += \
+       --disable-ipv6 \
+       --disable-werror
+
+# Liblo uses atomics, so we need to link with
+# libatomic for the architectures who explicitly need libatomic.
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+	LIBLO_CONF_ENV += LIBS="-latomic"
+endif

 $(eval $(autotools-package))
--
2.7.4
