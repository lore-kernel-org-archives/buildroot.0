From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Tue, 23 Jun 2020 20:35:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: disable libglib2 only if
 not available
Message-ID: <20200623183549.12105-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Take advantage of a possibly existing BR2_PACKAGE_LIBGLIB2

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/libnids/libnids.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index ee7c71ee88..83719a712f 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -12,8 +12,13 @@ LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
 LIBNIDS_CONF_OPTS = \
-	--disable-libglib \
 	--disable-libnet
+
+# disable libglib2 if not available
+ifeq ($(BR2_PACKAGE_LIBGLIB2),n)
+LIBNIDS_CONF_OPTS += --disable-libglib
+endif
+
 # hand-written Makefile.in, not using automake, needs a custom
 # variable for the installation path.
 LIBNIDS_INSTALL_STAGING_OPTS = install_prefix=$(STAGING_DIR) install
-- 
2.20.1
