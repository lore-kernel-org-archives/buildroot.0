From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Thu,  3 May 2018 20:15:31 +0100
Subject: [Buildroot] [RFC PATCH 1/1] core: add option to disable RPATH
 sanitation in target tree
Message-ID: <20180503191531.15549-1-ciro.santilli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
---
As explained on the Config, the rationale is to speed up BR2_EXTERNAL
package development build iteration.

This would make users targetting virtual machines happy.

It may be argued that embedded images are not supposed to be small,
but a counter argument is that there are already in-tree packages
that benefit considerably from this, e.g. ltp-testsuite, which drops
the build iteration from 18s to 5s on my machine, which is a huge
life improvement.

Additionaly, this will also make it easier for us to find and report
the offending packages mentioned at 5f4ca518094f7690536074246ab765f36a213783
and push for a correct upstream fix, are we tracking that somewhere?
Removing the rpath fix actually makes those packages not work is that it?

I'm not sure if this should be an actual config, thus the RFC.
Without the config, it is also possible to use it just as:

    make BR2_SANITIZE_RPATH=n

 Config.in | 7 +++++++
 Makefile  | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Config.in b/Config.in
index 6b5b2b043c..6b39bd9f8b 100644
--- a/Config.in
+++ b/Config.in
@@ -678,6 +678,13 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 	  and external toolchain backends (through the toolchain
 	  wrapper).
 
+config BR2_SANITIZE_RPATH
+	bool "sanitize rpath"
+	default y
+	help
+	  You may want to disable this while developing a package with
+	  BR2_EXTERNAL to make build iterations faster.
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/Makefile b/Makefile
index 54f940659c..a9c1b82b3f 100644
--- a/Makefile
+++ b/Makefile
@@ -743,8 +743,10 @@ endif
 	) >  $(TARGET_DIR)/usr/lib/os-release
 	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc
 
+ifeq ($(BR2_SANITIZE_RPATH),y)
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
 	$(TOPDIR)/support/scripts/fix-rpath target
+endif
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
-- 
2.16.1
