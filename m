Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE8AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC6F184448;
	Sat,  8 Jun 2024 19:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvmNlz9mIv9P; Sat,  8 Jun 2024 19:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8409784B3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8409784B3E;
	Sat,  8 Jun 2024 19:16:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCD491BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65198413CB
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zXDlHkowPrh for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29093409A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29093409A0
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23FBB814F1; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 19:56:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5a708e510a0d43a4cb1e62b382403f679cf49ba2
X-Git-Newrev: 29df0eb414a8f0ac90c5b7199471a974a2a7eb3e
X-Patchwork-Hint: ignore
Message-Id: <20240608191500.23FBB814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pkg-download: use
 _DL_SUBDIR as root dir of generated archives
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

commit: https://git.buildroot.net/buildroot/commit/?id=29df0eb414a8f0ac90c5b7199471a974a2a7eb3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Currently, when we generate archives, e.g.  for git, svn, cargo or go, we
use the package _BASENAME_RAW as the root directory of the generated
archive.  For example, for package foo at version 1.2.3, that would generate
an archive rooted at foo-1.2.3/.

This is usually what we want, except in one specific condition: when the
package shares its download with another package *and* it is a generated
archive. In that case, the root directory will be different for each of
the two packages, which is incorrect, but was so far benign: we never
had any hash for such generated archives, and they were only generated
in two cases:
  - linux and linux-headers
  - barebox and barebox-aux

As we skip one directory depth when extracting the archives, we did not
care what the root directory was; whether it was that of one package or
the other was of no consequence.

But now that we can have hashes for archives generated from custom
versions, this breaks the usual case where the headers used for the
toolchains are those of the kernel to build for the target. In this
case, we may end up downloading the linux-headers package before we
download the linux package, so we'd get the hash for an archive rooted
at linux-headers-XXX/, but the one for the linux package the archive
would be rooted at linux-XXX/, or we may end up (e.g. with parallel
builds) downloading the linux package first and linux-headers next.

That would cause conflicts in hashes, as demonstrated by the only defconfig
we have in that situation, olimex_stmp157_olinuxino_lime_defconfig.

_BASENAME_RAW is a construct that is expanded to include the RAWNAME
followed by a dash and the version, if there is a version, or with just
the RAWNAME when there is no version.

We tweak the download macro to use _DL_SUBDIR followed by the version.

This is only used by VCS backends (cvs, git, svn...) and so there will
always be a version string, so no need to duplicate the case without a
version like is done for _BASENAME_RAW

_DL_SUBDIR defaults to _RAWNAME, so this is a noop by default, unless
the package declares it shares its download with another one, in which
case the generated archive will now be rooted as for the shared package.

This was triggered by:
    https://patchwork.ozlabs.org/project/buildroot/patch/20240602070634.597337-1-francois.perrad@gadz.org/

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ebe238f2b595136be92c53aa70c40d3f333cc34e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 30eeb6b1fc..677d3608f5 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -115,7 +115,7 @@ define DOWNLOAD
 		-D '$(DL_DIR)' \
 		-f '$(notdir $(1))' \
 		$(foreach f,$($(2)_HASH_FILES),-H '$(f)') \
-		-n '$($(2)_BASENAME_RAW)' \
+		-n '$($(2)_DL_SUBDIR)-$($(2)_VERSION)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
 		$(if $(filter YES,$($(2)_SVN_EXTERNALS)),-r) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
