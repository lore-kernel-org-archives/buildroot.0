Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770D7C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 14:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038D584B53;
	Thu, 27 Mar 2025 14:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csbRz1q-V-LY; Thu, 27 Mar 2025 14:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCBA84B32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCBA84B32;
	Thu, 27 Mar 2025 14:42:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6936719A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 14:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E45608FE
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 14:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3VqtIK9CgMh for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 14:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E5BC608A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5BC608A1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E5BC608A1
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 14:42:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-391324ef4a0so123547f8f.2
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 07:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743086571; x=1743691371;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6PJXgOeuVqcrYUkGWEQjLIScyhzsbGoCTi+nAiZ5DE=;
 b=NOZ2SZxL13/g6qJobKqGg/pwSR4ktWjAAWyy90GSqA+UJxNYhJUoyfHPqfM320aGDy
 VMj3PA0qOYXRUG2Cii/Wm9ChX941ZIO/BItitAa1nTowo0NQ34dOTXUJb3VP1NMvTrjj
 IzaxBxbfmA1O0iQHexwqZZFMkJLxLeLNgTW+bAkG6S+j11FQXCUQIIR8SHgy9Tc1kKxV
 iIOrrGqMc2VZe3j4QT8Rl8NI6H7ma7r1uQs4rtQDifWfcEEkt98nNy7iNGSNtp4BE3pC
 J2rOyvuG95R1XSzVYTNs8Eyne1zl4Rt1RQe69H6ZOgQkIKGaDnpA4Lm3N5E8TKkNMDgp
 Czqg==
X-Gm-Message-State: AOJu0Yx9Yu1NrJXJEt8/e0jh6K0wpJah9cqEHV6VEmRZhpZMGUTQiHpY
 qVrklb3n5prT5/+BuecSL1fxJhAqXGMBkLldtgjPhxOQ2PeMESpQ
X-Gm-Gg: ASbGncsEP3BiIeChcLB6ZrnFFGCj19sxLHyAedT4tLq2WGFnRv4mFo7VepUcDH3VVWs
 gm4nUEspTkaqYNJ+uudGD//jB6oNnTfRDmIlPP8M6z15FCu+ZDrPvquij2qrlI7xmaP2/IJXTdW
 L1eCI2inEwzu/Z2gFobBPSk15Q5GVtMioMwtlVIz2cy+a6NZcwo9eahXi7ZErHPP+9L4pekepsT
 wIQt0e2ZHW+8l8MDEDQmKC0CckQvPBOv35EBE2+8sHvSW2I5dtnS/AOMFVo1TrNGUJSmOW1gN57
 tHbRYz1CwqXFkd+0naZL2zq69BMIf7cC
X-Google-Smtp-Source: AGHT+IGaQDnMTlOafbFMui5qSuvg4P2lYEnNoPUTIn7RaEN0idy2ayTw6RBSyMa7ZS+zBidHdUralg==
X-Received: by 2002:a5d:588b:0:b0:38f:2ad4:6b1b with SMTP id
 ffacd0b85a97d-39ad1788eefmr1307383f8f.13.1743086571154; 
 Thu, 27 Mar 2025 07:42:51 -0700 (PDT)
Received: from skbuf ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995611sm20483819f8f.15.2025.03.27.07.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 07:42:50 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:42:48 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <20250327144248.ajorwy6g6sre4xn5@skbuf>
References: <20250318163228.9989-1-vjardin@free.fr>
 <kxf5rnunnok625w5yglz2hhylmha633bvma3sa4mcvnjy5vl6p@6jl2dapqadt6>
 <20250326142045.do23qo6dh4qkgu5l@skbuf>
 <cvetqerrphqtbap7sl5kwuanjhgfecwumd424gs4ib457kpq6d@apo2ws24aqxz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cvetqerrphqtbap7sl5kwuanjhgfecwumd424gs4ib457kpq6d@apo2ws24aqxz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743086571; x=1743691371; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H6PJXgOeuVqcrYUkGWEQjLIScyhzsbGoCTi+nAiZ5DE=;
 b=ls4EOEELnmcpATXuYx4hXnmttRWbgEamPBsFVlUTExBhDv7d/yfADlDmfk0y5DJUrV
 JWNulrODPprTIWC3aLcIOq98r0+JX9V30xn5NAOft1RvmsMZJ/W44aVz+VRbHe4XQtdD
 UBffpUXC2oCgucFJGRKJxFgfvdseZHeiKJf4UQylIrdleM6IwZTn0pRge+C35iSc8E5Z
 wenX3apj/f2UL7ozJZNxkM+NYFY4ACQTKprvbuya2ZbSnGmEFz/kii8xn7G/XO5ozSmB
 sZZwdlwCQi8kOCvLoptx2mEDvm0xCw4gAetZLwnwJhCgsIrvR/GUU+La5vsRVAztsvQg
 Egpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ls4EOEEL
Subject: Re: [Buildroot] [PATCH] boot/qoriq-ddr-phy-binary: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Mar 27, 2025 at 12:46:47AM +0100, Vincent Jardin wrote:
> Sorry if I was unclear:
>   - the signature will be a support I'll check and I'd like to
>     mainstream with Buildroot.
>   - it seems for me it was better to align it into the boot/ folder
>     since this blob is rather loaded soon by the LX2160 ; so I was
>     inspired by the Marvell case.
> 
> I do not pretend to have enough expertise with Buildroot, but it seems
> for me that boot/ is a better home for such package. Maybe a Buildroot
> maintainer can help us to be proper aligned with the intends of the
> Buildroot's design ?
> 
> Vladimir: what would the rational be to have it into package/ ? Are
> there some other cases of boot-stage firmwares that are into package/ ?
> Maybe the package/freescale-imx with its FIRMWARE_IMX_PREPARE_DDR_FW
> could be a case. What's about the signature of the IMX firmwares ?

I don't want to compare with package/freescale-imx. I think it's
sufficient to consider package/qoriq-rcw/ as something which is more
directly relevant here, because that is already used on Layerscape, and
ATF does have a build dependency on it. We do already have:

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
	bool "Include NXP RCW in BL2"
	depends on BR2_PACKAGE_HOST_QORIQ_RCW
	help
	  Include the NXP RCW (Reset Control Word) in BL2. See
	  package/qoriq-rcw/ for more details. This is mostly useful
	  on NXP LayerScape platforms.

so a dependency from boot/ to package/ is not something entirely new
(though not required here, at least for now). Still, maybe it's best for
a Buildroot maintainer to share an expert opinion.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
