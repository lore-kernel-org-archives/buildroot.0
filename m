Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4341C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 11:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BFD6812A3;
	Fri, 25 Sep 2026 11:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Chz5nSJFmp9k; Fri, 25 Sep 2026 11:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8ED5981265
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790337253;
	b=h8twS9zPL2uJ+Rq8swZhGJFtmecBWIrJWIJDkwfF1d1GTX5z0mls1oWILyxNyn+wYimW
	 sPWg56e7WX54RqHyDViTQiFxxHMbBvB7RmGKNpFOwbAku3V/NdeXdK35mSCzBA3F+EZV7
	 45jNgKnCjiWVzjwnRKZjIeTi2Euua0cKb8/3saxhMtGqfLz3UiYOn4pjOTZF98MTsZ6HA
	 1kvO2mWMgHWOh0BEP+MLIvcMyZqFb9MAGskwlGjimCwi8cVR/C1H/Y+xI77IkeH/I0dkr
	 tOVpuDvWNFKOYPZobA+FKWT+/1KSW4GYoeLGoxHk53k6E8JyPdkRA+rqJ8Ynz1XEX3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790337253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Wx8H7Ip4lAeA4Sfbk5wijufdxMpqA9tbTQ4VirspkLg=;
	b=XVSN7yCE3dVBKw1v2N2cjod/tg4c4AGrf/o8WGaQzM0j30tL0R6DlcKhWSv4HJXPLfoF
	 FohVCNyt52bswN5u+UWN9Gr1HBf50jo1fOuczAFwubJiNbvrIPOzPxr7gWJmx6KBqMWa8
	 GDPO3HF5ZJu1BGMwnosP/MQrrj7IDfjjjc1pz2LFhbuCWvwI3gg6siQVkNnajuPU1yrJn
	 P3r12QYOAFSX70Lf2X2D+6iaIjoFe5rt9Jz3iirqXdaB3xJKtfzabA9/FqibQFn/72Bjv
	 whfCD9tRsgTaypVjK+sVi67mtWuJe1j/hnafjIqeGIaDpPWcbN7YHJ+HBHkqkSAwyhA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790337253;
	bh=Wx8H7Ip4lAeA4Sfbk5wijufdxMpqA9tbTQ4VirspkLg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OvRdHpJHY8ZXU+/+0gx7sr9Eu55Mpao9+wOXV/gHYWf10qn5YIZEjT63TbGseHpKR
	 Y2yyHKzaw8zwHpm7FizomJMTy8l8rSCvgF6q8kNB/tpKSQY8XE1WcHqYdkMEhm3ahB
	 dgw+EAj9w/QhDwTftyErTgd6SQHFnusiOEisBjrZAleze/gH6XHiAD5NHPnzbDABrE
	 z5yhhgRDHiStflWDbWq4Tl/BOrey74QJll9emz5c9Jd0VvIpyrE6HHAyzVeO9N1/l6
	 eqntKD1Pvwtm08YOohZbmIcYXmIf4SlRc02WHIoZMicy0YR1KamKPpgB9g1R7Cl5qB
	 56s1fQ2MrPelw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED5981265;
	Fri, 25 Sep 2026 11:54:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5452F5
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70974811C7
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eE0nDUdx_xm2 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 11:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3B97C811C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790337250;
 b=RgtSi+xRY/Mdzv3LiHBuBEYJxC3IZgUkGHhVtHjSQXvY8ifbiG4IO0tBpE4LlvYK06dq
 mCgq2ssAOTNLF8JpkW5NjOVkG3gBh3HHy/gza+ffzgk1F+ogv0SoYjFwkOAN9itPGsays
 aEXYMc1nXa1hq9EafhGyAX4/Zyzi/6DaNqZronpzTduWeCeVe62MjEwDFfbs+yKh9155E
 9o5aXGaasSNXUW3Fjx9nrmJVXCJovBG+jaOJKbEbwcgubotXx508x5hABxk1fWEcvQwey
 igw5FCi99GGU6fLiOfKRSi76MjXiGDHPO3QsA2n0scABlKk+cihIVRFzGLxjXglFPqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790337250;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=hTBn9dmzzCBBB5XmUXE2zTmWGDO5u5xxOmsFfzIHqWQ=;
 b=H+jqy4L7BoPxuQREYwkfFWnzPSa/msHpUWSWTrcYuTKtzYqv8a3ZgMCqh+bHOdxUsZoM
 rkpLcyI5StTSBaLDFTIZzbx4uDveiRANN/ha3GdlVa6XfQzj57o7gQisuMqeh8sHdeOD6
 Tdh4278NCIenGX7O1hCqBHGzOi7fcgdGyVLLx8zzuJqTBm2iW0xPaNK9RDviOxb2mKc+A
 +8vo7F/wlMt8B0KaaCiYkFWwIRVSC67nZ7R6GmP6wPUTUaoRz1Z43YQuBu83ESJwex1B5
 3Pm6x2U2VBISD+O9K5+C5lZDWPwnNoaB0eQJfRnTQw3k2RngXmfz5Pnd/UK4groQ6JA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LfX66cWd; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B97C811C2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:54:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0300A19F57E;
 Fri, 25 Sep 2026 13:54:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Sep 2026 13:54:02 +0200
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 13:54:02 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>, Neal
 Frager <neal.frager@amd.com>, matt@thewebers.ws
In-Reply-To: <20260924090812.217731-1-titouan.christophe@mind.be>
References: <20260924090812.217731-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <8a2bd2b28b289b5d48d87c9dd5ed5874@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/xen: add x86_64 target
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/09/2026 11:08, Titouan Christophe via buildroot wrote:
> Add support for building xen for x86_64 targets. In this initial 
> version,
> do not build extra bootloaders which would require additional download
> infrastructure.
> 
> Assisted-by: Claude:opus-5.5
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
