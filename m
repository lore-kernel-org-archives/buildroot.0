From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:47 +0100
Subject: [Buildroot] [RFCv3 10/15] package/pkg-generic: handle host-ccache
 as a regular dependency
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-11-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This moves the host-ccache dependency handling from
DEPENDENCIES_HOST_PREREQ to a proper package dependency. When
BR2_CCACHE=y, we add host-ccache as a regular dependency of all
packages except:

 - The extractor packages host-tar, host-xz and host-lzip

 - host-ccache itself

 - host-skeleton, because all packages depend on it

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - New patch
---
 package/ccache/ccache.mk             | 5 +++++
 package/pkg-generic.mk               | 6 ++++++
 support/dependencies/dependencies.mk | 4 ----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index afbec44fac..d6ef455e8b 100644
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
index e623afe7bc..cb5889c9ef 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -599,6 +599,12 @@ ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
 endif
 
+ifeq ($(BR2_CCACHE),y)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
+$(2)_DEPENDENCIES += host-ccache
+endif
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index ef2ae9b7e1..1a4b5df9f2 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -14,10 +14,6 @@ $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
 -include $(sort $(wildcard support/dependencies/check-host-*.mk))
 
-ifeq ($(BR2_CCACHE),y)
-DEPENDENCIES_HOST_PREREQ += host-ccache
-endif
-
 core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
-- 
2.13.6
