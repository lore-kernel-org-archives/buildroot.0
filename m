From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 22:48:44 +0200
Subject: [Buildroot] [git commit] eglibc: libstdc++ is not part of the C
	library
Message-ID: <20130915213314.5FCA082A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8164107ecc07933b244fd436ad1025d8ae1aff1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some reason, the eglibc.mk file was trying to install libstdc++.so
from eglibc to the target. But the C++ standard library is provided by
GCC, not by the C library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eglibc/eglibc.mk |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

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
