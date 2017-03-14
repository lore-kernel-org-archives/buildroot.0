From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:43 -0700
Subject: [Buildroot] [PATCH 14/23] package/gdb: use the Xtensa macro
	generators
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-15-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gdb/gdb.mk | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e7e2289..25f7a54 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -43,14 +43,10 @@ GDB_INSTALL_TARGET_OPTS += MAKEINFO=true DESTDIR=$(TARGET_DIR) install
 HOST_GDB_MAKE_OPTS += MAKEINFO=true
 HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
-# Apply the Xtensa specific patches
-ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define GDB_XTENSA_OVERLAY_EXTRACT
-	$(call arch-xtensa-overlay-extract,$(@D),gdb)
-endef
-GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
-HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
-endif
+GDB_ARCH_XTENSA_OVERLAY_COMPONENT = gdb
+HOST_GDB_ARCH_XTENSA_OVERLAY_COMPONENT = gdb
+$(eval $(arch-xtensa-overlay))
+$(eval $(host-arch-xtensa-overlay))
 
 ifeq ($(GDB_FROM_GIT),y)
 GDB_DEPENDENCIES += host-flex host-bison
-- 
2.1.4
