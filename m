From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Jan 2019 00:12:00 +0100
Subject: [Buildroot] [git commit] skeleton-init-common: improve /etc/hosts
 generation
Message-ID: <20190128231144.8907C81592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01aacbf942198f919ce878d257edc6a47e756e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If BR2_TARGET_GENERIC_HOSTNAME contains a FQDN, strip the host part and
add it as an alias, e.g.

    127.0.1.1	hostname.example.com hostname

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton-init-common/skeleton-init-common.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index 7d2c68ada3..e429b13d78 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -42,10 +42,15 @@ SKELETON_INIT_COMMON_PASSWD_METHOD = $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_M
 SKELETON_INIT_COMMON_BIN_SH = $(call qstrip,$(BR2_SYSTEM_BIN_SH))
 
 ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),)
+SKELETON_INIT_COMMON_HOSTS_LINE = $(SKELETON_INIT_COMMON_HOSTNAME)
+SKELETON_INIT_COMMON_SHORT_HOSTNAME = $(firstword $(subst ., ,$(SKELETON_INIT_COMMON_HOSTNAME)))
+ifneq ($(SKELETON_INIT_COMMON_HOSTNAME),$(SKELETON_INIT_COMMON_SHORT_HOSTNAME))
+SKELETON_INIT_COMMON_HOSTS_LINE += $(SKELETON_INIT_COMMON_SHORT_HOSTNAME)
+endif
 define SKELETON_INIT_COMMON_SET_HOSTNAME
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(SKELETON_INIT_COMMON_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
-	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTNAME)' \
+	$(SED) '$$a \127.0.1.1\t$(SKELETON_INIT_COMMON_HOSTS_LINE)' \
 		-e '/^127.0.1.1/d' $(TARGET_DIR)/etc/hosts
 endef
 SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_SET_HOSTNAME
