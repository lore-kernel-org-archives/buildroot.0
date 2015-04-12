From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:51 +0200
Subject: [Buildroot] [PATCHv2 07/21] Makefile: simplify show-targets
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

show-targets is only used currently by the graph-depends script, which
already recurses into the dependencies of the selected packages to
build the dependency graph. Therefore, dumping the contents of
$(PACKAGES) and $(ROOTFS_TARGETS) is sufficient: $(HOST_DEPS) and
$(TARGET_HOST_DEPS) will contain packages that are dependencies of
packages already listed in $(PACKAGES), which graph-depends will
discover by itself.

This allows to remove one more usage of $(HOST_DEPS) and
$(TARGET_HOST_DEPS), which is one more step towards their removal.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a22d99b..e91c5e6 100644
--- a/Makefile
+++ b/Makefile
@@ -639,7 +639,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
+	@echo $(PACKAGES) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(GRAPHS_DIR)
-- 
2.1.0
