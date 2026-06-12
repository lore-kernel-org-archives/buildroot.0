Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD6BCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF8D613C1;
	Fri, 12 Jun 2026 11:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxB1eht6Cqqc; Fri, 12 Jun 2026 11:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFCAA6138F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264311;
	bh=riLb39nO6QhBNKOXsJKySPrbT+/pJX3JA2c3OGM0aGc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OQ1OPDSFbj3wFAbzoLRru9SaFLi7JQbs/GWtwmGMQPb2TuvcdSfwyAFZNu3h4Y2xl
	 UWlrMAWQmmH+5Pi8hDu2nxR7dfBCfKzNURusoLhE8UgFCcFI+MPAQ52v27/8+vC01R
	 aYLbcNDSct7hQS5jhbc3guSufN140hEqH7IB8+M9atB33jv8mYViinsC64ZHDuEiq+
	 OuPUoW985OdpFAkmol6pxRVD1CXqLuWW5wNnd6/x8Ysudh0MSrpctGut8JPLpUoKA4
	 8tVAbBiVluLzMFT3I3FELbeDvVCTq+Lxw1FOVQAaM0dRrdmHJXFRHo8qa32imOOxWw
	 v2VI+iEP3NcHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFCAA6138F;
	Fri, 12 Jun 2026 11:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3F2112F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948BC61377
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIroThZSvC9g for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7677361313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7677361313
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7677361313
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45efb698ef2so426203f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264295; x=1781869095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4YVRodc1+Nl40aaFP3DVoEmXiSlP3p5RWV6XpyojwGo=;
 b=KmyBT2eDecC8OLfu/yDiP1nTl9biIldpRl0sVPjjhKEDuuFtTVxZRhSAI2ywP9wCER
 ZCHUk7AGi3wv0Xu73aaCnhmoww5XwuEd9KwvR1f5BT/NOAiya6olHxxBrNBvQzb411H/
 7UzD4ySD12AqRm/uDYNHXIuk1/Iv9wtPUfh+TUTqzZE6O6ZhiOCRyY977qll6trZfqKI
 gHWgwVOQeE3T3EU2zgLe30fO0tYVwV0uwiw9N59aW6gEEhn/RT/SKkMhMTvoaKQafTJO
 X96u4FiC/IckZQKLv43o6yUuG8ta+Pr8WzWRweOreI0IkDKvGBmhwPhB17Ib9p1uPHxL
 kJUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8OGamWv75mx0XjEnIrAmZ/THl+2uq8gWtLfNFMCp5CIg+lUzXKBx6LVrKZ7BXWdLbR4FvIIuZaAiU=@buildroot.org
X-Gm-Message-State: AOJu0Yyl1xrdl3hq7G8O3Vgnqevm7t333nKNVI8ncppNOWfeiSBYQGfg
 Z1FIRll6cxmjZc2xiqL5++5AgK8NVR6BJXKW5cl5mouQy99yxhxOwwtEdYv/9briXn5CpqcSorP
 QTejq
X-Gm-Gg: Acq92OHzMWwqp2qnrNXYqEDrtohAx7oLWesK8oo7tDIPzz2F9xpiGXQOGQVOpPn/HLx
 Dmz562+54o9XXStJUCBo3ymxSZSIwWgwKEL924R+6s8U4kxyqNVUX3trBMTwNxHzXMHguPYUX3/
 rwcVKSWxsoxELdEoDQ2D8SlNClXK9xPiHYFIAe4I6LmlGdvkrUvuwlNIqG0EtpY61e//dAYuJER
 xiW5Qty9Xth5MM2dsmMEBwBglufplJX5Ed628iIbYw8w45d7oCQNFIjy3IrvFwiBwOlvmvTnqZy
 UPkcyQOxtajIbN507GcUV3VxmT9BeKZrC8n6OTMeDqVkx+L5cg9NPoqmmtnElQNsnjfuGVs4rYm
 ezAGiEkBlGvm2LYRISafM7AgtNWhDkq7C8+kio/sWtzfF8xd5r+HRZCriesTweHfjVXnSbjp1GX
 n6VVwe8FBihQeRE4CjReBQ5+9Jjg==
X-Received: by 2002:a05:6000:713:b0:460:e2e:6e2b with SMTP id
 ffacd0b85a97d-4606db9f2f2mr3732089f8f.20.1781264295489; 
 Fri, 12 Jun 2026 04:38:15 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0bbfsm5011511f8f.23.2026.06.12.04.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:14 +0200
Message-ID: <20260612113814.253348-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603151317.3499635-1-bernd@kuhls.net>
References: <20260603151317.3499635-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264295; x=1781869095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YVRodc1+Nl40aaFP3DVoEmXiSlP3p5RWV6XpyojwGo=;
 b=G9qKDJ1yRuHFO+2oW9vHxx4OaLd5/hdsDXMWm8Km22WwhbzULtWMr1uV0wh41hmR+W
 uaaexRJ1IECR0CURpDLrO1D3/Vcb4RqC7URjgW5H1lMz3NdEBQpag33jXJhsEtC6W969
 8oFDe7inFB7WrvGauAGc/L1BEOHeSRnEdDay7u9HgnF79PV8QH5W9i5rI4+bRu1aNB9Q
 L4KdOzeKH83a5GQ/WZCU/phfLH8k/UZ2eHlP8kSk6VQK0OwgZeJy4OkBy6cIKsiugELH
 gYtSKRYPNfJVzdZkNBM1dEgMzZk/e/mOiiF0Rzr9kNFOECmw9wtggtd/OlRbXNweb8/J
 +UEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G9qKDJ1y
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: security bump version
 to 1.6.18
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
> https://lists.gnu.org/archive/html/freeipmi-announce/2026-06/msg00000.html
> https://savannah.gnu.org/news/?id=10898
> 
> Fixes CVE-2026-50031: https://seclists.org/oss-sec/2026/q2/794
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/27487f8f0d8776aa7d84a6e415932322eaf01505
> 
> with the exception of:
> - bootlin-microblazeel-uclibc
> - bootlin-mipsel-uclibc
> - bootlin-powerpc-e500mc-uclibc
> - bootlin-sh4-uclibc
> 
> due to build errors already present in version 1.6.16:
> https://autobuild.buildroot.net/?reason=freeipmi-1.6.16
> 
>  package/freeipmi/freeipmi.hash | 2 +-
>  package/freeipmi/freeipmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
> index 9d06be8cf9..97890d3a17 100644
> --- a/package/freeipmi/freeipmi.hash
> +++ b/package/freeipmi/freeipmi.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d  freeipmi-1.6.16.tar.gz
> +sha256  8098b23820038ad0aa39abf0f9a012e24683d384d9f91e760acb2a68b465e0fe  freeipmi-1.6.18.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
> diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
> index 0581b931b0..38a9adff37 100644
> --- a/package/freeipmi/freeipmi.mk
> +++ b/package/freeipmi/freeipmi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREEIPMI_VERSION = 1.6.16
> +FREEIPMI_VERSION = 1.6.18
>  FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
>  FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
>  FREEIPMI_LICENSE_FILES = \
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
