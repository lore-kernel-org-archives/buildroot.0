From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:03:41 +0200
Subject: [Buildroot] [git commit] legal-info: save license files even for
	local or overridden packages
Message-ID: <20140622200350.D34B69D06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22efb9f89e96fe7bd004861adc555c65f1a8a38c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 64f9b5f..b113684 100644
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
