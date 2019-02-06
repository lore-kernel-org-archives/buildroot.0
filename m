From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:21:25 +0100
Subject: [Buildroot] [git commit] package/pkg-waf: add support for
 <pkg>_SUBDIR
Message-ID: <20190206162018.A353C81F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0496a6a842e858c71760eb63833436fe9c044a6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the Buildroot manual, it is specified that the Waf-based
infrastructure supports the <pkg>_SUBDIR variable, which was not true.

This patch:
* makes use of this variable by changing to the given sub-directory
  before executing waf commands,
* documents the usage of <pkg>_SUBDIR in the waf-specific section of
  the manual.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-waf.txt | 6 ++++++
 package/pkg-waf.mk                  | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
index 12e122fb87..ffc004c290 100644
--- a/docs/manual/adding-packages-waf.txt
+++ b/docs/manual/adding-packages-waf.txt
@@ -60,6 +60,12 @@ the generic infrastructure also exist in the Waf infrastructure:
 An additional variable, specific to the Waf infrastructure, can
 also be defined.
 
+* +LIBFOO_SUBDIR+ may contain the name of a subdirectory inside the
+  package that contains the main wscript file. This is useful,
+  if for example, the main wscript file is not at the root of
+  the tree extracted by the tarball. If +HOST_LIBFOO_SUBDIR+ is not
+  specified, it defaults to +LIBFOO_SUBDIR+.
+
 * +LIBFOO_NEEDS_EXTERNAL_WAF+ can be set to +YES+ or +NO+ to tell
   Buildroot to use the bundled +waf+ executable. If set to +NO+, the
   default, then Buildroot will use the waf executable provided in the
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 3288dd63a0..a32d5dab33 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -60,7 +60,7 @@ $(2)_WAF_OPTS				?=
 #
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
 	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \
@@ -77,7 +77,7 @@ endif
 #
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -90,7 +90,7 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
@@ -104,7 +104,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
