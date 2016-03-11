From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:13 +0100
Subject: [Buildroot] [PATCH 5/9 v2] core/pkg-generic: add help about
	package-specific rules
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <74636e9e0bf960bd547741d3b172e562c7ed3ad0.1457717002.git.yann.morin.1998@free.fr>
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
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                | 1 +
 docs/manual/adding-packages-generic.txt | 6 ++++++
 package/pkg-generic.mk                  | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index ea8b1e4..fd953b2 100644
--- a/Makefile
+++ b/Makefile
@@ -934,6 +934,7 @@ help-internal:
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	@$(call print-help,$(PACKAGE_HELP))
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
 endif
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8ed7fe8..0e36ffa 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -436,6 +436,12 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_HELP+ defines the help entries visible when running `make help`.
+  The expected content for this variable is a list of single- or double-
+  quoted strings, with each string in the format "action : help for action".
+  This is seldom used, as packages rarely have custom rules. Do not use
+  this variable.
+
 The recommended way to define these variables is to use the following
 syntax:
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904c09..335b811 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -910,6 +910,8 @@ ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
 $$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
 endif
 
+PACKAGE_HELP += $$($(2)_HELP)
+
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
-- 
1.9.1
