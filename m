From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:40:43 +0100
Subject: [Buildroot] [git commit] core: sort packages and eliminate
 duplicates in show-targets
Message-ID: <20171201205341.3EA0780FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=203219ca93947bbf5d43edba89380ff41ef5a8a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, enabling more than one filesystem image will make
'show-targets' list a few host packages more than once.

This is because all filesystem images add the same set of
host-packages to their dependencies, which are then added as-is
to the package list.

Thus, host-fakeroot, host-makedevs and, if needed, host-mkpasswd will
appear as many times as there are filesystem images enabled.

Fix that by sorting the package list, thus eliminating duplicates from
that list. Also sort the rootfs list for good measure. Sort the two
separately, so that rootfses are last.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ef10c90..d528521 100644
--- a/Makefile
+++ b/Makefile
@@ -793,7 +793,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 
 .PHONY: show-targets
 show-targets:
-	@echo $(PACKAGES) $(TARGETS_ROOTFS)
+	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
 
 .PHONY: show-build-order
 show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
