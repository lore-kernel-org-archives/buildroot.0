From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Sep 2019 14:55:00 +0200
Subject: [Buildroot] [PATCH] core/show-info: extend with kconfig variables
Message-ID: <20190922125500.13865-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend the output of show-info with the kconfig variables applicable to
each item in the list:
  - the main variable, if it exists
  - the list of sub-options, if any

The main variable may not exist for host packages or for some low-level
target packages (e.g. virtual packages), and does not exist for the
pseudo, common rootfs.

Even though a host package may not have a main option, it may still have
sub-options (e.g. a blind option to enable an optional feature, like an
hypotetical BR2_PACKAGE_HOST_PYTHON_NEEDS_SSL).

For a package, the new ouput may now contain structures like:
    "busybox": {
      "kconfig_var": {
        "BR2_PACKAGE_BUSYBOX": "y",
        "options": {
          "BR2_PACKAGE_BUSYBOX_CONFIG": "package/busybox/busybox.config",
          "BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES": "",
          "BR2_PACKAGE_BUSYBOX_SHOW_OTHERS": "y"
        }
      },
      [...]
    }

or for a filesystem:
    "rootfs-tar": {
      "kconfig_var": {
        "BR2_TARGET_ROOTFS_TAR": "y",
        "options": {
          "BR2_TARGET_ROOTFS_TAR_NONE": "y",
          "BR2_TARGET_ROOTFS_TAR_OPTIONS": ""
        }
      },
      [...]
    },

or for an item with no kconfig presence (most probably a host package):
    "host-foo": {
      "kconfig_var": {
        "options": {}
      },
      [...]
    }

Note: for some special packages, the sub-options do not follow the
traditional naming convention. For example, the option pointing to the
uClibc config file is named BR2_UCLIBC_CONFIG, instead of the expected
BR2_PACKAGE_UCLIBC_CONFIG. Therefore, those variables do not appear in
the output of show-info.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 package/pkg-utils.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 74ade437d9..a05bf54527 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -97,6 +97,16 @@ define _json-info-pkg
 endef
 
 define _json-info-pkg-details
+	"kconfig_var": {
+		$(if $(filter $($(1)_KCONFIG_VAR),$(.VARIABLES)),
+			"$($(1)_KCONFIG_VAR)": "$($($(1)_KCONFIG_VAR))"$(comma)
+		)
+		"options": {
+			$(foreach v,$(sort $(filter $($(1)_KCONFIG_VAR)_%,$(.VARIABLES))),
+				"${v}": "$(call qstrip,$($(v)))"$(comma)
+			)
+		}
+	},
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
 	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
@@ -119,6 +129,16 @@ define _json-info-pkg-details
 endef
 
 define _json-info-fs
+	"kconfig_var": {
+		$(if $(filter BR2_TARGET_$(1),$(.VARIABLES)),
+			"BR2_TARGET_$(1)": "$(BR2_TARGET_$(1))"$(comma)
+		)
+		"options": {
+			$(foreach v,$(sort $(filter BR2_TARGET_$(1)_%,$(.VARIABLES))),
+				"${v}": "$(call qstrip,$($(v)))"$(comma)
+			)
+		}
+	},
 	"dependencies": [
 		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
 	]
-- 
2.20.1
