From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Jul 2014 09:45:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: Fix checking for
	statically build OpenSSL with libz dependency
Message-ID: <1406447128-5446-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/48a/48ad6d3659cf1f04581b7e3d115bebf454ff17fd/

To fix the error add "-lz" to LIBS variable and re-order the libraries in
configure.ac. Please note line 797 in configure.ac:
dnl XXX FIXME: use pkg-config if available!

Quote of the compile error:

configure: Enabling OpenSSL support in /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr.
checking for additional library dependencies of SSL... error
configure: error: cannot link with SSL - check config.log

In config.log multiple linking errors to libz can be found:

configure:10099: /home/br/br/output/host/usr/bin/i486-ctng-linux-uclibc-gcc -o
  conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64
  /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o):
  In function `zlib_stateful_c_zlib.c:(.text+0x56): undefined reference to `inflate'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../fetchmail-0001-fix-openssl-static-link.patch   |   30 ++++++++++++++++++++
 package/fetchmail/fetchmail.mk                     |    3 ++
 2 files changed, 33 insertions(+)
 create mode 100644 package/fetchmail/fetchmail-0001-fix-openssl-static-link.patch

diff --git a/package/fetchmail/fetchmail-0001-fix-openssl-static-link.patch b/package/fetchmail/fetchmail-0001-fix-openssl-static-link.patch
new file mode 100644
index 0000000..1a5f4d6
--- /dev/null
+++ b/package/fetchmail/fetchmail-0001-fix-openssl-static-link.patch
@@ -0,0 +1,30 @@
+Fix checking for statically build OpenSSL with libz dependency
+
+Fixes
+http://autobuild.buildroot.net/results/48a/48ad6d3659cf1f04581b7e3d115bebf454ff17fd/
+
+configure: Enabling OpenSSL support in /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr.
+checking for additional library dependencies of SSL... error
+configure: error: cannot link with SSL - check config.log
+
+In config.log multiple linking errors to libz can be found:
+
+configure:10099: /home/br/br/output/host/usr/bin/i486-ctng-linux-uclibc-gcc -o
+  conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64
+  /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o):
+  In function `zlib_stateful_c_zlib.c:(.text+0x56): undefined reference to `inflate'
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr fetchmail-6.3.26.org/configure.ac fetchmail-6.3.26/configure.ac
+--- fetchmail-6.3.26.org/configure.ac	2013-04-23 22:51:10.000000000 +0200
++++ fetchmail-6.3.26/configure.ac	2014-07-27 09:20:25.000000000 +0200
+@@ -778,7 +778,7 @@
+     AC_MSG_ERROR([SSL support enabled, but OpenSSL not found])
+   fi
+   LDFLAGS="$LDFLAGS -L$with_ssl/lib"
+-  LIBS="$LIBS -lssl -lcrypto"
++  LIBS="-lssl -lcrypto $LIBS"
+   dnl check if -ldl is needed
+   AC_MSG_CHECKING([for additional library dependencies of SSL])
+   found=0
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index bb723f7..e910019 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -10,6 +10,9 @@ FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)/
 FETCHMAIL_LICENSE = GPLv2; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
+FETCHMAIL_AUTORECONF = YES
+
+FETCHMAIL_CONF_ENV += LIBS="-lz"
 
 FETCHMAIL_CONF_OPT = \
 	--with-ssl=$(STAGING_DIR)/usr
-- 
1.7.10.4
