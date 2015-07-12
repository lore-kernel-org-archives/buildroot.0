From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:23 +0200
Subject: [Buildroot] [PATCH 1/7] core/pkg-kconfig: don't enforce check for
	config file when not building
In-Reply-To: <cover.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <388470f3f96d8a3eef231a93cc2b961e43c1b415.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, this is triggering the error message:
    make randconfig
    make source

Only limit the check to enforce a config file being set to when we are
actually building, like is done in the various kconfig-using packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index c86c340..41c6fd5 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -90,7 +90,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # FOO_KCONFIG_FILE is required
-ifeq ($$($(2)_KCONFIG_FILE),)
+ifeq ($(BR_BUILDING)$$($(2)_KCONFIG_FILE),y)
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
-- 
1.9.1
