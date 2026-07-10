Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD97C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 134A58119D;
	Fri, 10 Jul 2026 13:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKoYALXYwMaD; Fri, 10 Jul 2026 13:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FCA7811C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691578;
	bh=NHUxMFZ7S/rZ12SrcWoN07d8yniV7/H7z2/IiVPgYOU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g6hhcJAFi3IlFFogLWVkMqVyE/U91jhpuNv14to2OBpNBwNkK2B5PQ+sYyB+tbQ4O
	 52RGtVEnF/0CLBxATBG/uZfas6ox/98MObRqGNekUcjZ3+3WsWm1hDh96FQRsG+YeA
	 mKwxhbXNRIgKZ0fhSZ9dhiSmExTbcx1s2+q739FYmhAUjUHN802/6fL+9zhqd1V4To
	 uOf2219FDZ8TEX5UuzuXQnF0YViLFxPKs5W/pH2D7Unmfvs0n9WYtTMpESdAe+DEHC
	 JWd0Bjs876PEWcLa2h1TGagNL0kTKyqo41c1RkZiH0lPiviALflc5+EZPAE0AeFq15
	 tNt4mP5fX3Pjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FCA7811C7;
	Fri, 10 Jul 2026 13:52:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3403E2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2603E40120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g2hnqp1uTFn for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0028D400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0028D400D1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0028D400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso685171f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691571; x=1784296371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QWmMehVCCHXxaRpjaH+uadbkcslSnYUfrVy84/w2H2A=;
 b=arfsNfQABjNqbsSzfixaG/7TqwwWR3OVDxGI6I5L/rasu2SEbJXzdvdsmAajM9mzGN
 lPsrAHf5cGpck7pk/VNbIxWYBFyar2pTiOXiN6LkYzSO4KEsgRgyTOJfIhYved+qQA8N
 4A7pEZCywhExU4Ng/j+GMOl0NOI1vyqh7sARCMbkEA9MGD0lpYt7n+n10+88opUSLpra
 rVKasspZ76JkPu/GhDf4wZDGJ1pTUGYuIsTC0nrzUrzmxdjZJBx6pZobAnwm25FVMK6J
 meHGOvhW604sRcLoAIdwQVrNW5msf/WXUYLn4S1Jf+SsYq1GxT4VYX+oiRgCbrMANgMf
 a3cw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrYp7qH442ZCPbqGu6gkEUQh3XvSd8ShoMSGpBzl61el461CoO3hKQkgpnbj2uryjW7vcuy3Df6EaM=@buildroot.org
X-Gm-Message-State: AOJu0YxeFfx5fn1kjb012G+ZUIga6Snqo7VlEerzCgUEAvotHrjxk9KL
 Q9vD609YhpCLkSpDIrXNH0Di2gcwNVlku7uIm/wjwruO8LGOQU1qbMlD76Pmu8lrbv4=
X-Gm-Gg: AfdE7cmN+u12eX37I3bJ+2EDUEprLTTJJd5KWVQElK9mVw7/QLsPCUAN7T4Zsj48L8a
 zOM2WZZX5PZB8FG4/tFWADqmPP/WWViCeAlB5/XL+Rt5fvdLbcqKl42gQviioO0SWI0Bx5rfgQl
 ZlPGNVe2kP6xkKr6iKNI0bd1PWtRuGolmIpM96o7xNX0qkft8lOknt717UJPaGDTPAD8dW0seKR
 tfyLpi0ehUwCyWyeDXyY2aHqIcO+R7Wv4KjmeMz7746FLnUp35Q4BiGs/DeVTaDUteG/jcvWyaz
 UFpaNCrd/6EPNo2lNM1pfOVmXDmFK8wliH2a/X/yMsHqbgh2LmeMGWtB0JfYSC4sn+VhYgRRM0b
 C7upcLU807ctRCAaYYYORe0tuDaJ6dCO9WrC7bf+f3yUNyKUfS2T12h6vm3LAyOUCmHbXYOUg5N
 y/Uosbcw==
X-Received: by 2002:a05:6000:707:b0:474:8dbb:ccd0 with SMTP id
 ffacd0b85a97d-47ef697ed65mr4535700f8f.19.1783691570769; 
 Fri, 10 Jul 2026 06:52:50 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6da9sm59650213f8f.12.2026.07.10.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:50 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:50 +0200
Message-ID: <20260710135250.761154-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703190417.3687939-1-bernd@kuhls.net>
References: <20260703190417.3687939-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691571; x=1784296371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QWmMehVCCHXxaRpjaH+uadbkcslSnYUfrVy84/w2H2A=;
 b=aVGO6to+FDES16BZS3Rlpmgo139id7c7CJFBNydnOfk88j3g3rKaeHlPM0qM7bmjDX
 oh6iqfvCj8SKcyPJPH2G8btV5qfx5KiYlRYP8Di1SlxgKouUNlYENUBSN3Z9DbGeP517
 AnlLL9i78zZRFpbbkpbMqSJvVf0cA6EmY6V9VCOYLumHV+YRTrLJvli8dxB+aZby4VmI
 8IUriIsv4hrJFfjTWv70wvO7RdmMWJwXOx2f6kNB/UDzV1V+5eTv8PVfCjW0/l/6WFz1
 HB9uwj4IK4Bd/oLPc8J2GuS5BKS0qxH8qOIVjPoN9djeCbcI8vItuhUs5cME/zFoUo/B
 R8vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aVGO6to+
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://www.php.net/ChangeLog-8.php#8.5.8
> https://news-web.php.net/php.announce/498
> https://github.com/php/php-src/blob/php-8.5.8/NEWS
> 
> Fixes CVE-2026-14355.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/b91bfc334dc4ce271a79423f905bf27ea0026e2e
> 
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 2a89d03ecd..3c18506359 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
> +sha256  58910198d19e873048fe87cdfe16bc790025417ede3d1651bfa1c4b533d573f2  php-8.5.8.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 0bfb12a8eb..56d66e40d7 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.7
> +PHP_VERSION = 8.5.8
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
