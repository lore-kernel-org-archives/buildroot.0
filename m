From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 22:33:05 +0200
Subject: [Buildroot] [git commit] package/pmake: force argv[0]=${0} in the
	pmake wrapper
Message-ID: <20130602212115.CFEA79A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e037134a4d4e0429a413e80f345291118e8157d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This forces bmake to call the wrapper, not itself.
Also, use consistent "${0/*}" instead of "${0/pmake}".

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pmake/pmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pmake/pmake.mk b/package/pmake/pmake.mk
index 7b2e5a6..50613e8 100644
--- a/package/pmake/pmake.mk
+++ b/package/pmake/pmake.mk
@@ -39,7 +39,7 @@ define HOST_PMAKE_INSTALL_CMDS
 	for mk in $(@D)/mk/*; do                                        \
 	    $(INSTALL) -m 0644 $${mk} $(HOST_DIR)/usr/share/pmake/mk;   \
 	done
-	printf '#!/bin/sh\nexec $${0%%/*}/bmake -m $${0%%/pmake}/../../usr/share/pmake/mk "$$@"\n'  \
+	printf '#!/bin/bash\nexec -a "$${0}" $${0%%/*}/bmake -m $${0%%/*}/../../usr/share/pmake/mk "$$@"\n'  \
 	       >$(HOST_DIR)/usr/bin/pmake
 	chmod 0755 $(HOST_DIR)/usr/bin/pmake
 endef
