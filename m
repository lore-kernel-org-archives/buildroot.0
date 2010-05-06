From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 6 May 2010 23:27:58 +0200
Subject: [Buildroot] [git commit master] pciutils: Fix cross compiling
Message-ID: <20100506212939.7F4EA8B86C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a5fe7371b28ed52a019dc424821f199d0f86b969
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1705

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    3 ++-
 package/pciutils/Config.in   |    3 +++
 package/pciutils/pciutils.mk |    4 ++++
 3 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 525db27..0476fb0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: hal, mplayer,
+	Updated/fixed packages: hal, mplayer, pciutils,
 	xdriver_xf86-video-openchrome, usb_modeswitch, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
@@ -10,6 +10,7 @@
 	#985: Bump usb_modeswitch package to 1.1.0
 	#1525: Package hal deletes a whole <target>/etc/rc.d directory
 	#1699: Fix usbutils dependencies and bump
+	#1705: Fix pciutils broken cross compiling
 
 2010.05-rc1, Released May 3rd, 2010:
 
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index bc02660..07fc49b 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -7,4 +7,7 @@ config BR2_PACKAGE_PCIUTILS
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.
 
+	  You'll need a copy of pci.ids or pci.ids.gz in your
+	  target skeleton to enjoy verbose output.
+
 	  http://atrey.karlin.mff.cuni.cz/~mj/pciutils.html
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 393162f..2b999df 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -18,10 +18,12 @@ define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/uname -s/echo Linux/' \
 		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
 		$(PCIUTILS_DIR)/lib/configure
+	$(SED) 's/^STRIP/#STRIP/' $(PCIUTILS_DIR)/Makefile
 endef
 
 define PCIUTILS_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" \
+		HOST="$(KERNEL_ARCH)-linux" \
 		OPT="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		RANLIB=$(TARGET_RANLIB) \
@@ -33,8 +35,10 @@ define PCIUTILS_BUILD_CMDS
 		SHAREDIR=/usr/share/misc
 endef
 
+# Ditch install-lib if SHARED is an option in the future
 define PCIUTILS_INSTALL_TARGET_CMDS
 	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-lib
 endef
 
 $(eval $(call GENTARGETS,package,pciutils))
-- 
1.6.3.3
