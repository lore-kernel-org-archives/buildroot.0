Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A08CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1DA40BC0;
	Fri, 16 Oct 2026 15:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2Uc8_Cnv6UH; Fri, 16 Oct 2026 15:05:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D48B240BA0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163115;
	b=jfOVEC9jga1mZGrAttUucopA5pBJyTLkM/zi2C999X78NVv1a3D2CgZiZO4fcNCIBFbb
	 TNjDsX2aAi87eLxHrXk0pbMtFg6rPF0huFho88RSdRRnnyRd6vwS2rmIUDELoLTXcu/0a
	 COU68asfujPuUoQJQ0ZoUmy8/AwS9jx0yPd1PmephL8JPeY95muKwYhLs7PU7tKy7I37T
	 ZYFjRhWgCohs9mmGFCZv3LkTlHH3mDcl6iR4iwRvyx3jzxPjtKFaI/7CXsOmWTCv4X8rk
	 O/ijI30k9aNdcZyrNfmyyh7mlIs4lkRQ6tVH2lf5i7Lx7PwZfqlBBhvwEun3Bud4rSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163115;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0euPOU28em4n1csJNCaueGPKo8m9LbkFoRopExnI2DE=;
	b=qPOdXswM6gkW3IccTz+XkgDUWz04H8a75DWyrOhSq8QQPLC7ZO09uOdaHhp5iwbrZagK
	 CRfWxMIgk0kp6MCqjy7WIJ4q20VkFyj7WYONJXH+bB+jVgp9x8XlkaX3+jqhiBvOZSrB+
	 99SHVH2qLC/GiptXkQftGbz/udqMvwDTXdsvz32YuWcToq2ITuBVGI5Dv/jPPCc1jAvVz
	 FYHJCkUb3UT/6l3XmFPZCGPScRDUDN5m9C+cKt+PJpcPXHlOx1cnVCG2i4C47G0xX/iJj
	 fmm+bjsCn+pKEVtp+MKi/5jFaI8usNZMP3sx+KmKL84q2lcW7MeeQqBDb5W554F/j/Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163114;
	bh=0euPOU28em4n1csJNCaueGPKo8m9LbkFoRopExnI2DE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HgpYfPbcZT6FYbkbZISSnGRSh0nGGrhGS4rjv10XIF71sMXPTqou4s9tp0U2ujxEe
	 ZwLaj1+zZ4pcFAXGjnX68bemR0rUTI28gFzGoJqPcYib6NaD7aFz1Kly31d5uA4k2e
	 zRh9XeAWy/TYVbdTB7CWZWXPSD3e5X7bGb657EsndcMzoSR4fP0I/3brg2y+WF6dJN
	 k7hmLiZl0S3Kj2KBckG9ZJZUINxZp5r11HHV03+N4Lyf0a5LBjTLfVmwK8ORuOEH+c
	 wOJaYuoBLRQbnjh8dwqsWcKaObwbw6BDCLrByHadoT5fxUMc0LMscK5LslNRQhl+TO
	 t7ejakpNlPcXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48B240BA0;
	Fri, 16 Oct 2026 15:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A3B1255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B81F4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HICyc9Ktylhx for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9EBC040042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163113;
 b=gCy8LeegWY9O1k5scNx+GDCh7+Mug0oenFHas78I5CPRBkUJ8Lf4X1HaBAQaW3xpXFrL
 gkg3jjtKtLkZn9tjwVCLWqjK4hwzVxaeww+Du+Jj50AFeAJF1zqX/UctGdd2ghstJsxJQ
 Bkzx0A4Z+Oxd77yYSg6rU38Y/Gc88FnuzyrKAtp5YoNJCRdpYMdH5G1dH0//hAcXsZw4x
 X//Eh5Yu9QMo23l1DE4YzN9TKJBghjb1q1kgbg+0BETw0cSG4Sp3a0Wz/DZfxBqdeuA6D
 GuHeR+rEgbyjsYxOoC+/0kgiRDue+MChX2E3adeWCNPHm+uw7wZzjDPY7yVAmu6iCEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163113;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/BT1eE4hcpPo/A1Xrxgszyy5dEXctgmHtjCINuXxkrE=;
 b=tTG4SXlDfIqW1sN7wwCF1RDMIclJpTsc1J9KfUknN0H7qWcmSikqeLjvszShCZiYpx1p
 zqhAjdOOcOeenXX2AsnHK0AWxqER2GPLZ/FSXrP50smd8W7YYhDv1soiBggpSRG0CvDly
 A0FdBfRK50uvXXDFZAkKQTcCHLPBSXpjEOtR45tsYiVjbMXyNCdr6FeJysbp1vDkS49z1
 x44xFvz1txBW9UF79LErOAN2gJLWGA00k/2Jv4/LO5qFDLyrTnVH2iVNIUIyOW1w3e5oa
 6CueVaBNaJNkaBssnHulm3DJxAs8ZrC6+R/KheU6+jXAM+AV+38eZAhC+6+bGOcjI4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TVWkIohw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EBC040042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso3727676f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163110; x=1792767910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/BT1eE4hcpPo/A1Xrxgszyy5dEXctgmHtjCINuXxkrE=;
 b=xpGV+WJrE1/1PVnk4X7pEKxL2vv2kL8lVi1Lzrct7aOeACW2q8ZqQ5Psoo70jrQG5l
 saO2EE1CA0NHQzNd2e72BL+yuvs7wqFeukLx996U0Bj+Ziu6R2S7pdYmaZHHs5XYgzDI
 rJ/XmmRybIfsqb4hoWiCRqMMZfMSVBNnLg04sUnfGwgBwJwa0fG5i6qEifuCzUL5pbRZ
 17b4Fm2vmG6ZZIn/BmDQUl3qLUrF1m6uulw4nap6oklC/B3MBAVRUsQtATjHtzKcl4iK
 UtY1wjtM2vKEXhpP7pl5+2y5ILy3OlFluaCvZO1rXgmH1SH3KiodiPaG3sqj8MoIcM/h
 G9nA==
