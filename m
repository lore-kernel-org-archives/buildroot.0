Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A23CC7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E483F612B5;
	Thu, 26 Jun 2025 19:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7VFLm3ktR0m; Thu, 26 Jun 2025 19:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E15612A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E15612A4;
	Thu, 26 Jun 2025 19:53:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60A7110A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5249940507
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVUlgOSImTtr for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C4A940472
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4A940472
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C4A940472
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so10723465e9.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967588; x=1751572388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78NKmeIUvSVD/xLAOjmJ+TWOn0+Z9ouWqAsewXbK8dE=;
 b=AdSEam+X+mok+ULsm2uPQ64pVjDyvh8dYd9ryOE9yrCFgF5lP6FqFMgM+XeFEsa8e3
 +wfRPZjhthLvdIyj8HMUtW5TgAzg9d3UxTIltnz9W3g89Xd2ApHqjzOy+BwDb7qrSSGj
 eA39d4AZuakY00Z3emcX7TSbif2RW4+bSOKvvnTiquTc1/7xXErUTl/92JjSadrp4WXZ
 aqFpT2u7qLBe1GQ3PTQT0V++sOI6WEDKDb9YsHolOHwAfxjr/UYl36dhucvz26E9O79e
 xsgVEdAxFzrWGi3tY4EcgTdo3YxOw0Ay8y8p9vwkZbF0k5+UWFMfBWEOSoRy6+n1eW2Y
 ht6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8d5vx+RsGUToXmzIQvN1QPXPkCst5BI/NA486QArCiRIMUCBzd7I33wKaGbod6/McE8xghyQa8XA=@buildroot.org
X-Gm-Message-State: AOJu0Yx+3mB7uxklhYyJRRq5MN7tzdpBP0XbokkqqWryZhulFh6UHEbM
 8bsUATvTFprKAR2VQMCct6WAC80gt8FYaB5u08RGumYSNIZLihOB6Oihl5+/JtijvvZvbzSTv64
 InNgO
X-Gm-Gg: ASbGncvwNPk1aRD+epknT95z4Drv9L+juNr3WDmli4EqHYbzWWtw5BAcoOPyS+Kn0H1
 /6ixCWZSrBgZWqYivmNDn80cvcuvhSykkmjcFW81tULZDg/6o2L+h63C8VEgcSC+Vp2sbTCdUm+
 CBeHs8M49zUtmzZv07HqGuCnKITL498sVMYVk+6ynwn72E4DKFvHojC/YRAS3yaK0p3CKgEP6FU
 dw+7FHy0y0mr6f/WOGVoqU1xGXtrv+6KJCsVSv5mIWOYKncKuU2J3sWNJxAhHgvjQ4/AHawrf5b
 A2MTP6K+bJVSPlTACm+stUOF39SBFSurVRvBo3lyKg7tLGHNLBOzFj70P/i0wvJb4XrEyO87OJJ
 I4GEjAaLPhZtdDO+FXgByxcJ5PUgGy85J
X-Google-Smtp-Source: AGHT+IHLhg5F9B0Wme5vxUZMI2/T3nDAxtl3RVOCLTONMWe9PnTMgOhjJ9OKOi95yTBSgnMmpneGqg==
X-Received: by 2002:a05:6000:2d03:b0:3a4:edf5:b952 with SMTP id
 ffacd0b85a97d-3a8ff51fc25mr473464f8f.36.1750967588355; 
 Thu, 26 Jun 2025 12:53:08 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e78e8sm757510f8f.19.2025.06.26.12.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:53:07 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:52:59 +0200
Message-ID: <20250626195259.14962-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <5496754635235785aacbf2f359f2a498d4e02274.1749793479.git.yann.morin@orange.com>
References: <5496754635235785aacbf2f359f2a498d4e02274.1749793479.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967588; x=1751572388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78NKmeIUvSVD/xLAOjmJ+TWOn0+Z9ouWqAsewXbK8dE=;
 b=Ap+98hkrbjum/ziWn3Hke/8QUYRL2+ktASsIEZiphewP7IRUEnm1/CH72HW2uSnPzM
 KzIKgSzfpBbJqcLvfSSYqQlEtrxrcrSfSwc55Bsyq9Ydq3mLrevq4rAftl6YiAY81H+7
 QTiauRptm5LxtTUKjqlw1T+VZwax08oCcZ1BL2mwdVj76Ewyz8pcc4179EipLIWt3pTO
 kWDmzZc6NlbpkxRhHkSuNH1VnSm4L6xbfMG3gDltOCcic9f7s6hH+1+TXdemfmx9PfYK
 wXvWyK1k+xzpQXQaPenp1jkIgzH0v4wZnDT0oArtpS8ZnxMOrOIcCNIJgQu+S7pdnZKU
 wQYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ap+98hkr
Subject: Re: [Buildroot] [PATCH 1/3] package/amazon-ecr-credential-helper:
 add LICENSE hash
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
> The hash has for the license file been missing since the package was
> introduced in commit 9a9580622545 (package/amazon-ecr-credential-helper:
> new package).
> 
> Add it now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to 2025.05.x. Thanks

> ---
>  .../amazon-ecr-credential-helper.hash                            | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
> index 6ebcd4e204..eaac8efe35 100644
> --- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
> +++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
> @@ -1,2 +1,3 @@
>  # Localy computed
>  sha256  53765b3e441a0e785131731d0cee4c0e2b2a22b90e523e9e4ec3e461c0ec5b05  amazon-ecr-credential-helper-v0.9.1-git4-go2.tar.gz
> +sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
