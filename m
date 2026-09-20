Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D9C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B5C80F31;
	Sun, 20 Sep 2026 13:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iblX8YHpjUW3; Sun, 20 Sep 2026 13:16:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA90580F21
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789910168;
	b=RnUW89yUVgDwf8nY1AulBfipG2BqdMdBZJ4fm/e20e79Z+ALwYGHwE+QC9zPeViVKrs9
	 adw5lt8FpZZuzrCI7OhHUofQTFopkmSYIkRU1D+guQdZSYprA7A/L2VWxlrdCFFqT1Dmt
	 KKdnu40gGF/zmoZmrm0mcK8RZwB69Q+mphKWzQTHovmBhET2BnbIVbxLVcBZ0CUREKrx0
	 rypCkbs7GYJh75R/AEOf3D5pvArGuzVOiHZti9Y+uSbRenkAVKr94GphxeK+BZ3a0SfGF
	 FoxoCyOFTkNSLJL5xp+97OLr4uuyLzz/mOQwcutz1/ad3hJsSTn/XZMVRejXgKUnNFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789910168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WZS6RiSKCQH5PuzqFMVlgbq9/hl+hPgPDj9HnoCZPVI=;
	b=EHp60SRqzv+dtIQjjdTgIHgnATQ7QMz6uhWQdQ0P1L3/uySok3mCTTnBP6pZ4mXqEXZ9
	 WcbrwcWMGudLvQeNYk4kfBlaAB9vksZ+UfduLSJddjxxyadZ/9bo2x/kSicM/mpXMikRJ
	 9RXSaN+/ZC3P0sdVjwVjlk2c3EpAv0q7CxuTLWXhoSX8pUCfbp9NTVYQZv4iQ4dJ5lDBI
	 cuJCDC/aIX+m7tGQShQkHbaSKh/KrlxxPOdVGASi1YPGNqO674FWv1ieeL5dgmYaS3qqS
	 zPNd/ChTEeNEjPQfnKak+8pOxwMFpVWqIeYJ/LAuD6OVybZ4mLPR0faWyGqZpf0duFg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789910167;
	bh=WZS6RiSKCQH5PuzqFMVlgbq9/hl+hPgPDj9HnoCZPVI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XQoLmKSPoIOu6pFK7U/XAdG3psazmjW0ZBDqcMNCmD2/eAPiG+SAMeig9Mdz/Oxwn
	 4vvK0YhRW8ib657xeAhaLqN0/D2k+8tzvIgbebZTzqcy2u7sFLb3lI7hzIgQ1KuWe0
	 EiALIkM/QKx9ARjhPpi0kON853uuZKaihwEFWWyT9m6KQ5c1PgnMhmhrws8T65n9I1
	 GpF+SoG58oKnJsRyodkM2nMHH0NYeU3DOso/EGS7HrhJLfUqdTYc2zxiqt90rmcXGr
	 hBbODAHAz0/Et6BU0FTaSSwWVekCxVlZ3I06nZ6B0jUVRoz3U+Jw5bQxI7NMmht0Fu
	 R5wPpLc8cspqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA90580F21;
	Sun, 20 Sep 2026 13:16:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C17C371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 290D380F21
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2aLsIVKJNVaI for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:16:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B8DC380E1B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789910166;
 b=Pc4oQ/7oLpvTcCuLrtAvPEpjjM0D9y5p4O+u9Nt4ChG2iAm/QjJvAGRTaSyq3YOMSyW6
 OmJcehXUY5CB059fKgoSYWMRWr36S9cC8A5ZNmo3/PtWHrUPB1VflcHXPOkfp/F4s6BNX
 Y7YJSoZCkXC/b163587LzuG1xWj2T6gEzsTkfI8CXh8aqkLC5Nks5mq4S8CPhCaPeGp4a
 PWbkPdGEyiADfYYhd0yQKakL2YBOgE3IKSbmW20aiu6WBg2LKnEqcwT5o+rs1vaHZa/zR
 0OirVfUVTALTVtzgqLxGyXclaqSA3I9sQJCsQxo0O9fDMziz0AIHYHQ2VErlbZOyTBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789910166;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=VDA3xA2Rf3LtnIBKZE90DBXjmCBcXb8Y9g7lKEuVjpE=;
 b=P7uG9Yvra0AXmihH+Bci6iOcr7Cj6YO6n2t1lbV7AwPg+31Z1Hh6RwltNnJTVP9OfAdO
 YfgpS6fikwigY3W3jBzXtYugZr1s970X/GSAq55NRh7SnIpmFFR/l7cGU85iyfLt3Rb1C
 OhGpLd+nG2iI+MdwJHWquNpsup6Ej/Wf+8IL7lwNiwgE2NbdAXZX0eXwD78x0fec0UcVF
 pxbb3HtvuzO3ewHKS5YdsItJUoTJ1aIGOz94tg+wDKxiN5HhqukuvRwx/srfgyP/dEY2J
 GA46bVAMDqmSGb6tus7F0dlTuVLkr41yWI/pDwUQwWqmb6EO4Rnx4Ivdj9rdrV5B/kA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=duCufhXS; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8DC380E1B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:16:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5E3FB1A08D2;
 Sun, 20 Sep 2026 13:16:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 24DBC604C9;
 Sun, 20 Sep 2026 13:16:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 882E8103286A4; 
 Sun, 20 Sep 2026 15:15:51 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:15:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_b4Eh7DLvcalsj@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-18-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-18-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 17/77] package/dovecot{-pigeonhole}:
 security bump version to 2.4.5
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

Hello Bernd,

Thanks for working on this, and for writing a detailed commit log
about the packaging changes. I have a few questions, below.

On Sat, Sep 19, 2026 at 05:57:42PM +0200, Bernd Kuhls wrote:

> Added patch 0001 to revert upstream commit which breaks the build:
> 
>   CCLD     test-var-expand-crypt
> output/per-package/dovecot/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
>  attempted static link of dynamic object `./.libs/var_expand_crypt.so'

Did you report the issue upstream? Having this patch with "Upstream:
n/a" isn't exactly great.

> Added optional support for libkrb5, openldap, postgresql and zstd.

Why did you decide to handle libkrb5, openldap and zstd as automatic
optional dependencies (i.e dovecot.mk checks the availability of the
dependency to decide it can be used or not), but for postgresql you
decided to add an explicit Config.in sub-option?

> Removed configure option --with-ssl (openssl is already a dependency):
> https://github.com/dovecot/core/commit/6b0b7141a8a50ffc99ad51b4f27c75f876e58616
> 
> Removed configure options for zlib (zlib is already a dependency):
> https://github.com/dovecot/core/commit/d666521754b024ce4f1cfee322fcc492673c00a5

But are they really mandatory dependencies then? I mean if the
upstream build system has --with/--without options, why don't we use
them to make those dependencies optional?

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
