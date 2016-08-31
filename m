From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Sep 2016 00:17:54 +0200
Subject: [Buildroot] [git commit] package/libshout: add patches to fix
	static linking
Message-ID: <20160831224016.982E08212B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e65cf4c4ff1a2ee32646487d3bc7ed555f400526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This series includes two patches to fix static linking with libshout.

The first patch fixes two typos resulting in an uninterpretable library
propagation and is mainly needed for the follow-up patch.

The second patch makes sure that `@SHOUT_REQUIRES@` and therefore
`Requires.private` includes ssl as `Requires.private` defines a list of private
packages required by this package but not exposed to applications.

Note that autoreconf is enabled as the first patch touches configure.ac.

Fixes:
http://autobuild.buildroot.net/results/b82/b82408fccbf816575125dcc1a1de7260f66f62e8/
http://autobuild.buildroot.net/results/360/3605750023267e4cd35d98451bd283f9e70a6106/
http://autobuild.buildroot.net/results/03b/03b98b313dd6ed2909607cdc0c4f6fb87be3ccfe/
http://autobuild.buildroot.net/results/70b/70ba47e04d1fc0d2379bf1ac7aab4c52d6193001/

[Peter: fix libssl .pc reference, fix typo]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch      | 45 ++++++++++++++++++
 ...Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch | 55 ++++++++++++++++++++++
 package/libshout/libshout.mk                       |  3 ++
 3 files changed, 103 insertions(+)

diff --git a/package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch b/package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch
new file mode 100644
index 0000000..4d173c5
--- /dev/null
+++ b/package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch
@@ -0,0 +1,45 @@
+From d96a3cafeebeb80b4796bacbe0e6da0bbd3ee48e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 28 Aug 2016 00:39:55 +0200
+Subject: [PATCH 1/2] Fix {THEORA,SPEEX}_LDFLAGS typo
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Needed to properly link against libshout, otherwise the build fails with:
+
+  error: LDFLAGS: No such file or directory
+
+Upstream status: pending
+https://github.com/xiph/Icecast-libshout/pull/4
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 87a7f55..85f18ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -134,7 +134,7 @@ PKG_CHECK_MODULES(THEORA, theora, [
+   ])
+ fi
+ XIPH_VAR_APPEND([XIPH_CPPFLAGS],[$THEORA_CFLAGS])
+-XIPH_VAR_PREPEND([XIPH_LIBS],[$THEORA LDFLAGS $THEORA_LIBS])
++XIPH_VAR_PREPEND([XIPH_LIBS],[$THEORA_LDFLAGS $THEORA_LIBS])
+ AM_CONDITIONAL([HAVE_THEORA], [test -n "$THEORA_LIBS"])
+ if test -n "$THEORA_LIBS"
+ then
+@@ -153,7 +153,7 @@ PKG_CHECK_MODULES(SPEEX, speex, [
+   ])
+ fi
+ XIPH_VAR_APPEND([XIPH_CPPFLAGS],[$SPEEX_CFLAGS])
+-XIPH_VAR_PREPEND([XIPH_LIBS],[$SPEEX LDFLAGS $SPEEX_LIBS])
++XIPH_VAR_PREPEND([XIPH_LIBS],[$SPEEX_LDFLAGS $SPEEX_LIBS])
+ AM_CONDITIONAL([HAVE_SPEEX], [test -n "$SPEEX_LIBS"])
+ if test -n "$SPEEX_LIBS"
+ then
+-- 
+2.9.3
+
diff --git a/package/libshout/0002-Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch b/package/libshout/0002-Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch
new file mode 100644
index 0000000..08d7fa9
--- /dev/null
+++ b/package/libshout/0002-Make-sure-SHOUT_REQUIRES-contains-OpenSSL.patch
@@ -0,0 +1,55 @@
+From 69774132422af1d017008eb5daed8e2099d2fa0a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 31 Aug 2016 21:55:51 +0200
+Subject: [PATCH 2/2] Make sure @SHOUT_REQUIRES@ contains OpenSSL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Static linking userspace programs such as mpd against libshout
+currently doesn't work out of the box, because libshout is linked
+against libssl, but this isn't expressed in libshouts pkg-config
+file:
+
+```
+/usr/lib/libshout.a(tls.o): In function `tls_check_cert':
+tls.c:(.text+0x10): undefined reference to `SSL_get_peer_certificate'
+tls.c:(.text+0x24): undefined reference to `SSL_get_verify_result'
+tls.c:(.text+0x4c): undefined reference to `X509_get_subject_name'
+tls.c:(.text+0x60): undefined reference to `X509_NAME_get_text_by_NID'
+tls.c:(.text+0x118): undefined reference to `X509_NAME_get_entry'
+tls.c:(.text+0x11c): undefined reference to `X509_NAME_ENTRY_get_data'
+tls.c:(.text+0x120): undefined reference to `ASN1_STRING_length'
+tls.c:(.text+0x148): undefined reference to `X509_free'
+tls.c:(.text+0x178): undefined reference to `X509_NAME_get_index_by_NID'
+```
+
+Since OpenSSL installs its own .pc files, make sure that @SHOUT_REQUIRES@
+contains `ssl`.
+
+Upstream status: pending
+https://github.com/xiph/Icecast-libshout/pull/5
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 85f18ad..2b9c505 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -197,6 +197,10 @@ XIPH_PATH_OPENSSL([
+     ])
+ AC_SUBST([SHOUT_TLS])
+ AM_CONDITIONAL([HAVE_TLS], [test -n "$OPENSSL_LIBS"])
++if test "$SHOUT_TLS" = "1"
++then
++  SHOUT_REQUIRES="$SHOUT_REQUIRES, libssl"
++fi
+ 
+ SHOUT_VERSION="$VERSION"
+ SHOUT_CPPFLAGS="-I$shout_includedir $VORBIS_CFLAGS $PTHREAD_CPPFLAGS"
+-- 
+2.9.3
+
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 029c134..7c07909 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -11,6 +11,9 @@ LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
 LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
 
+# patching configure.ac
+LIBSHOUT_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 LIBSHOUT_CONF_OPTS += --enable-theora
 LIBSHOUT_DEPENDENCIES += libtheora
