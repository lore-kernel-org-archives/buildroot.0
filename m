Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80338E63F08
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DF882387;
	Sun, 15 Feb 2026 22:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOtnoiilpSF6; Sun, 15 Feb 2026 22:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8503D8235C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771193888;
	bh=nmK0SALw73AQE98Z9tGi31+LJlWhO7J7yyf/MXHHmnc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qT8veeh3IspvTGpgI/z+Ht9KI+1L/VvvSWKLni339uFSIAJiY1O/+5kgkz0cVKSDW
	 rvdHHtfZUFmRa19S107oLsDMIw3M8e2jnFE8Q6/zwxdJGrQ3qWnxpEt/5aDM39dVLW
	 CZfUZ3XMzovlqS602/N2FYWcQuiQHqChJRr2VpIfDo5HGpt/RW5Nv7Lo1GKA5zx8Ei
	 11S31W81T/5rsABKIMipfDg5HAlWk34MqbnmNfG7ArVxNHUazg6eXpWbsPrlLQnL9a
	 C4dTuZopTfOQWMAvrQPw5WfGSC5vbAY2+kSVWl1rZ9gNekGHLy0LRVl8pm7SDOfh9c
	 gn3byGOkGgOnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8503D8235C;
	Sun, 15 Feb 2026 22:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DE01EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1056240601
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLL1xLLEujSD for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EE1E4035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EE1E4035C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EE1E4035C
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:18:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -820048944; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:18:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkRE-00000009eCB-3Q93;
 Sun, 15 Feb 2026 23:18:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260215141317.503620-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 15 Feb 2026 15:13:17 +0100")
References: <20260215141317.503620-1-bernd@kuhls.net>
 <20260215141317.503620-2-bernd@kuhls.net>
Date: Sun, 15 Feb 2026 23:18:00 +0100
Message-ID: <87h5rhodlz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KFx8H7id6GW01DdgJwGMDnCN03tGqb85seXx4dH1dOXq9AqzZL1hoGARohtq4abDfBDkVPzef0d8TN72EcNAnyuXDOJTFUScquzDJsTQajK94uf1+2NwwOSz8ZJmBrELusiOpFO/xrn6IgSDnX1rVAVq6siqsyGUbpNWsF8uGClhj9bjA1Rdvjd4m6V+Q10srMKs7SPPOTbIg3zgjN1XNmUQ7VoZUexT+cPNqnBWYr3jio5W4DrGf2sM29ED4NbyhUKNbuBWeeRvEhpK4I5kMEorTEGr5cmvX2tQNcO17MqfbrfAdpg2pdlVWMzGjGBFGUZkIycvqcBRtKWi5ROlvg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=B0yv/rdgkz4KTZ6BMwbXxYUtgLm0gpfS0Lz/3rqT8xI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KFx8H7id
Subject: Re: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version
 to 26.1.2
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

 > https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.1.2
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
