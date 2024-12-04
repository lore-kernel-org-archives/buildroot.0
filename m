Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E87E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66C6840C1;
	Wed,  4 Dec 2024 21:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmoLkSigXV_S; Wed,  4 Dec 2024 21:14:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A16840B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A16840B2;
	Wed,  4 Dec 2024 21:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D4C81DD1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4944640378
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNb2t6IQfmjq for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F31C640B98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F31C640B98
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA1D2868D5; Wed,  4 Dec 2024 21:14:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:11:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c9b13b8dd993050ba0f026bf4e402f816a3f6df
X-Git-Newrev: 014a8201c857e81abeca026211e84f9c9353c9ba
X-Patchwork-Hint: ignore
Message-Id: <20241204211410.DA1D2868D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvpl: not supported on mips64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=014a8201c857e81abeca026211e84f9c9353c9ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although adding " || defined(__mips__)" here:
https://github.com/intel/libvpl/blob/main/api/vpl/mfxdefs.h#L71

would fix the problem, libvpl alone makes no sense and the only
dependee, intel-vpl-gpu-rt, is unsupported on mips anyway.

Fixes:
http://autobuild.buildroot.net/results/50d/50d64ab2d547c70b39e2421ee2763d8309873125/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libvpl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index b9e9a20fd7..5a370ed2e3 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARCH_IS_64
+	default y if BR2_ARCH_IS_64 && !BR2_mips64 && !BR2_mips64el
 	default y if BR2_arm
 
 config BR2_PACKAGE_LIBVPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
