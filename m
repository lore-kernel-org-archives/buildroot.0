Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9CCCCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24ADE83A73;
	Thu,  9 Oct 2025 14:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4PEE9aPzvDm; Thu,  9 Oct 2025 14:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A8883104
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A8883104;
	Thu,  9 Oct 2025 14:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 495BA119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 465A641004
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0-neXUe22ah for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 622434049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622434049F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 622434049F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso820516f8f.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021691; x=1760626491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+I6NurNYSZhueU9JZQPHzQYm8SzSvez1jB1lE5P7rgE=;
 b=j4cn8N3v7V8cVsEFiScQtdXfLnCoqVtwyc2tmYHbdTzwBXB6rWq3MDR9brsy4dFnv2
 aVsiwjhh9i/NBCIZaT6CUmiP8l/yR2JGaGOeiaR6B7kkoAOQa1SWourU6OgVFLmUSVt5
 0eB7CbChYK686M0NKjbjQM0oJ80/0puQVY+c/aa3aMLKzBOIE4cwukZOl7jnP6oDwNe2
 ZytuHol2cg536WjxLnYBA2J3MWIh5lBvSVe781Vs+ihuogXYungmRWcyUS8lN740WLmK
 xxkKmOtqEy9kNNPETNfn40B0iPTvj7sd7N91QDcZRwwiOJ2Zj66FjbHQCJd5MAZDB2wF
 D+gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFZQgCQSyiLRaHpChH4+MRRR/ogLIqYEbDSKyCtu7IE/ejOBOwdfEdOtOBeqm26GEKAygQqdZWOME=@buildroot.org
X-Gm-Message-State: AOJu0YyudL9xW9e0KMeunxAjUtOEi5TOAfLorRmCBSpNxSrtGEdEe8Y7
 g98PLHyOFbyCaMpImvpe4+kscY6qlSPdjub+6RSggRXppvSIhZiADEs47fpalYhdFb6b5WW+lMj
 zShgF
X-Gm-Gg: ASbGncsyPjKIw0X9XqPuKNE23r0stEJTCtWS3jc5EYfI5Z2DY9mpQJTQ1w04iDqx6Ch
 IKuVY6PxxBOAwsJIVkVQvFn90faAAHw6Ah0evDTuunjotUbJaaSG95tkEQE895EovPOxJr2WZeI
 Qs3aZ6DE2JGAonuY51FQUGQT2IuimkJEf/XtUIuC4DiFnS9L8hbRp6u8KlMl/eqUtREIXMDZXiP
 SkHinszYIVOaT96l2rKY2LS5xxIB/sz02Gr6QLL1KDxUMlXWRI+zP5LJuPxGj08O++Kn6wuOwcf
 a56dzLbLXOUtJ83ganU8UQVtZ3QIZabi+MQ/ZWsC6yyQ9A6xRLa4qIMJGC2nNM/7N9+Y6+tzZW/
 NuF3BnbRxPj4HkMna8uVgDzTqwnW3nsiZNl1CnbbI
X-Google-Smtp-Source: AGHT+IEVVPk3HfrcgYPwA9sTmJvQgSa89tK/PvmfrJN9LiTEAX5EBsloRWhf2zuguJzZdc3PE6j/Yg==
X-Received: by 2002:a05:6000:26c9:b0:425:57dd:58ca with SMTP id
 ffacd0b85a97d-42666aa6384mr5034429f8f.8.1760021691360; 
 Thu, 09 Oct 2025 07:54:51 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm35007985f8f.12.2025.10.09.07.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:51 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:50 +0200
Message-ID: <20251009145450.482785-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251004100747.1412268-1-dario.binacchi@amarulasolutions.com>
References: <20251004100747.1412268-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021691; x=1760626491; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+I6NurNYSZhueU9JZQPHzQYm8SzSvez1jB1lE5P7rgE=;
 b=OqJzSuDLPZBn643jEs495nIa9qc/aqdJwgWS31ED1X5gOLHLxtlSmikiIHWPLyh6v2
 ywbj2H1uVD0xmUFTU7Wfkl8OzLD76xhOinobjU+EwXhEFMqAxco7kTYTbivsvLdOYm8W
 DKATMidwStRI6mPhkcvlsg76nAf83P7m5zl79ihN93YVnFo3ASAHuRuLSWvRQfvii4KU
 GnRVEqkLVsJ5mMPkmXGDYMvzSobVprm01ww1SovcJnTDJj4sRM9zZCYmuvrxGY49TUvk
 Dgsj/WKT6J2rKvdI/0eWxaBJOm1mAaPaJ6UybZf8vWz6ToEvGp0UXPE+mM12HwDTi2fK
 K4pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OqJzSuDL
Subject: Re: [Buildroot] [PATCH 1/1] package/fastd: security bump to version
 23
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
> This bump includes the security fix for CVE-2025-24356.
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-24356.
> 
> The COPYRIGHT file was renamed to LICENSE [1]. The hash file was updated
> because a date was removed [2] and the libmnl version was updated [3].
> 
> Release notes:
> https://fastd.readthedocs.io/en/stable/releases/v23.html
> 
> [1] https://github.com/neocturne/fastd/commit/fa88c739b9afe053905bddc7fbb9c252e290c35d
> [2] https://github.com/neocturne/fastd/commit/318c944f40c90e048e370b2f75598bfcd79a1790
> [3] https://github.com/neocturne/fastd/commit/c08a3d59debddf5f99e442d9529a142f04549b50
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/fastd/fastd.hash | 4 ++--
>  package/fastd/fastd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
> index 5f7f9665336e..a02b506c98ea 100644
> --- a/package/fastd/fastd.hash
> +++ b/package/fastd/fastd.hash
> @@ -1,3 +1,3 @@
>  # computed locally
> -sha256  19750b88705d66811b7c21b672537909c19ae6b21350688cbd1a3a54d08a8951  fastd-22.tar.xz
> -sha256  adf08b42f1b890b89e998360a864cb4f8441a0a57c9e95e2ce1bfdfc24c49976  COPYRIGHT
> +sha256  dcab54485c79dda22ce6308a2a48764d53977a518952facd1204ba21af1c86e0  fastd-23.tar.xz
> +sha256  f229ee6df84971355f7d54d60b0302ca8a3b883d2dc41176e58e9da4aa7c1b05  LICENSE
> diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
> index 6c496cf9ef1a..e697ad0ca88a 100644
> --- a/package/fastd/fastd.mk
> +++ b/package/fastd/fastd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FASTD_VERSION = 22
> +FASTD_VERSION = 23
>  FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
>  FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
>  FASTD_LICENSE = BSD-2-Clause
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
