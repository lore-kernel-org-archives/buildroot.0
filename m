From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 14:41:13 +0200
Subject: [Buildroot] [PATCH 2/4] legal-info: save license files even for
	local or overridden packages
In-Reply-To: <cover.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <4970d4e28d1f96838b0f62c52852ea9d531faec2.1403439879.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Even if we do not save the sources for local or overridden packages because
it is too complex, we can still quite easily save the license files.

Also, having the license files is a very important part of complying with
the licenses.

Move the copy of license files out of the non-local, non-overridden package
case, but still in the case where packages have a _SOURCE defined, to
avoid catching packages bundled in Buildroot (eg. mkpasswd et al.)

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v5 -> v6:
  - typoes  (Luca)
  - fix the rebasing mess after the $$ conversion

Changes v4 -> v5:
  - avoid warning for packages bundled in Buildroot  (Luca)
  - the change is not about non-redistributable packages, but about
    local and overriden packages
---
 package/pkg-generic.mk | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5f2a27e..e8f2f9e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -644,6 +644,19 @@ $(1)-legal-info:
 	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 
+# Save license files if defined
+# We save the license files for any kind of package: normal, local,
+# overridden, or non-redistributable alike.
+# The reason to save license files even for no-redistribute packages
+# is that the license still applies to the files distributed as part
+# of the rootfs, even if the sources are not themselves redistributed.
+ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
+	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
+	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
+else
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+endif # license files
+
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
@@ -654,14 +667,6 @@ else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 else
 # Other packages
 
-# Save license files if defined
-ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
-	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
-else
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
-endif # license files
-
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
 	@cp -l $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
-- 
1.8.3.2
