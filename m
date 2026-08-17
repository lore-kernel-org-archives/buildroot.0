Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721E3C5DF74
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 14:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315C180BD6;
	Mon, 17 Aug 2026 14:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nO2W1eTOaJC; Mon, 17 Aug 2026 14:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8080F80BCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786977570;
	bh=mkffv36/7+bzaa51GAGIjCO4Vb8tSoF980qg1Ta/MD0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IduvCjIXhEeAnYVR210ij7LT3ZtOIYTLN1VxzmIW1/77RhAD/CsCvhQNYJbKkJC/f
	 Zf8tX9wk7kHRo616VLbPV0f7hYQ4xs5FKGsL5G/uP7dJbofWy5P9PIM5Z14/W/+PzU
	 JD/wIQJFgI9v2CkcerMyFBZH5UksFKXSBwWu+H+Buqbdu0f68GylvCuHjvtRcw6kIt
	 XCUSLz5WlNi4/Yecd07ITbKr4oV0iy6BydiQAD7CvRwBTLJ9Nk0qVqHcBF9Q3YKvDy
	 qwgmXvgvC/l6mFqfaLnuKwvKLk5XCwDTWOIErkSGRigWWdMijlZhQSOy4H4znXczY+
	 +lmDh/MYF1kKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8080F80BCA;
	Mon, 17 Aug 2026 14:39:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18065282
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F26EC606E3
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rl4mVV5c5ZZ for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 14:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5EF7606B0
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5EF7606B0
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ZkRnDle3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5EF7606B0
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:39:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZkRnDle3TPuBPTNRytDSz4pybP1cT/K7uZ6ueh7SZZv2iUxq/8Jz49YVU6O300hsOHu2QLF7CnDCoK0PLqp3KYBUQyT3RujAMH5oRWRU3bn2gueY/WKD+ANBxylMoNDjMNoVqhyoyau+mxzMBSxguRCal3cGv3xTC0nIuzip5kzF0S0ZyoeUHYzp4JmnXmCXdVg1UAgv5qtz4Qhbe2/QVKk+8vmiFGKdTE4rapLqbeB/dYpEv4GVhKxm8WQhX5RlapRJcEOYMqFtrBlYlWpTvAf9FswoxC1ZOrockJGLjeM//LMaiFfP2bxntrB3NSynTw+qPH/UjpU5bKkvFTlCzw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YdtrS+yR1sDsNneoVwD3y7Y82fpnogvTbv7vMMYkw+w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 390334315; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Aug 2026 14:39:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvyUd-00000002WtH-3ljl;
 Mon, 17 Aug 2026 16:39:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260816215224.122758-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 16 Aug 2026 23:52:24 +0200")
References: <20260816215224.122758-1-giulio.benetti@benettiengineering.com>
Date: Mon, 17 Aug 2026 16:39:15 +0200
Message-ID: <87mruk6cbw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mongoose: security bump to version
 7.23
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Release notes:
 > https://github.com/cesanta/mongoose/releases/tag/7.23

 > Fixes CVE-2026-73261, CVE-2026-73260, CVE-2026-63626, CVE-2026-73252,
 > CVE-2026-73251.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
