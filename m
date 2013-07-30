From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 23:26:02 +0200
Subject: [Buildroot] [git commit] package/libedit: switch to alternate URL
	for proper packaging
Message-ID: <20130730212952.7BD739A8C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc2a13a2aa30b0fd9006c2a7c2103f5af2bf00a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream libedit does not have a proper homepage, and does not provide
any sort of packaging whatsoever. So far, we used Debian's wayback
machine to get a tarball of a rather oldish libedit.

As Thomas pointed out, someone has been maintaining a proper autotools
based, up-to-date package for a while.

While Debian is stuck to 2.11 (5 years old now), we bump to 3.1 as a bonus.

Remove our libedit.pc, it's now bundled with the package.

Reported-by: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libedit/Config.in                          |   11 +--
 ...libedit-000-check-bsd-functions-in-libbsd.patch |   18 ++++
 package/libedit/libedit.mk                         |   90 +++++---------------
 package/libedit/libedit.pc                         |   13 ---
 4 files changed, 45 insertions(+), 87 deletions(-)

diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 7a515db..4747a38 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,15 +1,14 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
-	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )  # libbsd
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
-	select BR2_PACKAGE_LIBBSD
 	select BR2_PACKAGE_NCURSES
 	help
 	  The editline library (from BSD) provides generic line editing
 	  and history functions. It slightly resembles GNU readline.
 
+	  The official homepage is at:
 	  http://ftp.netbsd.org/pub/NetBSD/NetBSD-release-5-0/src/lib/libedit/
 
-comment "libedit requires a toolchain with thread support"
-	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 ) # libbsd
-	depends on !BR2_TOOLCHAIN_HAS_THREADS # libbsd
+	  Jess Thrysoee maintains an autotoolified packaged, which we use
+	  in Buildroot as it makes it much simpler than using the upstream
+	  sources which require pmake:
+	  http://www.thrysoee.dk/editline/
diff --git a/package/libedit/libedit-000-check-bsd-functions-in-libbsd.patch b/package/libedit/libedit-000-check-bsd-functions-in-libbsd.patch
new file mode 100644
index 0000000..21c57f8
--- /dev/null
+++ b/package/libedit/libedit-000-check-bsd-functions-in-libbsd.patch
@@ -0,0 +1,18 @@
+configure: on Linux, the BSD functions require linking against libbsd
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN libedit-20130712-3.1.orig/configure.ac libedit-20130712-3.1/configure.ac
+--- libedit-20130712-3.1.orig/configure.ac	2013-07-12 20:39:22.000000000 +0200
++++ libedit-20130712-3.1/configure.ac	2013-07-28 23:35:35.012676469 +0200
+@@ -108,6 +108,10 @@
+ #AC_FUNC_REALLOC
+ AC_TYPE_SIGNAL
+ AC_FUNC_STAT
++
++# Search for libbsd for *vis functions
++AC_CHECK_LIB([bsd], [vis])
++
+ AC_CHECK_FUNCS([endpwent isascii memchr memset re_comp regcomp strcasecmp strchr strcspn strdup strerror strrchr strstr strtol issetugid wcsdup strlcpy strlcat fgetln vis strvis strunvis __secure_getenv secure_getenv])
+ 
+ # strlcpy
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index c344b73..6769fdc 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -4,72 +4,26 @@
 #
 ################################################################################
 
-# Note: libedit does not have a regular homepage, and it seems
-# there is no place where to download a tarball from. That's
-# why we use the Debian way-back machine.
-LIBEDIT_VERSION_MAJOR   = 2
-LIBEDIT_VERSION_MINOR   = 11
-LIBEDIT_VERSION_EXTRA   = -20080614
-LIBEDIT_VERSION         = $(LIBEDIT_VERSION_MAJOR).$(LIBEDIT_VERSION_MINOR)
-LIBEDIT_SOURCE          = libedit_$(LIBEDIT_VERSION)$(LIBEDIT_VERSION_EXTRA).orig.tar.bz2
-LIBEDIT_SITE            = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/libe/libedit
-LIBEDIT_SUBDIR          = libedit
-LIBEDIT_PATCH           = libedit_2.11-20080614-5.debian.tar.bz2
+LIBEDIT_VERSION         = 20130712-3.1
+LIBEDIT_SITE            = http://www.thrysoee.dk/editline/
 LIBEDIT_INSTALL_STAGING = YES
