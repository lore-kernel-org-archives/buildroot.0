From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Feb 2017 12:02:52 +0100
Subject: [Buildroot] [PATCH] package/xfsprogs: fix static build
Message-ID: <1488106972-31975-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xfsprogs links to some libraries from util-linux. Those in turn may use
i18n functions when locales are enabled.

When doing a uClibc build, those i18n functions are provided by the
libintl library from the gettext package.

xfsprogs does not use pkgconfig to find the util-linux libraries, so it
misses the Requires.private field from libblkid, and thus misses the
Libs.private field from libuid.

And so a static link fails because of undefined references to i18n
symbols.

Furthermore, xfsprogs does not use automake; the hand-made Makefiles do
not make use of the LIBS variable set by configure.

We fix that in two ways:

  - pass LIBS=-lintl to configure, so that the configure step has a
    chance to succeed  (as suggested by Waldemar)

  - patch a Makefile to link with EXTRALIBS, and pass EXTRALIBS via
    XFSPROGS_MAKE_OPTS

Fixes:
    http://autobuild.buildroot.org/results/503/50314716a9f72e8bb238e52e9dc342c68f7e0b8b/
    http://autobuild.buildroot.org/results/253/253a024698b55dece992b2631e30edf4ff9092f7/
    http://autobuild.buildroot.org/results/3fe/3fe0d96cf13af12b0051a95f7865d4e38f4a78af/
    http://autobuild.buildroot.org/results/d48/d48e61785d25d33106b7dab1b5cb200cf27d4044/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 package/xfsprogs/0004-use-extra-libs-for-static.patch | 12 ++++++++++++
 package/xfsprogs/xfsprogs.mk                          | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 package/xfsprogs/0004-use-extra-libs-for-static.patch

diff --git a/package/xfsprogs/0004-use-extra-libs-for-static.patch b/package/xfsprogs/0004-use-extra-libs-for-static.patch
new file mode 100644
index 0000000..cc2b667
--- /dev/null
+++ b/package/xfsprogs/0004-use-extra-libs-for-static.patch
@@ -0,0 +1,12 @@
+diff -durN xfsprogs-4.8.0.orig/include/buildmacros xfsprogs-4.8.0/include/buildmacros
+--- xfsprogs-4.8.0.orig/include/buildmacros	2016-02-29 00:39:26.000000000 +0100
++++ xfsprogs-4.8.0/include/buildmacros	2017-02-26 11:04:23.641629241 +0100
+@@ -11,7 +11,7 @@
+ 
+ LDFLAGS += $(LOADERFLAGS) $(LLDFLAGS)
+ LTLDFLAGS += $(LOADERFLAGS)
+-LDLIBS = $(LLDLIBS) $(PLDLIBS) $(MALLOCLIB)
++LDLIBS = $(LLDLIBS) $(PLDLIBS) $(MALLOCLIB) $(EXTRALIBS)
+ 
+ MAKEOPTS = --no-print-directory Q=$(Q)
+ SRCFILES = Makefile $(HFILES) $(CFILES) $(LSRCFILES) $(LFILES) $(YFILES)
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index e59f1f6..c110733 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -18,6 +18,23 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
+# xfsprogs links some of its programs to libs from util-linux, which use
+# i18n functions. For shared-only builds, that's automatically pulled in.
+# Static builds need some help, though...
+#
+# No need to depend on gettext in this case: xfsprogs does not use it for
+# itself; util-linux does need it and has it in its own dependencies.
+#
+# xfsprogs' buildsystem uses hand-made Makefiles, not automake, and they
+# do not use the LIBS variable set by configure. So we use EXTRALIBS that
+# is added by our patch.
+#
+# It is not needed to propagate the EXTRALIBS to the install step.
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS)$(BR2_NEEDS_GETTEXT_IF_LOCALE),yy)
+XFSPROGS_CONF_OPTS += LIBS=-lintl
+XFSPROGS_MAKE_OPTS = EXTRALIBS=-lintl
+endif
+
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
-- 
2.7.4
