Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16857EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9355615A2;
	Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_MTsjhYlcAM; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F62F614E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011425;
	bh=G1eKjeHAU9J3HSaNRCF9bv+fJdr4oRHqYKo5WBC8Eio=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I2l1YgDUY3C1xFdS1N6fV9BACV7Ai91+CDuTnMU7EQC0cbfT4GWm6zYSzb6VT3Uch
	 SGC4UdB7yUrXUeR2fS8qB7hIuTYOMLRPhXV7GmfK/r7N8vvcq+fDtvUVDCRb1waESm
	 2d8enF1MO9c9dK9lsPuvHmzHCT+lFqHgriBnqLjCwTZisQSA0s1p6c1oNIsnxcxX8h
	 09kcZAOPDbBlw+NN80iSTIupCbcJhs8pbOITDnKqh0upleYkwhnKH56z0gukl7/ol1
	 shGfmvR74ELbFdnB1JvI0Qoka1E10F5/L62pe1t1Sy7v4QfeG7NNnqpib9/2JfsBll
	 CnyaEpfnTQygw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F62F614E1;
	Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EE669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72FDB412A0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBQYuZ5QLb8c for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CF75412A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF75412A7
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF75412A7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-65a35fc8007so2140938a12.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011383; x=1771616183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6VJRpgTa5XI9/NkIFhzrMp2BrpPvHZl/z67wWSGOrNo=;
 b=kb9eZ10rSUy7RomaWKZ/WpEYiXzLYQsD94/plUY2KnmBp3eAMKcubOVIP9ebQvl95b
 P78r8q0pEPp121sq80VdwmHL0PKMRhrYi567OqgXlCdNnd/Y24K0r1Q4Tr6rVOGHMZwd
 8eWjM4ZxdTBwlT90WJ1ZpmUP9gZPtYO93eYr68d/2o29UlI4O/ixDpEt8VVG8fDnDe/W
 9TICNuSrfA+o9rCVRnwE1djzaMXx9R8WccoJe7Yn7hQ5Kby1cSLiz1O77wcOkrTjSgKA
 RPJ2zcjhzfqcRXs9D5X8dj5bfJ5mjJLznqzw7j8CYjNmwtMmW9Sgi1uiBvmk4zxEWWVK
 J9rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYFmYDxRpNiIMqe4L9hCIIo/ECRMkl5u8u7651MBcodDrA/gUHK2Q/q01YSVM9ubVyrdBrkmmzFiQ=@buildroot.org
X-Gm-Message-State: AOJu0Ywrcl0zHW+I+8VW2TsY7cODH5MmZ77djdZiAvduZwty0cKd0iRr
 OHYqsMNLrOM2BzOoPlltxUzRxG7wgiI6wtuLGJdZYqV0SHdA5ouPjkKUzek6RkcM1uPavuetiay
 nIPdi
X-Gm-Gg: AZuq6aKM9VXiVdLg/Yo88mw/k2ZfpFFRyfhvwoqAMC2szcT7RNDrqTUURjLRABTfvEG
 Jeb842M9RoAbD7hXxhZ2LOCbiCueuz5nRNFaJNtUA2hAcFMFa9mbJ7sCPxdXzFMCsGP9UMc0nov
 uvzMwibEK/+Fb5kIuxnTMDLWombPMSDaqA8HhucGpe8XFKch7Q2DBiqd48VUwaGB8Tp2KK8bDDf
 xR7hXwLXbRRBAStAf5gsFAtDp8OfZ8tlrjKzEeouwFMpZNhwjpx6sQzugzel3p5Tb3MTvcfLS2J
 Dhzam4ZQpC7DweQt9eBYZKuJku2lf7jIqwOvO+PBmgVbAzK+q6PDnVcmWsSdocfJ4NjHCgbr3WE
 NqF8P0CkrMTtuNCe1O0ved2h0urqwIsyLD+3sSW8DUDVA08kdHZxDqtA2BhRk7Y1qBqPTKwYTgg
 sSIMA86MRxetROG3I=
X-Received: by 2002:a17:907:97d6:b0:b86:f194:9eec with SMTP id
 a640c23a62f3a-b8fb421466cmr167353866b.18.1771011382761; 
 Fri, 13 Feb 2026 11:36:22 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fb629c936sm65694966b.47.2026.02.13.11.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:22 -0800 (PST)
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:21 +0100
Message-ID: <20260213193621.37266-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251010125430.1253718-1-thomas@devoogdt.com>
References: <20251010125430.1253718-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011383; x=1771616183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VJRpgTa5XI9/NkIFhzrMp2BrpPvHZl/z67wWSGOrNo=;
 b=DOd/GZYFLvDoRTPFzIfd1TYOBTDawCUHyV2+eWjXeAa9exKQUvmVUz2WlcFrT0WRA1
 a4jogP+xR+4o0obVJ8DxW4WBFU9J30MIdGDMHVasgHsNyj9+Fxk8lPe6AK46K/u5tKLA
 lHo2Rr8CrQkzKCUsZRkm55oaPx6y8chbM1NfuX8WTbCh6+Ug/jU7lBZAebxd7TAlOKop
 QFNzfT/cl1gdJuUk+/YOgCVMoCoT7ph/xElp7oGLpVDiuyYXYsgjCZsgefhxlUNCI54q
 iq2JvxxB5d1PCdx70d642fyDohtYTLofL5rm9kapa8UAkuZh3Dc2EO9brRid5nu5WnaJ
 9drw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DOd/GZYF
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.50.1
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
> Release announce:
> https://webkitgtk.org/2025/09/17/webkitgtk2.50.0-released.html
> https://webkitgtk.org/2025/10/10/webkitgtk2.50.1-released.html
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to 2025.02.x. Thanks

> ---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index fde2439dd5..90304074ac 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.48.6.tar.xz.sums
> -sha1  8f8e27722b29be5aba84322cf7252fe14afcec60  webkitgtk-2.48.6.tar.xz
> -sha256  d9ac3034b7a39c2aaa567e6112b3124b158e591a74439e46974a031dd0e44e24  webkitgtk-2.48.6.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.50.1.tar.xz.sums
> +sha1  b599be86497f57fc5b2eb8b5d60ff181fc651752  webkitgtk-2.50.1.tar.xz
> +sha256  33e912ee6e3cdb4b9803715f50686af85a60af47f1cf72a6acc6a2db1bb3d9fe  webkitgtk-2.50.1.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index cb66641e3d..0b6a1383ca 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.48.6
> +WEBKITGTK_VERSION = 2.50.1
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
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
