From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:04:56 +0200
Subject: [Buildroot] [git commit] legal-info: rename
	legal-warning-pkg-savednothing helper
Message-ID: <20140622200502.425439D06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d42b6d04516803c4a86c8e02b729d95df9c9415
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    4 ++--
 package/pkg-utils.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 851ae0f..78fe134 100644
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
