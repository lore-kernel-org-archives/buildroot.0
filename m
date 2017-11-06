From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 6 Nov 2017 22:23:03 +0100
Subject: [Buildroot] [PATCH v3 2/2] parted: properly link with libiconv
In-Reply-To: <20171106212303.10662-1-arnout@mind.be>
References: <20171106212303.10662-1-arnout@mind.be>
Message-ID: <20171106212303.10662-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

parted uses libiconv but doesn't link with it. Add a patch to add it
to LIBADD of the library that uses it. iconv was already checked in
configure.ac, but only if i18n is enabled, so the iconv check is also
added unconditionally in configure.ac.

Also add an optional dependency on libiconv, so it is reproducible.

This was not detected in the autobuilders, since it only occurs when
libiconv exists (otherwise uClibc stubs will be used). libiconv
depends on !BR2_ENABLE_LOCALE and parted depends on BR2_USE_WCHAR. We
don't have such a configuration in the autobuilders.

Upstream status: sent to mailing list
http://lists.alioth.debian.org/pipermail/parted-devel/2017-November/005131.html

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Sjoerd Venema <srg.venema@gmail.com>
---
v3: add link to upstream
v2:
 - Add AM_ICONV to configure.ac. Without it, -liconv will be added
   also if it is already part of libc (e.g. in glibc). (Thomas)
 - Explain in the commit message why autobuilders didn't detect this.

Patch sent upstream but hasn't appeared in the mailing list archives
yet.
---
 ...arted-labels-link-with-libiconv-if-needed.patch | 54 ++++++++++++++++++++++
 package/parted/parted.mk                           |  7 ++-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch

diff --git a/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch b/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch
new file mode 100644
index 0000000000..a4a1b00331
--- /dev/null
+++ b/package/parted/0004-libparted-labels-link-with-libiconv-if-needed.patch
@@ -0,0 +1,54 @@
+From dd17f55b2ac189ccd3b8025e4f6509537d00f9d3 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sun, 8 Oct 2017 00:53:31 +0200
+Subject: [PATCH] libparted/labels: link with libiconv if needed
+
+gpt.c uses iconv so it should link with it. Otherwise, on platforms
+where libiconv is a separate library, we get a link failure of parted:
+
+    CCLD     parted
+  ../libparted/.libs/libparted.so: undefined reference to `libiconv'
+  ../libparted/.libs/libparted.so: undefined reference to `libiconv_open'
+  ../libparted/.libs/libparted.so: undefined reference to `libiconv_close'
+
+Since iconv functionality is needed unconditionally (not only when
+gettext is enabled), AM_ICONV needs to be added to configure.ac.
+
+Upstream status: sent to mailing list
+http://lists.alioth.debian.org/pipermail/parted-devel/2017-November/005131.html
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac                 | 2 ++
+ libparted/labels/Makefile.am | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 50ad478..62f1b4d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -288,6 +288,8 @@ fi
+ AC_PROG_LIBTOOL
+ LT_INIT
+ 
++AM_ICONV
++
+ AM_GNU_GETTEXT_VERSION([0.18])
+ AM_GNU_GETTEXT([external])
+ if test "$USE_INCLUDED_LIBINTL" = "yes"; then
+diff --git a/libparted/labels/Makefile.am b/libparted/labels/Makefile.am
+index c996f81..b204379 100644
+--- a/libparted/labels/Makefile.am
++++ b/libparted/labels/Makefile.am
+@@ -35,7 +35,7 @@ liblabels_la_SOURCES = \
+   rdb.c		\
+   sun.c
+ 
+-liblabels_la_LIBADD = $(OS_LIBS) $(INTLLIBS)
++liblabels_la_LIBADD = $(OS_LIBS) $(INTLLIBS) $(LIBICONV)
+ 
+ AM_CPPFLAGS = $(partedincludedir) $(INTLINCS)
+ 
+-- 
+2.14.2
+
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 35d152b469..1f0428a55b 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -9,7 +9,8 @@ PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
 PARTED_INSTALL_STAGING = YES
-# For uclinux patch
+# 0002-configure.ac-uclinux-is-also-linux.patch
+# 0004-libparted-labels-link-with-libiconv-if-needed.patch
 PARTED_AUTORECONF = YES
 PARTED_GETTEXTIZE = YES
 PARTED_LICENSE = GPL-3.0+
@@ -29,6 +30,10 @@ else
 PARTED_CONF_OPTS += --disable-device-mapper
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+PARTED_DEPENDENCIES += libiconv
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 PARTED_CONF_OPTS += --disable-dynamic-loading
 endif
-- 
2.15.0
