Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12821C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA3260E46;
	Sun,  6 Aug 2023 21:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA3260E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2iUX8LLnIKf; Sun,  6 Aug 2023 21:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F27B60C18;
	Sun,  6 Aug 2023 21:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F27B60C18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48DA71BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF4F340337
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4F340337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpI9UrR0eTJQ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:30:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D18040878
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D18040878
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58D4B84612; Sun,  6 Aug 2023 21:30:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 23:27:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 552a054d45f516990e6470338c18ce9f792c59b3
X-Git-Newrev: 134900401f0831f893ddd4f358e499f548d66433
X-Patchwork-Hint: ignore
Message-Id: <20230806213037.58D4B84612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/fix-rpath:
 parallelize patching files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=134900401f0831f893ddd4f358e499f548d66433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Using "xargs" instead of "while read" loop allows for the patching of
files to be parallelized. This significantly reduces the amount of
time it takes to fix all the paths.  On a larger RFS(~300MB) this
script was taking 5 minutes, it now only takes about 30s on a 12 core
machine.

Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
[Thomas: take into account the suggestion of Quentin Schulz to pass
PARALLEL_JOBS through the environment down to the fix-rpath script]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                  | 12 ++++++---
 support/scripts/fix-rpath | 67 +++++++++++++++++++++++++++--------------------
 2 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index 18e337006b..e5aae17602 100644
--- a/Makefile
+++ b/Makefile
@@ -594,8 +594,12 @@ world: target-post-image
 .PHONY: prepare-sdk
 prepare-sdk: world
 	@$(call MESSAGE,"Rendering the SDK relocatable")
-	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
-	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
+	PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath host
+	PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath staging
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -765,7 +769,9 @@ endif
 	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc
 
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
-	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath target
+	PARALLEL_JOBS=$(PARALLEL_JOBS) \
+		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
+		$(TOPDIR)/support/scripts/fix-rpath target
 
 # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
 # counterparts are appropriately setup as symlinks ones to the others.
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 3e67e770e5..a9b348e189 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -46,6 +46,8 @@ Environment:
     TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR
                  (default HOST_DIR/opt/ext-toolchain)
 
+    PARALLEL_JOBS number of parallel jobs to run
+
 Returns:         0 if success or 1 in case of error
 
 EOF
@@ -58,6 +60,38 @@ HOST_EXCLUDEPATHS="/share/terminfo"
 STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
 TARGET_EXCLUDEPATHS="/lib/firmware"
 
+patch_file() {
+    PATCHELF="${1}"
+    rootdir="${2}"
+    sanitize_extra_args="${3}"
+    file="${4}"
+
+    # check if it's an ELF file
+    rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
+    if test $? -ne 0 ; then
+        return 0
+    fi
+
+    # make files writable if necessary
+    changed=$(chmod -c u+w "${file}")
+
+    # With per-package directory support, most RPATH of host
+    # binaries will point to per-package directories. This won't
+    # work with the --make-rpath-relative ${rootdir} invocation as
+    # the per-package host directory is not within ${rootdir}. So,
+    # we rewrite all RPATHs pointing to per-package directories so
+    # that they point to the global host directry.
+    changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
+    if test "${rpath}" != "${changed_rpath}" ; then
+        ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
+    fi
+
+    # call patchelf to sanitize the rpath
+    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
+    # restore the original permission
+    test "${changed}" != "" && chmod u-w "${file}"
+}
+
 main() {
     local rootdir
     local tree="${1}"
@@ -123,34 +157,11 @@ main() {
             ;;
     esac
 
-    find_args+=( "-type" "f" "-print" )
-
-    while read file ; do
-        # check if it's an ELF file
-        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
-        if test $? -ne 0 ; then
-            continue
-        fi
-
-        # make files writable if necessary
-        changed=$(chmod -c u+w "${file}")
-
-        # With per-package directory support, most RPATH of host
-        # binaries will point to per-package directories. This won't
-        # work with the --make-rpath-relative ${rootdir} invocation as
-        # the per-package host directory is not within ${rootdir}. So,
-        # we rewrite all RPATHs pointing to per-package directories so
-        # that they point to the global host directry.
-        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
-        if test "${rpath}" != "${changed_rpath}" ; then
-            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
-        fi
-
-        # call patchelf to sanitize the rpath
-        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
-        # restore the original permission
-        test "${changed}" != "" && chmod u-w "${file}"
-    done < <(find "${rootdir}" ${find_args[@]})
+    find_args+=( "-type" "f" "-print0" )
+
+    export -f patch_file
+    # Limit the number of cores used
+    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${PARALLEL_JOBS} -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
 
     # Restore patched patchelf utility
     test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" "${PATCHELF}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
