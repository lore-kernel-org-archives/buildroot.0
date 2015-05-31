From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:36:35 +0200
Subject: [Buildroot] [git commit] package/sconeserver: fix static link with
	openssl
Message-ID: <20150531083702.68E9C804CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f08ba100e97f677424971e30d8643d885c92c72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When linking statically, the order of libraries on the linker command
line is important, and sconeserver got it wrong.

Also, sconeserver does not use pkg-config, so it misses the private
libs of -lcrypto, which is linking with -lz.

Fix that:
  - add a patch to configure.in to fix the order of libraries;
  - forcibly pass -lz when linking statically with openssl.

Note: we were already reconfiguring sconeserver, because it comes from
the github repository.

Fixes:
    http://autobuild.buildroot.org/results/403/403eac974ecdaacdb66b8241fbdcf19ec5e07480

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../sconeserver/0001-fix-ssl-libs-ordering.patch   |   36 ++++++++++++++++++++
 package/sconeserver/sconeserver.mk                 |    3 ++
 2 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/sconeserver/0001-fix-ssl-libs-ordering.patch b/package/sconeserver/0001-fix-ssl-libs-ordering.patch
new file mode 100644
index 0000000..f1f25b9
--- /dev/null
+++ b/package/sconeserver/0001-fix-ssl-libs-ordering.patch
@@ -0,0 +1,36 @@
+configure: re-order SSL libs when linking
+
+When doing static builds, the ordering of libs is important, as the
+linker does not back-pedal to previous libraries specified on the
+command line to find missing symbols, and only searches for those
+missing symbols in the following libs.
+
+Thus, as -lssl needs symbols from -lcrypto, it needs to come before
+-lcrypto.
+
+And globally, we do *not* append new libraries, we prepend them.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/configure.in b/configure.in
+--- a/configure.in	2014-10-16 11:12:08.000000000 +0200
++++ b/configure.in	2015-05-30 15:44:25.540329788 +0200
+@@ -133,12 +133,14 @@
+     [AC_MSG_ERROR([header file <openssl/ssl.h> is required for OpenSSL, use --with-openssl-path=PATH])]
+   )
+   AC_CHECK_LIB([crypto],[CRYPTO_new_ex_data],
+-    [SSL_LIBADD="$SSL_LIBADD -lcrypto"],
+-    [AC_MSG_ERROR([library 'crypto' is required for OpenSSL])]
++    [SSL_LIBADD="-lcrypto $SSL_LIBADD"],
++    [AC_MSG_ERROR([library 'crypto' is required for OpenSSL])],
++    [$SSL_LIBADD]
+   )
+   AC_CHECK_LIB([ssl],[SSL_library_init],
+-    [SSL_LIBADD="$SSL_LIBADD -lssl"],
+-    [AC_MSG_ERROR([library 'ssl' is required for OpenSSL])]
++    [SSL_LIBADD="-lssl $SSL_LIBADD"],
++    [AC_MSG_ERROR([library 'ssl' is required for OpenSSL])],
++    [$SSL_LIBADD]
+   )
+   AC_SUBST(SSL_LIBADD)
+ fi
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 3ff891b..beca926 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -24,6 +24,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
 SCONESERVER_CONF_OPTS += --with-ssl
+ifeq ($(BR2_STATIC_LIBS),y)
+SCONESERVER_CONF_ENV += SSL_LIBADD=-lz
+endif
 else
 SCONESERVER_CONF_OPTS += --without-ssl
 endif
