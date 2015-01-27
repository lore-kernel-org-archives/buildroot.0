From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:47 +0100
Subject: [Buildroot] [RFC 2/8] pkg-kconfig: extend per-package help text
	with kconfig targets
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the kconfig-package infrastructure use the
$(2)_HELP_HOOKS mechanism to extend the per-package help text with the
specific kconfig targets. These targets allow to run *config editors,
and perform other configuration related actions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index ec58d69..7e7b776 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -36,6 +36,14 @@ $(2)_KCONFIG_EDITORS ?= menuconfig
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
+define $(2)_KCONFIG_PACKAGE_HELP
+	$$(foreach editor,$$($(2)_KCONFIG_EDITORS),\
+            @$(call pkg-print-help-opt,$(1)-$$(editor),"Run the $$(editor) configuration tool")$(sep))
+	@$(call pkg-print-help-opt,$(1)-update-config,"Update configuration")
+endef
+
+$(2)_HELP_HOOKS += $(2)_KCONFIG_PACKAGE_HELP
+
 # FOO_KCONFIG_FILE is required
 ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
-- 
2.1.0
