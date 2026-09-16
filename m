Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC13C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7181740729;
	Wed, 16 Sep 2026 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAdETtpF2i-1; Wed, 16 Sep 2026 21:15:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 95D9F40434
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789593307;
	b=OpkUuBMuZdBgEvPF4VdkEOBcIB3lTGTaaUrACMgBc7JXdvTf0KhSSzLvs0hkaAsaoG39
	 Jayxrg6Ej9K+RS28u6dG1fRW8OOK6LyKOWqK5pguJepEOHHadajj5k0Gc0TxGR5KXiCWr
	 Ozizr/nxlY2Q589QVlVWuZwSnhZJRCmxCwVlvprfRbBNJJMYBCkLMXXFf8lrlm5RkvAS6
	 1p5wKF7DEAi5mQfyUjJWgM8xzRyrJnzpNI3lSi+EsERS+Ls1nkC/ykSjYpMD6JMpc0M6N
	 xgwYDRV/qPH6oLerEr2In5qpDrddHaX2nl6fe7fU8YmK9lf9YnYhHe55S88duekYcVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789593307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2a11uzx4cmre20XfbsXg2e8ycmCRPYVTTpUR4wVFSO0=;
	b=TCRvo9tW9styHyKQmW0o8P5+ao+t6ebZn7sxBo473Vk0w/Z7w8P2JNZMDbP+PAbVr4W4
	 YLJc0uc/tqml6r5epi7Xiuz+miRQQWVePaKmtxSJuIWJq5pm5qiNm3/EjMzo/b7V7KRpP
	 Um66eYFGh8VmNWNgKWTTadQuuPJpNN+bZVHb29RrneWS9zAfti87+cmsQv3P8V5/qudUd
	 IoaTXTPrXcs0qbeTKc4UcGQD8J1z+vGa1XHnMGNlwCIqj7Sqr6Zei3aeqg38JSU7rqUNO
	 8xTot6rwnXUbYmLrzQ/elfngjUDTGwot4nlUZGIGiwegZkiR1ybUL3CjVYEX7HvZTng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789593307;
	bh=2a11uzx4cmre20XfbsXg2e8ycmCRPYVTTpUR4wVFSO0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BpUYgsZMr5pQsz+SaTWEctzKSZigTYEgmj/bkt3iW1eoumqgUQTSbCiIwhXMOlQzA
	 h98aewQA5+p/U4f/bsdimMLsDklDWkP8cir9F3x8etHa8q+IWlaFGtuXyWnivUFsJ+
	 LGfVDjpwXg2NiT5vd+oCG92pLrEgByWEzTgm5z0h/LO1l9hMdT+8GgrHEwCw1lhcph
	 B/yZpWSnaoqxxCUmC8dB6HHIz9Qg3+nm/cpopym3xQyVLgYIIW8io5mSVkNL1LnfWp
	 NM21qpXedlo2KSUMYIBte5NGGYboInxYXPObdelq5UD+FNWYxqPVq7IeFWbTnbKOrh
	 i+MO9934HHP1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D9F40434;
	Wed, 16 Sep 2026 21:15:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D88EE2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA159400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsDfk_vC6yKA for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:15:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 88FF340081
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789593304;
 b=O3Wkzptv5JJsfRo1Zb1qIPBaZL2BlJFPy7JUGULBfP3Lijv9zT4Ksxa2hmC7tYSQeOeI
 brF84lmFiVE44wt3zt4XUYC6OEawLu9UmCUZp+svaGIxxu81b7qUxc62T3VkYALmh8ZrY
 jeigiqlHrsqQboyu8ijJKE2VWca3vO22L+Pvp4kXMK86W3dMJvWW6T5D7CsVgRUQRuAfd
 WYOeIB++QtgpvKOd3w8NQ4oB0DaroiLPc3V3EylPVTmrS4a/k921++tgYzVy4f8E9EpgQ
 XOQUJ5XTkNDd7NJlUQopsi4tWpMgJJ5RRjtU4uDXOgCavk9TF5gmmy35s2p/GiZciag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789593304;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZsM+a2yf8HiW7kGkisxAp1cilYYREbaXqR72jceAS2A=;
 b=eox42dTeA5LBKRdjouct+V8fIlSWhCgY6NJYe7MPCR6EDwv8A7cvEcN7ghiAT4gQ8aaJ
 Nk4UfpjDXLiMEt3GQxCJVVZPOwyJcgP69whuRoyigKbjt1pQuY0qzMTSy9H/7p577d4Gp
 8Rwj+vuP2oQerrtZUCeJCO9Zjr/cyylJgQJy6He7bDWKNZnmKJ8AMUDTG5BMj9vAGRbgt
 4k/uMc0txHbu9R6q6s6oiADzvX88aHPoCGrDG6ylZaDCMn3dZMT2PNbgdxcmIRUjd8te4
 SG84vksr0dPfgYh9iNELVTomSWJp3s1Js2imqXJepwrTEvX/1rKJvkLkD1ooQgWn/rw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bWCpqNhg; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88FF340081
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:15:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5B54E4E40754
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:15:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13AC360337;
 Wed, 16 Sep 2026 21:15:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A30E11C79EA0; 
 Wed, 16 Sep 2026 23:14:56 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:14:55 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <aqsGt3LbPWJgtUpB@windsurf>
References: <20260104220221.39077-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104220221.39077-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure with powerpc
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

On Sun, Jan 04, 2026 at 11:02:21PM +0100, Giulio Benetti wrote:
> Not all Linux defconfigs have CONFIG_INET enabled and this results in:
>   LD [M]  88XXau.o
>   MODPOST Module.symvers
> ERROR: modpost: "register_inetaddr_notifier" [88XXau.ko] undefined!
> ERROR: modpost: "unregister_inetaddr_notifier" [88XXau.ko] undefined!
> 
> So let's add CONFIG_INET to LINUX_CONFIG_FIXUPS.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6b4f17518e049a91a36be74c78cb8cde89b73bb3/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I've researched which commit introduced the issue, and amended the
commit message accordingly. Applied to master with those changes.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
