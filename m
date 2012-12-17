From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Dec 2012 09:27:30 +0100
Subject: [Buildroot] [git commit] pciutils: work around race condition in
	make install with high BR2_JLEVEL
Message-ID: <20121217084226.0D8D99A325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8286d7113f481c2acbc9dc5ff62a364087700d51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/908d7368c8dc8e320fd33f3193039f5925adc352

make install and install-lib can race against eachother causing 'install'
to fail. Work around it using MAKE1.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pciutils/pciutils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index ba866a0..6219711 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -48,12 +48,12 @@ endef
 
 # Ditch install-lib if SHARED is an option in the future
 define PCIUTILS_INSTALL_TARGET_CMDS
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
+	$(MAKE1) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
 		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
 define PCIUTILS_INSTALL_STAGING_CMDS
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
+	$(MAKE1) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
 		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
