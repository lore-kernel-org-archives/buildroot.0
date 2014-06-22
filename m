From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:02:07 +0200
Subject: [Buildroot] [git commit] legal-info: extract even no-redistribute
	packages
Message-ID: <20140622200218.2585F9D06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d04e825f9fa3daaca4ef1271c2113632064e843e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
will not try to extract it first.

If that package also declares some _LICENSE_FILES, legal-info fails
if it is the only action we're trying to run:

    $ cat defconfig
    BR2_arm=y
    BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
    BR2_PACKAGE_LIBFSLCODEC=y
    $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
    $ make legal-info
    [--SNIP--]
    cat: /home/ymorin/dev/buildroot/O/build/libfslcodec-3.5.7-1.0.0/EULA: No such file or directory

Fix this by always having legal-info extract the archives if one or
more _LICENSE_FILES are specified.

We do this for all types of packages: overridden, local or 'normal'
remote packages. Even though we do not save the sources for the
overridden or local packages, we need to save their licensing info,
so we need to extract them.

This implies that we now need only PKG-source, not PKG-extract anymore,
as a dependency of legal-info for packages we want to save (ie.
redistributable, non-local and non-overriden packages.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4a011cc..64f9b5f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -620,11 +620,18 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
 endif
 $(2)_MANIFEST_LICENSE_FILES ?= not saved
 
+# If the package declares _LICENSE_FILES, we need to extract it,
+# for overriden, local or normal remote packages alike, whether
+# we want to redistribute it or not.
+ifneq ($$($(2)_LICENSE_FILES),)
+$(1)-legal-info: $(1)-extract
+endif
+
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
-# Packages that have a tarball need it downloaded and extracted beforehand
-$(1)-legal-info: $(1)-extract $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+# Packages that have a tarball need it downloaded beforehand
+$(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
 endif
 endif
