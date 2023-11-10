Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41524C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 13:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC16B421F7;
	Fri, 10 Nov 2023 13:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC16B421F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0c44kYV_bRX; Fri, 10 Nov 2023 13:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50E9421E3;
	Fri, 10 Nov 2023 13:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D50E9421E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B29D31BF3E1
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 13:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A08B8382F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 13:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A08B8382F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mB8jKQa93wTY for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 13:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C47283837
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 13:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C47283837
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E2FC86F4E; Fri, 10 Nov 2023 13:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 14:30:39 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: de187fe97bfd51489851a647f2239b8cfc69aad1
X-Git-Newrev: 7938949369daaca5def35fc2cf245cb394e871c6
X-Patchwork-Hint: ignore
Message-Id: <20231110133723.7E2FC86F4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] pkg-download: add option
 to enforce hash checking
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

commit: https://git.buildroot.net/buildroot/commit/?id=7938949369daaca5def35fc2cf245cb394e871c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Currently, when a package is downloaded from a custom location or
version, Buildroot excludes such a package from the mandatory integrity
check with hashes, because it was until now not possible to have such
hashes.

We now have a mechanism which users can leverage to provide additional
hashes, and so custom versions or locations can now be checked too.

Buildroot has no way to know that hashes have indeed been provided for
a custom location/version, and so will still happily ignore an
unchecked package.

However, users who do provide extra hashes most probably do expect that
no download is done without an integrity check, and thus expect that a
missing hash not be ignored.

Add an option that users can select to make Buildroot forcibly require
at least one valid hash, and no invalid hash, for all downloads.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e091e31831122b60b084bd755e94df4dfe7188d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in               | 17 +++++++++++++++++
 package/pkg-download.mk |  5 ++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index 339c28f29c..d3bf6000ca 100644
--- a/Config.in
+++ b/Config.in
@@ -699,6 +699,23 @@ config BR2_FORCE_HOST_BUILD
 
 	  This option will increase build time.
 
+config BR2_DOWNLOAD_FORCE_CHECK_HASHES
+	bool "Force all downloads to have a valid hash"
+	depends on BR2_GLOBAL_PATCH_DIR != ""
+	help
+	  For packages where a custom version or location can be set,
+	  Buildroot does not carry a hash for those custom versions or
+	  locations, so the integrity of such downloads is not verified.
+
+	  Say 'y' here to enforce downloads to have at least one valid
+	  hash (and of course, that all hashes be valid).
+
+	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
+	  see above.
+
+comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
+	depends on BR2_GLOBAL_PATCH_DIR = ""
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 44cc178dea..078470808e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -66,9 +66,7 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
 
 # Expressly do not check hashes for those files
-# Exported variables default to immediately expanded in some versions of
-# make, but we need it to be recursively-epxanded, so explicitly assign it.
-export BR_NO_CHECK_HASH_FOR =
+BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
 # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
@@ -110,6 +108,7 @@ endif
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
 	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
