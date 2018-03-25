From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 17:45:58 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: handle host-lzip as
 an extract dependency
Message-ID: <20180325155336.04FDA83AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15815e43ddbb137faca46084f3808f8063bfbffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This moves the host-lzip dependency handling from
DEPENDENCY_HOST_PREREQ to an extract dependency.

To achieve that, check-host-lzip.mk fills in the
BR2_LZIP_HOST_DEPENDENCY with host-lzip if building a host-lzip is
needed. The name BR2_LZIP_HOST_DEPENDENCY has been chosen because it
matches the name BR2_CMAKE_HOST_DEPENDENCY already used in
check-host-cmake.mk.

The BR2_LZIP_HOST_DEPENDENCY is added to all packages, except:

 - host-lzip, because we would otherwise depend on ourself.

 - host-tar, because lzip itself is delivered as a tarball, so we need
   to have host-lzip depend on host-tar, and not host-tar depend on
   host-lzip

 - host-skeleton, because we need to have host-lzip depend on
   host-skeleton, and not the opposite.

We also mutually exclude host-lzip and host-xz from dependending on
each other, to avoid a circular dependency.

In addition, we modify lzip.mk to explicitly build host-lzip without
ccache. We generally took the approach of building host-ccache *after*
all the extractors have been built.

[Peter: fix s/host-tar/host-lzip/ typo, fix s/xz/lzip/ typo]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lzip/lzip.mk                    | 2 +-
 package/pkg-generic.mk                  | 6 +++++-
 support/dependencies/check-host-lzip.mk | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 4088662de2..72742240a5 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -16,7 +16,7 @@ endef
 
 define HOST_LZIP_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_MAKE_ENV) ./configure --prefix=$(HOST_DIR) \
-		$(HOST_CONFIGURE_OPTS) )
+		$(HOST_CONFIGURE_OPTS) CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)")
 endef
 
 define LZIP_BUILD_CMDS
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b03d7263b1..f03f1d930f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -559,10 +559,14 @@ ifeq ($(filter host-tar host-skeleton,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz,$(1)),)
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
 endif
 
+ifeq ($(filter host-tar host-skeleton host-xz host-lzip,$(1)),)
+$(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
+endif
+
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
index 00cdd0a236..cdd784058c 100644
--- a/support/dependencies/check-host-lzip.mk
+++ b/support/dependencies/check-host-lzip.mk
@@ -1,5 +1,5 @@
 ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
-DEPENDENCIES_HOST_PREREQ += host-lzip
+BR2_LZIP_HOST_DEPENDENCY = host-lzip
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
 LZCAT = $(HOST_DIR)/bin/lzip -d -c
 endif
