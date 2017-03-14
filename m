From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:33 -0700
Subject: [Buildroot] [PATCH 04/23] package/gdb: use the Xtensa variables
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-5-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... instead of re-computing them over-and-over-again.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gdb/gdb.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ccfed4c..9f7746d 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -44,11 +44,9 @@ HOST_GDB_MAKE_OPTS += MAKEINFO=true
 HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
-XTENSA_CORE_NAME = $(call qstrip, $(BR2_XTENSA_CORE_NAME))
-ifneq ($(XTENSA_CORE_NAME),)
+ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define GDB_XTENSA_PRE_PATCH
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
-		-C $(@D) --strip-components=1 gdb
+	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gdb
 endef
 GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-- 
2.1.4
