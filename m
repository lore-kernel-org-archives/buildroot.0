From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 08:35:21 +0200
Subject: [Buildroot] [PATCH 02/12] eglibc: libstdc++ is not part of the C
	library
In-Reply-To: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377671731-28656-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, the eglibc.mk file was trying to install libstdc++.so
from eglibc to the target. But the C++ standard library is provided by
GCC, not by the C library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eglibc/eglibc.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
index 8873a06..fe12299 100644
--- a/package/eglibc/eglibc.mk
+++ b/package/eglibc/eglibc.mk
@@ -89,17 +89,10 @@ ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 EGLIBC_LIBS_LIB += libthread_db.so
 endif
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-EGLIBC_LIBS_USR_LIB += libstdc++.so
-endif
-
 define EGLIBC_INSTALL_TARGET_CMDS
 	for libs in $(EGLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
 	done
-	for libs in $(EGLIBC_LIBS_USR_LIB); do \
-		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/usr/lib) ; \
-	done
 endef
 
 $(eval $(autotools-package))
-- 
1.8.1.2
