Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D61CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4DD40A44;
	Fri, 16 Oct 2026 15:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaYZ1O76dnsj; Fri, 16 Oct 2026 15:02:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 97AB240A21
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162946;
	b=HGAOmRa0eTlkbNsHdcCo+jC1j/Jt3fmKJ+i7hDDnXVWolQnDD0peQZgz83mUaqdm6hiO
	 0cDryYOBl3WqlvWnbghree6AkRuuDT+Yn08cslW6CBA9LU7AYHuLNhv3MQTnrWXY0CNJK
	 CVUa44bxwNFFoJP1vxMSkhINsB66jyqYFAEaEKnkSGg9zPGcl/hJgA4aaB8LmubhdAbgr
	 Ob3XDAWOl3rDAvyCd3ALehxZe2GS9IMlu5smBFv+yck056N8oV280gZUz48ioDM64oMyj
	 h/L+hxzTLGg43EYd9RR8XxzCwvmsevWPCOTeGRd+3n3w+wlsbTRp/2CWDSe5U1agPvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sbcDRBCuq3RIbKGaBcJkT7rBFTvD8MiLmgaD/jsWf7w=;
	b=Pb19Yc8QoSWRu0XPEtHGURYwqc+IpN85/0nUMzfSvs4VkFOKaxbVRMCnCQ7E41LC+WY5
	 7v5wRibgXrCli1ERCbH7oAQobZi0lnRayzguPotanM3QRfk6ZoA6Zo7rXZoZmjDLN3BXN
	 V3yesov0vnslw+3IeasERsRb2tKSVtwQ7oRFE1CIzIMPlg+hsbgzp+OD1B8cqg7pWsTTk
	 gltErwAq2Z9fDb9+NZWR3GZRvv1KWihTIBmjJOdY9IwI/Bf+Q5f1ezJeaYgl3/VwEKzuK
	 rSogEDYYjUAW4XOC1ihdD4fnZhfnussXoTLdDoc37P8DTK62c/JNVUOuAbKFx2m8+jw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162946;
	bh=sbcDRBCuq3RIbKGaBcJkT7rBFTvD8MiLmgaD/jsWf7w=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CiqXrtwq8m8qCbyuRj+mpyJsGOqFtJNgTxixU1kWiUD5yKmRMqajD23UbrkEU9Zg4
	 nD3YdorRWXXMoK2Ran3cOBpx5U/CI4bEHoYEHtaKPP9osoLLg5f11PGTag1z4kc+vN
	 HpkysJkKNSiD1Nowi54gN6VaoPZC198HHxbMEboW8aRb71abnVRrCMMeiT69p1P2mu
	 ykOAeqm6dOzjT1xsKDomoyjgaSf81DWsuIAS8qVp/hveRTtqCSzpRHNmUiCtzdtOy+
	 iGgpfeSxklRzUZl5hABz4fm002nuKi53WphdRNK9DSiGrV+B3t5vQgvHqJOft8mP65
	 otyEf8zpR+d1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97AB240A21;
	Fri, 16 Oct 2026 15:02:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABDC5255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91E6240A38
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-kTjgic197k for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C0C0C40A44
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162944;
 b=Y4UPIKbMdTjkmTxmWXDHDYtQ/BatoSCcyFv4M+gdI1OFROXD+DTwnPSKMuk6sBs/UoT2
 /4bnXfxnN99HtGM+3J3/z49Qe/erhmsoSEjX6+67zlvzwvwkfA5WIOa6e0JzC/pPXUFgB
 JhvAuf3zSEwWCC2ClYZpT6kjuuvn+RS1vJ77dUe9ly5wgFtrZaJrnn1mI2+357FPDcI4J
 X0CMqjyw363ZgGGnBZl1A9rdIpZDtoPNvqEiN+ubul62Y7Q8La6599TyGvOKiw8yc5+47
 Bu0DN+4/JRAic6Pl14TLcT7A7Ys05kdIXn3LO3zrawBJT6KNUH7oamsL5IphYwNBdIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162944;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FCILZD04Mvxb9JIF0QHagQbtIcPhTKGtucdSUL/c8FA=;
 b=Eienv7UwJ+XLCCx52+ZIGVuU5GJ3JsLnv5of54SsJChOvvbZ8uEeDmrl0pH+qERdtxQ2
 43+XiNMQ3A3pb9/Iv0eOWqbOitEaDe2Ld8FX4+OH78XjC9QjiNuObxAr424ja/fHCYjSd
 +pFswxYdzZkRyuutUC2V/4ZPQm8BvEmuUZ6XizHuFBV0eEybfNBclyMb/BenPvm5iy1PS
 EIdvbjo0vHk0c82yEYgH39Rwt77I9roUtecv4SkfeEXuYAknYMYkolpcVWukjHyPbT3Aa
 AlmOoSnpPhT0eokrhgMZ6tNL5BwAz4GalJWtF8qP8n7/5AHN77MUXJKehnHNVvQQg2g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WJFuVCKh; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C0C40A44
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so723390f8f.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162941; x=1792767741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FCILZD04Mvxb9JIF0QHagQbtIcPhTKGtucdSUL/c8FA=;
 b=lTB3+P0cnbbG20r30NUZq395AO+MHbvhNDnER9nKjwjVKwOGcye0exrn/qHYGHtdtY
 A5GEwOvrgZQyIoS2R+sUKwFgU/+YQm7144e3xQtlG5KDjsayAt25mK8sy0QenRmf6PLi
 pVuARLyeznDqzawPtw28x3WEUBv+NpUG+Zgl0/nnwQjzsUUIRhUwuA3IVopgV7jmBjTi
 LW1oYwVLJx1YDQe8b9JSnMW/tR42F3oN6KVLdccMgJhYWiID7sdvr0s68Tbb1rxoDNTO
 iEt2JMty+IvfYK2kG0pcqld09OgCRRlIhbIz1qpkJ1+gCUlPIFCeWepHaVRLda6fefuD
 Thnw==
