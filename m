From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 01:25:04 +0200
Subject: [Buildroot] [PATCH RFC] kconfig: allow pre-seending
	randpackageconfig
Message-ID: <1405812304-7603-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: this is only a proof of concept, for initial feedback.

kconfig is not able to properly randomise choices when a base .config
file is provided.

Sicne we do have quite a few choices that selects one package or
another, and we do want to sometime build them, we need to be able to
preseed those packages.

Add a new environment variable that contains the path to a file
containing options to be preseeded to randpackageconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 1af51de..eeaf7d3 100644
--- a/Makefile
+++ b/Makefile
@@ -751,6 +751,9 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
+ifneq ($(BR2_RAND_PRESEED_CONFIG),)
+	@cat $(BR2_RAND_PRESEED_CONFIG) >> $(CONFIG_DIR)/.config.nopkg
+endif
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --randconfig $(CONFIG_CONFIG_IN)
-- 
1.9.1
