From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2019 17:38:16 +0200
Subject: [Buildroot] [PATCHv2] package/libglib2: fix NLS build on musl and
 uclibc
Message-ID: <20190623153816.14016-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libglib2 uses a very crude and error-prone way to detect the intl
functions, which basically fails when the C library is not glibc.

Now that a meson pacakge can specify its LDFLAGS, use that to pass the
infrastructure-provided TARGET_NLS_LIBS to link with.

Fixes:
    http://autobuild.buildroot.org/results/f0d/f0d85d76786343d767fba9c7c5c01f042ecfc018/
    [...]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

---
Note: a few lines above, we do export LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
but this does not work at all and has been broken by the conversion over
to meson, and will need to be addressed by another patch.

---
Changes v1 -> v2:
  - rebase on master
---
 package/libglib2/libglib2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 207352fa37..bbc0d11e23 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -17,6 +17,8 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
+LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
 	-Dfam=false \
-- 
2.20.1
