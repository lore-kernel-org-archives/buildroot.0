Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC7EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7165341F4C;
	Fri, 13 Feb 2026 19:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8vrsEmQmbqi; Fri, 13 Feb 2026 19:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC43E41F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011443;
	bh=9WFoOUqQseVSy7s/VPdj9LtMekj/wQNc28SM+ZbCDIg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dj8TcabFNhq05rAt7AsXTVAM84nRZ/b+uVqNN2r/rae05Vgw/x+JXcYRVt5kku6ou
	 qC8etKbAKrW1If4ZU3phXQaonx27LAJsvgX3zDJ+k4J4HX8pMz77DVH7KUpQ+EdkTa
	 mhAUKDPUHw10OaSZllgdWDR7k1153PKE9DeC07QTNiem0Oxy1uE/v3/0acCqsL9qXs
	 4pEJHPaa+pe2a1OnDoi/RD56Zrit1pqUq7kDOy/Lm0GKK1znnF6v55cjpv97yNL+9h
	 Zyiv/oWQss1EmY0pnoi5YuOImEHZjjyeuxcN7FsvyM3DxYw+GLSzDBmU1Sa1WjJtzs
	 WsiIx4P8f1mRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC43E41F01;
	Fri, 13 Feb 2026 19:37:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B24283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C18841F04
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN3sbFiJwGpA for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4006C41F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4006C41F0F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4006C41F0F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48068127f00so12888655e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011408; x=1771616208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2sr33yf+H+9KRhrv2Qw44YJ9U6kPoJ4g75rPWcBmwC4=;
 b=SqowDAQDm+AnyZyIHy9a4hefTh2sc/MyJzplKuBCkroSyTCds38HRiOJcVq47cstoC
 b0mhIPuL5godiAR/CZ2RctaXSqv5SjGtxz2YX3RWZZ7Wi4AJs+CYifnZe4WRacARzvft
 4mj/3DvH+tiX97n3rK6m3rAnJqzUGpwp3963MLnPubLRYkLakC5ugUV0lcLogw2/VaLe
 c7+CLt6INtW/nWkcpAEQHZCraqCOorrpBl315l7CXL+rHr7jCk7FEgQdGS25KFDtMbac
 cblJ2xVVmozEZ1SeOWCbq7rWmZYeuwZoTOJYP9rJG4YrT1iV9Toa6kTaHblH745dGseK
 Pltw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDKl+aAHez6qER0rOQ7s5MS6e4UEockkD8Dj+X5Yxmm+Q1wXHXaLoWg9DKCSx2t5E66S8tWVO3fT4=@buildroot.org
X-Gm-Message-State: AOJu0YyMQAAtOWqeEZO8gOVEvwjlJGBkZq7tXf8MlTURmhfo6j16XjS1
 hQgy+9QAkDfXY75W14XYF7KlXsIs668w93yIL2wes3CEvqrHJM6KcajDCofdRoX5RBc=
X-Gm-Gg: AZuq6aKNEyf07j7J1x9zRr99bfifjZuGooZ2YquYh5tsmjvAwbImo+xd/uDThXROwyg
 eSwlMBqLUv63udNGBY02wbRhVCQPppgSasFcu6AiJ+WVhNykNl5zVkGAEo64+PXhX+g8AjXG3Au
 kECAyZnyGxo1a+NkIK8Z+p0KTzRRmqLt+K6FDpCgcFGMMVYdInck1jLIpnpo2sCeVBD2PixJ+Xq
 BM7+9mzHThJxh70vEBtUUs9E1l83sO7TWjEh5vO8EgzDYG6xxdBTs1MO0GfwzQZcg3x08VqjFkk
 xH+eLeJ0OeUlVFUxfbGOIWRiPIwpFzfKBs0ntszfCrz1Mx3tZCwH8FxTbXk93P65BMijacnnGe8
 H7XTWq70G80kyN5ClfRv85bCGSBd/65ko/8pPiV/HmEornPes69wK8o1tVzJuMEeESZnu9S3Gfc
 3s9a94wRow+CLDNA4=
