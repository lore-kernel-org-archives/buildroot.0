From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 00:03:05 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove self-dependency from host
	packages
Message-ID: <1341957785-3763-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When HOST_XXX_DEPENDENCIES are derived automatically from
XXX_DEPENDENCIES, a self-dependency is created if host-xxx is a dependency
of xxx.  This was the case for miniperl.

Filter out the self-dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/pkg-gentargets.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index 1c9b458..5da9cdc 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -245,7 +245,7 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
 endif
 endif
 
-$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
-- 
tg: (b8b57bb..) t/host-no-circular-dep (depends on: master)
