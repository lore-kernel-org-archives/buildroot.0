From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  2 Jul 2014 19:20:05 +0200
Subject: [Buildroot] [PATCH] infra: Add a way to apply patches using git
Message-ID: <1404321605-20073-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is mainly used for package developpers. When activated,
Buildroot will automaticaly create a git repository for each package
it extract. Initial version is tagged as `upstream'. Next, during
patch step, git is used instead of patch. BTW, patches are easier
to modify/fix/rebase/cherry-pick/upstream. Once satisfied with
changes, developper may use
    git format-patch -o $TOPDIR/package/$PKG upstream
to save its patches to Buildroot.

Notice this option should be compatible with `guilt' (a clone of
`quilt')

Notice you can also use this feature for a specific package using
    make BR2_USE_GIT_TO_PATCH=y $PKG-dirclean $PKG-patch

Current known limitations:
  - If a patch cannot be handled by `git am', we use `git apply`. In
    this case, patch description is not reported in commit message.
  - When patch is handled with `git apply`, subject used may not be
    perfect (it is extracted from patch filename)
  - `git format-patch' does not prefix patch files with name of package.
  - If upstream was downloaded with git, we may also run
    `git remote add $($(PKG)_SITE)' during git repository creation

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 Config.in                        | 18 ++++++++++++++++++
 Makefile                         |  4 ++++
 package/pkg-generic.mk           |  7 +++++++
 support/scripts/apply-patches.sh | 29 +++++++++++++++++++++++++++--
 4 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 50968fb..3645fe4 100644
--- a/Config.in
+++ b/Config.in
@@ -541,6 +541,24 @@ config BR2_GLOBAL_PATCH_DIR
 	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
 	  then all *.patch files in the directory will be applied.
 
+config BR2_USE_GIT_TO_PATCH
+	bool "use git repositories to handle patches"
+	help
+	  This option is mainly used for package developpers. When activated,
+	  Buildroot will automaticaly create a git repository for each package
+	  it extract. Initial version is tagged as `upstream'. Next, during
+	  patch step, git is used instead of patch. BTW, patches are easier
+	  to modify/fix/rebase/cherry-pick/upstream. Once satisfied with 
+	  changes, developper may use
+	      git format-patch -o $TOPDIR/package/$PKG upstream
+	  to save its patches to Buildroot.
+
+	  Notice this option should be compatible with `guilt' (a clone of
+	  `quilt')
+
+	  Notice you can also use this feature for a specific package using
+	      make BR2_USE_GIT_TO_PATCH=y $PKG-dirclean $PKG-patch
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/Makefile b/Makefile
index b3bd91e..b35e5a6 100644
--- a/Makefile
+++ b/Makefile
@@ -177,6 +177,10 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+# apply-patches.sh rely on this varaible to know git should be used instead 
+# of patch
+export BR2_USE_GIT_TO_PATCH
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifdef V
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ab1f8d2..86368cc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -108,6 +108,13 @@ $(BUILD_DIR)/%/.stamp_extracted:
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
+ifeq ($(BR2_USE_GIT_TO_PATCH),y)
+	$(Q)cd $(@D) ; \
+	git init ; \
+	git add . > /dev/null ; \
+	git commit -m "$($(PKG)_RAWNAME) $($(PKG)_VERSION)" > /dev/null ; \
+	git tag upstream
+endif
 	$(Q)touch $@
 	@$(call step_end,extract)
 
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 37f2d81..0524b9a 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -84,8 +84,28 @@ function apply_patch {
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
-    if [ $? != 0 ] ; then
+    if [[ -n "$BR2_USE_GIT_TO_PATCH" && -e "${builddir}/.git" ]]; then
+        abspatch=$(readlink -f "${path}/$patch")
+        pushd ${builddir} > /dev/null
+        ${uncomp} "$abspatch" | git am --reject > /dev/null
+        RET=$?
+        if [[ $RET != 0 ]]; then
+            ${uncomp} "$abspatch" | git apply --index --reject - > /dev/null
+            RET=$?
+            if [[ $RET == 0 ]]; then
+                # This regexp is far to be perfect
+                pkgname=$(echo ${builddir} | sed 's/^.*\///; s/-[0-9\.]\+$//;')
+                msg="$(echo ${patch} | sed "s/^.*\///; s/^$pkgname-//;  s/^[0-9\.]\+-//; s/\.[a-zA-Z]*\$//; y/-/ /;")"
+                git commit -m "$msg" > /dev/null
+                RET=$?
+            fi
+        fi
+        popd > /dev/null
+    else
+        ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
+        RET=$?
+    fi
+    if [ $RET != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
     fi
@@ -121,6 +141,11 @@ function scan_patchdir {
 
 scan_patchdir "$patchdir" "$patchpattern"
 
+if [[ -n "$BR2_USE_GIT_TO_PATCH" && ! -e "${builddir}/.git" ]]; then
+    echo "BR2_USE_GIT_TO_PATCH supplied but git repository not found."
+    echo "Falling back to classical patch method."
+fi
+
 # Check for rejects...
 if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
     echo "Aborting.  Reject files found."
-- 
2.0.0