-LIBEDIT_DEPENDENCIES    = host-pmake libbsd ncurses
-
-define LIBEDIT_POST_PATCH_PERMISSIONS
-	chmod +x $(@D)/libedit/makelist
-endef
-
-LIBEDIT_POST_PATCH_HOOKS += LIBEDIT_POST_PATCH_PERMISSIONS
-
-define LIBEDIT_FIX_VIS_H_INCLUDE
-	$(SED) 's,^#include <vis\.h>$$,#include <bsd/vis\.h>,;' \
-	       $(@D)/libedit/filecomplete.c                     \
-	       $(@D)/libedit/history.c                          \
-	       $(@D)/libedit/readline.c
-endef
-LIBEDIT_POST_PATCH_HOOKS += LIBEDIT_FIX_VIS_H_INCLUDE
-
-LIBEDIT_PMAKE_OPTS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \
-                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT_VERSION_MAJOR}"  \
-
-define LIBEDIT_BUILD_CMDS
-	cd $(@D)/$(LIBEDIT_SUBDIR); \
-	$(TARGET_CONFIGURE_OPTS) LDADD="-lbsd -lcurses" pmake $(LIBEDIT_PMAKE_OPTS)
-endef
-
-LIBEDIT_MAN_LINKS = el_init el_end el_reset el_gets el_getc el_push el_parse   \
-                     el_set el_get el_source el_resize el_line el_insertstr     \
-                     el_deletestr history_init history_end history
-
-# $1: DESTDIR to install into
-# Can't use pmake to install, it wants to be root. sigh... :-(
-# We need to create the .so links, otherwise we can't link; and waiting for
-# ldconfig is too late as it's done just before building the images.
-define LIBEDIT_INSTALL_CMDS
-	$(INSTALL) -D -m 0644 package/libedit/libedit.pc $(1)/usr/lib/pkgconfig/libedit.pc
-	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
-	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
-	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
-	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
-	ln -sf libedit.so.$(LIBEDIT_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT_VERSION_MAJOR)
-	ln -sf libedit.so.$(LIBEDIT_VERSION_MAJOR) $(1)/usr/lib/libedit.so
-	$(INSTALL) -D -m 0644 $(@D)/libedit/readline/readline.h $(1)/usr/include/editline/readline.h
-	$(INSTALL) -v -D -m 0644 $(@D)/libedit/editline.3 $(1)/usr/share/man/man3/editline.3el
-	$(INSTALL) -v -D -m 0644 $(@D)/libedit/editrc.5 $(1)/usr/share/man/man5/editrc.5el
-	for lnk in $(LIBEDIT_MAN_LINKS); do                            \
-	    ln -sfv editline.3el $(1)/usr/share/man/man3/$${lnk}.3el;   \
-	done
-endef
-
-define LIBEDIT_INSTALL_STAGING_CMDS
-	$(call LIBEDIT_INSTALL_CMDS,$(STAGING_DIR))
-endef
-
-define LIBEDIT_INSTALL_TARGET_CMDS
-	$(call LIBEDIT_INSTALL_CMDS,$(TARGET_DIR))
-endef
-
-$(eval $(generic-package))
+LIBEDIT_DEPENDENCIES    = ncurses
+
+# We're patching configure.ac
+LIBEDIT_AUTORECONF      = YES
+
+# Note: libbsd required for *vis functions, but works only with a toolchain
+# with __progname; otherwise, some features are disabled, as if libbsd was
+# missing entirely.
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+LIBEDIT_DEPENDENCIES   += libbsd
+endif
+
+# Wide-char support is not autodetected by configure, we have to help a bit.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_WCHAR),y)
+LIBEDIT_CONF_OPT       += --enable-widec
+else
+LIBEDIT_CONF_OPT       += --disable-widec
+endif
+
+$(eval $(autotools-package))
diff --git a/package/libedit/libedit.pc b/package/libedit/libedit.pc
deleted file mode 100644
index 47ac871..0000000
--- a/package/libedit/libedit.pc
+++ /dev/null
@@ -1,13 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: libedit
-Description: Not just a replacement library for libreadline and libhistory.
-Version: 2.11
-Requires: libbsd ncurses
-Requires.private:
-Libs: -L${libdir} -ledit
-Libs.private:
-Cflags: -I${includedir}
