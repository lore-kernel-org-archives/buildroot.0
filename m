Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228FAC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C760C421E0;
	Tue,  7 Nov 2023 10:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C760C421E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aShHWDEcbq6N; Tue,  7 Nov 2023 10:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E56421E5;
	Tue,  7 Nov 2023 10:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E56421E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1338F1BF95D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0C3B61350
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 10:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0C3B61350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nd8Xk3Lke0fi for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 10:49:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE34C6134D
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 10:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE34C6134D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA38186B75; Tue,  7 Nov 2023 10:49:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 11:48:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f91e89b6e64d4ad092c359a658a8ee22e848ce66
X-Git-Newrev: 5d36710e36fc4698c8fae71675bcff7395246006
X-Patchwork-Hint: ignore
Message-Id: <20231107104913.AA38186B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-download: lookup hash files in
 global-patch-dir
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d36710e36fc4698c8fae71675bcff7395246006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we expect and only use hash files that lie within the package
directory, alongside the .mk file. Those hash files are thus bundled
with Buildroot.

This implies that only what's known to Buildroot can ever get into those
hash files. For packages where the version is fixed (or a static
choice), then we can carry hashes for those known versions.

However, we do have a few packages for which the version is a free-form
entry, where the user can provide a custom location and/or version.  like
a custom VCS tree and revision, or a custom tarball URL. This means that
Buildroot has no way to be able to cary hashes for such custom versions.

This means that there is no integrity check that what was downloaded is
what was expected. For a sha1 in a git tree, this is a minor issue,
because the sha1 by itself is already a hash of the expected content.
But for custom tarballs URLs, or for a tag in a VCS, there is indeed no
integrity check.

Buildroot can't provide such hashes, but interested users may want to
provide those, and currently there is no (easy) way to do so.

We leverage the existing global-patch-dir mechanism to look for extra
hash files. We use the same heuristic that is used for bundled hash
files, and for each global patch directory <dir>, we use the first file
to exist among:
 1. look into <dir>/<package>/<version>/<package>.hash
 2. look into <dir>/<package>/<package>.hash

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                                  | 10 ++++++----
 docs/manual/adding-packages-directory.adoc |  6 ++++++
 docs/manual/customize-patches.adoc         | 24 +++++++++++++++++++++++-
 package/pkg-download.mk                    |  2 +-
 package/pkg-generic.mk                     | 14 +++++++++-----
 package/pkg-utils.mk                       |  2 +-
 6 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/Config.in b/Config.in
index 7dd49567f6..b344d0e80a 100644
--- a/Config.in
+++ b/Config.in
@@ -674,12 +674,12 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  documentation for more details on this feature.
 
 config BR2_GLOBAL_PATCH_DIR
-	string "global patch directories"
+	string "global patch and hash directories"
 	help
 	  You may specify a space separated list of one or more
-	  directories containing global package patches. For a specific
-	  version <packageversion> of a specific package <packagename>,
-	  patches are applied as follows:
+	  directories containing global package patches and/or hashes.
+	  For a specific version <packageversion> of a specific package
+	  <packagename>, patches are looked up as follows:
 
 	  First, the default Buildroot patch set for the package is
 	  applied from the package's directory in Buildroot.
@@ -693,6 +693,8 @@ config BR2_GLOBAL_PATCH_DIR
 	  exists, then all *.patch files in the directory will be
 	  applied.
 
+	  The hash files are looked up similarly to the patches.
+
 menu "Advanced"
 
 config BR2_FORCE_HOST_BUILD
diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 7150018a3b..5a0f298eb1 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -540,6 +540,12 @@ mercurial) because Buildroot currently does not generate reproducible
 tarballs when source code is fetched from such version control
 systems.
 
+Additionally, for packages for which it is possible to specify a custom
+version (e.g. a custom version string, a remote tarball URL, or a VCS
+repository location and changeset), Buildroot can't carry hashes for
+those. It is however possible to xref:customize-hashes[provide a list of
+extra hashes] that can cover such cases.
+
 Hashes should only be added in +.hash+ files for files that are
 guaranteed to be stable. For example, patches auto-generated by Github
 are not guaranteed to be stable, and therefore their hashes can change
