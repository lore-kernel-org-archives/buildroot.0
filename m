From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 19 Oct 2018 10:38:02 -0300
Subject: [Buildroot] [PATCH] skeleton-init-common: improve /etc/hosts
 generation
Message-ID: <20181019133802.19627-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If BR2_TARGET_GENERIC_HOSTNAME contains a FQDN, strip the host part and
add it as an alias, e.g.

    127.0.1.1	hostname.example.com hostname

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/skeleton-init-common/skeleton-init-common.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index e8a0522052..93a410914a 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -41,10 +41,16 @@ SKELETON_INIT_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_M
 SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
 
 ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
+SKELETON_INIT_COMMON_HOSTS_LINE = $(SKELETON_INIT_COMMON_HOSTNAME)
+SKELETON_INIT_COMMON_SHORT_HOSTNAME = $(firstword $(subst ., ,$(SKELETON_INIT_COMMON_HOSTNAME)))
+ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),$(SKELETON_INIT_COMMON_SHORT_HOSTNAME))
+SKELETON_INIT_COMMON_HOSTS_LINE += $(SKELETON_INIT_COMMON_SHORT_HOSTNAME)
+else
+endif
 define SKELETON_INIT_COMMON_SET_HOSTNAME
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(SKELETON_INIT_COMMON_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTNAME)' \
+	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTS_LINE)' \
 		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
 endef
 SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_HOSTNAME
-- 
2.14.4
