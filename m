Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C68C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ADD540707;
	Sun, 16 Aug 2026 14:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7xzKbt_Gtvp; Sun, 16 Aug 2026 14:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D91D4064E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786891506;
	bh=6uWf2Rr2SwxGA18a+by8tit48BkI5NI40xCfTFCBdkU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MLGH5YCTP1SBFcIS8aw+V/LvBNCreNifVhwEqXw3pTgNWlDK6TjuAFCtfg1JVmWSq
	 mQ2X2hG0eOJ95HRR1c/ei3NgbtVF3sYN02OKW+S2Tyn6RrTmEI+anEWsDTgx+nsJbu
	 vh3C7/ViuMzUgizBa8oTMytxO+9aJtAEFryJ+RoxNlQwLmQpzj5wnbT9n+kZvDIOwj
	 ke1u2+wSYlbk/jdR56ES6xwDsxxVNlkHfcEj6LoShtTRvx9UGSyRNiy3EA84XOf+c2
	 rIg4jbXpoD3QqhvSTk9SXlCcV8YwpjQCPZlxOtQ7ld3ER9/zlZKiWObDFW3jMJrYxC
	 gUJlz7Gq9BZHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D91D4064E;
	Sun, 16 Aug 2026 14:45:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9761A147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D67E60622
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXZPfvlR9eRo for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 14:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB50E6061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB50E6061F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB50E6061F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 14:45:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5BE054E41269;
 Sun, 16 Aug 2026 14:45:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C24360352;
 Sun, 16 Aug 2026 14:45:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8F6D11C4F982; 
 Sun, 16 Aug 2026 16:44:54 +0200 (CEST)
Date: Sun, 16 Aug 2026 16:44:53 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aoHM2VMpxxq8pzaU@windsurf>
References: <20260706054430.2860918-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706054430.2860918-1-troglobit@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/firewalld: bump to v2.4.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 06, 2026 at 07:44:30AM +0200, Joachim Wiberg wrote:
> - Switch to release tarball using GitHub generated checksum
> - Drop backported patch
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
