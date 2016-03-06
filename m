From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 14:34:17 +0100
Subject: [Buildroot] [git commit] legal-info: fix detection of "override"
	packages
Message-ID: <20160306133543.27B117FB47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a083cafbc82545dcc8c4f54ba440a0b8d9fe22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ifneq ($$($(2)_SITE_METHOD),override) test will always match
because SITE_METHOD is never set to "override". The result is that
some packages are downloaded and extracted unnecessarily, although
they are (correctly) not saved in output/legal-info/.

Fix by simply testing $(2)_OVERRIDE_SRCDIR instead: when empty, it
indicates that the packages is neither a "local" site-method package
nor a package that has its source directory overridden.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e22babb..9ea2a70 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -757,13 +757,11 @@ endif
 # non-local, and non-overriden. So only store, in the manifest, the tarball
 # name of those packages.
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-ifneq ($$($(2)_SITE_METHOD),local)
-ifneq ($$($(2)_SITE_METHOD),override)
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # Packages that have a tarball need it downloaded beforehand
 $(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 endif
 endif
-endif
 
 # If FOO_ACTUAL_SOURCE_TARBALL is explicitly defined, it means FOO_SOURCE is
 # indeed a binary (e.g. external toolchain) and FOO_ACTUAL_SOURCE_TARBALL/_SITE
