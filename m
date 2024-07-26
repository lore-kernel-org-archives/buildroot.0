Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C0BC3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A40409A4;
	Fri, 26 Jul 2024 07:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcyeMtRum_DS; Fri, 26 Jul 2024 07:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4E0409C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4E0409C9;
	Fri, 26 Jul 2024 07:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20B741BF995
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CFE640944
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWEoUbI8yTe5 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A54C40940
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A54C40940
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0ED5E87485; Fri, 26 Jul 2024 07:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 09:21:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90e22ff48bb5705c146a64b75556157667b551d3
X-Git-Newrev: b65856fbb0895d4b08f35b2d3a9bb5b5a2069e1d
X-Patchwork-Hint: ignore
Message-Id: <20240726073210.0ED5E87485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b65856fbb0895d4b08f35b2d3a9bb5b5a2069e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The packages 'python-jsonschema-specifications', 'pydantic-core', and
likely other packages based on Python maturin silently stopped
installing files to the host and target directories after commit
a14c862c08.

A similar issue was reported by the Conda project[1]. It seems some
build tools scan for gitignore files to decide what files to build
and install.

I attempted various combinations of gitignore patterns including
mimicking the Conda project's gitignore[2], but the only thing that has
worked reliably is the original `/output` ignore in the root Buildroot
directory.

This reverts commit a14c862c08865e053d5fce90a0d0323b8f9e4bc0.

[1] https://github.com/PyO3/maturin/issues/1911
[2] https://github.com/conda-forge/conda-smithy/blob/main/conda_smithy/feedstock_content/.gitignore
Reported-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitignore | 1 +
 Makefile   | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index 14b7ca5040..bb02d9f572 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
+/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index 0432a014ab..f51e8f690f 100644
--- a/Makefile
+++ b/Makefile
@@ -63,9 +63,6 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
 $(error The build directory can not contain a '@')
 endif
 
-# Create a default .gitignore file that ignores everything
-$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
-
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
