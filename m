From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 22:21:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/mc: add optional support for libssh2
Message-ID: <1455139292-5849-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libssh2 was compiled before, mc will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/mc | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libssh2.so.1]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libgcrypt.so.20]
 0x00000001 (NEEDED)                     Shared library: [libgpg-error.so.0]
 0x00000001 (NEEDED)                     Shared library: [libglib-2.0.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.1]
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mc/mc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 39de165..eb4b104 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -11,6 +11,13 @@ MC_LICENSE = GPLv3+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBSSH2),y)
+MC_CONF_OPTS += --enable-vfs-sftp
+MC_DEPENDENCIES += libssh2
+else
+MC_CONF_OPTS += --disable-vfs-sftp
+endif
+
 # mc prefers slang, so use that if enabled, otherwise
 # fallback to using ncurses.
 # Either or both will be enabled, but we prefer slang.
-- 
2.7.0
