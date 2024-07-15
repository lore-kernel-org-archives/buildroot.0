Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB1EC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 528584034B;
	Mon, 15 Jul 2024 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQxo_aeWUfBH; Mon, 15 Jul 2024 17:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE1A440580
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE1A440580;
	Mon, 15 Jul 2024 17:46:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44C6E1BF408
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 17:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30720403F9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 17:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYcs3_lyJwBX for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 17:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0B0403F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D0B0403F4
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 17:46:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 825CD86BB6; Mon, 15 Jul 2024 17:46:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 19:40:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b843284d2196fc345b7415efb7336487f7894e7
X-Git-Newrev: aacca7f0639bac6bb3fb262d0b1738c4387edeb0
X-Patchwork-Hint: ignore
Message-Id: <20240715174623.825CD86BB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: local and override
 support in legal-info
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aacca7f0639bac6bb3fb262d0b1738c4387edeb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sources of packages which are using the 'local' _METHOD_SITE or
which declare an _OVERRIDE_SRC_DIR are not archived when generating
the legal-info target.
This is problematic since those packages are the most likely to
require being published, because it's highly probable that their
sources have been modified. A typical use case is a package (e.g. linux)
that is maintained as a git submodule of the BR2_EXTERNAL and with the
LINUX_OVERRIDE_SRCDIR set appropriately, or with a tool like repo
putting it in a well-known location.

This patch generates a tar.gz archive on the fly, containing the
result of the rsync of the package's source directory, using the
same arguments as during the preparation of a build.
Note that is not possible to archive the builddir, since it may
contain artifacts of previous compilations.

In order to create a tarball that is reproducible, we reuse the
mk_tar_gz function from the download helpers. We have to provide it with
the TAR variable. We also have to cd to the build directory first,
because the script generates a temporary file in the current directory.
That script needs a date. We unforuntately don't have a good
reproducible data. The timestamps of the files in the override srcdir
itself aren't useful either: if they come from git, they typically have
the time of checkout. Therefore, we fix the date at Jan 1, 1970 (which
we can do with @0).

The mk_tar_gz function could actually work directly in the override
srcdir without the need for an rsync - except for one limitation: it
doesn't have the equivalent of RSYNC_VCS_EXCLUSIONS. It would be nice to
refactor the script so it could accept a list of exclusions instead of a
single one and also work at any level instead of just the toplevel. But
that is for future improvement.

It is not possible to consider rsync as a "normal" download method
either (which would have solved the initial problem), because if we
do that:
 * the DL dir's content would be altered improperly
 * the rsync + tar gz overhead would be paid on compilation and is
   significant, for example, for a linux kernel
 * a hash file would be necessary, which would be a burden to
   maintain, for sources frequently modified

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
[Arnout:
 - Drop the auxiliary variables: their use is contained within one code
   block and it's easier to read with being explicit.
 - Put it in an additional subdirectory .legal-info-rsync of the build
   directory, to reduce the chance of conflict with an existing
   file/directory.
 - Archive the directory (e.g. linux-custom) rather than its contents,
   so that it matches a normal tarball.
 - Use the mk_tar_gz function from download helpers to create a
   reproducible tarball.
 - Split long lines.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 365d6c748d..171163dcb4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1155,13 +1155,20 @@ else
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
-ifeq ($$($(2)_SITE_METHOD),local)
-# Packages without a tarball: don't save and warn
-	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
-
-else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),override)
-
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+# local/override packages: copy it and archive the copy
+	@echo "Package is of type local or override, archive sources"
+	$$(Q)rm -rf  $$($(2)_BUILDDIR)/.legal-info-rsync
+	$$(Q)mkdir -p  $$($(2)_BUILDDIR)/.legal-info-rsync
+	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
+		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
+		 $$($(2)_BUILDDIR)/.legal-info-rsync/
+	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
+		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
+		$$($(2)_BASENAME_RAW) \
+		@0 \
+		$$($(2)_REDIST_SOURCES_DIR)/$$($(2)_BASENAME_RAW).tar.gz
+	$$(Q)rm -rf $$($(2)_BUILDDIR)/.legal-info-rsync
 else
 # Other packages
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
