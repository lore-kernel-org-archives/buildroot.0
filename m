From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:18:55 +0200
Subject: [Buildroot] [git commit] Makefile: simplify show-targets
Message-ID: <20150414081955.0DB0B807AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adc88b8663eeff061c01726192599d5aaaf5f000
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d041226..70d6b4a 100644
--- a/Makefile
+++ b/Makefile
@@ -639,7 +639,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
+	@echo $(PACKAGES) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(GRAPHS_DIR)
