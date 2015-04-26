From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:50:48 +0200
Subject: [Buildroot] [git commit] Makefile: use the package infra based
	external-deps
Message-ID: <20150426202108.1B3C581734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e679ccb4c10b653839c3b8cea233a96d8556a5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes the global 'external-deps' target to use the newly
introduced per-package <pkg>-all-external-deps, instead of relying on
the 'source' target with a custom DL_MODE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 6a7581a..7649e4c 100644
--- a/Makefile
+++ b/Makefile
@@ -614,8 +614,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 
 source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
 
+_external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
-	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
+	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
