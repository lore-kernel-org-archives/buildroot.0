From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:46 +0100
Subject: [Buildroot] [RFC 1/8] package: core support for per-package help
	text
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds to the generic-package infrastructure a new
per-package $(1)-help target, which shows a help text containing
details about all available make targets for this package.

Each target is displayed using a small helper function called
pkg-print-help-opt, also added by this commit.

This basic generic-package help text can be extended by specialized
package infrastructure, or by individual packages, using the
$(2)_HELP_HOOKS variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 24 ++++++++++++++++++++++++
 package/pkg-utils.mk   |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..cf7333d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -594,6 +594,30 @@ $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 
 $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
+$(1)-help:
+	@$(call pkg-print-help-opt,$(1),"Build completely")
+	@$(call pkg-print-help-opt,$(1)-install,"Build up to the installation step")
+ifeq ($$($(2)_TYPE),host)
+	@$(call pkg-print-help-opt,$(1)-install-host,"Build up to the host installation step")
+else
+	@$(call pkg-print-help-opt,$(1)-install-target,"Build up to the target installation step")
+	@$(call pkg-print-help-opt,$(1)-install-staging,"Build up to the staging installation step")
+	@$(call pkg-print-help-opt,$(1)-install-images,"Build up to the images installation step")
+endif
+	@$(call pkg-print-help-opt,$(1)-build,"Build up to the compile step")
+	@$(call pkg-print-help-opt,$(1)-configure,"Build up to the configure step")
+	@$(call pkg-print-help-opt,$(1)-patch,"Build up to the patch step")
+	@$(call pkg-print-help-opt,$(1)-extract,"Build up to the extract step")
+	@$(call pkg-print-help-opt,$(1)-depends,"Build package dependencies")
+	@$(call pkg-print-help-opt,$(1)-source,"Only download the source files")
+	@$(call pkg-print-help-opt,$(1)-show-depends,"Display the list of dependencies")
+	@$(call pkg-print-help-opt,$(1)-graph-depends,"Generate a graph of the dependencies")
+	@$(call pkg-print-help-opt,$(1)-dirclean,"Remove the package build directory")
+	@$(call pkg-print-help-opt,$(1)-rebuild,"Restart the build from the compile step")
+	@$(call pkg-print-help-opt,$(1)-reconfigure,"Restart the build from the configure step")
+	@$(call pkg-print-help-opt,$(1)-legal-info,"Generate legal informations")
+	$(foreach hook,$$($(2)_HELP_HOOKS),$$(call $(hook))$(sep))
+
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7eddc47..fbb94cf 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -37,6 +37,10 @@ endef
 $(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
 $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
 
+define pkg-print-help-opt
+	printf "%30s - %s\n" $(1) $(2)
+endef
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
-- 
2.1.0
