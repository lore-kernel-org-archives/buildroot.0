From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:49:05 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: handle host-ccache as
 a regular dependency
Message-ID: <20180325155336.1673A83AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0283d7ee3907d1345307c4ee4aab02fdf38780d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This moves the host-ccache dependency handling from
DEPENDENCIES_HOST_PREREQ to a proper package dependency. When
BR2_CCACHE=y, we add host-ccache as a regular dependency of all
packages except:

 - The extractor packages host-tar, host-xz and host-lzip

 - host-ccache itself

 - host-skeleton, because all packages depend on it

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.mk             | 5 +++++
 package/pkg-generic.mk               | 6 ++++++
 support/dependencies/dependencies.mk | 4 ----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 552a611f42..9a11d46d30 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -21,6 +21,11 @@ CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 # has zero dependency besides the C library.
 HOST_CCACHE_CONF_OPTS += --with-bundled-zlib
 
+# We are ccache, so we can't use ccache
+HOST_CCACHE_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
 #    is already used by autotargets for the ccache package.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f03f1d930f..bc4882235f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -567,6 +567,12 @@ ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
 endif
 
+ifeq ($(BR2_CCACHE),y)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-ccache,$(1)),)
+$(2)_DEPENDENCIES += host-ccache
+endif
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 3fc235863c..bab064319f 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -17,10 +17,6 @@ endef
 include support/dependencies/check-host-tar.mk
 -include $(sort $(filter-out %-tar.mk,$(wildcard support/dependencies/check-host-*.mk)))
 
-ifeq ($(BR2_CCACHE),y)
-DEPENDENCIES_HOST_PREREQ += host-ccache
-endif
-
 core-dependencies:
 	@MAKE="$(MAKE)" DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
