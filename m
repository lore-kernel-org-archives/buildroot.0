From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 23:19:47 +0100
Subject: [Buildroot] [PATCH v3] package/libxml2: add optional LZMA support
Message-ID: <1427235587-18228-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LZMA support is provided by xz, since liblzma is long dead.

Contrary to zlib, liblzma uses pkg-config, so we do not need to add the
full path to libzma.

Reported-by: vdm on IRC
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v2 -> v3;
  - actually use pkg-config
---
 package/libxml2/libxml2.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 354c178..264e437 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -16,7 +16,7 @@ ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
-LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug --without-lzma
+LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 LIBXML2_DEPENDENCIES = host-pkgconf
@@ -30,6 +30,13 @@ else
 LIBXML2_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBXML2_DEPENDENCIES += xz
+LIBXML2_CONF_OPTS += --with-lzma
+else
+LIBXML2_CONF_OPTS += --without-lzma
+endif
+
 LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
-- 
1.9.1
