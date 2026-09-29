Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5668C9832A
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 07:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A4746070F;
	Tue, 29 Sep 2026 07:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDxkfFmb0sqG; Tue, 29 Sep 2026 07:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F905605C7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790666511;
	b=TXLeycKLzJk2VVl/OYgq7mxp0OVXYYEod9IDzka66/S+fWIzqMK1lXUnF4Kvtwl1J/8U
	 DD8NF7PdjmP3lctgntQPN6yEeZ6nG0rc3QyhkEmpCu9av7bpHCymWoQL01KNHQ9FO+uax
	 nka2u6MUQOoi+cyuJlBTsCD2Vb3tEg1Y9Hz/7NcsscWCZm0qNC1cJ3WvBc8HcCAVuBK/L
	 FOJsTwzX+rKZXzufUCHFTcAoBaA/nD64TTx3K6GzBE2MtFnpCVryeyKlfVdqKDEuWRSFA
	 fcgS4y8SmpKEmHEDo7uS/qrFBrgULLxlwKhJy8vCU5JLFp+Je8HXIDZHhcYBdY6v7DQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790666511;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hH0gSLsYHqtIy1GXEfW9sAh24Jf+tgwM2HN2qJqWv3E=;
	b=Dbzs7IegS4QcLZefTyrJJk+tlN6IOgsmWKoiCWWJVPee2LZwWGXrGTFe8VUR4f6tmj9m
	 awApvTWkhgH91VvNIACwldnLu6vzVBfogMThYCNkwR2/4VmEXscNQij/NJvuidlFN8GBl
	 m4JELXAXw2wyuVrjFZQvnk8zW7RqH6Y6YNdqhoaiupVR+ZjwxwUEfnGSjExMwD9TSythJ
	 yV4nc0iV0IxGzDHvwB8Wln9LyUnII+fkVqmp6n4zHgAyy2t/llPuCLPhYw56Sq4smN+qQ
	 BAQbQM0xHUIVkqM/gcwm1oDl4zyibxqJQx76PaXP1ddAkWjX5xdaqXTvaXnFwUhZ2FA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790666511;
	bh=hH0gSLsYHqtIy1GXEfW9sAh24Jf+tgwM2HN2qJqWv3E=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=EZU6F+1pHPH8qHlD4huX+AYdbGC0I9bnAgqPf4JgA0NFhWPvI6SyMrBocRixoPSOj
	 GZbaYxNGggdD8Ipr/5jhyNe/Rgg9x7EVIj7FCveP69Fn5t/tm+iHUJ1gs9jQa6mc3v
	 NZtyzoyIEEJl1Cg56bC9gxuqxigJOyQtBnDKsYYiWhe5Egym8JaAeRsOO7FajMNCSp
	 P0PO6DexTmYetdJdGfyxaHeGL0YVQUx422PCGuFgyi/gXIFL2bMp6IqavkZjPKytsC
	 8YalvVGAkwjMOdjwx+08nFfM4nE7VszyRaEaHg1xHm9BsDPIKb7lUh+sKlUrKyZ6tv
	 tK2J1JlXaCq3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F905605C7;
	Tue, 29 Sep 2026 07:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C51A3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21FF740558
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kk508wvGiTwj for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 07:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D0F9240557
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790666508;
 b=CFFzlhFTDK6kmIRHCwZwl8e5d/dXUDwVBYKK/uQRcHPng+ST3tIut7twNu5G2qLpQvkl
 RvO0tF0kNjX1GiWwiAgXTAlXJwLSJI6EtddF3hcH7+908s/3C+DDgAbjLgrpZKVG3AdLq
 J4EsR+X241r8HlYPbSTpSjF82VZcTlle5lmLwOnxn9hfSEv4sUL/DA0P9UxpP/kXPZayR
 yIT4RsZfP2j3IHdtKpnUEdRN91ikU7y+G8AX012e93neKeeW3I30KUaXZ761yB1OOqvOK
 /IFblCJmmxNcwEVahRWDnlE/LdmJic+S8QWbPglT+GNQmTcnWNdyFABym/1l7Z9z+sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790666508;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YZIYRVAFu30x6aU1KA2bcbcdCn/mTin2F33XJjHhuEw=;
 b=F1rYGVQvlZSF2YAVIUY2pZmGCJABQr+7eSTeyqb8/Vsm0ST7MZOm0Bek0PEdxgTWjZzM
 Dgv2eno36X1lclxjhPSKKaPF1ASxZcGyg+nSMjdV4JGtZKQcdFifOfNrvusFq+dYQO8li
 6od3Y3S/tGhNXgmm3znQjYHn4kw5005BU7pnXL9Z+OLXw8NN27ACsyNQELx1C17RO/akI
 uF1LPc996xqIVD8OThF20vEZMCbr8IAL3rIp4EmHPHEDJlQtgOfINwxju0olsD2tMBYQx
 uy/7OOFqLg7KON2Uh4eRL6uYRzchLEZH32OlPGXK4YsuJ90gd8Ma2EP/46IqFB6cbZg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=M2fPmqWK; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0F9240557
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 07:21:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 38AAB1A1054;
 Tue, 29 Sep 2026 07:21:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 051F3601BD;
 Tue, 29 Sep 2026 07:21:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13341102F1E1D; 
 Tue, 29 Sep 2026 09:21:41 +0200 (CEST)
Date: Tue, 29 Sep 2026 09:21:37 +0200
To: Wei Dai <daiwei@sunkaisens.com>, buildroot@buildroot.org, 
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>
Message-ID: <artm6-0i7bQ4gJSM@windsurf>
References: <20260920074056.1320014-1-daiwei@sunkaisens.com>
 <aq_Qf67Tgr75QV-B@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq_Qf67Tgr75QV-B@windsurf>
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

Hello Wei,

Gentle ping on the question below regarding your patch. Thanks for
your feedback!

Thomas

On Sun, Sep 20, 2026 at 02:26:33PM +0200, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Sun, Sep 20, 2026 at 03:40:54PM +0800, Wei Dai wrote:
> > The kernel-libipsec plugin for libcharon provides an IPsec
> > backend that runs entirely in userland, using TUN devices and
> > strongSwan's own libipsec implementation.
> > 
> > Unlike the default kernel-netlink and kernel-pfkey backends,
> > which install SAs into the OS IPsec stack, this plugin is a
> > useful alternative when the kernel IPsec stack does not support
> > a required algorithm (e.g. AES-GCM on platforms lacking it).
> > It generally performs worse than the kernel stack, so it is
> > not recommended for high-throughput security gateways.
> > 
> > Enable it with --enable-kernel-libipsec. A network kernel
> > backend (kernel-netlink or kernel-pfroute) is still required.
> > 
> > Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
> 
> Thanks for your patch. I'm curious to understand why you enable this
> new feature unconditionally, while in PATCH 2/3 you propose to enable
> another feature by way of an option. Note that I'm not very familiar
> with Strongswan/IPsec, so maybe the answer is obvious, but your commit
> message doesn't really clarify why we would want this enabled
> unconditionally, even though it was not enabled since
> package/strongswan was added in Buildroot.
> 
> It might also be relevant to comment about the additional footprint
> added by this option enable unconditionally.
> 
> Thanks for your feedback!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
