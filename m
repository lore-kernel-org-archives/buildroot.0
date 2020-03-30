From: Yaroslav Syrytsia <me@ys.lc>
Date: Mon, 30 Mar 2020 16:41:37 +0300
Subject: [Buildroot] [PATCH] Makefile: fix custom toolchain building with
 4.3+
Message-ID: <20200330134137.1564855-1-me@ys.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make 4.3 has backward-incompatibility change which breaks
builds that use custom toolchains

Signed-off-by: Yaroslav Syrytsia <me@ys.lc>
---
 Makefile             | 14 ++++++++++++++
 toolchain/helpers.mk |  8 ++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index ae29b042ec..5e603eed21 100644
--- a/Makefile
+++ b/Makefile
@@ -105,6 +105,20 @@ ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MA
 $(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
+# make 4.3:
+# https://lwn.net/Articles/810071/
+# Number signs (#) appearing inside a macro reference or function invocation
+#   no longer introduce comments and should not be escaped with backslashes:
+#   thus a call such as:
+#     foo := $(shell echo '#')
+#   is legal.  Previously the number sign needed to be escaped, for example:
+#     foo := $(shell echo '\#')
+#   Now this latter will resolve to "\#".  If you want to write makefiles
+#   portable to both versions, assign the number sign to a variable:
+#     H := \#
+#     foo := $(shell echo '$H')
+SHARP_SIGN := \#
+
 # absolute path
 TOPDIR := $(CURDIR)
 CONFIG_CONFIG_IN = Config.in
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 2c2a987c3e..44d0c83d1e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -119,12 +119,12 @@ copy_toolchain_sysroot = \
 	done ; \
 	for link in $$(find $(STAGING_DIR) -type l); do \
 		target=$$(readlink $${link}) ; \
-		if [ "$${target}" == "$${target\#/}" ] ; then \
+		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
 			continue ; \
 		fi ; \
-		relpath="$(call relpath_prefix,$${target\#/})" ; \
-		echo "Fixing symlink $${link} from $${target} to $${relpath}$${target\#/}" ; \
-		ln -sf $${relpath}$${target\#/} $${link} ; \
+		relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
+		echo "Fixing symlink $${link} from $${target} to $${relpath}$${target$(SHARP_SIGN)/}" ; \
+		ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
 	done ; \
 	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
 	if [ "$${relpath}" != "" ]; then \
-- 
2.26.0
