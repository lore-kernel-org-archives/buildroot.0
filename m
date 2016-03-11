From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:32:07 +0100
Subject: [Buildroot] [PATCH 3/3] core/pkg-infra: downlaod git submodules if
	the package wants them
In-Reply-To: <cover.1457721001.git.yann.morin.1998@free.fr>
References: <cover.1457721001.git.yann.morin.1998@free.fr>
Message-ID: <8386db648bd2fde9ca492c57b2b92c09cdcfa18d.1457721001.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package variable that packages can set to specify that they
need git submodules.

Only accept this option if the downlaod method is git, as we can not get
submodules via an http download (via wget).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 1 +
 package/pkg-generic.mk  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1332e66..2324a07 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -76,6 +76,7 @@ export BR_NO_CHECK_HASH_FOR =
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		$(if $($(PKG)_GIT_SUBMODULES),-r) \
 		$(QUIET) \
 		-- \
 		$($(PKG)_SITE) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904c09..fee7eb0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -453,6 +453,14 @@ ifndef $(2)_SITE_METHOD
  endif
 endif
 
+# Do not accept to download git submodule if not using the git method
+ifneq ($$($(2)_GIT_SUBMODULES),)
+ ifneq ($$($(2)_SITE_METHOD),git)
+  $$(error $(2) declares having git sub-modules, but does not use the \
+	   'git' method (uses '$$($(2)_SITE_METHOD)' instead))
+ endif
+endif
+
 ifeq ($$($(2)_SITE_METHOD),local)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
-- 
1.9.1