X-Gm-Message-State: AFq9FYJQu9kbQr+TMe+4takzWuOjYrA9UQ9TZsBiBaBQcaxMCE6u8wsP
 axdV8Syup0o6aybALWpqWm4Um7KT0IQcAdEfDSq9/t7hxS/4k7pOWCnaygs+fB2LcxNmCZI+mSP
 AtyDXExI=
X-Gm-Gg: AYBFou2WLB51IlYfkm5ibr9sCpcZXPjMyznnpXCfIomRLgdlpObnUcGP9Upj3vrSFsZ
 jSfh4xJqDOuL0cRYsGtzzZxTtW4kO4cRw3z4As8UYCa5KRn0ZbH4PBMOsw7CTdvTlWEzgScOKj+
 EKJsoNwu0ev2UpOB5fx+bpfSykIFEcE+YevV99AzgBF6Lo7uYglwe1if2vG2p4/GoKVgorQa/XR
 FhSJsoGvZMLc7rZg48fZHkUfpB1/6AszTULCk3HtFypytqR0Dt1eSra8xK1Yh1X2sRvNVxuHA71
 kY1yi4tkwoeiVgJO+L2pXE0rUKDHUI7YXAP/RoKCys6i4s193xRwX16OBNbYoR38OK772hPpoFd
 4UgUz1ggLQxCFhvVH2kOa2+xqZUhrmicJdsPNKwxMM6atS0/aNmFEgeZ8mjtOKL80r1DHx4pShF
 UqaLeCIRLK8mP59OV/NarE6Kveu2lOAVcrhq9xpN9QhIr2TRp9QkfbvBkKYv441flKsAH+0cZen
 obcL0LC6rKcoVRtgv8QiD5K7/hczKIKcPUaHNBqDw==
X-Received: by 2002:a05:6000:e4f:b0:48c:6f3a:fe30 with SMTP id
 ffacd0b85a97d-48dbaade0bemr35330928f8f.15.1792163110479; 
 Fri, 16 Oct 2026 08:05:10 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd471a1fsm4889794f8f.3.2026.10.16.08.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:04 +0200
Message-ID: <20261016150507.73251-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261005132832.203227-1-yegorslists@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/inadyn: fix mbedtls support
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
> Since commit 6bab22ca41 ("package/inadyn: bump to v2.10.0"), the
> mbedtls condition is written as "$BR2_PACKAGE_MBEDTLS", which make
> expands as the variable $B followed by "R2_PACKAGE_MBEDTLS", so the
> condition is never true. Without OpenSSL and GnuTLS, inadyn was built
> with --disable-ssl even when mbedtls was enabled.
> 
> In addition, inadyn uses GnuTLS by default and needs --enable-mbedtls
> to use mbedtls, which was never passed.
> 
> Fix the condition and pass --enable-mbedtls.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> 
>  package/inadyn/inadyn.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
> index a8891debb3..68a28eabfa 100644
> --- a/package/inadyn/inadyn.mk
> +++ b/package/inadyn/inadyn.mk
> @@ -15,7 +15,8 @@ INADYN_CONF_OPTS += --enable-openssl
>  INADYN_DEPENDENCIES += openssl
>  else ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  INADYN_DEPENDENCIES += gnutls
> -else ifeq ($BR2_PACKAGE_MBEDTLS, y)
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +INADYN_CONF_OPTS += --enable-mbedtls
>  INADYN_DEPENDENCIES += mbedtls
>  else
>  INADYN_CONF_OPTS += --disable-ssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
