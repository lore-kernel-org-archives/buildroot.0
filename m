From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:36 +0200
Subject: [Buildroot] [PATCH 22/35] Makefile: use the package infra based
	external-deps
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-23-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit changes the global 'external-deps' target to use the newly
introduced per-package <pkg>-all-external-deps, instead of relying on
the 'source' target with a custom DL_MODE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0709751..8fca4b8 100644
--- a/Makefile
+++ b/Makefile
@@ -617,8 +617,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 
 source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
 
+_external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
-	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
+	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
-- 
2.1.0
