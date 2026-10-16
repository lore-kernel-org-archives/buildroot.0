Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF5CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7360D60F8D;
	Fri, 16 Oct 2026 13:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwcG-1STPcCn; Fri, 16 Oct 2026 13:10:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E518F60F86
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156218;
	b=joVvpmvNbrHwMpBgtm/Q3BDwdMPvZbanAefuO7YmDbV2Qrm9y4LviosNIFnCb+lg0zXi
	 FiktrI0ZtaJlR/BZg5no/84BmuD/88/fLEdiM8EfqTfKWj71oTaDqaqtLxbiLMcprnODo
	 YUCHSvbesJ7v0xmddzMl6sCS91f332HLWNWOxFtLONK/mKd2lcnsY+Y/zzl0yo/5i9PNu
	 IFr8b+O+kS1235a9wzlKSnphyP8OuMpDAAQNfqNgDps65oPq+yioI4liwYvbJaWC7SiDP
	 /wvPK5Tl+Im+dPadZ2ioahuvGWlr4ctJIspdVZiAny/raIq6yRHRV4SU/+yvg1PmDRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=3TnW7tezt0uEwHSd6Jp7DVm7TPnbLiRpjFGcOSPlLfk=;
	b=SQZxxlgMLuebFoL4eODmuY6z9yQN2WBlOF2YGBGyXNj5q6VJjuRmtarhZQdmlxX9ikg5
	 AjgE1QXQ26gFz21P2X3mgXfxh/p2o+v09XfLPZ9yULL7J9u7mfWb4xv46Mi0w7riPfqIY
	 dFKUzNdgRBPxPcYAx/VCQyphGA/OeLtUADLkGNmk30b706Kqlu0o23d+xblix2Qz4fLg6
	 iZChLTJ/QJhDHzlb+sdF8bwZX+HETo3BSf/yiP/26WkMSHY9z1VbYhB366u1bP6newQTL
	 OlrCLkink8YqfaCs5V9FfdZsFNwUTzCYK9H2SL8Dwp5oK0M/O5aMqYwHPNluTsj4IZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156218;
	bh=3TnW7tezt0uEwHSd6Jp7DVm7TPnbLiRpjFGcOSPlLfk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OW1c4cWjj4FeTt9dGqVsStXgyML1z9Bkk1ktcn+nbYzJMDXVJ9f7Gg3kUcDyIpkcq
	 1/LnYSrlNuvJq7z07Fg0sr+z+GOBdbtjjf/MmU+UCEEZSMSzvlaxio9Wm4tqbHFYs2
	 PlIpHmfPnD//run/IQ/omxnshjUAH+d/a1yyY56+BgnKd5L8rm6y2EEyCAr4FLL9xN
	 srKkHWwIIwjviQ5Ohj2c5wCWtfS5lpE5g6V3rjx37rkLR5o3NKIauLnxpe8G1iDJTa
	 zuY0bnY+1VgqXOAZWfPQJ78ITUp+IQUQoxS8LsiPOFjWiN8SIUrw0dYVDyCNMVuxHE
	 7gaqV6A50ebWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E518F60F86;
	Fri, 16 Oct 2026 13:10:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29F571F6C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2495D80772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRwsfK4GZUqL for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 54758814F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=DuiSu427fMbyRa4Q67O9vEGfqVTeRihpCfm+HC/a+yt945L5Z/PtBMOCZvbCp8yQRLPQ
 ZutSCuOHW1NO6GLUytSkDkjJsOGgVTS2J8vDnZPNxEftQonkkEC8XzLQG3RgM86HQ242P
 yeyMLWoc2/yL9PnnUpIE+LMtgaw30TQSZJ9R16sUIqYZ8cZESE60f4nfCUNQ0vgpcTtLW
 ucaZeNkXgelpabp3mr4LvvD6jFg1boSzjv9NvKriOcyvAIFsNkGNca66yNbEL4GX9h4pH
 wgaZ0T0UUXsfSSHjj+hdH8gRFeDHzSO16kibGU7hcrh92aA/FdXkHUZhCU7MMM+oDgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zt2g+Cc9CXMlemBv3wfeZI/ebokkxbArmc7lqgDK+Gw=;
 b=T4X9JBzHmXY4Np1MYIL40PMwB1CnufMa94liBPAqlll+GoGhjwLUYKQHlsuKIWXSnWec
 Q2S+a4KXiYJGm5M0MqqF6nliZhBHscvcZ4cy1TsxuFTR/2sEou0kKx8sW5wIYgbveqWm8
 MuSv7FQjdYYM5E4ANa8R6fXEhbwpuAvg2t1E26TCu/JWDrFpTN4O9VFxDt4Kf84C6MAhR
 UyHuGq0hzRPQ8DnT7Ba8lxQBdbh3HwjXduZtukw5r/h4vn7rL6rTS5aNyPVJMBf4cRe/J
 1VbmAZJrbryh6pzjKE5L3ngBaiM8QE8bVoQHU/KxSrnuCYUya0H5NDaEB2g++hPpHjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54758814F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45A53960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 058281ec05d28d792e4d409e9e9fef03190c44a0
X-Git-Newrev: 06e90ca7c2286f6bf28f21598630def6632ae6b1
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.45A53960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/edk2/Config.in:
 remove empty line to fix check-package error
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2187657353843188708=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2187657353843188708==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06e90ca7c2286f6bf28f21598630def6632ae6b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit [1] introduced the check-package error:

   boot/edk2/Config.in:19: line contains trailing whitespace

This commit fixes the issue by removing those extra spaces.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ea0f27d64f84894f53170bec827aeff4370104fe

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9054c08eb6e9c1a5f3247b91e9cbd73153a1c490)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 boot/edk2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 135804d706..8403fd50bd 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -15,7 +15,7 @@ config BR2_TARGET_EDK2
 	  development environment for the UEFI and PI specifications.
 	  Select this to build EDK II (and OVMF) to be able to boot
 	  Buildroot in QEMU (UEFI mode).
-	  
+
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2

--===============2187657353843188708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2187657353843188708==--
