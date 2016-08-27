From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 28 Aug 2016 01:13:37 +0200
Subject: [Buildroot] [PATCH] package/libshout: add patches to fix static
	linking
Message-ID: <20160827231337.29284-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series includes two patches to fix static linking with libshout.

The first patch fixes two typos resulting in an uninterpretable
library propagation and is mainly needed for the follow-up patch.

The second patch adds the field 'Libs.private' to the pkg-config file so
when static linking with libshout the needed libraries are correctly
propagated.

Note that autoreconf is enabled as the first patch touches configure.ac.

Fixes:
http://autobuild.buildroot.net/results/b82/b82408fccbf816575125dcc1a1de7260f66f62e8/
http://autobuild.buildroot.net/results/360/3605750023267e4cd35d98451bd283f9e70a6106/
http://autobuild.buildroot.net/results/03b/03b98b313dd6ed2909607cdc0c4f6fb87be3ccfe/
http://autobuild.buildroot.net/results/70b/70ba47e04d1fc0d2379bf1ac7aab4c52d6193001/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch      | 45 ++++++++++++++++
 ...Add-Libs.private-field-to-pkg-config-file.patch | 61 ++++++++++++++++++++++
 package/libshout/libshout.mk                       |  3 ++
 3 files changed, 109 insertions(+)
 create mode 100644 package/libshout/0001-Fix-THEORA-SPEEX-_LDFLAGS-typo.patch
 create mode 100644 package/libshout/0002-Add-Libs.private-field-to-pkg-config-file.patch

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
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
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
diff --git a/package/libshout/0002-Add-Libs.private-field-to-pkg-config-file.patch b/package/libshout/0002-Add-Libs.private-field-to-pkg-config-file.patch
new file mode 100644
index 0000000..2c198c1
--- /dev/null
+++ b/package/libshout/0002-Add-Libs.private-field-to-pkg-config-file.patch
@@ -0,0 +1,61 @@
+From be6dc10c525ec3d51659ee9ace1a4228d91d05ea Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 28 Aug 2016 00:08:19 +0200
+Subject: [PATCH 2/2] Add 'Libs.private' field to pkg-config file
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Static linking userspace programs such as mpd against libshout
+currently doesn't work out of the box, because libshout is linked
+against libssl, but this isn't expressed in libshouts pkg-config
+file:
+
+In order to support static linking, shout.pc should include a 'Libs.private'
+field listing all the libraries that libshout requires.
+
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
+
+The Libs.private field is specifically designed for such usage:
+
+From pkg-config documentation:
+
+  Libs.private:
+
+     This line should list any private libraries in use. Private
+     libraries are libraries which are not exposed through your
+     library, but are needed in the case of static linking.
+
+Therefore, this patch adds a reference to vorbis and speex in the Libs.private
+field of libshouts pkg-config file.
+
+Upstream status: pending
+https://github.com/xiph/Icecast-libshout/pull/5
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ shout.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/shout.pc.in b/shout.pc.in
+index 867a0be..4827295 100644
+--- a/shout.pc.in
++++ b/shout.pc.in
+@@ -12,4 +12,5 @@ Description: Audio streaming library for icecast encoders
+ Version: @VERSION@
+ Requires.private: @SHOUT_REQUIRES@
+ Libs: -L${libdir} -lshout
++Libs.private: @VORBIS_LIBS@ @XIPH_LIBS@
+ Cflags: -I${includedir} @PTHREAD_CPPFLAGS@ @SHOUT_CFLAGS@
+-- 
+2.9.3
+
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 029c134..9f54463 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -11,6 +11,9 @@ LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
 LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
 
+# patching congigure.ac
+LIBSHOUT_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 LIBSHOUT_CONF_OPTS += --enable-theora
 LIBSHOUT_DEPENDENCIES += libtheora
-- 
2.9.3
