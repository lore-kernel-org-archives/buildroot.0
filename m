From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 11:51:01 +0200
Subject: [Buildroot] [PATCHv4 03/18] Makefile: use the package infra based
	external-deps
In-Reply-To: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1430041876-16436-4-git-send-email-thomas.petazzoni@free-electrons.com>
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
-- 
2.1.0
