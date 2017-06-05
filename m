From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 17:27:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdbm: fix uclibc build error
Message-ID: <20170605152724.12167-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patches fixes

gdbmopen.c:35:40: error: unknown type name 'blksize_t'
 compute_directory_size (GDBM_FILE dbf, blksize_t block_size,

To get the missing define we need to pass -D_GNU_SOURCE.

Fixes
http://autobuild.buildroot.net/results/592/59278fb8681d474883e6551df5173edd806b16fa/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gdbm/gdbm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 4e3ed76e8..5365f3c95 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -10,6 +10,8 @@ GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
 GDBM_INSTALL_STAGING = YES
 
+GDBM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
 GDBM_DEPENDENCIES += gettext
 endif
-- 
2.11.0
