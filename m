From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Feb 2013 23:47:19 +0100
Subject: [Buildroot] [git commit] mii-diag: fix race condition
Message-ID: <20130226225051.2D3359AD8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a84432044e0eed6f6c2f895fd5641a08c370bd4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mii-diag buildsystem doesn't correctly encode the needed
dependencies, so the install step can race against the mii-diag-udeb
(through all) to either cause mii-diag to be built for the host or
not be available when 'install' is executed.

Work around it by explicitly calling the needed steps and not building
the (unused) udeb version at all.

Fixes http://autobuild.buildroot.net/results/4825d267025c74c522077f84330b47f1110315fa

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mii-diag/mii-diag.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index a4ad474..b9d763c 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -21,11 +21,11 @@ endef
 MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
 
 define MII_DIAG_BUILD_CMDS
-	$(MAKE) $(MII_DIAG_MAKE_OPT) -C $(@D)
+	$(MAKE) $(MII_DIAG_MAKE_OPT) -C $(@D) mii-diag
 endef
 
 define MII_DIAG_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-mii-diag
 endef
 
 define MII_DIAG_UNINSTALL_TARGET_CMDS
