From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Mar 2014 00:04:14 +0100
Subject: [Buildroot] [PATCH 4/4] legal-info: rename
	legal-warning-pkg-savednothing helper
In-Reply-To: <cover.1395097170.git.yann.morin.1998@free.fr>
References: <cover.1395097170.git.yann.morin.1998@free.fr>
Message-ID: <ff3371fa4250df5d073cbcb772d9e5563cec4348.1395097170.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This helper was called when none of the sources or license
files were saved.

Now we handle license files separately from the sources,
this is no longer the case: they are only called when the
sources are not saved.

Rename the handler and change the warning message accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk | 4 ++--
 package/pkg-utils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 953d6f9..58d4ccc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -599,10 +599,10 @@ ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
-	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
+	@$(call legal-license-nosource,$$($(2)_RAWNAME),local)
 
 else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
+	@$(call legal-license-nosource,$$($(2)_RAWNAME),override)
 
 else
 # Other packages
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 91a1981..68f1dda 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -105,8 +105,8 @@ define legal-warning-pkg # pkg, text
 	echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
 endef
 
-define legal-warning-pkg-savednothing # pkg, {local|override}
-	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
+define legal-license-nosource # pkg, {local|override}
+	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
 
 define legal-manifest # pkg, version, license, license-files, source, {HOST|TARGET}
-- 
1.8.3.2
