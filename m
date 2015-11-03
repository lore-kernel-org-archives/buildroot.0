From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:20:30 +0100
Subject: [Buildroot] [git commit] core/pkg-generic: allow packages to
	exclude files when extracting
Message-ID: <20151103223523.48DDF81E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07e5641339800b75109cbc72f8e13a7b4f16d039
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, packages that need to exclude parts of the archives when
extracting (e.g. to gain space), like gcc or toolchain-external, have to
provide custom extract commands, just for the sake of adding a bunch of
--exclude directives when calling tar.

Add a new variable that packages may set, to provide a space-separated
list of patterns to exclude.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    4 ++++
 package/pkg-generic.mk                  |    5 ++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 9d6401f..a7143e4 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -314,6 +314,10 @@ information is (assuming the package name is +libfoo+) :
   that have more than one leading component to strip, set this
   variable with the value to be passed to tar. Default: 1.
 
+* +LIBFOO_EXCLUDES+ is a space-separated list of patterns to exclude
+  when extracting the archive. Each item from that list is passed as
+  a tar's +--exclude+ option. By default, empty.
+
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
   name) that are required for the current target package to
   compile. These dependencies are guaranteed to be compiled and
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffef4d3..8b189fe 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -508,7 +508,10 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
-	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
+	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
+		-C $$($(2)_DIR) \
+		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
+		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
 $(2)_PRE_DOWNLOAD_HOOKS         ?=
