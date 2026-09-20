Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA4C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 11:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5104C80F51;
	Sun, 20 Sep 2026 11:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HTHuC53t5bJ; Sun, 20 Sep 2026 11:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1054D80DBF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789903695;
	b=Ugd5fpZHyEI12/4Gmt3Zcjn601Nm1pNiPJ9EZO7DuJj1cmGG5VMq+Gl2vGzILMztmCZF
	 DPxeiVu6+ubnb9srUaDtudoH57T2oCnaWK2BFhwqhWP1xy+zHIYLPcOF9yWHVBhV0bEuN
	 mjfp6pBz38wfzUse9X1Uv/pZA5Ox5yt1e1scV3rUcgbjNILHs9g2AKSxzdGzOjEmk1p5O
	 x/keHNvDHCkCG/qHrXxHlXjHpf/spWsGOJUfadiJzMCpGGIncdU56MDTU3G912NhpED0U
	 jgr2e3qTCrZKd3W/KT5ZPewaGmZjiHpeWxtp2m9aOu24qiANA9U9AwFgPIDkkVSmvTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789903695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gYKoXPhAw6C96tIMfNnD3clnc9ea81LmYpsz/SmNB+o=;
	b=AYg+8deNCphKsfMvyauQcLPh4x7Ghze62z92ZpsXhH8jP0Rj6zVJT3sKbCApJTHtdPCH
	 rBOxdcupn6vUhCnXAyacvmku3RS2lYeOr6tOBIdBdaml7EonWpJbYDMoCgg2EgTn3nmyQ
	 AkOQVWQeRw5Ki6tzwM4U5a0RvFaqVSD4CJJdbywA+LTLwyzPXq7Ll3DVqjUi9OJbjsFWY
	 +Y8M7hVH9S6pYzhrt1jaedaIB0wHj9xc6CAt23xrFnJ6sFXklYeA3SdNkQyXZyuPXvI2v
	 C4vXF5rQbVDxyIYpSffgCkQCbLhIdPuCcYJB4mYFuxOxWLIgFxl+II067bnkoM6iKBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789903695;
	bh=gYKoXPhAw6C96tIMfNnD3clnc9ea81LmYpsz/SmNB+o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gSCbByH51SsXrtzRlIQMMdk/S2g/Hbpf2JASgR0zFkI876FtgE3jAz3tUkN/ZGhXI
	 UcLEs7icXIHCBzoPHzXqJBjUJLMUb+DIdGZjKQBICv2Jk977sAOqiK2hKjI1603fTN
	 /Fnp/Z9rM2VPtD3QJZfmVL5YZdOfgq3bnGrOIM32kuEETG7m1ZmA8er6R/dqqMM8Uk
	 8cDCU3bmVfoiqNYNx62ATjdcRDJHmlRcf3zRTyq+18rVRYp7uq/sfiP8++VGxry6VG
	 7tFeXRC+6y7DQvI1EVdqnAQIO1qlVqA1KeHMSDn/vShiGHO3oCYwQRaXNZ6B/QD/lJ
	 RxrMK/BdTHY5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1054D80DBF;
	Sun, 20 Sep 2026 11:28:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D78392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8B0D60621
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1ZXq4Tvs3Mt for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 11:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 36233605D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789903691;
 b=dV1ink1VSj9tqmw8xWyxvpGS8dzKpLIRzmsUdA5QD0R5BN4SVt0oE+8ldTzU8PrUDW4Z
 7udJW+Q3Ol5J3F3+aFX49UVoL35a5EOd8o/kIWINDEO+YhPGe/F1z8rJ4oMeqkHV/la7D
 iVpWYLfS5bbQ5HeRXPeUoax/mPsLmiMYRDrEL8mE+p5pk0e7kmPklRF48LRmMwILhNlKf
 NQIlfI+RtIJcsd4kPRbQqQOZFhsndCp50vVxTvTmZssEukyDq6vJ7nhyjKcge0nj7gD05
 c9JJn/L6BPut0hp4nVskx78oA2dK6EXJRFuSYuR6HUyqR6PfF0GYJhPmunjIFV1Zf6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789903691;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=s8ToE+/w0+f+KnJm4LpuZ1mk0Xxk9ZTsrEViylAFAng=;
 b=d1/teoq3s6z6j9C4IP739VJXSTETCB38lcFJRW+zr/p24YNy/RdKm6fp2oppV5Trhw97
 IfXxVM0UGEdCwrNQRUz9yp8dVvONr42FjGcDeZ4Qa46sgWjxu4otWVLc4VpkwNLoDA0f0
 Abhm2PsTF4wFKvJx9S7D/BXBprgyh0D1t4brOmC0OOOxhuRH30e6T64dgzpWoRjo+m0vY
 t7TzoqR/mK9GJhZIGt5UGxnwUUXV/BHv6o1PJzaf/NMcMrJeWKYLdBMW6N+kywpP9RTGS
 ZG0GWqPue2HEhCFpXKYa2Jnv+4kbHaI4YZBgOVkuTsbIDYIdFc6Dn+kw37hIuPsiP6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=yaZn8e+A; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36233605D2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 11:28:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CEAB41A0969;
 Sun, 20 Sep 2026 11:28:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 61D44604C9;
 Sun, 20 Sep 2026 11:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B2C710328160; 
 Sun, 20 Sep 2026 13:28:02 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:28:01 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq_C_jltc2dsvVi-@windsurf>
References: <20260919163604.897135-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919163604.897135-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/nnn: add
 BR2_TOOLCHAIN_HAS_THREADS dependency
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

Hello Alexander,

On Sat, Sep 19, 2026 at 06:35:56PM +0200, Alexander Shirokov wrote:
> nnn links against pthread. Specify the dependency to avoid
> unexpected build failures on toolchains lacking thread support (e.g.
> br-arm-full-nothread).
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Thanks for your updated patch. However, a patch fixing an issue must
indicate when the issue was introduced. Is it since package/nnn was
introduced? Due to a subsequent version bump of nnn?

Ideally, we like to have:

Fixes: <commithash> ("commit title")

This helps the maintainers of Buildroot LTS branches in figuring out
whether the patch needs to be backported or not.

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