X-Gm-Message-State: AFq9FYL92VL6w7YNr+9696kGsYDeP4++hDFMnr89wyMYvOSkzU6/fWM4
 01FTcjMvyMBDv2hOjppSZlvptaoEqT/0zyw8aNyQvntCyrbr3Z9H0FEQw7nkwQdmygo1fgoQcm+
 1CQBnfyo=
X-Gm-Gg: AYBFou1Z2JGgB8tjcSGg+uR3oKly3PXLGyCxnLLNyILNvTnT0pPrnKM+9WyulAsCiJt
 Nmj1VNJFFEiLJk59lEP3IfC0OhSJQCumi/JWjT9fbW3Ep98XjxZDaMLoQFiA28ji2gzRS+0KZzn
 Y3vXRfICuVLkX07gqeUrVKbpub8MBRIHfQ6cbzC3Ujdnj49KKIGIfRENYJGuz1Y67AIEW46FPlR
 DntU5vH6dx880gZxiEXTmUvB7uJ/9a5hzdjA+gdIeDdo5gZwq5U/OsCoDZ+Nbgw2BKqWf6xT/K5
 lwLozpK1Da5vgY489blYY4ON2qYJ9fnFb5+yguUrEIGBfT0Dd+CezprZBEJ0a0rbi+Wtmob9rBL
 ZNU0JIp3J+nTL39CoxXDMjDVmtTEBWOEbw6kPl2B9x66o2ALqEE+YfoK4BHYU54GWFRMy0dZjvH
 UItw/5fH+Dk9wZSnLkzmtTHIn3Is1/qxlQlW6mRA7GuVLRKejORxjPlAvlUD2xLCifcqic/2LDW
 jNJ9M5ETqldhiP7kHzpYQYQ3eNpw7w6fzoixi3SFNnkJlHaWM23
X-Received: by 2002:adf:ec91:0:b0:48c:54ec:ea3 with SMTP id
 ffacd0b85a97d-48dfae65b2dmr7579615f8f.13.1792162941505; 
 Fri, 16 Oct 2026 08:02:21 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f5b2dsm5957734f8f.31.2026.10.16.08.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:20 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:17 +0200
Message-ID: <20261016150220.60510-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-8-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 07/11] package/patchelf: add CPE
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/patchelf/patchelf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
> index c583b228a3..4642ba26d8 100644
> --- a/package/patchelf/patchelf.mk
> +++ b/package/patchelf/patchelf.mk
> @@ -10,5 +10,5 @@ PATCHELF_SITE = \
>  PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
>  PATCHELF_LICENSE = GPL-3.0+
>  PATCHELF_LICENSE_FILES = COPYING
> -
> +PATCHELF_CPE_ID_VENDOR = patchelf_project
>  $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
