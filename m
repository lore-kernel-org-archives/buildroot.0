From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Apr 2014 00:20:03 +0200
Subject: [Buildroot] [PATCH 1/3] pkg-autotools: add support to gettextize a
	package
In-Reply-To: <cover.1397081821.git.yann.morin.1998@free.fr>
References: <cover.1397081821.git.yann.morin.1998@free.fr>
Message-ID: <ba76bf3e6e86c38cc4740d8208c14225e3e2c72e.1397081821.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In case a package comes with a gettext infra which is different from
the one Buildroot provides, we'd get autoreconf errors, like:
    http://autobuild.buildroot.net/results/c0f/c0f7c801f61fdc310cde64342060b00a70155431/

To avoid that, we need to gettextize the package prior to running
autoreconf.

Provide the necessary infrastructure in the autotools infrastructure,
so we can do it consistently across packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/pkg-autotools.mk | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index a646612..84c5577 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -87,6 +87,22 @@ ifndef $(2)_AUTORECONF
  endif
 endif
 
+ifndef $(2)_GETTEXTIZE
+ ifdef $(3)_GETTEXTIZE
+  $(2)_GETTEXTIZE = $($(3)_GETTEXTIZE)
+ else
+  $(2)_GETTEXTIZE ?= NO
+ endif
+endif
+
+ifndef $(2)_GETTEXTIZE_OPT
+ ifdef $(3)_GETTEXTIZE_OPT
+  $(2)_GETTEXTIZE_OPT = $($(3)_GETTEXTIZE)
+ else
+  $(2)_GETTEXTIZE_OPT ?= -f
+ endif
+endif
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
@@ -197,6 +213,20 @@ $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
 #
+# Hook to gettextize the package if needed
+#
+define GETTEXTIZE_HOOK
+	@$$(call MESSAGE,"Gettextizing")
+	$(Q)cd $$($$(PKG)_SRCDIR) && $(HOST_DIR)/usr/bin/gettextize $$($$(PKG)_GETTEXTIZE_OPT)
+endef
+
+# This has to come before autoreconf
+ifeq ($$($(2)_GETTEXTIZE),YES)
+$(2)_PRE_CONFIGURE_HOOK += GETTEXTIZE_HOOK
+$(2)_DEPENDENCIES += host-gettext
+endif
+
+#
 # Hook to autoreconf the package if needed
 #
 define AUTORECONF_HOOK
-- 
1.8.3.2
