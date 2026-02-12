Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38818EEA865
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 22:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0343361298;
	Thu, 12 Feb 2026 22:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CdYVU19MCBS; Thu, 12 Feb 2026 22:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 668296126E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770935756;
	bh=ae9rXRc+Dtb7/ojT7WEQzyE79KxTz27qhvulmZ6WxD8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cifd6KSg4zHmsGawlZzucwlrP4ruDb2aicBdyoxecnZgIlbGpS8pqluDXS8rWF9Sb
	 b1KNS2fMCXcL8v+/lqerl5OMRSm/nsucQbCdmfZrW/K8k5526jFCjT44yy/4EFue7J
	 dxx70+Z+FfyiorpIdNkbYZXl+7lN2SBnOS9A8NQbR2pE9I4qVbVaDEgY3NgJ2b1btE
	 n0VJQUAPOVwz6EKMxaJpTFNw4WwkVdte2gPtac73oSswboYo/nv49JuVIYlDG5LH22
	 rOcKuexaIg+PyernR8IgdiU1jBqTMPe68+q9f+h2Sji0dWFwLkrn+TsQuQbSW+eCVk
	 84jvLTEoVTq7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 668296126E;
	Thu, 12 Feb 2026 22:35:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09D1DEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 039BC4103D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbOtex2wtVOZ for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 22:35:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A6164103B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A6164103B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A6164103B
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:35:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C5F114E40CFA;
 Thu, 12 Feb 2026 22:35:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 850BF606B8;
 Thu, 12 Feb 2026 22:35:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1988110368DCF; Thu, 12 Feb 2026 23:35:49 +0100 (CET)
Date: Thu, 12 Feb 2026 23:35:48 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, tim.hammer@nav-timing.safrangroup.com, 
 nicolas.carrier@nav-timing.safrangroup.com
Message-ID: <aY5VrfmnkY8yD3bw@windsurf>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
 <20251016-openscap-v3-2-d7b28e958f5f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-openscap-v3-2-d7b28e958f5f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770935749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9JRTBx9Cgk7uFlfkXX+z1QaHL/xfQzs6L267da2iOB0=;
 b=ioQxjrLR1DeZorjskMCMZYZxbFBHlnC5XKfVpcWVQSRKhyVm88ShLEDTik/yea+0rchyt3
 wP5ciaFb8ryNmbkQ8bvw7SBGsdJwgmSqJRmjn2mSvSU9b6eQmzGEpr0b7qut9bk0Z4NGEZ
 6yvxycgnqbE/VVtYgbNtMUbo1dby14YGKULcbQKvN5Dc6MVAjO6L0um8O5/o44ftHApgFR
 KKoeGQ7J6sMfBFuDTRaq7A/Q/AeT5bR+GahEnSaVBTRDYerdjJHpMJ73HnKov6lGVyni7f
 +KYcm9dlroEPAxaJ3+xOpy+jLeQ0LSYI+EweKKjf+12hxpNHxrlcNfjTvOeiuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ioQxjrLR
Subject: Re: [Buildroot] [PATCH v3 2/5] package/libcurl: Reapply "libcurl:
 add host variant"
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

On Thu, Oct 16, 2025 at 04:46:35PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> libcurl host build support has initially been added with 736e0fc5d610
> ("libcurl: add host variant") while adding support for host-cargo build,
> and reverted with 69e84008abf8 ("Revert "libcurl: add host variant"")
> when standalone cargo build has been removed. In order to bring a new
> host package depending on libcurl, re-enable host-libcurl build support.
> While doing so, remove the not-needed-anymore post-patch hook.

Applied with some slight rewording of the commit message.

Thanks a lot!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
