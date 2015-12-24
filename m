From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 11:18:27 +0100
Subject: [Buildroot] [git commit] libnspr: fix build with the musl C library
Message-ID: <20151224101958.DE74F826FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c6bf50828ee2c027a37ddad0f655ddb1c8b4fd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though libnspr uses a configure script, it does look at __GLIBC__
and other macros to determine whether certain C library features are
available or not. Such things fails completely with the musl C
library, since it doesn't define __GLIBC__.

To fix this, we borrow some logic from Alpine Linux, which consists in
explicitly specifying which features are available in the musl C
library.

Fixes:

  http://autobuild.buildroot.org/results/ddd/dddd032232126f1e476e6aea2c6a32e9cd1ddfae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 207da4e..8e58986 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -21,6 +21,22 @@ LIBNSPR_CONF_ENV = \
 LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
 LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
 
+# ./nspr/pr/include/md/_linux.h tests only __GLIBC__ version to detect
+# c-library features, list musl features here for now (taken from
+# Alpine Linux).
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBNSPR_CFLAGS += \
+	-D_PR_POLL_AVAILABLE \
+	-D_PR_HAVE_OFF64_T \
+	-D_PR_INET6 \
+	-D_PR_HAVE_INET_NTOP \
+	-D_PR_HAVE_GETHOSTBYNAME2 \
+	-D_PR_HAVE_GETADDRINFO \
+	-D_PR_INET6_PROBE
+endif
+
+LIBNSPR_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(LIBNSPR_CFLAGS)"
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBNSPR_MAKE_OPTS = SHARED_LIBRARY=
 LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SHARED_LIBRARY= install
