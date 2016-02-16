From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:06:55 +0100
Subject: [Buildroot] [git commit] package/dovecot: add optional support for
	xz
Message-ID: <20160216220706.2769A7FD2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9ddfddf9d7f22c61f0857d4bde731f94bace8d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xz was compiled before, dovecot will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/dovecot/lib30_imap_zlib_plugin.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [liblz4.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

(lz4 support will be added with the next patch of this series)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/dovecot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index eea9efc..dbf2dab 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -76,6 +76,13 @@ else
 DOVECOT_CONF_OPTS += --without-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+DOVECOT_CONF_OPTS += --with-lzma
+DOVECOT_DEPENDENCIES += xz
+else
+DOVECOT_CONF_OPTS += --without-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 DOVECOT_CONF_OPTS += --with-zlib
 DOVECOT_DEPENDENCIES += zlib
