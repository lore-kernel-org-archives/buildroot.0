Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF50AC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 799E180E48;
	Sun, 13 Sep 2026 08:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M09WXtUMMPSW; Sun, 13 Sep 2026 08:42:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E74A80E44
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789288939;
	b=erSYcP1EgWR8r7TyGxiKDBXG1CoLiW7lUuKeP96D3Y1R+8xyo08HhkLmthbRW4s4EA1O
	 rJuJ3dh+6OVxCZESAARR4LK7+1kVAgdMs1x8kecOF/rMHHvWHybP1Sa+m2g4g+i6Pz0JZ
	 radIyqcr4oRARRfLfIlqbHwyT3K1tXstvH0j39YF0bzLOAuVfp/Szk5Gk7iWZQJzA4Evp
	 BqnA10MwZLTHBqP95rOwTOk5Dw8Ka8dMO3P18jvh5KCtWcMF56B8W9C2vRrHYzzt2QCju
	 7hgx6dUxJYaKP5EM5KTLxAJnvbHs4J0SFCN5AUa2QT5nnfsVCVBQDrui+kxWFp1v9Cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789288939;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mC/mvmzc8Np3okMRTXx3DorX0jLZEIRfnjelni0ncZc=;
	b=Zpj4nQavLWoTrigOs+Zw8DhjGZnniSK0Lnez4QlaAzW/LX+ELbUN0dalGARrPFMRsw1M
	 xdNwWhUjYfgM8UC+uYpv7OgO6HsbFadsU6Wu74rLrCHav7EvO7jRhDE19t6RkfSvToxYN
	 bEYuq3X5nG7rv/d1L5UeDQfx7g6EWtZs9+u3INjVV3H4a8p0VSWzx6twXESOqgfO0KMpn
	 TaDdzu8ghQqEOh9J/nYnZbgCj/y53ow1PhDd/YFVJ2zT5jHW/ohBb7S9lPi7Tn23dcQXJ
	 qRdLXMhAfgLtdLJdIyjM55q2GucykC2ofCfOf+kY7lNX0EgWPzel0U+2JskpJiSc5Fg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789288939;
	bh=mC/mvmzc8Np3okMRTXx3DorX0jLZEIRfnjelni0ncZc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rBsxtjp2ffOKMT7SfkmmvxYDerch34Lv0JF7e5Tb25GyctLgygRezgen6JqP5A4x+
	 lMviXlVH7oHHAmkfXUnwpc6HaFgLNknkm7RuZjd2jybXd4JLfjJZCc5Kn1RdsyYf0/
	 i6If58HBmx3cjeNFdEJ3V8ub5Obhq5YN4swphKcScqDqVeP2GapRjMHc3+QbHemrqH
	 2fS7L8+OrXHKcKGASEiRHuqk0yEi3CTJW5vWJT34L/DFaGCVLAPR2jshlWyVbbNNqq
	 sAML18t9FW627T4b+E6Vx8l9B8Q82K8wzxW4zTd1K75MoklGCVWzbRYJOiSYmLtQiN
	 vf7NWTtrosmmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E74A80E44;
	Sun, 13 Sep 2026 08:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5FE223F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC72A40049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64zTwav9fQUO for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:42:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DFB3F40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789288937;
 b=SzM32AoG691WR6y/yYkCQB/4s3nGaxKIy3cHHQuQ72JQ74It3D388slM1VDMtY3BifCH
 6YpR/KY68Xqgo+8YckBopR5xGxJJPM4jzXnu6kOskF367jDYpXXE+r/S3WwD4pMOOCR4m
 nwqsge4mgzQoFbDYqpPTz5Nw0FpAIvegZZxVUikdKT6Mp11joC5glEUDGHuZZTyPGvN7S
 16wxiHFus6HA+dMN/nQ1XJ+9nT92xIGPhpKF0nve95ub+S3lj7+xfV1DfLeGeHbNBQK8n
 sIVas58BZCLRvpDRj+xmZq7cB0fIL6Oqz0oel1KIBoi0XGHPvcDDXGImE7W/6d0MMMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789288937;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=0R5NFUhJAX1R61aLwR3LZLmPE57KPE/60vAnAfVfW7k=;
 b=d5vkAQ3NssJfoHK9kDgIIfPgtk7GkH6Vp9jZ+SB+moaM8BPAgGUaYgysCCccIHszm4BA
 xljrMFV1f638hMJsz0VLqbgl1g5yPZ+MXsWnfrQT/2w1TAspCqmRB/imxBdk4BGGpIrnm
 ieJLTGhMsXIoIbGY7a1pdwJZcHlU6ktkb2fUr7lQrp+jXZ/GCtxPecgq9oOucRawXN307
 uGxakQf31iE28AX4WgGec7ZCYn59juryBlIJwze2J6P1KyASMWRVzf2gnPCNJ0KaypZWF
 1uDFQW3Af43EhYGR3lv2mYvwnUXo8eoUkFpQ/NVcY1bYk1ZEoTLhs1arwyM42Ouwm1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WhE93lBH; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFB3F40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:42:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BE8F413F8C6;
 Sun, 13 Sep 2026 10:42:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 10:42:10 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 10:42:10 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Marek Belisko
 <marek.belisko@open-nandra.com>
In-Reply-To: <20260912210147.1550484-1-thomas.petazzoni@bootlin.com>
References: <20260912210147.1550484-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <5558c3df63e2d99a293fd5e0b25c418e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/udisks: add missing BR2_USE_MMU
 dependency
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

On 12/09/2026 23:01, Thomas Petazzoni via buildroot wrote:
> Commit 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump
> to version 2.92") mistakenly removed the BR2_USE_MMU dependency of
> udisks when dropping "select BR2_PACKAGE_LVM2". Indeed, BR2_USE_MMU is
> a dependency of many other packages selected by udisks.
> 
> Interestingly, the Config.in comments in the same file still had the
> "depends on BR2_USE_MMU" dependencies.
> 
> Fixes: 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump 
> to version 2.92")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
