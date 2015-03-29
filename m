From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:35 +0200
Subject: [Buildroot] [PATCH 21/35] Makefile: simplify show-targets
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-22-git-send-email-thomas.petazzoni@free-electrons.com>
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
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ab54dda..0709751 100644
--- a/Makefile
+++ b/Makefile
@@ -644,7 +644,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
+	@echo $(PACKAGES) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
-- 
2.1.0