X-Received: by 2002:a05:600c:a09:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-48373a0809fmr47120045e9.7.1771011408200; 
 Fri, 13 Feb 2026 11:36:48 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a15d99sm34911645e9.4.2026.02.13.11.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:47 -0800 (PST)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:47 +0100
Message-ID: <20260213193647.38179-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103084002.2045193-1-thomas@devoogdt.com>
References: <20260103084002.2045193-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011408; x=1771616208; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2sr33yf+H+9KRhrv2Qw44YJ9U6kPoJ4g75rPWcBmwC4=;
 b=Rj1HFyEjkJtP+woWQK7z8QSryQLYoAeABITiX0WyEUq1WY1PLNlwpp6ma82VVY2fQy
 sP9XG9dKGn8t/7QEDioUr2TfupMj9QZEX95rq2oYSLRVtoNVVAxuHsGkN7SX2EhoAhq9
 80lqij1RRsxObwF1+1wnNnWqV4UQf4S/WdSjX4ILUt7AwF5/5RjjBBPPRIfE6rbNzskT
 endcQqzmgzOBw1UWLDN/xsdacrNvwmg4wsCb+lk9CSGI/eY+kPJftKlp6vd9Kyr3fcAL
 CDL+Q6+Mt8LdWP4X0wwXm4C3BZOSJ2QP8YBesCSTkAsBcC74BSkb1gHzgassi2m60fsM
 5sLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Rj1HFyEj
Subject: Re: [Buildroot] [PATCH v2 1/2] package/mesa3d: explicitly enable
 llvm for host-mesa3d
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
> LLVM is already implicitly enabled for host-mesa3d when
> BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER is selected. This blind
> option is automatically enabled when LLVM is required by drivers such
> as intel-iris, panfrost, imagination, or intel-vulkan.
> 
> The BR2_PACKAGE_MESA3D_LLVM option also independently selects host-llvm,
> but this change makes the dependency more explicit for host-mesa3d
> builds.
> 
> Note that disabling LLVM is not possible for host-mesa3d, as the build
> will fail with:
> ../../../br-test-pkg/bootlin-armv5-uclibc/build/host-mesa3d-25.3.2/meson.build:847:3: ERROR: Feature llvm cannot be disabled: CLC requires LLVM
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to 2025.11.x. Thanks

> ---
> v2: Explicitly added the llvm flag to host-mesa3d configuration,
>     see https://lore.kernel.org/buildroot/20251226101445.2b29f439@windsurf/.
>     @bkuhls, I can see that CLC support is needed to compile the intel-iris
>     driver, (commit 317260f "package/{mesa3d, mesa3d-headers}: bump version to
>     25.0.6") but can you elaborate why this is required for the generic
>     host-mesa3d? Perhaps some llvm related logic should be added for the host.
> ---
>  package/mesa3d/mesa3d.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index e41bf68d8ec..09b098628ab 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -297,6 +297,7 @@ HOST_MESA3D_CONF_OPTS = \
>  	-Dgallium-drivers=$(subst $(space),$(comma),$(HOST_MESA3D_GALLIUM_DRIVERS-y)) \
>  	-Dtools=$(subst $(space),$(comma),$(HOST_MESA3D_TOOLS)) \
>  	-Dinstall-mesa-clc=true \
> +	-Dllvm=enabled \
>  	-Dmesa-clc=enabled \
>  	-Dplatforms= \
>  	-Dprecomp-compiler=enabled \
> @@ -306,6 +307,7 @@ HOST_MESA3D_CONF_OPTS = \
>  HOST_MESA3D_DEPENDENCIES = \
>  	host-libclc \
>  	host-libdrm \
> +	host-llvm \
>  	host-python-mako \
>  	host-python-pyyaml \
>  	host-spirv-tools
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
