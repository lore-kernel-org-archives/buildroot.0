From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:21:38 +0100
Subject: [Buildroot] [git commit] package/elfutils: link with libatomic if
 needed
Message-ID: <20210225210527.A0BB7844EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51b5df23b2019eb9da1fc2ceb43c518dc79f1378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build of elfutils 0.181 with Bootlin SPARC uclibc toolchain added
with commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/31ce9e3861c6229a7869a15d322f5d2f5bfc6165

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
