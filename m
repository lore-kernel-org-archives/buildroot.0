From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:28 -0000
Subject: [Buildroot] [git commit branch/next] source-check: change behavior
	to check only selected packages / add source-check-all
Message-ID: <20120802195243.7C7548E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07bae75635ebc0b2b3a2df8aca2f5022debacddb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The original 'source-check' target first selects all packages, and then checks
whether the package tarballs can be found. This is useful for Buildroot
maintainers, but less useful for developers working on a specific project. The
latter only care about the packages used in that project.

This patch removes the allyesconfig dependency to source-check so that only
selected packages are checked. The original behavior is moved to a new target
'source-check-all'.

[Peter: removed source-check-all, people can just make allyesconfig before]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c691767..7a66897 100644
--- a/Makefile
+++ b/Makefile
@@ -591,7 +591,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(CONFIG_DIR)/defconfig $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
-source-check: allyesconfig
+source-check:
 	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
@@ -678,7 +678,7 @@ endif
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
-	@echo '  source-check           - check all packages for valid download URLs'
+	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
