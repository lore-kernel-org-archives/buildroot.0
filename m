Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720BBC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E2D60B3A;
	Fri, 31 Jul 2026 12:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CnAGhG3Shaa; Fri, 31 Jul 2026 12:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3817160B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499520;
	bh=NuvbsZ9+Du9JuPxCY/0LN/bHy78jW2/WVFcN4zJSwkw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iwga5VXI3TXKESqF2vLTqIZ/IhQRM3PL+mh3dc/NTtmvUPgWjiZ083KQpgbzm1C4g
	 6fl+pydiHcyNvwqJARlv0aglekO3D2iGqS5pMzL5IbKhDUcQuFPtEeJ+wj2PH/keHD
	 vADGJuRCSHrAmGnINxAoydHfogERFwKRg9v5vwF6gJQZNw4CPCImNRtulLt/+ceikn
	 tTcbEsLPEMX9zw5N5LahWWkCiwK/YeqGqmy0mP9Np32fdEefxcT93AK5MKUcgPwNPD
	 7kuGoreoTi1jnAGsdqFyB268ywpkXCSa2KOt1qqLfF2EnxnKJH+QeBqpOP4GxigXYe
	 o0qXH3MQjRAcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3817160B26;
	Fri, 31 Jul 2026 12:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BC7B27C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA30812D5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrwnmMKjzAw2 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC7E2812C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC7E2812C5
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC7E2812C5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:15 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6984169c126so1642095a12.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499513; x=1786104313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HQzMzCPcJTo0kPvrE4c6pMT5EkhPP6Fq77OgZqhl35k=;
 b=BnzpJO2MMlxVKdiqedY9Q6Ghjlm0y7/r+YFYQkud2lH2M3TSgNK92fbiO41nTGIQSb
 giGPaJJ2w9R6NggTOvh0/nf9bRRsmMcUlP+PNsjig2YwG23ZIwLEYrL+T2foozV2t64f
 b0MOs5bWBx1MYtoQ+4ShzA70yRRtyHtUes9YhPgBDkfinvioYxY6i0tZ/FEIXFlP5XcD
 ZwdaYUoGGbI7PimLByqIrAI25HMRkLkOshwUO7eiTWA091IanD832dKgVhX17zhOFfxX
 kWmuC9WAN5LvWfTOb1S9EvuQJ9Ft4qePEE0TpbM2zak48eeBUiC+wnpWY8ujXeymVSVC
 GZzw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqguxj13g0Q7ECGzf0SSGkl3bkHuPDMqq7kaRkr30taA5yjKRXTMlJRTcQfT4WdTg7TQV+35fQSEd4=@buildroot.org
X-Gm-Message-State: AOJu0YwL8Ui4sS4KOQ0gSmqFktehqq4+Z+au2Z19fijkM3KpEmY28m0G
 fyBxAQbY8G53JSJXPPs2mCnhqUcjgZKA0YMOwDgaxeqcnQ7AWZMn8TljJyUH44AVIvo=
X-Gm-Gg: AR+sD11ts8ZyuGKY3six4ALEXfYxLgZSLOccPwOHqgV9C/73q1OrBJWJefTF9JMNwji
 1Q8g0T+zchvTWTrAYjpsl5YW0lYpVdQ/UVF9h9AA/C526mvHF4ncIzk1+/TxXPBXotZcvIAMgBK
 nOd/pekesKKU5/TmtGQobfrYPeveLn9jAN5w0HG/lR99nOqyppauqmfV8TmLOaniSJ8b4jL5aQQ
 XyikJdhRG+LMrtefNJppDrYWiHnH/j+M4mqATS0jMaS1PiLJeXMDkMivhQAe1H5X7eI3chTDEI1
 y6ziH6uZGKdIY3x9jGZ2gUpCRnuUO47HrtJOU0K3Nz9gJ4nOvwJSQ2qSi5V0Cdk6oL5pFepBxqR
 sjSaxG0cb5+9AF1niuaLjHoXKKrbB29zgGuS4rmiFYyvDKWMLu+/CLFGywk9LSXAJ5kpVGxDtAz
 5ByE+lGsUSyqLz1imbXxcURCv6cIH3TpN2te0Zqq2tWn6501PDKhLWyQPvuKuqJ0zN9+nqIPBLW
 LDqkvSvnLBT74d6CIA+Fx+gbA==
X-Received: by 2002:a05:6402:501a:b0:69e:8ad:5162 with SMTP id
 4fb4d7f45d1cf-6a0984e0239mr872271a12.1.1785499513429; 
 Fri, 31 Jul 2026 05:05:13 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e296csm4182014f8f.12.2026.07.31.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:12 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:11 +0200
Message-ID: <20260731120511.3391-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720170437.133823-4-fiona.klute@gmx.de>
References: <20260720170437.133823-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499513; x=1786104313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HQzMzCPcJTo0kPvrE4c6pMT5EkhPP6Fq77OgZqhl35k=;
 b=FwqseEJ1U5fcJsBDrBm6NZ6XGLyM6TXSL3UC1AL/B9t47JwuEnVn4QgzVycB1SMEvL
 f4MZVwTVU0X0vtx98tHAdn7g2V/wR6eBnJ7RDX1SgcnP84qMrmhom0Yl0rIDOlyb+gbM
 6GmtaEsi5AuLwwiIYyAzG+0dPEAXc8LWmSoLVITcaWSUKR3juIkezhuco8bVWPR2A1/1
 1lj0C2wO1z6cGnRgJiUcpFGc/glx98f1f16kgv+PvEPv4SNqW0iZHlSupVBl6kWyAhTF
 oHbPBR4UeymUMb5VboyEc95QZwijTUQN9lBp9sm+I2g+65BGEDhG85VVtKYnxVfbl4Hk
 dz9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FwqseEJ1
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: use SPDX license
 identifier for bzip2 license
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
> "bzip2-1.0.4" is not a valid SPDX license identifier. The license text
> in archival/libarchive/bz/LICENSE in the busybox source matches the
> text associated with the bzip2-1.0.6 identifier [1].
> 
> [1] https://spdx.org/licenses/bzip2-1.0.6.html
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/busybox/busybox.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 1d804ec5e2..a13b6ee480 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -7,7 +7,7 @@
>  BUSYBOX_VERSION = 1.38.0
>  BUSYBOX_SITE = https://www.busybox.net/downloads
>  BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
> -BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
> +BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.6
>  BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
>  BUSYBOX_CPE_ID_VENDOR = busybox
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
