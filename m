Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87814E9270E
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3973440510;
	Sat, 27 Dec 2025 22:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VL16Nv5rDVAm; Sat, 27 Dec 2025 22:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4F440535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766873482;
	bh=P/XuJf8vIX6Jbpe43+nsGuwg6J49TiJMIGrib2t3YfY=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=RUWX71F59h8qqQssUhgU4aeRt1SGAB7L7zaGLcgi22ZnjArOEk3eljak/8YIiVJvu
	 M4Vr3JtZ3knm3Vzap/1fyFynwmodGbkizxeoLyyOvv7vK6irK0wnTT5ocbtBS0+W0M
	 kFAFe39WxR4FXAGN1sd5tmDXiWaY1+1ESjUot6GONqj5yZ9D+vcCRqTrzOMQqDJo5c
	 ndineGo+M0r9BX48LPCjhIbxLFgN3YywLP+n5bOh3T8HlFaMB85kD/vs3QAey9/sQN
	 Y+/HMD3RavuT1xJXuTqefdv6CXQ5nosQXvtfTaMcbdkSw0FVlpi8qJ0v0b50a1sphi
	 bHy29n6Pqx5Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4F440535;
	Sat, 27 Dec 2025 22:11:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D111119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15FAF80B5E
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9hXoeqom2Jw for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20E9380B54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E9380B54
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20E9380B54
 for <buildroot@busybox.net>; Sat, 27 Dec 2025 22:11:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C0F841A24A3;
 Sat, 27 Dec 2025 22:11:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 84E3060725;
 Sat, 27 Dec 2025 22:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC6B61197803A; Sat, 27 Dec 2025 23:11:15 +0100 (CET)
Date: Sat, 27 Dec 2025 23:11:14 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20251227231114.72a279bc@windsurf>
In-Reply-To: <20251220173412.433583-4-francois.perrad@gadz.org>
References: <20251220173412.433583-1-francois.perrad@gadz.org>
 <20251220173412.433583-4-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766873476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=T0eaF1tD2cPnMGYTObLug7F1l7NYHoTN0/noANS1mm0=;
 b=oG6On6E9Hc+r4Rj8YFNuau57ULcNXd43gIZwVUxP9N/8976D403CK1AmH1AiaU0B1gl6TU
 XQ4G/2DQHSPMiUPknsiLBypYHLhSUw5Cm8k8tdQOcuNouYh+DXfRexsFmGa5JzaPMuPv2j
 hhK2tY3Thev0RrqgmcEZ4iaxaf8IoBHhiTL/wl6DT2ywgBWYtxttqHO4J28qk53x/ujwp4
 Dk8Z8nbZMs/h72EGN3XwHl/twLEyMJPtKDzbbZKfJWMvft2X3vOhBQsFhhatxlmJlZDWYf
 nhoBUjV7C8Bppzo/0Okp8+VKoTbVVVQI5GDYWFshLFejM7vbepaAk2G8Z4jt5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=oG6On6E9
Subject: Re: [Buildroot] [PATCH 4/4] package/janet-spork: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 20 Dec 2025 18:34:12 +0100
Francois Perrad via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

What does this package actually provides? If I understand correctly,
janet-spork is like an utility library of some sort. What are you using
it for? For your own custom Janet-based application?

Are there some Janet-based applications that are available so that this
janet-package infrastructure can actually be used for something
_useful_ ?

But really aside from that the patch looks really good and clean.

Can you do a v2 adjusting the few comments on the rest of the series,
and providing a bit more background? Then we can go ahead and merge
this.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
