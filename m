From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 May 2013 23:45:57 +0200
Subject: [Buildroot] [PATCH 1/3] package/pmake: force argv[0]=${0} in the
	pmake wrapper
In-Reply-To: <cover.1368567696.git.yann.morin.1998@free.fr>
References: <cover.1368567696.git.yann.morin.1998@free.fr>
Message-ID: <6c151d23c349f63fed35cf97396e8ed7123ac303.1368567696.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This forces bmake to call the wrapper, not itself.
Also, use consistent "${0/*}" instead of "${0/pmake}".

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pmake/pmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.2
