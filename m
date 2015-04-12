From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:52 +0200
Subject: [Buildroot] [PATCHv2 08/21] Makefile: use the package infra based
	external-deps
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit changes the global 'external-deps' target to use the newly
introduced per-package <pkg>-all-external-deps, instead of relying on
the 'source' target with a custom DL_MODE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e91c5e6..40ee2e2 100644
--- a/Makefile
+++ b/Makefile
@@ -612,8 +612,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 
 source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
 
+_external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
-	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
+	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
-- 
2.1.0
