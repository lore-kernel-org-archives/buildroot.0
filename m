From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:55:00 +0200
Subject: [Buildroot] [git commit] qt: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161029135923.A21487FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e8cc4d5c8f91c1ed9a19a8c0cf4571052bc8238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We drop the usage of the QT_CONFIGURE_ENV variable, because it isn't
defined anywhere, so it's always empty.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8c0ff7b..29dcc46 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -505,7 +505,7 @@ endef
 endif
 
 define QT_CONFIGURE_CMDS
-	-[ -f $(@D)/Makefile ] && $(MAKE) -C $(@D) confclean
+	-[ -f $(@D)/Makefile ] && $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) confclean
 	$(QT_CONFIGURE_IPV6)
 	$(QT_CONFIGURE_CONFIG_FILE)
 	# Fix compiler path
@@ -527,7 +527,7 @@ define QT_CONFIGURE_CMDS
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		$(QT_CONFIGURE_ENV) \
+		$(TARGET_MAKE_ENV) \
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
@@ -632,7 +632,7 @@ endef
 # remove the sysroot path from them, since pkg-config already adds it
 # automatically.
 define QT_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/usr/bin
 	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
 	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
