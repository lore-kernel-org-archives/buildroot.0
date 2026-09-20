Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7743C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A22B80EE2;
	Sun, 20 Sep 2026 12:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJuVUh5NnndE; Sun, 20 Sep 2026 12:26:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9DE3480F00
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907202;
	b=nwytvsc7AIXJsViwn9Hz2QkBnynAp6b7MVCVuCabsAPlOB9h0n15dTavRvUIDfzpkDMt
	 rXD6ti4ia/2VO96FpcsezUtfkXQC+Ujyap5sabG3TPjbchAdzNMd34pl4iO+IPSEMNjJF
	 kLNmL+2rysh4L/pHvqzuPuOlv5IjhjriZIx1lY/Fct1Fj20mSuNPiaemYT0DyggPfhZPC
	 N3Dt1hgGyqFluFzqvrN3IYXfrq07H77ZfZxBEXtkcZhyEaPmndSk33rnUlf/mn/FHSwBG
	 Dt7+2sLk5+Jf2y6i3cck/MCzG+07LLXDgIJAcUWMkARKeGMYjS+1QdSbNdwiWvI0dhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9zXyQymwUCyjIl9rpN1WPIBhisso+/jstHk5MgcYTbw=;
	b=OIzXNPqEjyBGtDGkbKLu39joTFQ7+1lw21yzzoLdlP17BptRJdQd1wjPFQHFHmurRHwp
	 adZQOtrW2B78ViwXMxJdEVprlsHZ0PKyM0pzAlzakoPAJ/JPHQjb6ck2M7k6PHBNG6pIJ
	 TCe+fnq4WqDwGm4fTgp7BnHX0sl+Q5Gwjk1Fjtq2paYfcmza+vWh9BLlHOJG8M3XgNUeV
	 OBjBZ2mt8vcjOAPG5+qs1ZbCp2JqNv0tmrFJbssm1Ycw/9A2WtU/1B6dZzlM2o6lXJkWL
	 dw3wLJheqdJjWWQGLPh4EtzwYLXPLRtQDSr18YiF6rDoenLeypxwneLVeJ9AELSLqbg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907202;
	bh=9zXyQymwUCyjIl9rpN1WPIBhisso+/jstHk5MgcYTbw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p5Xu/kQEP0a/zSyBgBOdzN4EtKtF36E/Ws1tioWEjEe4cdDnu49nAl/Fj36Utlfb/
	 cv6XmpoagbRtVom5tVI5wpXkdC8QzF3qmdWzwmEW5NZtYTMS1aasLX7rQAKnNrY2Wd
	 bTRQIuqEfPhjMzTa7EY0qQlmXUsPJ0tqXSY73JvEawKmVye0LJdNWR4lgvUJc6XZQ3
	 iF4kcMRwdZH+nQEOrXlxo42c9bQA91L79s/Nkbz7DhmRzrBhyyqDZJgfdVG9CPL++a
	 ToLSDgf8249zIiXGpOxOyE4PFXJfNBF9hsumMT9lOPfqFgf3fnuzACrUq6Z5fXSKcE
	 5VWf7G8ToiX3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE3480F00;
	Sun, 20 Sep 2026 12:26:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11820371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBD1240B2C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1BSS7tTAfgl for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:26:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 25D6C4081F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907200;
 b=NvIUpOjj3FEtD3UQOagReIsOEkfZhSvr6TTKTgugo8iC3tqgzMojg5TcayblsXJQoUFa
 OGg8NjH7Ihey04IILyBXLyK4Xo+J/V0fFvMSxruvPVQMPHEkVhT9F2ApevaJ0T1t+L40C
 005tvhoghm5HDv7Ft8y+dvAfb+2xalh3y6j60Nhh3N9Zq1qBTHqLStXO9+U8Og+8/ZKZ/
 g8+EdMZS3VKzKBKpRtCBw42gLSriSZCR6VhClJ7uyWy2wb5+hhDV93+8UugYQCN+z8cGA
 3VUFYPRJGs7xg1116LSt2EZqDvVr6M3okFxaya01RSC2WQRGjgksGNWaSNAyZvI23aA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907200;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=KFwXQ4/SotNRblYXjEgQEqCgKcUlPZ2b0pN2KVP6oSE=;
 b=VfcfuCo5z4kYCeaQuJgu2ueepl8Fcjn9GLA94zj7RhL38xm17pQ0IeykXnjaNn+VovI+
 kYAq6c6em3u2gt0zja5tYGOxQ2r4+W2htFSeiWycFHrwekH9RGpH61qUOAnm4JxjsYDho
 v5MANXsdOgIgj/u0/IHkDpTVwZ3E+AuZxe/LDe+1w2qdk23PDymlmPOovEp8vntFTfFzj
 VIvM4azNMq+uxa83U7cGbaDke4DhKioIandAmclorDXV6rUGWac5TXD9TBTxCwpGhyQzm
 BtVrSnDUfevLCRse+O5akIOxGOhpcIg6YXBQF1Cibh5gt91k2HMm1QYx3uw4Q4e05tA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=25zYouKy; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25D6C4081F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:26:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AEF204E40922;
 Sun, 20 Sep 2026 12:26:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73ED5604C9;
 Sun, 20 Sep 2026 12:26:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5372103282B0; 
 Sun, 20 Sep 2026 14:26:34 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:26:33 +0200
To: Wei Dai <daiwei@sunkaisens.com>
Cc: buildroot@buildroot.org, 
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Message-ID: <aq_Qf67Tgr75QV-B@windsurf>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920074056.1320014-1-daiwei@sunkaisens.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/strongswan: enable
 kernel-libipsec
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

Hello,

On Sun, Sep 20, 2026 at 03:40:54PM +0800, Wei Dai wrote:
> The kernel-libipsec plugin for libcharon provides an IPsec
> backend that runs entirely in userland, using TUN devices and
> strongSwan's own libipsec implementation.
> 
> Unlike the default kernel-netlink and kernel-pfkey backends,
> which install SAs into the OS IPsec stack, this plugin is a
> useful alternative when the kernel IPsec stack does not support
> a required algorithm (e.g. AES-GCM on platforms lacking it).
> It generally performs worse than the kernel stack, so it is
> not recommended for high-throughput security gateways.
> 
> Enable it with --enable-kernel-libipsec. A network kernel
> backend (kernel-netlink or kernel-pfroute) is still required.
> 
> Signed-off-by: Wei Dai <daiwei@sunkaisens.com>

Thanks for your patch. I'm curious to understand why you enable this
new feature unconditionally, while in PATCH 2/3 you propose to enable
another feature by way of an option. Note that I'm not very familiar
with Strongswan/IPsec, so maybe the answer is obvious, but your commit
message doesn't really clarify why we would want this enabled
unconditionally, even though it was not enabled since
package/strongswan was added in Buildroot.

It might also be relevant to comment about the additional footprint
added by this option enable unconditionally.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
