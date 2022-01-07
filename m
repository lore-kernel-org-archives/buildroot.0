Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70100C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E939A82C8F;
	Fri,  7 Jan 2022 10:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asVoFLxVACG1; Fri,  7 Jan 2022 10:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51C2982FCB;
	Fri,  7 Jan 2022 10:27:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F16BD1BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFD87830E6
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ov1-VgWRImXR for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B0ED82FD7
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:27:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7518F83486; Fri,  7 Jan 2022 10:20:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 11:21:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db15e2853ff5a234e8ed1a70a75b5d426dceec5
X-Git-Newrev: 2da7b07a22fc2c610f670c153e987d35d966022b
X-Patchwork-Hint: ignore
Message-Id: <20220107102059.7518F83486@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-download.mk: add
 <pkg>_DOWNLOAD_POST_PROCESS variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=2da7b07a22fc2c610f670c153e987d35d966022b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow packages to register that a download post-processing
is needed. Note that this variable is intentionally not documented: it
is an internal variable meant to be set by package infrastructures,
not directly by packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 823b34981c..a15e21e110 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -118,6 +118,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(if $($(2)_GIT_LFS),-l) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
