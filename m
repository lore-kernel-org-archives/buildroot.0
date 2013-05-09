From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 00:22:56 +0200
Subject: [Buildroot] [PATCH 3/6] package/libedit2: new package
In-Reply-To: <cover.1368137904.git.yann.morin.1998@free.fr>
References: <cover.1368137904.git.yann.morin.1998@free.fr>
Message-ID: <0af174d65ec156e6dd992ed2ab7b9c529066af7c.1368137905.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in            |  1 +
 package/libedit2/Config.in   |  9 ++++++
 package/libedit2/libedit2.mk | 76 ++++++++++++++++++++++++++++++++++++++++++++
 package/libedit2/libedit2.pc | 13 ++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 package/libedit2/Config.in
 create mode 100644 package/libedit2/libedit2.mk
 create mode 100644 package/libedit2/libedit2.pc

diff --git a/package/Config.in b/package/Config.in
index fc97f58..f5d68c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,6 +617,7 @@ menu "Text and terminal handling"
 source "package/enchant/Config.in"
 source "package/libfribidi/Config.in"
 source "package/icu/Config.in"
+source "package/libedit2/Config.in"
 source "package/libiconv/Config.in"
 source "package/linenoise/Config.in"
 source "package/ncurses/Config.in"
diff --git a/package/libedit2/Config.in b/package/libedit2/Config.in
new file mode 100644
index 0000000..1e7b95d
--- /dev/null
+++ b/package/libedit2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEDIT2
+	bool "libedit2"
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_NCURSES
+	help
+	  The editline library (from BSD) provides generic line editing
+	  and history functions. It slightly resembles GNU readline.
+	  
+	  http://ftp.netbsd.org/pub/NetBSD/NetBSD-release-5-0/src/lib/libedit/
diff --git a/package/libedit2/libedit2.mk b/package/libedit2/libedit2.mk
new file mode 100644
index 0000000..0916c2e
--- /dev/null
+++ b/package/libedit2/libedit2.mk
@@ -0,0 +1,76 @@
+#############################################################
+#
+# libedit2
+#
+#############################################################
+
+# Note: libedit2 does not have a regular homepage, and it seems
+# there is no place where to download a tarball from. That's
+# why we use the Debian way-back machine.
+LIBEDIT2_VERSION_MAJOR   = 2
+LIBEDIT2_VERSION_MINOR   = 11
+LIBEDIT2_VERSION_EXTRA   = -20080614
+LIBEDIT2_VERSION         = $(LIBEDIT2_VERSION_MAJOR).$(LIBEDIT2_VERSION_MINOR)
+LIBEDIT2_SOURCE          = libedit_$(LIBEDIT2_VERSION)$(LIBEDIT2_VERSION_EXTRA).orig.tar.bz2
+LIBEDIT2_SITE            = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/libe/libedit
+LIBEDIT2_SUBDIR          = libedit
+LIBEDIT2_PATCH           = libedit_2.11-20080614-5.debian.tar.bz2
+LIBEDIT2_INSTALL_STAGING = YES
+LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses
+
+define LIBEDIT2_POST_PATCH_PERMISSIONS
+	chmod +x $(@D)/libedit/makelist
+endef
+
+LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_POST_PATCH_PERMISSIONS
+
+define LIBEDIT2_FIX_VIS_H_INCLUDE
+	$(SED) 's,^#include <vis\.h>$$,#include <bsd/vis\.h>,;' \
+	       $(@D)/libedit/filecomplete.c                     \
+	       $(@D)/libedit/history.c                          \
+	       $(@D)/libedit/readline.c
+endef
+LIBEDIT2_POST_PATCH_HOOKS += LIBEDIT2_FIX_VIS_H_INCLUDE
+
+LIBEDIT2_PMAKE_OPTS = MKPROFILE=no MKCATPAGES=no MLINKS= MANPAGES= NOGCCERROR=1         \
+                      SHLIB_SHFLAGS="-Wl,-soname,libedit.so.${LIBEDIT2_VERSION_MAJOR}"  \
+
+define LIBEDIT2_BUILD_CMDS
+	cd $(@D)/$(LIBEDIT2_SUBDIR); \
+	$(TARGET_CONFIGURE_OPTS) LDADD="-lbsd -lcurses" pmake $(LIBEDIT2_PMAKE_OPTS)
+endef
+
+LIBEDIT2_MAN_LINKS = el_init el_end el_reset el_gets el_getc el_push el_parse   \
+                     el_set el_get el_source el_resize el_line el_insertstr     \
+                     el_deletestr history_init history_end history
+
+# $1: DESTDIR to install into
+# Can't use pmake to install, it wants to be root. sigh... :-(
+# We need to create the .so links, otherwise we can't link; and waiting for
+# ldconfig is too late as it's done just before building the images.
+define LIBEDIT2_INSTALL_CMDS
+	$(INSTALL) -D -m 0644 package/libedit2/libedit2.pc $(1)/usr/lib/pkgconfig/libedit2.pc
+	ln -sf libedit2.pc $(1)/usr/lib/pkgconfig/libedit.pc
+	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.a $(1)/usr/lib/libedit.a
+	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit_pic.a $(1)/usr/lib/libedit_pic.a
+	$(INSTALL) -D -m 0644 $(@D)/libedit/libedit.so.2.11 $(1)/usr/lib/libedit.so.2.11
+	$(INSTALL) -D -m 0644 $(@D)/libedit/histedit.h $(1)/usr/include/histedit.h
+	ln -sf libedit.so.$(LIBEDIT2_VERSION) $(1)/usr/lib/libedit.so.$(LIBEDIT2_VERSION_MAJOR)
+	ln -sf libedit.so.$(LIBEDIT2_VERSION_MAJOR) $(1)/usr/lib/libedit.so
+	$(INSTALL) -D -m 0644 $(@D)/libedit/readline/readline.h $(1)/usr/include/editline/readline.h
+	$(INSTALL) -v -D -m 0644 $(@D)/libedit/editline.3 $(1)/usr/share/man/man3/editline.3el
+	$(INSTALL) -v -D -m 0644 $(@D)/libedit/editrc.5 $(1)/usr/share/man/man5/editrc.5el
+	for lnk in $(LIBEDIT2_MAN_LINKS); do                            \
+	    ln -sfv editline.3el $(1)/usr/share/man/man3/$${lnk}.3el;   \
+	done
+endef
+
+define LIBEDIT2_INSTALL_STAGING_CMDS
+	$(call LIBEDIT2_INSTALL_CMDS,$(STAGING_DIR))
+endef
+
+define LIBEDIT2_INSTALL_TARGET_CMDS
+	$(call LIBEDIT2_INSTALL_CMDS,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/libedit2/libedit2.pc b/package/libedit2/libedit2.pc
new file mode 100644
index 0000000..47ac871
--- /dev/null
+++ b/package/libedit2/libedit2.pc
@@ -0,0 +1,13 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: libedit
+Description: Not just a replacement library for libreadline and libhistory.
+Version: 2.11
+Requires: libbsd ncurses
+Requires.private:
+Libs: -L${libdir} -ledit
+Libs.private:
+Cflags: -I${includedir}
-- 
1.8.1.2
