From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 22:59:07 +0200
Subject: [Buildroot] [git commit] package/fstrcmp: new package
Message-ID: <20190921205424.55F268F0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c4ff8467df1ed512bf6286f019ec611370814aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for Kodi >= 18.0
https://github.com/xbmc/xbmc/commit/c79fb23a7d7b8550f236ecbc9d3f0af4e57365e4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/fstrcmp/0001-disable-rpath.patch | 25 +++++++++++++++++++++++++
 package/fstrcmp/Config.in                | 12 ++++++++++++
 package/fstrcmp/fstrcmp.hash             |  6 ++++++
 package/fstrcmp/fstrcmp.mk               | 31 +++++++++++++++++++++++++++++++
 6 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 77fa95210c..92e5058e9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -305,6 +305,7 @@ F:	package/flac/
 F:	package/freeswitch/
 F:	package/freeswitch-mod-bcg729/
 F:	package/freetype/
+F:	package/fstrcmp/
 F:	package/ghostscript/
 F:	package/giflib/
 F:	package/gli/
diff --git a/package/Config.in b/package/Config.in
index 23efe9394f..f71e155faf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1796,6 +1796,7 @@ menu "Text and terminal handling"
 	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
 	source "package/fmt/Config.in"
+	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/fstrcmp/0001-disable-rpath.patch b/package/fstrcmp/0001-disable-rpath.patch
new file mode 100644
index 0000000000..cec57e7e94
--- /dev/null
+++ b/package/fstrcmp/0001-disable-rpath.patch
@@ -0,0 +1,25 @@
+Remove rpath from linking command
+
+Fixes build error:
+
+lib/.libs/libfstrcmp.so: undefined reference to `__ctype_b_loc at GLIBC_2.3'
+lib/.libs/libfstrcmp.so: undefined reference to `mbstowcs at GLIBC_2.2.5'
+lib/.libs/libfstrcmp.so: undefined reference to `printf at GLIBC_2.2.5'
+lib/.libs/libfstrcmp.so: undefined reference to `readlink at GLIBC_2.2.5'
+lib/.libs/libfstrcmp.so: undefined reference to `malloc at GLIBC_2.2.5'
+lib/.libs/libfstrcmp.so: undefined reference to `memcmp at GLIBC_2.2.5'
+lib/.libs/libfstrcmp.so: undefined reference to `wcslen at GLIBC_2.2.5'
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- fstrcmp-0.7.D001/Makefile.in.orig	2014-03-05 01:13:45.000000000 +0100
++++ fstrcmp-0.7.D001/Makefile.in	2019-04-07 13:55:07.817689231 +0200
+@@ -507,7 +507,7 @@
+ lib/libfstrcmp.la: $(lib_obj)
+ 	rm -f $@
+ 	$(LIBTOOL) --mode=link --tag=CC $(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) \
+-		-o $@ $(lib_obj) $(LIBS) -rpath $(libdir) -version-info 6:0:6
++		-o $@ $(lib_obj) $(LIBS) -version-info 6:0:6
+ 
+ #
+ # The install of the *.la file automatically causes "$(LIBTOOL) --mode=install"
diff --git a/package/fstrcmp/Config.in b/package/fstrcmp/Config.in
new file mode 100644
index 0000000000..04f11b0f97
--- /dev/null
+++ b/package/fstrcmp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FSTRCMP
+	bool "fstrcmp"
+	depends on BR2_USE_WCHAR
+	help
+	  The fstrcmp project provides a library that is used to make
+	  fuzzy comparisons of strings and byte arrays, including multi-
+	  byte character strings.
+
+	  http://fstrcmp.sourceforge.net/
+
+comment "fstrcmp needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/fstrcmp/fstrcmp.hash b/package/fstrcmp/fstrcmp.hash
new file mode 100644
index 0000000000..9a43c59c09
--- /dev/null
+++ b/package/fstrcmp/fstrcmp.hash
@@ -0,0 +1,6 @@
+# From https://sourceforge.net/projects/fstrcmp/files/fstrcmp/0.7/
+md5 9c440bbdfcad9fd22e38f2388715b0cc  fstrcmp-0.7.D001.tar.gz
+sha1 bb848118fb157dc624ae9fac0566a64cc85f2ef2  fstrcmp-0.7.D001.tar.gz
+# Locally computed
+sha256 e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476  fstrcmp-0.7.D001.tar.gz
+sha256 5352e426b563eda9252d76be92337b49f7b5cfdd1302a1e8d99389840c0e46be  LICENSE
diff --git a/package/fstrcmp/fstrcmp.mk b/package/fstrcmp/fstrcmp.mk
new file mode 100644
index 0000000000..9c42159afb
--- /dev/null
+++ b/package/fstrcmp/fstrcmp.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# fstrcmp
+#
+################################################################################
+
+FSTRCMP_VERSION_MAJOR = 0.7
+FSTRCMP_VERSION = $(FSTRCMP_VERSION_MAJOR).D001
+FSTRCMP_SITE = https://sourceforge.net/projects/fstrcmp/files/fstrcmp/$(FSTRCMP_VERSION_MAJOR)
+FSTRCMP_LICENSE = GPL-3.0+
+FSTRCMP_LICENSE_FILES = LICENSE
+FSTRCMP_INSTALL_STAGING = YES
+FSTRCMP_DEPENDENCIES = host-libtool
+FSTRCMP_CONF_ENV = LIBTOOL="$(HOST_DIR)/bin/libtool"
+
+FSTRCMP_MAKE_OPTS = all-bin libdir/pkgconfig/fstrcmp.pc
+
+# We need to install the package files ourselves due to upstream trying
+# to install a .lai file which is missing because of rpath removal
+define FSTRCMP_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install-include
+	$(INSTALL) -D -m 755 $(@D)/lib/.libs/libfstrcmp.a $(STAGING_DIR)/usr/lib/libfstrcmp.a
+	$(INSTALL) -D -m 755 $(@D)/lib/libfstrcmp.la $(STAGING_DIR)/usr/lib/libfstrcmp.la
+	$(INSTALL) -D -m 755 $(@D)/libdir/pkgconfig/fstrcmp.pc $(STAGING_DIR)/usr/lib/pkgconfig/fstrcmp.pc
+endef
+
+define FSTRCMP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/bin/fstrcmp $(TARGET_DIR)/usr/bin/fstrcmp
+endef
+
+$(eval $(autotools-package))
