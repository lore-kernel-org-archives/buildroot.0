From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Dec 2019 22:09:48 +0100
Subject: [Buildroot] [git commit] package/pkg-utils.mk: rework
 implementation of extractor-system-dependency
Message-ID: <20191217210914.3682E8B84D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e42840e2ae1a4279b00e0db6b197ca6f3a0df3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have the EXTRACTOR_PKG_DEPENDENCY.* variables available,
we can use them to implement extractor-system-dependency: if for a
given archive type, the corresponding EXTRACTOR_PKG_DEPENDENCY.<type>
variable is empty, then it means we need the corresponding extractor
tool to be provided by the system.

Following this, EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS is no
longer used, so we can drop it from support/dependencies/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk                     | 4 ++--
 support/dependencies/check-host-lzip.mk  | 1 -
 support/dependencies/check-host-xzcat.mk | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 35a441e0aa..d324934dba 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -62,8 +62,8 @@ extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))
 # $(firstword) is used here because the extractor can have arguments,
 # like ZCAT="gzip -d -c", and to check for the dependency we only want
 # 'gzip'.
-extractor-system-dependency = $(firstword $(INFLATE$(filter-out \
-	$(EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS),$(suffix $(1)))))
+extractor-system-dependency = $(if $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1))),,\
+	$(firstword $(INFLATE$(suffix $(1)))))
 
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
diff --git a/support/dependencies/check-host-lzip.mk b/support/dependencies/check-host-lzip.mk
index cdd784058c..98a4f42388 100644
--- a/support/dependencies/check-host-lzip.mk
+++ b/support/dependencies/check-host-lzip.mk
@@ -1,5 +1,4 @@
 ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
 BR2_LZIP_HOST_DEPENDENCY = host-lzip
-EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
 LZCAT = $(HOST_DIR)/bin/lzip -d -c
 endif
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index e5d72f95dd..9a78a8f38a 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -3,6 +3,5 @@
 
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
 BR2_XZCAT_HOST_DEPENDENCY = host-xz
-EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .xz .lzma
 XZCAT = $(HOST_DIR)/bin/xzcat
 endif
