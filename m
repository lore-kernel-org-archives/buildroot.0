Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7686CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 19:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5CCB8472B;
	Fri, 29 May 2026 19:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEAR2UniJoyo; Fri, 29 May 2026 19:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E3E3813CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780082027;
	bh=KU+zrHgliqviSqdt3S3CciH7RmeYboscZ9Un7XBclyQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=osxQjfrLTJCF9aghQFKgJB87HPiLB9m9TDhwHeiDnEu7XnWD4JwGGceB71b3BcKNg
	 OGRlUtFQ+31N1S9iKmL5RYZ0AibzcoJdyFISpfMIgoMYugLbc61qQ5z5oeudoZrGFX
	 gqv4Xys1eVTT1Ywrt/wyrDAWOiCFWV3hbJAfDq5m3E8zQsKgJO7URJLKD2RcrurXDt
	 z73aECNj2OD0ZwEk3JSb3JMbhLfCaOF0rjq18toTq32RZ24yy5v4OIlw60rBY5vcTL
	 LPnIM4wkonjHMTP3RxjuGS2FQmEqD1aGBttDwbyxajXZDNlgxZnAgcFw8TC6Xc/cc7
	 agq1CZhIZbgvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3E3813CA;
	Fri, 29 May 2026 19:13:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF714D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E1C142270
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPgzsKvFjiN0 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 19:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B41BA4226D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41BA4226D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B41BA4226D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:13:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 043DE1A3729;
 Fri, 29 May 2026 19:13:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAA4A601FA;
 Fri, 29 May 2026 19:13:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB81F10888650; 
 Fri, 29 May 2026 21:13:39 +0200 (CEST)
Date: Fri, 29 May 2026 21:13:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahnlP2lj_zl11I3b@windsurf>
References: <20260501183421.2459291-1-bernd@kuhls.net>
 <ahnci7WYFV3NQ8rS@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahnci7WYFV3NQ8rS@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780082021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=2r3bR2AiyoKDRpMGhfj9wnqNf8BoUygWhicllhgNY+s=;
 b=UU5hbafc0B1RcYsxTxqayaZeOoYJjsXxZqbBXptBIEsUu6PQhxATIzWcUe7BEqoJLoS0lt
 s82V9Hu6CAsoeUPGT0JUsNXe0QMAK7sUt4aLHlgRduSOE4u+uhMVusawq3ruqr1gpeNNoD
 fSENcPEYZMQr1Vjo1wTME1HGXD8etzjMBCWLz6A2TvhZ7clFArh03Bv1rbe+dQpDFRMh8I
 HL5veCq5UfaULmySWCmfV30OFUYSCEBTFC/aSszQJvHBvSM8LyAawAk0Xt59CVX02ZzGrr
 e74q8C+ngsoGT2xxtjkM6KQgnNhYi4I0chKgvAfbi29MqFnjjhY6mG15vePhkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UU5hbafc
Subject: Re: [Buildroot] [PATCH 1/5] package/stellarium: fix qt5serialport
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 29, 2026 at 08:37:32PM +0200, Thomas Petazzoni wrote:
> Hello Bernd,
> 
> On Fri, May 01, 2026 at 08:34:17PM +0200, Bernd Kuhls wrote:
> > qt5serialport is only needed when GPS support is enabled:
> > https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L632
> 
> Well, it seems like you're pointing to code that shows your statement
> is not correct:
> 
> IF(USE_PLUGIN_TELESCOPECONTROL OR ENABLE_GPS)
>      FIND_PACKAGE(Qt${QT_VERSION_MAJOR} COMPONENTS SerialPort REQUIRED)
> ENDIF()
> 
> So Qt is used when gps support is enabled *OR* when the telescope
> control plugin is enabled, and this plugin is apparently enabled by
> default.

On this I am wrong, we disable building the telescope control plugin:

        -DUSE_PLUGIN_TELESCOPECONTROL=OFF \

> I don't understand the "wrong order of dependencies". Is this fixing a
> bug?

Still interested by some feedback on this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
