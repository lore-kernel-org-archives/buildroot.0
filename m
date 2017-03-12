From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 15:06:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/python: add optional support for
	libintl
Message-ID: <20170312140605.28511-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python links to gettext when available:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_locale.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

In comparison the same library compiled without gettext:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/python2.7/lib-dynload/_locale.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python/python.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 7541e0bc4..8f4e298c4 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -60,6 +60,10 @@ HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
 PYTHON_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+PYTHON_DEPENDENCIES += gettext
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
 PYTHON_DEPENDENCIES += readline
 else
-- 
2.11.0