diff --git a/docs/manual/customize-patches.adoc b/docs/manual/customize-patches.adoc
index eb98d1bea2..72e87c3c04 100644
--- a/docs/manual/customize-patches.adoc
+++ b/docs/manual/customize-patches.adoc
@@ -1,8 +1,10 @@
 // -*- mode:doc -*- ;
 // vim: set syntax=asciidoc:
 
+=== Adding project-specific patches and hashes
+
 [[customize-patches]]
-=== Adding project-specific patches
+==== Providing extra patches
 
 It is sometimes useful to apply 'extra' patches to packages - on top of
 those provided in Buildroot. This might be used to support custom
@@ -57,3 +59,23 @@ are available at a URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
 patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
 as it is done from a post-patch hook of the Linux package.
 
+
+[[customize-hashes]]
+==== Providing extra hashes
+
+Buildroot bundles a xref:adding-packages-hash[list of hashes] against
+which it checks the integrity of the downloaded archives, or of those
+it generates locally from VCS checkouts. However, it can only do so
+for the known versions; for packages where it is possible to specify
+a custom version (e.g. a custom version string, a remote tarball URL,
+or a VCS repository location and changeset), Buildroot can't carry
+hashes for those.
+
+For users concerned with the integrity of such downloads, it is possible
+to provide a list of hashes that Buildroot can use to check arbitrary
+downloaded files. Those extra hashes are looked up similarly to the
+extra patches (above); for each directory in +BR2_GLOBAL_PATCH_DIR+,
+the first file to exist is used to check a package download:
+
+* +<global-patch-dir>/<packagename>/<packageversion>/<packagename>.hash+
+* +<global-patch-dir>/<packagename>/<packagename>.hash+
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e5cd83d859..bf1c19e5ec 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -115,7 +115,7 @@ define DOWNLOAD
 		-d '$($(2)_DL_DIR)' \
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
-		-H '$($(2)_HASH_FILE)' \
+		$(foreach f,$($(2)_HASH_FILES),-H '$(f)') \
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6c24be7505..577a148c1e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -509,11 +509,15 @@ else
 endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
-$(2)_HASH_FILE = \
+$(2)_HASH_FILES = \
 	$$(strip \
-		$$(if $$(wildcard $$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
-			$$($(2)_PKGDIR)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
-			$$($(2)_PKGDIR)/$$($(2)_RAWNAME).hash))
+		$$(foreach d, $$($(2)_PKGDIR) $$(addsuffix /$$($(2)_RAWNAME), $$(call qstrip,$$(BR2_GLOBAL_PATCH_DIR))),\
+			$$(if $$(wildcard $$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash),\
+				$$(d)/$$($(2)_VERSION)/$$($(2)_RAWNAME).hash,\
+				$$(d)/$$($(2)_RAWNAME).hash\
+			)\
+		)\
+	)
 
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
@@ -1138,7 +1142,7 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
 	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILE))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$(F),$$($(2)_DIR)/$$(F),$$($(2)_HASH_FILES))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b91061a572..059e86ae0a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -280,7 +280,7 @@ define legal-manifest # {HOST|TARGET}, pkg, version, license, license-files, sou
 	echo '"$(2)","$(3)","$(4)","$(5)","$(6)","$(7)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(1))
 endef
 
-define legal-license-file # {HOST|TARGET}, pkgname, pkgname-pkgver, filename, file-fullpath, pkg-hashfile
+define legal-license-file # {HOST|TARGET}, pkgname, pkgname-pkgver, filename, file-fullpath, pkg-hashfiles
 	mkdir -p $(LICENSE_FILES_DIR_$(1))/$(3)/$(dir $(4)) && \
 	{ \
 		support/download/check-hash $(5) $(4) $(6); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
