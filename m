Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65EBC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D31E8136F;
	Fri, 25 Sep 2026 14:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Fmu7Ka8EBaz; Fri, 25 Sep 2026 14:45:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 900758135C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347540;
	b=g3Nceqjvba+u0ietHWMq1iX3dTdAvnQTntlq1lkt8N5Fd7BJfz+8/dBPqllZUiLwVPvn
	 RmlDGF3lsVlCxFWUTWCHqxJjcRtOI50+IR7rc7s1lUTqsLL3oiucPAdN0jFeqRlgwGGXM
	 zM/Kl1PeMAnPyWU1Xrec1Jdw2rEaVzScwUI1S7dOD+Gb30Ek49BmDVuwubA3xVEkvkaM3
	 P+y+Fg7dm0u7l7ccpiw3wJ/SY/EdvEVI6spWFgdePg8c5b/OuRCg5R4brXBKgh8zocJ9/
	 LHApGTombKyRi9RGwMj+IeXXDvwwfaXwqco56kphr53qLxNbfKlcV3B2ML1cQbwrOng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6K7V79boTfQVChxdZey/9UNt/8T1/R8A/HeoRCjg+yA=;
	b=qT8E9rcuRJQXH3ZputvSNUWVV/5RWBoilgn7wZ83bMiDuw+BXgRgluF5IPSdcGfM9MyG
	 nj+0Cw6cGbLEPnl5R+YS4thgSYIOkosTUHpJwVq6moLNbj4A6JWCQDvaJeINX2L/8hQcp
	 kdnBwTYwHjgLajdJHM74HZmJxdiN9P+u4cjFrvAq51iFGLfSOlmkV0pPakXxbGi2XpW/8
	 Ne1xElRDOWLmr+SXVxWXe/DkdVecfU5hwBsDC66JCzAxt3sVbnswu/V3nw1/hXxQdRjXn
	 uDf6P/1VvFXfzsyVVukNgkveonGf4in5S8jw+mbAON/QhnsM5lMJpUz0PxSnc0bNtFA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347540;
	bh=6K7V79boTfQVChxdZey/9UNt/8T1/R8A/HeoRCjg+yA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S9BVoCUe2hjSeqRyS5j/oPgK4L/kwgSbVAIgWiy2M5AoJWVK2APYo6kruyMu18zF/
	 kLpfcA8Z74Hn28swgJlhb2y9O4OF/ftIKLYeja4Dd/jZSfr/+QCA/lBil/E5KkHk1k
	 Y/mAd56YYh+3TTsCWc54efUbXiKaZhRXQUBXZrbWKhkRgZ7xRCEcOZnVr2xcBCgxN1
	 mToZc3ovCfiHFjiY9XSHssDTs2g8+ONj/ZyY4HnfmNzY4kMwsvXac7kNBF+hEpCj9j
	 jlow5E0/FXn3+fvz4ZavpNSpsslqTnAJ9hOkc2Iq+NGFH5+XzNCMtuwjGZ2Ck8PIjn
	 phtE+vOBQ/hMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900758135C;
	Fri, 25 Sep 2026 14:45:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C79C334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E717F60E3C
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0f3BgPOFySgW for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D29FD60DA0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347535;
 b=C8bsz6/WVFpWVXmFIZ0my6j6WXnWN9QbK9dKQAGZjdLZV2KLW54LqEMUomizWY8aLjsf
 YmXiAYI8RtyRXsnKItsbCqZ4Sj3wWaq+4wXQAzyX7YUVgWAigysOROb7cMJ4zLC9fDjuM
 Vfv8BDyK3uCi4HoTLAmyxwVCEjkMtiKTTcttNLCSSzcfYYCHpGORrW/F9IxHUtkiZjc4Q
 ydrPUBca4EkbG9YJOLPJ41Ky0wR79jf4K/cNdDkqxGrCQJNnwjZmTN4bEdwpk1dHGCTGi
 61dzCCsioBi7zT3DARmKKPQZwbuFZ8vHNNnAD2AusBn+r/0zKX9Tw/ogBRNA6S1j3JA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347535;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vBO26tCM/apzf4t+LXevddnuajeaicFgeKY7BjQJ1E4=;
 b=BAdjganz4BBUnN3x3BRprYT5r8KBwh83tDg2X4pfkYg23Qvie9LITCQmkXWwJ94zZenP
 AL2sR17DV2Ecvb6vouBWEV/n5zEgGJJnF1klxRezZ5HvKy+206oYZogLGGe14vZbmic8k
 E2FhRLYO9GZkOa2XKhLm262NwfHA6aPVv1h4Pp8OP2iWUCIrbVhHxVCe7ox1ArTyrstII
 gQuddCm3vOpG/h9YEdSoNOH2SPPRyFmiHO+/H6JFCLNRSccBkJJi53LD6NzffkOxJxPbI
 97ehUNicCJnL2fEIGs/gY9+INWAc82quGjRhFRus9/87MSXcrmk7C4Dj7vMWCc793lw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DwLwcZqw; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D29FD60DA0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:34 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f635552aso746525f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347533; x=1790952333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vBO26tCM/apzf4t+LXevddnuajeaicFgeKY7BjQJ1E4=;
 b=hxBDaBDoD7+hNV5DL6W9zdWnqvU/S2wqOAtULAJOasaePTmgKII26eDsm4VyVH1RHV
 PrrwnzCp7LdnnM9x1HCkVgxSaM1aqj6vel2nNsEsSI0WZBfr68agkMgs4tFC/1SWj/rD
 mk8Njj6BgumtxHblrfH9ewG8+kgIXZg92VyrMGFWMadZKLfOLnyEewX6yuxzz9vcTz/S
 3EeNikb6uy/L6NoMaccbvARIRipwXEfYOYsrRpxjdnGDatLJR2jOCQesdCJqUEBknUEb
 Muaqa/TuFuEW+vLVQKYB4lCdW23jPJu/HEQuE5Pbo3rSh0uoTkG8zYjlioq31m8LW4QD
 yLUQ==
