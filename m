From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Wed, 24 Jun 2020 14:17:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: disable libnet only if not
 available
Message-ID: <20200624121742.20034-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnids can be built against an existing libnet lib,
take advantage of that.

Unfortunately, pkg-config is not available for libnet,
so configure --with-libnet is our only option at the
moment.

--with-libnet expects a build directory,
not an installation path like in our context.
We use --with-libnet=yes to skip tests that would fail.
In this situation, 'LIBNET' goes undefined, so we
need to define it ourselves.
This works because we make sure -lnet is installed
prior anything related to libnids.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libnids/libnids.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index f0330787c7..01d50879b6 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -11,7 +11,21 @@ LIBNIDS_LICENSE_FILES = COPYING
 LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
-LIBNIDS_CONF_OPTS = --disable-libnet
+
+# disable libnet if not available
+# Tests in configure.in expect --with-libnet=$build_dir
+# not an installation patch like in our context.
+# We use with-libnet=yes to skip the unusual paths tests.
+# But 'LNETLIB' gets left out, so we need to define it ourselves.
+ifeq ($(BR2_PACKAGE_LIBNET),y)
+LIBNIDS_DEPENDENCIES += libnet
+
+LIBNIDS_CONF_OPTS += --with-libnet=yes \
+	LNETLIB=-lnet \
+	--enable-libnet
+else
+LIBNIDS_CONF_OPTS += --disable-libnet
+endif
 
 # disable libglib2 if not available
 # The test in configure.in is flawed: passing --enable-libglib would also
-- 
2.20.1
