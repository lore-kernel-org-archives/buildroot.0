From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 1 Jul 2019 10:02:15 +0200
Subject: [Buildroot] [git commit] package/libglib2: fix build on ARM in
 Thumb mode
Message-ID: <20190701080441.625C0812EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad125248030dcb7b3a8e13c96b727262799c48b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4102db0f7 (package/libglib2: bump to version 2.60.3) did convert
libglib2 over to meson. In doing so, it left a very corner-case along.

When the target is an ARM CPU and the build is in thumb mode, then we
want to ensure that libglib2 is still built in arm mode (because of
inline asm).

But with meson, CFLAGS from the environment are passed to the host
compiler, so the build breaks, and the meson log contains:

    Appending CFLAGS from environment: '-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -marm'
    No LDFLAGS in the environment, not changing global flags.
    No CPPFLAGS in the environment, not changing global flags.
    Sanity testing C compiler: cc
    Is cross compiler: False.
    Sanity check compiler command line: cc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -marm [...]/build/libglib2-2.60.4/build/meson-private/sanitycheckc.c -o [...]/build/libglib2-2.60.4/build/meson-private/sanitycheckc.exe
    Sanity check compile stdout:
    -----
    Sanity check compile stderr:
    cc: error: unrecognized command line option ???-marm???; did you mean ???-mabm????
    -----
    meson.build:1:0: ERROR: Compiler cc can not compile programs.

Fix that by using the new per-package CFLAGS feature of the meson infra.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglib2/libglib2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 28f404b74a..38941ca79d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -12,11 +12,12 @@ LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
 LIBGLIB2_INSTALL_STAGING = YES
 
+LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
 LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+LIBGLIB2_CFLAGS += -marm
 endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
