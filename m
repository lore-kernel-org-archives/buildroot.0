From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Jan 2020 21:37:53 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
Message-ID: <20200115203753.12110-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: NOT TO BE COMMITTED!

This patch is a proof of concept for the transient download mechanism,
that would help using branches as versions, and keep using the head of
the branch each time a build started.

A package declares its download as transient with:
  FOO_DOWNLOAD_TRANSIENT = YES

this means that the download infra will not use any already downloaded
archive, and will instead always download it as if missing.

Since the check is done in the download wrapper, we have no TOCTOU race
in case two bulds would attempt the same transient download: the archive
is only replaced ato,mically as usual.

So, if the package uses a branch as version, the branch's HEAD at that
very moment will be redownloaded.

This stil has the drawback that two builds in parallel may get slightly
different content for the same branch, and the first build could end up
using the download of the second build:

    build-1             build-2

    download
    |                   download
    |                   |
    save to dl-dir      |
    [...]               save to dl-dir
    extract

Furthermore, even with a single build, it might get what it expects:

    developer-1         developer-2

    git push branch
    trigger CI          git push branch
    [...]
    download

In that case the build of delopper-1 would get the code of developper-2
who pushed on the same branch.

For people who are aiming at their feet, we're now providing them with
a loaded gun. ;-]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Chris Packham <judge.packham@gmail.com>
Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 16 +++++++++++++---
 package/busybox/busybox.mk              |  1 +
 package/pkg-download.mk                 |  1 +
 package/pkg-generic.mk                  |  8 +-------
 support/download/dl-wrapper             |  8 +++++---
 5 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index baa052e31c..afffb09bc8 100644
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
+     +LIBFOO_DOWNLOAD_TRANSIENT+, later);
   2. because two builds can never be perfectly simultaneous, and because
      the remote repository may get new commits on the branch anytime,
      two users, using the same Buildroot tree and building the same
@@ -342,6 +344,14 @@ not and can not work as people would expect it should:
   submodules when they contain bundled libraries, in which case we
   prefer to use those libraries from their own package.
 
+* +LIBFOO_DOWNLOAD_TRANSIENT+ can be set to +YES+ or +NO+ (the default).
+  If set to +YES+, the download for that package will be attempted at
+  every build; any already downloaded archive is ignored as if missing.
+  This may help when a branch is specified in +LIBFOO_VERSION+, and the
+  head/tip of the branch is to be built, like a CI pipeline would need
+  for example. This still suffers from the other issues listed above
+  about using branches, though.
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 6283bc96ea..ee17febe48 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -9,6 +9,7 @@ BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
 BUSYBOX_LICENSE_FILES = LICENSE
+BUSYBOX_DOWNLOAD_TRANSIENT = YES
 
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index de619ba90a..c3a98ce7b0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -108,6 +108,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_DOWNLOAD_TRANSIENT),-F) \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 268d999efb..7c2e9db604 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -158,13 +158,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
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
+	@$(call MESSAGE,"Downloading") ; \
 	$(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
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
2.20.1
