From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 21 Feb 2019 00:17:22 +0100
Subject: [Buildroot] [git commit] package/madplay: fix static build
Message-ID: <20190220231606.78CA2840A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da304a832b9a0f5f5ef62c244f67e5f5ae39748e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to use pkg-config to find id3tag dependency (-lz)

Fixes:
 - http://autobuild.buildroot.org/results/5e4882ddacf205a92a3ff1e79649cf16e4b6c0ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: add comment to AUTORECONF to refer to the patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...onfigure-ac-use-pkg-config-to-find-id3tag.patch | 23 ++++++++++++++++++++++
 package/madplay/madplay.mk                         |  5 +++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch b/package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch
new file mode 100644
index 0000000000..47645edd4c
--- /dev/null
+++ b/package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch
@@ -0,0 +1,23 @@
+configure.ac: use pkg-config to find id3tag
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -durN madplay-0.15.2b-orig/configure.ac madplay-0.15.2b/configure.ac
+--- madplay-0.15.2b-orig/configure.ac	2019-02-14 21:34:01.507212449 +0100
++++ madplay-0.15.2b/configure.ac	2019-02-15 23:24:00.079876087 +0100
+@@ -182,12 +182,13 @@
+ *** environment variable to specify its installed location, e.g. -L<dir>.])
+ ])
+ 
+-AC_CHECK_LIB(id3tag, id3_tag_parse, :, [
++PKG_CHECK_MODULES(ID3TAG, id3tag, [
++	CFLAGS="$CFLAGS $ID3TAG_CFLAGS" LIBS="$LIBS $ID3TAG_LIBS"], [
+ 	AC_MSG_ERROR([libid3tag was not found
+ *** You must first install libid3tag before you can build this package.
+ *** If libid3tag is already installed, you may need to use the LDFLAGS
+ *** environment variable to specify its installed location, e.g. -L<dir>.])
+-], [-lz])
++])
+ 
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS(madvise localeconv)
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index dd54e2e78f..e1a78bd7d7 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -8,17 +8,18 @@ MADPLAY_VERSION = 0.15.2b
 MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
 MADPLAY_LICENSE = GPL-2.0+
 MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
-MADPLAY_DEPENDENCIES = libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
+MADPLAY_DEPENDENCIES = host-pkgconf libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
 
 # Force autoreconf to be able to use a more recent libtool script, that
 # is able to properly behave in the face of a missing C++ compiler.
+# Also 0003-configure-ac-use-pkg-config-to-find-id3tag.patch
 MADPLAY_AUTORECONF = YES
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
 MADPLAY_CONF_OPTS += --with-alsa
-MADPLAY_DEPENDENCIES += host-pkgconf alsa-lib
+MADPLAY_DEPENDENCIES += alsa-lib
 MADPLAY_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs alsa`"
 endif
 
