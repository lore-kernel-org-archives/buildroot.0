From: Tal Zilcer <talz@ezchip.com>
Date: Thu, 2 Jul 2015 17:41:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/pkg-kconfig: define
	KCONFIG_EDITORS_MAKE_ENV
Message-ID: <1435848100-5762-1-git-send-email-talz@ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tal Zilcer <talz@ezchip.com>

When building a configuration editor we assume its for the HOST.
However some packages might define MAKE_ENV as TARGET_MAKE_NEV.
Using this variable adds to beginning of $(PATH),
the directory $(HOST_DIR)/usr/bin.

This cause us to not use pkg-config from our host machine but the one
from $(HOST_DIR)/usr/bin. This pkg-config does not support QT.
Now when we try to run for example linux-xconfig we fail since QT is not found.

To overcome this we defined a dedicated variable for the configuration editors

Signed-off-by: Tal Zilcer <talz@ezchip.com>
---
 package/pkg-kconfig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index c86c340..48ab6ff 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -109,7 +109,7 @@ endif
 #
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
 $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
-	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+	$$($(2)_KCONFIG_EDITORS_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
 		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
-- 
1.7.1
