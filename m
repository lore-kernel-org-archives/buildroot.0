Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79245CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEEC281164;
	Sat, 10 Oct 2026 15:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbn95j75LZux; Sat, 10 Oct 2026 15:31:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBC17811D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791646297;
	b=eT9wlQKxJveNXmu46peMEwbNwecOL5QGUjzxQzqDH+Lms77QKoznjoX1juq6Mk6OvrQc
	 MLtkXhcoNdqcmKbcUSrWE5eNwn1FwFD454DxN91MJOWbThFEjp3bzJ87VefpkkRYXYirU
	 gb+u9aaM8J/pGNveROluiHLT5H1drq9xCa2vh+0hGEmPKETfkUWgW+vAbf8qm9/p8hl/j
	 JDRqxJ8Zu2FxRQuRqdI59NlVGDPsUo2GU1tD3P9LUfETPquvwq2oEEeT9xl3OlkQHa5YA
	 q9HKdb6/rrR/4Cj3+yCT2l1Z8ObL9DzOA2qjUKcnkr/RiXF0cyp9DcF10cNaxUcIAEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791646297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1bSqOxmvkOKdgBpBCACQeuaAVZofh9wtofYmkZR2P+4=;
	b=lAJqPPLxTw2iGlPlMuMr5gU7NkDyxLB1KfIaqwY+KC3TGYJoB34ybEEcTv44iYxYhLgb
	 +pCOcCefDZdcLZ9JRn071vpv7ukk2/rpcylkxNAErFuo3opXxjsCegCBofV78DK+TH7lH
	 Aojqe86UW3QewmXd72ISWziW2KDGZzTbOH38v9P00S09zZ2lE3WqsFBOinauCFEk5wuzm
	 PbdBa9RzwNmEcfXTB1SFDwse2CyRQvVfST7hxEPcahgaEgn+SDig5ytsx3xegzB/93yR7
	 e+AUUK/9cjte8b/YPjWuxw/NDii3YH1boZg0sy3ZQHoehVixG7STgxAx9V8rQhbdLww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791646297;
	bh=1bSqOxmvkOKdgBpBCACQeuaAVZofh9wtofYmkZR2P+4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vm9FSDapqEbW/4tKF8ULUZ7R/8V6KWXvlyNuF7i6mkbEZOY4bWPfc3kqFKPAhws9d
	 wV6RLgkR7co6+1xJeY3AODJdVZ0/voF227EPQkJDSzpLIaSsBjLMZrdj9pBpwWUE4i
	 Y8pdltT6U/eBtaE4QmPfLimLK/1zf80ylkmlt/fbUdPZwcOC73KqbQ/LT+BPtrbCb7
	 2Vv8n2DtjWj8I4njJUmCJetXbO1i0JlIJ89OgkzL1PXhbixKKuLycMNYU1dT/qe5tW
	 NwyUOE1LJn4ynW1o6Px1GAXlq05SopJXbLWpVQ84OzZA2MR5y7ENvoHgglGRZOMi2U
	 fg+UU3l2PGNRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC17811D1;
	Sat, 10 Oct 2026 15:31:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D31AADE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C55806064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsN9xclP6h6W for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D9D760668
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791646293;
 b=kfb3+VnaTs3yB4Gwn/U9gQq690zmT9vxeRHaT69Gs5Fmbcnhtk2VkjR+YB5/bI2zv4yU
 WBbSUJH0cAp4r2ZcqjvVrMaNYiPUJo65biVBDgoJ7X0RS7sa9HOfrbz2xS6Qc7oKfl7f5
 +1W2tTOWaS1HV8ELNl/fnOd7NwUgjRyc525vcTvu1qxRMcvpDthxM8hsZ/RZmPKMtKLoa
 ZREsjtPHbT5glVoKFlaNazSi43FD5jbIHG/1Vfi2+boFMicvr2QblFN20M2sWy7py82xY
 mowvbwBSXkuytZkXdi6WH9ibEIArP4nnGj4O80KmQVLbMJVpXgFXw5VMWTq99oTY4AA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791646293;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=T6RU6MlN81WSDXUFPOegdZa+BQ3t27zn6+yn1eJb/6s=;
 b=ZrrlRw3nJbx3WhKnv51NI1bDEwqOyVUFFSArGTcQCEfoHPTAgY/2F4dIVGrB1YTTNnJE
 7MtxBjK+6L3b6FZJ6V8oFX/8QVPl+3qX/JufmjS9Bu00Z2ptVFt1w1iNocm5dpSaVGdlH
 NsmsBZST1XATm8eEsJGOUtnxi0t7nD1ukeEqib5LXd/nC0BlbFL/SmwQyZM3z9LRehpEd
 DOWCl4i7ApYw6a8iiB6k1oK73HQx2PUCspEjjqYNgrbtKnVDxQ/xr9i9bRfTAauvC+iGu
 pyPd0YJJjUEriS2dlfTb5Xtmpo7FETFPy/YVZ0ZA1ruIJyJ/cCiXEhOIMXUT73Zu4qg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9D760668
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF98492289; Sat, 10 Oct 2026 15:30:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:31:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c668c42e2bfff3d71a39d340350ff0d28bd82d2
X-Git-Newrev: f454580f0f5f591f9a9edfdefb5c7ef4b0aa28db
X-Patchwork-Hint: ignore
Message-Id: <20261010153014.CF98492289@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: drop PKGDIR
 variable for {, actual-}source step
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f454580f0f5f591f9a9edfdefb5c7ef4b0aa28db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This was added in commit 2d4fd5d358 ("pkg-infra: also set PKGDIR for the
download step") for the DOWNLOAD macro, which was reworked in commit
155f752d8a ("core/download: do not hard-code the path to the package hash
file") to instead use <FOO>_HASH_FILE, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c69bc96237..4e2ce2e7a0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1087,9 +1087,7 @@ $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
-$$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
