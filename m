Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5051AC61DE8
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 06:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD74605EF;
	Mon, 31 Aug 2026 06:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8U8ug4G6jteG; Mon, 31 Aug 2026 06:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788156063;
	bh=l3xShIbFz030SuAGg5Sd380YyCczVR/QBG0YdzDHZ4g=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CDScnAGuKbsEYuXS95c+89hKJFa4MnDKzU2JAQCRVJEAY5WoOqcYAZHspt993vyRm
	 Kb81SEO4kAHl3X16u7Lq/KZrCOIhQil02qKuL8zkT8ydcxmNFXsVX1U8O7sA+GLTUv
	 jsqXzuM4ZISstQqpL7XLW3gQpIVCUFi+llx5F/eHzP9/TDtTp5ppcmE7mcRdYJIiFt
	 PGdnAd5ZoZuSvloM6QK5w0PviQMBYS3qRcmocBBeO9geHb55/Y7CWFJhXk3H3TSj5x
	 u14s/HIAVXjZBF85gbXUjUHlYmyG+U0kWIc2xJQKgC5GqJuQdFsbAdVvPpJswMxcD3
	 7f5Y2Njn0F6Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39DCE605D8;
	Mon, 31 Aug 2026 06:01:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 156A8355
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF8C080863
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wel4vwbKkNi0 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 06:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FCrqlK11
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B2A8807B3
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FCrqlK11wW9J/Jy98MmCQwzNa2AbIKjlyxEvsRO6/Fro4vvL3EnOHMqkk9KbqVX9pUi4y1aCNEBYLeArzJ/iaZv5XmxkDSO94ZmXDpmMseCgZfCHFgBe98ZBjKGU1CBa6PcaFTFSCUugL2B94EYWgPHUhZUd9EqXlyCw8TKjHZG0YeXW33dWQqjCU/BOEyOPCM5VhbpedxefNZCw5w9L453KmFc+yq+Q88rXJUTSsqk16zjLjdOVoMbmmNl434SdCksFMdSW8sTkZJNQr8j89cgIVXSwQqOuqrqkZnJyGY8FGfxC+RZc0klHUUr2K1abRGisj6eKHacxNbhIM8SaOQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=IGELTg3NlrVosRU1/av/NLx4FwmbjkXesT0CpO0CW0s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 33336129;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 06:00:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0v4i-00000001oie-1n5b;
 Mon, 31 Aug 2026 08:00:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 28 Aug 2026 19:19:59
 +0200")
References: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com>
Date: Mon, 31 Aug 2026 08:00:56 +0200
Message-ID: <878q5momlj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: patchwork is now at
 patchwork.buildroot.org
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > patchwork.buildroot.org used to be a redirect to patchwork.ozlabs.org,
 > but we are now running our own instance, so let's adjust the links in
 > the manual accordingly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
