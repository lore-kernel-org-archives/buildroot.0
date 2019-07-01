From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 1 Jul 2019 10:00:27 +0200
Subject: [Buildroot] [git commit] package/libglib2: fix NLS build on musl
 and uclibc
Message-ID: <20190701080441.54256812EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2e24f106058e63d7cb4404da0e7a6f209c162dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglib2 uses a very crude and error-prone way to detect the intl
functions, which basically fails when the C library is not glibc.

There is a bug report about this in upstream meson [1], but it doesn't
seem to get any progress. Fixing that properly in Buildroot looks
complicated.

Now that a meson package can specify its LDFLAGS, use that to pass the
infrastructure-provided TARGET_NLS_LIBS to link with.

Fixes:
    http://autobuild.buildroot.org/results/f0d/f0d85d76786343d767fba9c7c5c01f042ecfc018/
    [...]

[1] https://github.com/mesonbuild/meson/issues/3740

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglib2/libglib2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 28a50f96a4..28f404b74a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -12,6 +12,8 @@ LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
 LIBGLIB2_INSTALL_STAGING = YES
 
+LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
