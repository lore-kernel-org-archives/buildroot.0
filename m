Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FF3CA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C535C4038E;
	Fri, 30 Aug 2024 17:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5P56Sc9Mz6jS; Fri, 30 Aug 2024 17:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9158F411B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9158F411B8;
	Fri, 30 Aug 2024 17:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F4D1BF5A5
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F37478186A
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrjiGnB33fzY for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E948433E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27E948433E
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:09:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA6D28677A; Fri, 30 Aug 2024 17:09:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 19:09:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b5feb52afd2165be21a1dfb8f8f870eab9b9acb
X-Git-Newrev: 2bd1723c0a5224efca245edf6930aa485e29341b
X-Patchwork-Hint: ignore
Message-Id: <20240830170927.CA6D28677A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/genimage.sh: drop gzip
 compression
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bd1723c0a5224efca245edf6930aa485e29341b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6889056f1eb4 (support/scripts/genimage.sh: support creating a bmap
image) added unconditional gzip compression of the genimage outputs if
bmap-tools is enabled, which is problematic for a number of reasons:

- The gzip invocation is not reproducable (E.G. does not use -n)

- The original file is removed, dropping the sparse info

- It hardcodes policy, E.G.  bmap supports a number of different compression
  algorithms / compression may not be desired for all images / different
  compression levels may be desired

So drop the compression step.  If desired, compression can be done with a
post-image script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/genimage.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index b479ec9e0b..df224241ab 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -54,6 +54,5 @@ if grep -Eq "^BR2_PACKAGE_HOST_BMAP_TOOLS=y$" "${BR2_CONFIG}"; then
 			continue
 		fi
 		bmaptool create "${image_path}" -o "${image_path}.bmap"
-		gzip -c "${image_path}" > "${image_path}.gz"
 	done < <(grep '^image ' "${GENIMAGE_CFG}" | cut -d ' ' -f 2)
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
