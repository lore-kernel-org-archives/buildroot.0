Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAEDCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F3D84ECC;
	Sat, 30 May 2026 20:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5P55-5JxVVSO; Sat, 30 May 2026 20:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3949884ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780173190;
	bh=JyuPYeFM9a92jtk2T6gKSNnElf6VnHH/v8q3TR+tszo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pKcU4U0izfk5dwXwc0qGTZVk9yFRc14Uk2yye+OF0TYBeWHA82r/3xo4Tr6us9+Dg
	 S9VwnayF3x8BFlRGlq4NOAEd4vuGLFuC+14M61fkY2piqTxLgEkRixwVV+bPuJLEyO
	 R0AaBJDu7r+HX9GafT1DlUuZazNOt9XRhXQ1U5eyhuwRZ75Ywgzoq00yEoN10Jb2Rw
	 qq5vXraZzBlG4WiLmRaSFM2p9gOdRGROON87Ew/DB/bU0IECDyijdkL0H9jLT97jXO
	 AJqv1s/LqUNJcESLRm7M3i7h2iBWY2CNw407RLe1MmiNMFkzomyjVZv4h4HAPY6ERX
	 yAF+ujZmrDjmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3949884ECD;
	Sat, 30 May 2026 20:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67C03D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E5D426C2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIlo_pnQZHoT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7ED4C40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ED4C40137
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ED4C40137
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:33:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F27254E42D9B;
 Sat, 30 May 2026 20:33:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C6AC16073B;
 Sat, 30 May 2026 20:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81EA710888CC7; 
 Sat, 30 May 2026 22:33:03 +0200 (CEST)
Date: Sat, 30 May 2026 22:33:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahtJNrS18lS6lbyh@windsurf>
References: <20260530155718.657095-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530155718.657095-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780173184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=F+vGuW0UeQfdYaf2x6X6offFp3+2VpFYVdxtGx7fHgw=;
 b=fkl1LDxMUOVdxhsn9hf3FcK6pJMOPRsJHDh3EHAfvQkmSULsWsCpU0FGM9Wi253Yy/m8CR
 heIBbA1wCgg2oyN8Layqf8lnjcgLPTPRFEDjfseuxYPuXIyODoTkZSZrIrCV6rCvhmAbeX
 Zcoz+m/ydWq/TpFhA/oKeZRyeXl2DXZn6ui9UyPvj2nwSbjD73lr2lhgmWx7zU2+piNuqo
 hRLWovKeN0e+Dq0PdPFASaP05//P2YniPh0Q63jPJ1M5/YBrPA+HFnUxcvEuTjktAacq24
 sTcPS9AotPviWZfqxu2Y7rEKMpdpoQOjMRYgBXU/05csfSo9iXZaR0Jq0YcZyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fkl1LDxM
Subject: Re: [Buildroot] [PATCH v2 1/5] package/stellarium: fix
 qt5serialport dependency
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

On Sat, May 30, 2026 at 05:57:14PM +0200, Bernd Kuhls wrote:
> qt5serialport is only needed when GPS support is enabled:
> https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L623
> 
> Please note that we disable telescope support by default so only gpsd
> enables the usage of qt5serialport.
> 
> A backport to the LTS branches should be considered, adding
> qt5serialport as dependency without gpsd support causes the unneeded
> build of qt5serialport for stellarium. This situation exists for years
> and is not caused by recent upstream changes.

This is not correct. qt5serialport would only be pulled as a
dependency of stellarium if BR2_PACKAGE_QT5SERIALPORT=y. So in *any*
case qt5serialport would be part of the build. The only difference is
that it is a build dependency of stellarium for no reason. This is not
that much of a problem and probably doesn't deserve being backported,
so I dropped this paragraph, and applied your patch to master.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
