Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8806E81A24
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 14:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55FA460B9B;
	Mon, 16 Feb 2026 14:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJ43H-GItLGI; Mon, 16 Feb 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B1E160B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771251819;
	bh=oMVWqz63rHs4+Yu6klVLZ+y0PGcPuz71KcCVVJ1w1SU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iBblyti4k2yAfxE9Pq9eqZMRtlA7AhZENje1FrLz4eloqJWpiGQCvMqinHYu7hRdp
	 nJ5tJqriS90Wfhko4C3ho+Le9LJ7zg614g0GN3IXu2fH80Z9/q4r78tptSlLpglZPz
	 GMJSsDbSs18eAAcJmGRGI9Zw4YQmxoZzaZ/TM0GS3YzapR6WZ+7FOo1N9XFMnkQzq9
	 0YqMkjonfDgEslpNwSJ3RxsvbERFhrkndt0n/r092hODDcGbSMQliYEQT2DyQd49on
	 sJxaFG/G/uqk2EWF6C0EZqMM8eNeOZFzokp7KwigLFsasd41tyT98LgUjXndwqRK/t
	 wAc98gED15vlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B1E160B44;
	Mon, 16 Feb 2026 14:23:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A695C270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 944EA40781
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlX_9krHIJL2 for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 14:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B821740245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B821740245
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B821740245
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:23:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B16B51A0F9F
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:23:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 88634606CF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C28D610369159; Mon, 16 Feb 2026 15:23:32 +0100 (CET)
Date: Mon, 16 Feb 2026 15:23:32 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aZMoS9Ofl-rxPWPY@windsurf>
References: <20260216-openscap_cpp-v1-1-3372149da5b0@bootlin.com>
 <aZLpW6VY-EmXGyn-@windsurf>
 <DGGEKQ9KMK68.2QOAAZOR2M5YV@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGGEKQ9KMK68.2QOAAZOR2M5YV@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771251813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ySs2b3HICHRaQs552cjT6ApXShojyM096+9E36WaM80=;
 b=dTJRnGVindJqYx9Ydzng8EnI+Ss+P0Ia75NB5zpGPhy83r7z6YoigI7BEb+RoSIThHYQet
 UePxN1DE6BAYV1qcP6hNmcu7Bm6Owz2vdzj8ukUAUnfF2G27e81Qa4VsCVbwONYQ2znP1R
 ZMBEgtuHyCOnr/IXADxaRk8zUCdKd7V0T6TM7Cwddtwtg/4zszQwmXDQLy4JbG2+V15Lec
 c5lklcYSsQHQFCPwVXGPt+JYI8uAGFnOIPsMQA0mtCiME7R8/BhVF68N26mI4L+RG5fdnm
 0J5UsE5U89QoNQcu4aMuIPaso59BiJUleVnlu88fW8p+XYsW3DvMmQVgT0tQcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dTJRnGVi
Subject: Re: [Buildroot] [PATCH] package/openscap: set dependency on C++
 support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 16, 2026 at 01:59:24PM +0100, Alexis Lothor=E9 wrote:

> Good point, thanks. I'll send this fix to the upstream project. As
> the package is now integrated in master (and so triggering failures
> every day in the autobuilder), I guess it is ok to follow-up with a v2
> bringing the corresponding patch submitted on the upstream project, even
> if not merged yet ?

It is absolutely OK, and is exactly what we would expect :-)

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
