From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jul 2013 19:24:59 +0200
Subject: [Buildroot] [PATCH] package/pmake: remove
Message-ID: <1375205099-7724-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Packaging pmake was required when we used the upstream libedit.
Since we have switched to using the autotools-based libedit,
pmake is no longer needed.

Because pmake is quite ugly, let's just drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Note: this requires the libedit change be applied first, of course.

---
 package/pmake/pmake.mk | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 package/pmake/pmake.mk

diff --git a/package/pmake/pmake.mk b/package/pmake/pmake.mk
deleted file mode 100644
index 83ee12e..0000000
--- a/package/pmake/pmake.mk
+++ /dev/null
@@ -1,47 +0,0 @@
-################################################################################
-#
-# pmake
-#
-################################################################################
-
-PMAKE_VERSION       = 1.111
-PMAKE_SOURCE        = pmake_$(PMAKE_VERSION).orig.tar.gz
-PMAKE_SITE          = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/p/pmake
-PMAKE_LICENSE       = BSD-3c BSD-4c
-# No license file. License texts are spread in the boilerplates
-# of each individual source files; some are BSD-3c, some BSD-4c.
-
-# Vampirise patches from Debian
-PMAKE_PATCH = pmake_1.111-3.2.debian.tar.gz
-
-# CFLAGS vampirised from Debian's rules, adapted to buildroot variables
-HOST_PMAKE_CFLAGS = -O2 -g -Wall -D__COPYRIGHT\(x\)= -D__RCSID\(x\)= -I.    \
-                -DMACHINE=\\\"buildroot\\\"                                 \
-                -DMACHINE_ARCH=\\\"$(ARCH)\\\" -DMACHINE_MULTIARCH=\\\"\\\" \
-                -DHAVE_SETENV -DHAVE_STRERROR -DHAVE_STRDUP -DHAVE_STRFTIME \
-                -DHAVE_VSNPRINTF -D_GNU_SOURCE -Wno-unused
-
-define HOST_PMAKE_BUILD_CMDS
-	$(MAKE) -C $(@D) -f Makefile.boot CFLAGS="$(HOST_PMAKE_CFLAGS)"
-endef
-
-# The generated file is named bmake, but we want pmake; but:
-#  - pmake uses support files (in  mk/)
-#  - it's not possible to tell pmake, at build-time, where to expect
-#    these support files, and pmake expects them in /usr/share/mk/
-#  - but pmake has an option to override that search path at runtime
-#  - so we install bmake as bmake
-#  - and we install a wrapper named pmake that calls pmake with the
-#    appropriate search path
-define HOST_PMAKE_INSTALL_CMDS
-	$(INSTALL) -m 0755 $(@D)/bmake $(HOST_DIR)/usr/bin/bmake
-	$(INSTALL) -d -m 0755 $(HOST_DIR)/usr/share/pmake/mk
-	for mk in $(@D)/mk/*; do                                        \
-	    $(INSTALL) -m 0644 $${mk} $(HOST_DIR)/usr/share/pmake/mk;   \
-	done
-	printf '#!/bin/bash\nexec -a "$${0}" $${0%%/*}/bmake -m $${0%%/*}/../../usr/share/pmake/mk "$$@"\n'  \
-	       >$(HOST_DIR)/usr/bin/pmake
-	chmod 0755 $(HOST_DIR)/usr/bin/pmake
-endef
-
-$(eval $(host-generic-package))
-- 
1.8.1.2
