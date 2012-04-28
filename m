From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 28 Apr 2012 23:16:19 +0200
Subject: [Buildroot] [PATCH 1/3] pkg-infra: add CONF_ENABLE and
	CONF_PKG_ENABLE helper functions
In-Reply-To: <1335647781-16536-1-git-send-email-arnout@mind.be>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
Message-ID: <1335647781-16536-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

CONF_ENABLE is shorthand for --enable/--disable options depending on a
.config variable.

CONF_PKG_ENABLE is shorthand for --enable/--disable options and for a
dependency depending on the selection of a package.

These macros make it easier to consistently add --enable and --disable
options to configure.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-autotargets.mk |   57 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index c9887c2..3743db3 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -37,6 +37,63 @@ define CONFIG_UPDATE
 endef
 
 ################################################################################
+# CONFIG_ENABLE -- generates the configure option to enable or disable a
+# feature depending on a .config option.
+#
+# argument 1 is the uppercase package name
+# argument 2 is y or empty (i.e. it is the .config option to check)
+# argument 3 (optional) are additional dependencies in case the .config option
+#   is y.
+# If the call has four arguments, argument 4 is the name that comes behind
+#   --enable- resp. --disable-
+# If the call has five argument, argument 4 is the ensable option and
+#   argument 5 is the disable option.
+# The call must be done within an $(eval) clause.
+#
+# Examples:
+# $(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_CAIRO_SVG),,svg))
+# $(eval $(call CONF_ENABLE,CAIRO,$(BR2_PACKAGE_CAIRO_PNG),libpng,png))
+# $(eval $(call CONF_ENABLE,AVAHI,$(BR2_PACKAGE_AVAHI_DAEMON),expat,--with-xml=expat,--with-xml=none))
+#
+################################################################################
+define CONF_ENABLE
+ifeq ($(2),y)
+       $(1)_CONF_OPT += $(if $(5),$(4),--enable-$(4))
+       $(1)_DEPENDENCIES += $(3)
+else
+       $(1)_CONF_OPT += $(if $(5),$(5),--disable-$(4))
+endif
+endef
+
+################################################################################
+# CONF_PKG ENABLE -- generates the configure option and dependency for another
+# package, depending on whether that package is selected.  If the other package
+# is selected, an --enable- option and a dependency on the other package is
+# added.  If the other package is not selected, a --disable- option is added.
+#
+#  argument 1 is the uppercase package name
+#  argument 2 is the lowercase name of the other package
+#  If the call has two arguments, the --enable-<pkg> configure option is added.
+#  If the call has three arguments, argument 3 is the name that comes after
+#    --enable- and --disable- (in case this differs from the buildroot package
+#    name).
+#  If the call has four arguments, argument 3 is the option to enable the
+#    other package and argument 4 is the option to disable it.
+#
+# The call must be done within an $(eval) clause.
+#
+# Examples:
+# $(eval $(call CONF_PKG_ENABLE,AVAHI,dbus))
+# $(eval $(call CONF_PKG_ENABLE,AVAHI,libglade,gtk))
+# $(eval $(call CONF_PKG_ENABLE,AVAHI,libglib2,--enable-glib --enable-gobject,--disable-glib --disable-gobject))
+#
+################################################################################
+define CONF_PKG_ENABLE
+$(call CONF_ENABLE,$(1),$(BR2_PACKAGE_$(call UPPERCASE,$(2))),$(2),$(if $(3),$(3),$(2)),$(if $(4),$(4),))
+endef
+
+
+################################################################################
 # AUTOTARGETS_INNER -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
 # few hooks to tune the build process for autotools specifities and
-- 
1.7.10
