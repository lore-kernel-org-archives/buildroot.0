From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:39 +0100
Subject: [Buildroot] [PATCH 01/14] core: sort packages and eliminate
 duplicates in show-targets
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <9fd0b864668a90afaf2c40774451219068ca7547.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v1 -> v2:
  - don't toch the variable; just sort the list when dumping it
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9240d0aeeb..19bfcfbee3 100644
--- a/Makefile
+++ b/Makefile
@@ -789,7 +789,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 
 .PHONY: show-targets
 show-targets:
-	@echo $(PACKAGES) $(TARGETS_ROOTFS)
+	@echo $(sort $(PACKAGES)) $(sort $(TARGETS_ROOTFS))
 
 .PHONY: show-build-order
 show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
-- 
2.11.0
