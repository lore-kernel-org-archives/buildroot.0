From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Feb 2021 21:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/elfutils: link with libatomic if
 needed
Message-ID: <20210221202944.121423-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of elfutils 0.181 with Bootlin SPARC uclibc toolchain added
with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/31ce9e3861c6229a7869a15d322f5d2f5bfc6165

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/elfutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 3d37c4634b..42f2f8b304 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -43,6 +43,10 @@ ELFUTILS_CONF_ENV += \
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \
 	$(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ELFUTILS_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 ELFUTILS_DEPENDENCIES += musl-fts
 ELFUTILS_LDFLAGS += -lfts
-- 
2.30.0
