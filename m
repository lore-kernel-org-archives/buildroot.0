From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 19:15:13 +0100
Subject: [Buildroot] [PATCH 15/16 v3] core/legal-info: allow ignoring
	packages from the legal-info
In-Reply-To: <cover.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <882f1002db3ce40f210893921c23728ca796d20e.1454004518.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It might be necessary to not even mention a package in the output of
legal-info:

  - virtual package have virtually nothing to save in the legal-info
    output;

  - for Buildroot itself, host-gcc-initial and host-gcc-final are
    not real packages, they are just two different steps of the same
    package, gcc;

  - for proprietary packages, it might not even be legal to even
    mention them, being under NDA or some other such restrictive
    conditions.

Introduce the new FOO_LEGAL_INGORE variable that a package can set
to 'YES' (default to 'NO') to indicate that the package should be
completely ignored from the legal-info output, in which case the
package is not metionned in the maniufest, its source archive,
patches and license files are not saved into legal-info/ .

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Changes v1 -> v2:
  - introduce a new variable, instead of making _REDISTRIBUTE a
    tri-state  (Thomas, Peter, Luca)
---
 docs/manual/adding-packages-generic.txt |  9 +++++++++
 package/pkg-generic.mk                  | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1f9c7bb..1b07a14 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -421,6 +421,15 @@ information is (assuming the package name is +libfoo+) :
   non-opensource packages: Buildroot will not save the source code for this
   package when collecting the +legal-info+.
 
+* +LIBFOO_LEGAL_IGNORE+ can be set to +YES+ or +NO+ (the default) to indicate
+  that this package should be completely ignored when saving the licensing
+  information. If set to +YES+, then the package is not listed in the manifest,
+  its source archive and its license files are not saved. You probably do not
+  want to set it to +YES+, unless under very specific conditions (e.g. when
+  you use the `legal-info/` output directory as-is to provide a compliance
+  delivery, and do not want your proprietary, non-redistributable packages to
+  even be mentionned in the manifest).
+
 * +LIBFOO_FLAT_STACKSIZE+ defines the stack size of an application built into
   the FLAT binary format. The application stack size on the NOMMU architecture
   processors can't be enlarged at run time. The default stack size for the
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b59af9e..9c02372 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -490,6 +490,14 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+ifndef $(2)_LEGAL_IGNORE
+ ifdef $(3)_LEGAL_IGNORE
+  $(2)_LEGAL_IGNORE = $$($(3)_LEGAL_IGNORE)
+ endif
+endif
+
+$(2)_LEGAL_IGNORE		?= NO
+
 $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME_VERSION)
 
 # When a target package is a toolchain dependency set this variable to
@@ -762,7 +770,10 @@ $(2)_MANIFEST_LICENSE_FILES ?= not saved
 # We need to extract and patch a package to be able to retrieve its
 # license files (if any) and the list of patches applied to it (if
 # any).
+# But not if we want to ignore that package completely.
+ifneq ($$($(2)_LEGAL_IGNORE),YES)
 $(1)-legal-info: $(1)-patch
+endif
 
 # We only save the sources of packages we want to redistribute, that are
 # non-local, and non-overriden. So only store, in the manifest, the tarball
@@ -792,6 +803,8 @@ endif # actual sources != ""
 
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
+ifneq ($$($(2)_LEGAL_IGNORE),YES)
+
 # Packages without a source are assumed to be part of Buildroot, skip them.
 	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
@@ -845,6 +858,8 @@ endif # other packages
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
+endif # $(2)_LEGAL_IGNORE != YES
+
 # add package to the general list of targets if requested by the buildroot
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
-- 
1.9.1
