From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:31:58 +0200
Subject: [Buildroot] [PATCH 1/7 v2] core/pkg-kconfig: don't enforce check
	for config file when not building
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <e855e3fc3f672d83f21bb82ffa0069d20c66c4f1.1436783490.git.yann.morin.1998@free.fr>
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
Changes v1 -> v2:
  - use BR_BUILDING in its own ifeq, do not coalesce with the existing
    ifeq  (Thomas)
  - use $$ instead of $ to evaluate BR_BUILDING
---
 package/pkg-kconfig.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index c86c340..f708875 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -90,9 +90,11 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # FOO_KCONFIG_FILE is required
+ifeq ($$(BR_BUILDING),y)
 ifeq ($$($(2)_KCONFIG_FILE),)
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
+endif
 
 # Configuration editors (menuconfig, ...)
 #
-- 
1.9.1
