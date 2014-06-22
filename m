From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 14:41:15 +0200
Subject: [Buildroot] [PATCH 4/4] legal-info: rename
	legal-warning-pkg-savednothing helper
In-Reply-To: <cover.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <1b7669d8f5b489b6c8b2b3394ba1207c903a9e68.1403439879.git.yann.morin.1998@free.fr>
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
Changes v5 -> v6:
  - fix the silly new name of the macro  (Luca)
---
 package/pkg-generic.mk | 4 ++--
 package/pkg-utils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 55936d2..97c8416 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -662,10 +662,10 @@ endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
-	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
+	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
 
 else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
+	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),override)
 
 else
 # Other packages
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 163ef8a..59a5ab2 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -101,8 +101,8 @@ define legal-warning-pkg # pkg, text
 	echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
 endef
 
-define legal-warning-pkg-savednothing # pkg, {local|override}
-	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
+define legal-warning-nosource # pkg, {local|override}
+	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
 
 define legal-manifest # pkg, version, license, license-files, source, {HOST|TARGET}
-- 
1.8.3.2
