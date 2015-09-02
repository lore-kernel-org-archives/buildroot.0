From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  2 Sep 2015 20:11:59 +0300
Subject: [Buildroot] [PATCH] pkg-generic: fix <pkg>-legal-info target
Message-ID: <217433bd5ec057444b036dd8b72778f078f0926e.1441213919.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When making the <pkg>-legal-info target before the main legal-info target, the
following error shows:

/bin/sh: /home/baruch/git/buildroot/output/legal-info/licenses.txt: No such file or directory
package/freescale-imx/imx-vpu/imx-vpu.mk:39: recipe for target 'imx-vpu-legal-info' failed
make: *** [imx-vpu-legal-info] Error 1

Make <pkg>-legal-info depend on legal-info-prepare to ensure that
$(LEGAL_INFO_DIR) exists when generating licenses.txt.

Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a7d97efdf02..24b473b13ff2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -715,7 +715,7 @@ endif
 endif
 
 # legal-info: produce legally relevant info.
-$(1)-legal-info:
+$(1)-legal-info: legal-info-prepare
 # Packages without a source are assumed to be part of Buildroot, skip them.
 	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
-- 
2.5.0