X-Gm-Message-State: AFuF++n1XKZqavfIiSXn02l/733kgnCSyZMWDcsQkYLUuBbo8YdPv/U1
 T+p5kW3l91XJEZzWXFKExTPOWPsUz4oAMFdgmIHLYuy2aS3BcCZgkBLDBUBSxrZjV1nMW67svXX
 58RmbCXMA8Q==
X-Gm-Gg: AYBFou1/HV6pzjLwohx0+BY7XjJniPrDFttfffUe/mcI/jAo1lw68xdDAJrhOrsusHH
 4VLxabZnaYydhTufRBrP+DYtCxIuOSiajDuNBRZcHgtEcgVfWneGQWc52RY/NIZ7jX05TlPnvvT
 TLNNWfxG9UzGEqkXURteeYOYHmr79JLkMmUgg0aIOxKcFPQKbItTsSEYABJ2tre4tU3bHJVagHh
 /TSzBWGOkQOBe5bFN2n6U96+aCIKHU8zegQVK9j7v+PnFGY70NK3mRLRq4wXkAd6C6IMoBEhK2x
 uCDPITkosFctDhYINJHVbkVCTn0aK31HzFJ9n2WJNgZh2F4z7ryk6pA5RegvO9X8kfmv+uTwgWJ
 MEDo6EGL/Jm+g+OXgsAtDGDwhcrMi9u+jxpc9ta6B3n+c2E344kpSgsXtMy6t5R21XpGXfYzX6V
 i2rM0Q+MbtRWGc9e0TY33GfD3yv0GaiM87t1nlAM2Mi+ghGndf5TzbpEe8SdfPNpHZXLArbAfDo
 C1QvwYBJHeudq54C5opxPaXeGTwwv1By8jutQyl9A==
X-Received: by 2002:a05:6000:4108:b0:488:78e4:5e34 with SMTP id
 ffacd0b85a97d-48878e460c1mr5972386f8f.9.1790347532632; 
 Fri, 25 Sep 2026 07:45:32 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a6450a3sm6956358f8f.25.2026.09.25.07.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:32 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:29 +0200
Message-ID: <20260925144531.4097893-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915123932.1956884-2-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/glslsandbox: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS needs the full blown version of
> bash and coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but
> it does so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense,
> but is not aligned with the vast majority of other places where
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
> this with other packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/glslsandbox-player/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
> index d2e146d827..04ca85f381 100644
> --- a/package/glslsandbox-player/Config.in
> +++ b/package/glslsandbox-player/Config.in
> @@ -35,7 +35,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
>  	depends on BR2_USE_MMU # bash, python3
>  	depends on BR2_USE_WCHAR # python3
>  	select BR2_PACKAGE_BASH # runtime
> -	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>  	select BR2_PACKAGE_COREUTILS # runtime (timeout)
>  	select BR2_PACKAGE_LIBCURL_CURL # runtime
>  	select BR2_PACKAGE_IMAGEMAGICK # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
