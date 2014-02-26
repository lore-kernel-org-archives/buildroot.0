From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Feb 2014 22:27:35 +0100
Subject: [Buildroot] [PATCH] libxml2: do not detect zlib/lzma when not
	available
Message-ID: <1393450055-30751-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-libxml2 package does not depend on zlib or lzma, but may
detect versions available on the host. This can cause problems in the
following situation:

 1 host-libxml2 is built, finds an available lzma library in the
   system, enables lzma support by using it.

 2 host-xz is built, which installs a different version of the lzma
   library into $(HOST_DIR)

 3 host-libxslt is built, tries to link against libxml2, which fails
   because now the visible lzma library is the one from
   $(HOST_DIR)/usr/lib and no longer the one libxml2 was built agains.

To fix this, this patch passes --without-zlib and --without-lzma to
the host package.

In addition, since the target variant of libxml2 does not have
provisions to depend on the target lzma, we also pass --without-lzma
for the target variant. The case of zlib for the target was already
properly taken into account.

Fixes:

  http://autobuild.buildroot.org/results/6dc/6dcef647eb0f0db7de3f34194eb15ceebc645b39/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 7116b82..62f3e27 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -16,15 +16,17 @@ ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
-LIBXML2_CONF_OPT = --with-gnu-ld --without-python --without-debug
+LIBXML2_CONF_OPT = --with-gnu-ld --without-python --without-debug --without-lzma
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
+HOST_LIBXML2_CONF_OPT = --without-zlib --without-lzma
+
 # mesa3d uses functions that are only available with debug
 ifeq ($(BR2_PACKAGE_MESA3D),y)
-HOST_LIBXML2_CONF_OPT = --with-debug
+HOST_LIBXML2_CONF_OPT += --with-debug
 else
-HOST_LIBXML2_CONF_OPT = --without-debug
+HOST_LIBXML2_CONF_OPT += --without-debug
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
-- 
1.8.3.2
