From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 19:30:30 +0200
Subject: [Buildroot] [PATCHv2] infra: add the transient download mechanism
Message-ID: <20200930173030.2461586-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

People have been hollering for a long time, asking for a way to be able
to trigger a build that will always get the current HEAD (or whatever it
is called outside of git) of a branch, whatever the conditions, so that
they can trigger automated builds (e.g. in a CI or whatever) to test
their greatest and latest changes, by pushing again and again ad libitum
on the same branch, without having the need to update the sha1 in the
.mk of the affected package.

We introduce the concept of a transient download, which means that
Buildroot will never consider any already downloaded archive, and so
will re-download it (but only if the package has not already been
downloaded for the current build).

A package declares its download as transient with:
  FOO_TRANSIENT_DOWNLOAD = YES

Since the check is done in the download wrapper, we have no TOCTOU race
in case two builds would attempt the same transient download: the archive
is only replaced atomically as usual.

So, if the package uses a branch as version, the branch's HEAD at that
very moment will be re-downloaded.

Obviously, such builds are not reproducible.

This also has the pitfall that two builds in parallel may get slightly
different content for the same branch, and the first build could end up
using the download of the second build:

    build-1             build-2

    download
    |                   download
    |                   |
    save to dl-dir      |
    [...]               save to dl-dir
    extract

Also, as noticed by Thomas, legal-info of build-1 is not correct when
executed after build-2 downloaded the archive. But since such CI builds
are expected to be done during development, legal-info is usually not
that important in that case (and even then, such packages are probably
proprietary packages that are probably "FOO_REDISTRIBUTE = NO" already
anyway).

Furthermore, even with a single build, it might not get what it expects:

    developer           CI

    git push branch
    |                   trigger build-1
    git push branch     |
                        download

In that case the build in the CI gets the code of the second push, which
might or might not be the expected behaviour.

We would also want to always print the "Downloading foo" message for
transient packages, while keeping it silent for the already-downloaded
packages. But that would make the code a bit more complex. We just
simplify it by always displaying that message, even if there is actually
nothing to download (this actually makes the download step more like the
others, btw: if there is nothing to do to configure, we are still
printing the "Configuring foo", "Building foo" messages, etc...).

Finally, by design, we can't check the hashes for a transient package.

For people who are aiming at their feet, we're now providing them with
a loaded gun. ;-]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - typoes in commit log

Changes RFC -> v1:
  - only be transient with 'YES', not with 'NO'  (Thomas)
  - add blurb about legal-info  (Thomas)
  - do not check hash for transient downloads
  - rename variable: DOWNLOAD_TRANSIENT -> TRANSIENT_DOWNLOAD
  - typoes fixed (and probably others added)
  - always print "Downloading"
  - rework the commit log
---
 docs/manual/adding-packages-generic.txt | 27 ++++++++++++++++++++++---
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  | 20 +++++++++++-------
 support/download/dl-wrapper             |  8 +++++---
 4 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b8bfcb4aff..40c5188116 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -206,12 +206,14 @@ information is (assuming the package name is +libfoo+) :
   ** a tag for a git tree +LIBFOO_VERSION = v0.1.2+
 +
 .Note:
-Using a branch name as +FOO_VERSION+ is not supported, because it does
-not and can not work as people would expect it should:
+Using a branch name as +FOO_VERSION+, although technically possible,
+is highly discouraged, because it does not and can not work as people
+would expect it should:
 +
   1. due to local caching, Buildroot will not re-fetch the repository,
      so people who expect to be able to follow the remote repository
-     would be quite surprised and disappointed;
+     would be quite surprised and disappointed (but see
+     +LIBFOO_TRANSIENT_DOWNLOAD+, later);
   2. because two builds can never be perfectly simultaneous, and because
      the remote repository may get new commits on the branch anytime,
      two users, using the same Buildroot tree and building the same
@@ -342,6 +344,25 @@ not and can not work as people would expect it should:
   submodules when they contain bundled libraries, in which case we
   prefer to use those libraries from their own package.
 
+* +LIBFOO_TRANSIENT_DOWNLOAD+ can be set to +YES+ or +NO+ (the default).
+  If set to +YES+, the download for that package will be attempted at
+  every build from scratch; any already downloaded archive is ignored
+  as if missing. This may help when a branch is specified in
+  +LIBFOO_VERSION+, and the head/tip of the branch is to be built, like
+  a CI pipeline would need for example. This still suffers from the
+  other issues listed above about using branches, though, the most
+  obvious being the *lack of reproducibility*. Besides, it has its own
+  pitfalls that one must be aware of as well:
+  ** when two builds are running in parallel on the same machine, there
+     is a TOCTOU race for each build to download and extract the archive,
+     so each build may not get what it downloaded, but what the other
+     build did download;
+  ** as a consequence, legal-info is not reliable when a package is
+     transient;
+  ** if a branch is pushed to an automated build bot (in a CI for
+     example), and then re-pushed to while the build is still in
+     progress, the build may get the wrong version of the branch.
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 951d2fb554..f6445d5367 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -108,6 +108,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $(filter YES,$($(2)_TRANSIENT_DOWNLOAD)),-F) \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c63807047b..66b7d88bb9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -144,13 +144,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
-# Only show the download message if it isn't already downloaded
-	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
-		if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
-			$(call MESSAGE,"Downloading") ; \
-			break ; \
-		fi ; \
-	done
+	@$(call MESSAGE,"Downloading")
 	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
@@ -563,6 +557,18 @@ ifndef $(2)_DL_OPTS
  endif
 endif
 
+ifndef $(2)_TRANSIENT_DOWNLOAD
+ ifdef $(3)_TRANSIENT_DOWNLOAD
+  $(2)_TRANSIENT_DOWNLOAD = $$($(3)_TRANSIENT_DOWNLOAD)
+ else
+  $(2)_TRANSIENT_DOWNLOAD = NO
+ endif
+endif
+
+ifeq ($$($(2)_TRANSIENT_DOWNLOAD),YES)
+BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
+endif
+
 ifneq ($$(filter bzr cvs hg,$$($(2)_SITE_METHOD)),)
 BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 3315bd410e..ab22ca7e4f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -21,11 +21,12 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
 
 main() {
     local OPT OPTARG
-    local backend output hfile recurse quiet rc
+    local backend output hfile recurse quiet rc force
     local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
+    force=false
+    while getopts ":c:d:D:o:n:N:H:rf:u:qF" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -38,6 +39,7 @@ main() {
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
         q)  quiet="-q";;
+        F)  force=true;;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
@@ -67,7 +69,7 @@ main() {
     # - matches all its hashes: do not download it again and exit promptly
     # - fails at least one of its hashes: force a re-download
     # - there's no hash (but a .hash file): consider it a hard error
-    if [ -e "${output}" ]; then
+    if ! ${force} && [ -e "${output}" ]; then
         if support/download/check-hash ${quiet} "${hfile}" "${output}" "${output##*/}"; then
             exit 0
         elif [ ${?} -ne 2 ]; then
-- 
2.25.1
