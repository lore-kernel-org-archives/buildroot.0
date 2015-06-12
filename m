From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:28:18 +0200
Subject: [Buildroot] [git commit] package/gdb: Add optional dependencies
Message-ID: <20150612212901.7451C8184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23413b51b2308225584b65c2fcd800ca8f7c56af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To allow reproducable builds of target gdb add some optional dependencies

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libutil.so.0]
 0x00000001 (NEEDED)                     Shared library: [libpython2.7.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libexpat.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

[Thomas: explicitly use --{with,without}-{expat,zlib}. There is no
such option for libiconv, so for libiconv, the code was left as is.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9818320..4b9a757 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -33,7 +33,8 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
 GDB_SUBDIR = gdb/gdbserver
 HOST_GDB_SUBDIR = .
 else
-GDB_DEPENDENCIES = ncurses
+GDB_DEPENDENCIES = ncurses \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 endif
 
 # For the host variant, we really want to build with XML support,
@@ -98,6 +99,20 @@ else
 GDB_CONF_OPTS += --without-python
 endif
 
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+GDB_CONF_OPTS += --with-expat
+GDB_DEPENDENCIES += expat
+else
+GDB_CONF_OPTS += --without-expat
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GDB_CONF_OPTS += --with-zlib
+GDB_DEPENDENCIES += zlib
+else
+GDB_CONF_OPTS += --without-zlib
+endif
+
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
 define GDB_REMOVE_UNNEEDED_FILES
