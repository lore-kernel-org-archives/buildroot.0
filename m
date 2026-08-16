Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5A6C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0630380D96;
	Sun, 16 Aug 2026 22:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQypXS47_Hq1; Sun, 16 Aug 2026 22:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DDDD80D81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918561;
	bh=IF1Wc7emmWjx/xvJLrdwSq0DQAHQMaGBoSbwsC/QtkQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFxrTqjRarTPePGve9MrB834I5sk+Fc3QWcbb1QN7iY/PvnVta1bGl8JK2dNo1lrK
	 hDZ6gMWN/9lZQf7sOid8Js8FN3cWjpuybAw9D8ShPxDWiRXR3wDo7CrR/YPnnfVAYm
	 Wga2KAGcJKRJq/AUq2Zz60OMZBGiIjmF6ysaX4b7DsHIvKuAcQypnUH4dKDvWCD01N
	 IViY+CIMuNtKSpHc7fFbP9afrseM9Lq3mNAW081jcVL7Q++jp067Pp7ALXdH82LZ8J
	 N1yaAmGOHsixUN5a+BXDG7sNDAz7GKUkOpHiyvYQKpen/e2gtadhHvQwE/g+BBzCmD
	 6NBDyElOkaOOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DDDD80D81;
	Sun, 16 Aug 2026 22:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7235623F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 703074009E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5U-o58gxk4i for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6302340015
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6302340015
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=bpM3xzqi
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6302340015
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:15:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=bpM3xzqivn2kjKyfYb7W3WHoaTr8gezhpWJH+4NEDgtQASieo70IRaA5uowhlpt4Cjauhf88r50nsMlX3JZ3gcJxWJQ5FfJCBrcqE3o5Y8hKdpnMKRj6KsqX425Renm8FsRuMBSru0EXQ1zbxdxQIgIPTtsUkGV5msS9NBSFpySHzYczaMcDJ3oj74yLhYuyN/KvA+2KcjaOvptBvSSo4Sw0ZMs/P0cXwwQjUeVDPplARv9wQf2uKtN6zEiT84FD+d+3C0KyksEaVvhDveJCop04w/T0BIEbd8sgBsGlsgADjXYTs6ziWFHFZ21W9v5oZcHhnpleGES/Wli26LZXDA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=ZJ3WZ3OqoCwVkLiP74I5ALLvgCJJOQqDXOasUOxNPTI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -136051567; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Aug 2026 22:15:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvj8z-000000021NE-2rcq;
 Mon, 17 Aug 2026 00:15:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
In-Reply-To: <20260816203207.3980846-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 16 Aug 2026 22:32:04 +0200")
References: <20260816203207.3980846-1-bernd@kuhls.net>
 <20260816203207.3980846-2-bernd@kuhls.net>
Date: Mon, 17 Aug 2026 00:15:53 +0200
Message-ID: <87zeylbtk6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/5] package/docker-engine: security bump to
 version 28.5.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/moby/moby/releases/tag/v28.5.2
 > Fixes CVE-2025-31133, CVE-2025-52565 & CVE-2025-52881.

 > https://github.com/moby/moby/releases/tag/v28.5.1
 > https://github.com/moby/moby/releases/tag/v28.5.0
 > https://github.com/moby/moby/releases/tag/v28.4.0

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
