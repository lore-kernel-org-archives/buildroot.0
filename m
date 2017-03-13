From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:24:42 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/python: add
	optional support for libintl
Message-ID: <20170313233002.B637C7FB3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=894a37c031cce0715d28f5003ccc58db07b1cce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 70759f5359d6e5f7b868b74399e20d8ea7956769)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/python.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python/python.mk b/package/python/python.mk
index 281130c..8eb82b2 100644
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
 endif
