From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 00:22:54 +0200
Subject: [Buildroot] [PATCH 1/6] package/pmake: add host pmake
In-Reply-To: <cover.1368137904.git.yann.morin.1998@free.fr>
References: <cover.1368137904.git.yann.morin.1998@free.fr>
Message-ID: <2d595758f38c257f4efb7ad18eee25888b192fd5.1368137904.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

pmake is the make command used by the BSD.
It will used to build BSD-related packages, coming later.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pmake/pmake.mk | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/pmake/pmake.mk

diff --git a/package/pmake/pmake.mk b/package/pmake/pmake.mk
new file mode 100644
index 0000000..6aa3478
--- /dev/null
+++ b/package/pmake/pmake.mk
@@ -0,0 +1,47 @@
+#############################################################
+#
+# pmake
+#
+##############################################################
+
+PMAKE_VERSION       = 1.111
+PMAKE_SOURCE        = pmake_$(PMAKE_VERSION).orig.tar.gz
+PMAKE_SITE          = http://snapshot.debian.org/archive/debian/20120601T033558Z/pool/main/p/pmake
+PMAKE_LICENSE       = BSD-3c BSD-4c
+# No license file. License texts are spread in the boilerplates
+# of each individual source files; some are BSD-3c, some BSD-4c.
+
+# Vampirise patches from Debian
+PMAKE_PATCH = pmake_1.111-3.2.debian.tar.gz
+
+# CFLAGS vampirised from Debian's rules, adapted to buildroot variables
+HOST_PMAKE_CFLAGS = -O2 -g -Wall -D__COPYRIGHT\(x\)= -D__RCSID\(x\)= -I.    \
+                -DMACHINE=\\\"buildroot\\\"                                 \
+                -DMACHINE_ARCH=\\\"$(ARCH)\\\" -DMACHINE_MULTIARCH=\\\"\\\" \
+                -DHAVE_SETENV -DHAVE_STRERROR -DHAVE_STRDUP -DHAVE_STRFTIME \
+                -DHAVE_VSNPRINTF -D_GNU_SOURCE -Wno-unused
+
+define HOST_PMAKE_BUILD_CMDS
+	$(MAKE) -C $(@D) -f Makefile.boot CFLAGS="$(HOST_PMAKE_CFLAGS)"
+endef
+
+# The generated file is named bmake, but we want pmake; but:
+#  - pmake uses support files (in  mk/)
+#  - it's not possible to tell pmake, at build-time, where to expect
+#    these support files, and pmake expects them in /usr/share/mk/
+#  - but pmake has an option to override that search path at runtime
+#  - so we install bmake as bmake
+#  - and we install a wraper named pmake that calls pmake with the
+#    appropriate search path
+define HOST_PMAKE_INSTALL_CMDS
+	$(INSTALL) -m 0755 $(@D)/bmake $(HOST_DIR)/usr/bin/bmake
+	$(INSTALL) -d -m 0755 $(HOST_DIR)/usr/share/pmake/mk
+	for mk in $(@D)/mk/*; do                                        \
+	    $(INSTALL) -m 0644 $${mk} $(HOST_DIR)/usr/share/pmake/mk;   \
+	done
+	printf '#!/bin/sh\nexec $${0%%/*}/bmake -m $${0%%/pmake}/../../usr/share/pmake/mk "$$@"\n'  \
+	       >$(HOST_DIR)/usr/bin/pmake
+	chmod 0755 $(HOST_DIR)/usr/bin/pmake
+endef
+
+$(eval $(host-generic-package))
-- 
1.8.1.2
