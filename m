From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 24 Oct 2018 00:45:41 +0100
Subject: [Buildroot] [git commit] pkg-perl: add per package upgrade target
Message-ID: <20181023234600.9BB49837AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e04289beaad8f3620f5702a4841a4867b973b677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If PKG_DISTNAME is defined, an addition pkg-upgrade target is created
that will run scancpan with the right parameters for re-generating the
package.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout:
  - make it really private to pkg-perl;
  - factor away the host/target condition, instead use $(4) directly.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-perl.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 07348bd5d3..1ecf31eff9 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -197,6 +197,14 @@ endif
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
 
+# Upgrade helper
+ifneq ($$($(3)_DISTNAME),)
+$(1)-upgrade:
+	utils/scancpan -force -$(4) $$($(3)_DISTNAME)
+
+.PHONY: $(1)-upgrade
+endif
+
 endef
 
 ################################################################################
