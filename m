Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775BBC982E1
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A1A40BA7;
	Fri, 18 Sep 2026 13:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av1p5n6pLdMA; Fri, 18 Sep 2026 13:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 660E140B92
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736768;
	b=VlKWYFeM5cGcsnanHw4uGTTlS//5RHMcYKunHEJScWkaJFO/HBZpR/g1XsgXbuMk1Ns9
	 iZ5QS6k17M3vcHp/6bMR/W8pSRKFLR2vGIpzXQsQjh3vgVnE2yLL/1i/pVxZ9ZEOoJnsG
	 mZIfC2oc1x5mBo53cjaPLgWlfGbb49bVfnXb85WdSHRQ/QsBdWOu9+TeW9TdWJd1ueF97
	 fapYeHlUwJPTU6pD8Zu3npPcz27lMaE2S8myv/eLZL1YmRCfQOKKzkYkLobT+JEPupz1X
	 HIYnTaEZydfre8mkxn+lylUYM3ZU69QA/vq7IHzSbQn7w2GpXyFzAgTkhXay761vzaw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736768;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YjHEPvRBQUhHeeVd8tayL8xxizyy7O19ljrhcgWW7fY=;
	b=N4zHeGXZWJFTr+J4R9vHI81e2h8lbyzk8wiBdRNrT9K9ce18BEW7tEbpoxH8yC1yPKt7
	 dvb529wCH7QIveSL17VQc5fCJ+5smTzn8v95qkGcjT5Obn8fArj3Ql5lyoEX37CkVkVIB
	 Themw0jXQOCOapRq6lKWMdWrVtLH5r6q6YmvHAOwIi71g3uyZrxg7c1EcBnXeLSdNE/mL
	 lDw7u7mIz6kdlhCN/vNb5AuuNs2OHWjti6g5oUlsgTwoo4Z2WjOgymbXdZCBPytculNPv
	 ikdDTwaJBQcwhHS8JodfvuVaPZOQxCN4VlMChBOJS6kXkAaT23Ca+WnRFWWCFDyYtQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736768;
	bh=YjHEPvRBQUhHeeVd8tayL8xxizyy7O19ljrhcgWW7fY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FE70LgW+6pBIwrnedz9cH2/z01d+iNz4Q2nZDiF7XERyAtGsSiTAKc+TQ0/EXf7Bs
	 LAgu1keTsKl54EKYOeexgZOxTUOM6MC3gTzFoci0P7AmDmy0at0eRUt4YNZxPKNEpM
	 RPbGB5UWmdT0D2Y35SenTYZjKAyDGHuyo0qm7WfcleQ9fENCuZGVAL0Lfkpr+S72PO
	 /rSBtv2ltNY9FHAcaDJs4CPYca4LhQ2u7ti7rQF1MHsGxWDjtLz2uO9o2wlc1aTbQN
	 IQs3nwhvOmQ17eWr3D85xw6ZKgDPUC7llBXFKLk2/3mzGGVxHYtKF5wgFvscdoSSyV
	 LrU9ChYD5cVHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 660E140B92;
	Fri, 18 Sep 2026 13:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D25D43A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E1C40B94
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvHaWi5WdZJt for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 744DA40B7E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=GP/5NSULhgXNPykYcFAasVad+UNFj8C8BDSxwAGlFqT5+7idlEmXf5h63OLVnKjUILiV
 u5aHmUIKUuK3apSHdpPPeqNFuSwbN6InTvG6wxWghk73FJG1NH03kzlSYCF47dP6kNUbz
 ezTr6Z2FtyDf89lIbKB3f3fahq/jtFeQamKF5ktCVefl2ZZUBQDKIqfS4+3C/aqJas6lO
 zDEIuGPXWL+QUZPB+8o9kQoDVsC38+5Z8opZwjuyN3KgC1HDFRKQI0LnlAGAa0KJsGPz6
 Zf/chlSFNZb0mw30pSNeQgc9CEKC8KHsLQ3sYgko0rWGWdglaQoL4Rx4qIUbuMGU+FA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wWSsduMHQlAbJSk/ltW6MJAuQPFz24MQ1DWur5g937o=;
 b=jnB1I6Xun3+Qq3mcXmME1kujsdUvc6C5ytzplqulHN4RFXYvc6BQLsleU4UkpgePMeqQ
 DlajGL8tDEYwcoVCboi2VDZ5YIdKIzKFFF110iuxHFTiqSRXT8jJXOSdsqtq+uAWbtXZf
 V0FTF09XsaC+7OmccCksLR3+jDLIT0NTOuaAMlRNN/TVNuwY5TOWhGAcKxMlQrLQrLZYm
 fzKf6NqVXYW2b7FtRGKBOi/avvigNY0MnRkfXuEc+cDs2eOmvJKZbrkrRBzhEBXagjmSR
 NU5FJu9Z71IDSajmgjdB3Fch7GlTMc8y4naO4uUzSfHVBABf5BB1B/OVcFpifFRYQqA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744DA40B7E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D51097696; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:18:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0fe3e2e604c68cc787e5ad8cfa65cfb2664561e4
X-Git-Newrev: 36545de94cb7835544ecf0b9803380279844c7a1
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.2D51097696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apache: renumber
 patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36545de94cb7835544ecf0b9803380279844c7a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 99bfbef093f41f20dff305dea83c7763c8b34a1b removed patch
0002 but forgot to renumber the remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c9fbf7efe606d9c34533871d925fc0d16364e7a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ch => 0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} | 0
 ...ch => 0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
similarity index 100%
rename from package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
rename to package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
similarity index 100%
rename from package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
rename to package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
