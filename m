From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 28 Mar 2011 19:16:35 +0200
Subject: [Buildroot] [PATCH 2 of 2] ncurses: fix hanging installation due to
 old version of tic
In-Reply-To: <patchbomb.1301332593@localhost6.localdomain6>
References: <patchbomb.1301332593@localhost6.localdomain6>
Message-ID: <716e9d2242b5da1161e8.1301332595@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During installation of ncurses, the 'tic' program from the host is used. In
some cases, this version of tic is too old for the data to be processed, and
the installation hangs indefinitely (already reported in July 2010, see [1])

With this patch, a static version of tic is built and used during the
installation step of target ncurses. This method is based on a similar fix
in Gentoo Linux (see [2] for the report and [3] for the solution).

[1] http://lists.busybox.net/pipermail/buildroot/2010-July/036100.html
[2] http://bugs.gentoo.org/show_bug.cgi?id=249363#c25
[3] http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/ncurses/ncurses-5.7-r2.ebuild

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/ncurses/ncurses.mk |  21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -27,6 +27,7 @@
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_INSTALL_STAGING = YES
+NCURSES_DEPENDENCIES = host-ncurses
 
 NCURSES_CONF_OPT = \
 	--with-shared \
@@ -118,6 +119,24 @@
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libncurses.so*
 	$(NCURSES_INSTALL_TARGET_DEVFILES)
-endef # NCURSES_INSTALL_TARGET_CMDS
+endef
+
+#
+# On systems with an older version of tic, the installation of ncurses hangs
+# forever. To resolve the problem, build a static version of tic on host
+# ourselves, and use that during installation.
+#
+define HOST_NCURSES_BUILD_CMDS
+	$(MAKE1) -C $(@D) sources
+	$(MAKE) -C $(@D)/progs tic
+endef
+
+HOST_NCURSES_CONF_OPT = \
+	--without-shared
+
+HOST_NCURSES_INSTALL_HOST = NO
+
+NCURSES_MAKE_ENV += PATH=$(HOST_NCURSES_DIR)/progs:$(PATH)
 
 $(eval $(call AUTOTARGETS,package,ncurses))
+$(eval $(call AUTOTARGETS,package,ncurses,host))
