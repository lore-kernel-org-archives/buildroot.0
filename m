From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:47 +0200
Subject: [Buildroot] [PATCH 1/8 v3] core/pkg-generic: add support for
	package-defined help
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <fcca98ea0e54fd40f5e3fbe5dcaaf56e405bb525.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a package-variable to store the package-specific make rules.

Although this variable would be seldom used, we still document it.
However, we make sure the documentation explicitly states that this
variable should not be used (if it needs to be, the submitter of a
package will be told so during reviews).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - package don't provide help text, they provide help commands
---
 Makefile                                | 1 +
 docs/manual/adding-packages-generic.txt | 6 ++++++
 package/pkg-generic.mk                  | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/Makefile b/Makefile
index 21d63f6..d77b539 100644
--- a/Makefile
+++ b/Makefile
@@ -937,6 +937,7 @@ help:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	$(foreach p,$(HELP_PACKAGES),$($(p)_HELP_CMDS)$(sep))
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endif
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8ed7fe8..de8aca2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -497,6 +497,12 @@ different steps of the build process.
   systemd is selected as the init system in the configuration, only
   +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run).
 
+* +LIBFOO_HELP_CMDS+ lists the actions to print the package help, which
+  is included to the main +make help+ output. These commands can print
+  anything in any format.
+  This is seldom used, as packages rarely have custom rules. *Do not use
+  this variable*, unless you really know that you need to print help.
+
 The preferred way to define these variables is:
 
 ----------------------
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b031879..374d9d5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -914,6 +914,10 @@ ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
 $$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
 endif
 
+ifneq ($$($(2)_HELP_CMDS),)
+HELP_PACKAGES += $(2)
+endif
+
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
-- 
2.7.4
