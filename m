From: Alex B <alexbaldwinmusic@gmail.com>
Date: Mon, 12 Feb 2018 13:33:24 +0100
Subject: [Buildroot] [PATCH v3 1/1] LIBLO : bump version to 0.29
Message-ID: <1518438804-7961-1-git-send-email-alexbaldwinmusic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex <alexbaldwinmusic@gmail.com>

Starting from version 0.28, C++ wrappers are provided as well. The configure
script appropriately detects the availability of a C++ compiler so no Buildroot
changes are needed for this.

Building fails with --enable-ipv6 so --disable-ipv6 is needed in CONF_OPTS.
This is known by liblo developers and building without ipv6 support is recomennded.

werror is kept on, so disable this with --disable-werror.

Patch to fix werror about redirect from sys/poll.h to poll.h

Liblo use's atomics, some architectures need explicit linking with libatomic. Added
link to reflect this.

Included hash for license files.

Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>

---
CHANGELOG
-V2
No longer including a patch for liblo/configure. This was the wrong way of dealing with --enable-ipv6.
SHA256 for COPYING file instead of sha1.
Include  # License files comment for clarity.
-V3
disable werror
poll.h redirect patch
link with libatomic when HAS_LIBATOMIC

Signed-off-by: Alex <alexbaldwinmusic@gmail.com>
---
 package/liblo/0000-server.c-fixPollHeaderRedirect.patch | 13 +++++++++++++
 package/liblo/liblo.hash                                |  9 ++++++---
 package/liblo/liblo.mk                                  | 14 +++++++++++++-
 3 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 package/liblo/0000-server.c-fixPollHeaderRedirect.patch

diff --git a/package/liblo/0000-server.c-fixPollHeaderRedirect.patch b/package/liblo/0000-server.c-fixPollHeaderRedirect.patch
new file mode 100644
index 0000000..ae284d2
--- /dev/null
+++ b/package/liblo/0000-server.c-fixPollHeaderRedirect.patch
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
diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a4e01a6..30a052d 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,3 +1,6 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.26/
-sha1	21942c8f19e9829b5842cb85352f98c49dfbc823  liblo-0.26.tar.gz
-md5	5351de14262560e15e7f23865293b16f  liblo-0.26.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.29/
+sha1	6aa69456787d3d6ef915281b4a0f8f2c79548ce3	liblo-0.29.tar.gz
+md5	b0e70bc0fb2254addf94adddf85cffd3		        liblo-0.29.tar.gz
+
+# Locally computed
+sha256	  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 3c852be..7d1bdd7 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,11 +4,23 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.26
+LIBLO_VERSION = 0.29
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
 LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
+# IPv6 support broken, issue known upstream.
+# wError - not needed for release.
+LIBLO_CONF_OPTS += \
+	--disable-ipv6 \
+	--disable-werror
+	
+# Liblo uses atomics, so we need to link with
+# libatomic for the architectures who explicitly need libatomic.
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBLO_CONF_ENV += LIBS="-latomic"
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
