From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Feb 2017 23:55:20 +0100
Subject: [Buildroot] [git commit] package/unixodbc: add optional dependency
	to libtool
Message-ID: <20170204225537.68BD081F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0064b2fb749e309a24e5983f08204b85468fcab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To get reproducible builds of unixodbc add libtool as optional
dependency.

Without libtool:

$ host/usr/bin/x86_64-linux-readelf -a target/usr/lib/libodbc.so.2.0.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]

With libtool:

$ host/usr/bin/x86_64-linux-readelf -a target/usr/lib/libodbc.so.2.0.0 | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libltdl.so.7]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/unixodbc/unixodbc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index f66daab..280fe57 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -20,6 +20,13 @@ else
 UNIXODBC_CONF_OPTS += --disable-iconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTOOL),y)
+UNIXODBC_CONF_OPTS += --without-included-ltdl
+UNIXODBC_DEPENDENCIES += libtool
+else
+UNIXODBC_CONF_OPTS += --with-included-ltdl
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 UNIXODBC_CONF_OPTS += --enable-readline
 UNIXODBC_DEPENDENCIES += readline
