Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF46C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A4B40FC3;
	Fri, 31 Jul 2026 12:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1pm9xf27GgR; Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E4FA40FA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499517;
	bh=y7cTs6WqZFL5Gi7gFvjiLDFclM6lL+q2a0c7qsv/W/Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WIa5IUZQ5xNslG/AwOZ0TEHNg1eAPcW0Ds5qstf7pRhlGYIcol9Goe0RxG6pCvm98
	 wkllwm6LPMj7H9OxU3+1GPHdrjgUyOsxmy63V2hv3llTPJIqJr0aqBYSQEA9axUyft
	 47Te7hIoX4pzfADAol0s9b2eR2458zXWMVt+NRSRFOG1Qi0TUvjGU2F/zHSlWabTtL
	 Ka4x5xKOIabZJNAWQDS5LQkbKN+V/WjVcEH6xRKAZ7W+ccsjUis+35c90jBdbY551J
	 yPB6pHDQqZKTbbSGwUfmdjFf9ez6LUZgaR87bltSmyiGe7SUMfCz9ONQXmOKupC1l5
	 iRDkpSS4RNDPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4FA40FA0;
	Fri, 31 Jul 2026 12:05:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 590C827C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E616812C5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pfm2bVbsZlUz for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46E92812BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E92812BF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46E92812BF
 for <buildroot@busybox.net>; Fri, 31 Jul 2026 12:05:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso930617f8f.3
 for <buildroot@busybox.net>; Fri, 31 Jul 2026 05:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499511; x=1786104311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UJRL4e5SMQKZBBpu8SroAUAMBGBY2tz++QeoAcqLLeo=;
 b=HzXpEKS66CZCaXVye+koBZhgtNZv3XGMt0ydnBoNh0KD/XLLWE7+GUyNJ3ktPp4K7S
 MfqjZ1rrLWkbSBdZCfKu5fPHBqMahGoMW0tvGX2YdpImwiiAyN8/emP+/LjNe2gNvqQb
 p4e9fynlbnDkwDC0/YLCp5zjMCefrRww2CtgugfTHPNd7tAK1vnMZSnqiwTAZ1sXtapX
 9kF9sfewj+c1sZI2Kd+fzkXnFqv96nWF/tBSvr3SHMoDbD8L0gtCNePWXqE0b5lsc7ZH
 OICcC/P60AbOn1AgLxnUjwS5h4VCPWNV06gW2PklbxoDv5OhPPNstUxl3l5SFABeSECV
 P9tA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrPLAg1tCP0LBaEssVvytMsrWfLK3O7ZE8umNBzi/fIBAmO/S7FQcVLzFe491l+6cwMwOLv9se1hYc=@busybox.net
X-Gm-Message-State: AOJu0Yw+F/NlE2WH5+YDNi7m4IkuFdAPqwAu0v1LEpqj5XzCqfETA3OZ
 nt+WRIB5UyfxgavXcZSLfKovi3ISsD7Dtenx5pBdGvFnzQgy68hnCogtJb1d0swTHHI=
X-Gm-Gg: AR+sD12zTZNG9rsCtLVdFLVBHEic4RnldEEk1exjepE2Bu4iDVpJI4DpJ2/e9ozxEu6
 VkEWJLokSlC+nWlylYovXzrfv2qoJvfFyC6bcZOPbZEaj8vuFehqufYn10tfCrvEQv4dEKoMNd0
 hysIuUEmwDVQz1GGEA7KtLT3phWaX3v3QHcgHJl5Po1+hd7DfvMUHQy7L4FzaQsh/1qEH6WCkup
 5C2YlnVRfHr7512OLt4XePmu5Ni3TXZfNM22PWWQRwwsHhPvCZFmR3NQPgNI+7ZIfSNKcRjCvOr
 DpYMCjg1ZanArBbY+FCpre+G7BDxO95X+yf1aJHG40KOe6AFz/RmYJtOY/jwi7/Y7rqry0sKwmh
 o7tGIwQBxggMNmkQZFrvE/4oitBCLFasDNKRU8mBfiCS8gV5eGxd7NgMVMgXwIR3XRYiMguPZ2W
 Aaz0kckaaTIzYsbKRTNZYhTqZRFGDJy+++0IQyJYxy8ssxrrrDOntESlo7CPyd6PBFvsb23irxT
 N7SKMbWWhXbTaKtK1dNSoqcsw==
X-Received: by 2002:a05:6000:178a:b0:47f:8ae9:4445 with SMTP id
 ffacd0b85a97d-47fd2b41c57mr3941024f8f.44.1785499510976; 
 Fri, 31 Jul 2026 05:05:10 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456262bsm3652600f8f.17.2026.07.31.05.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:09 -0700 (PDT)
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri, 31 Jul 2026 14:05:08 +0200
Message-ID: <20260731120508.3342-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720184652.252941-1-francois.perrad.86@gmail.com>
References: <20260720184652.252941-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499511; x=1786104311; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UJRL4e5SMQKZBBpu8SroAUAMBGBY2tz++QeoAcqLLeo=;
 b=CAkeeMlnhLbbh3zUzf192oOu4xpylTaBHkYrTA5TzgsVwqnRcZvVuBr9FHpnZI9RFs
 Ktk8/S9yWKQonIcuX+NhfUgtMX9xVPAtVIsxh6A7cxWj/zjmFpYiw3x4QfmnU+LMzQXo
 ux/KiuEV4BiOBrkNXY/3o9LZg49xlysrqZYGOUmFk5FL7nnBHO9MXocq03xBRsWKgilF
 rCrA3Ua37ZrZZIrrGpnSCopQdn+7wg2f9kiFwVDis955x5w8tusL77MlVhsYMDxeTzvk
 fkSOsgtka6L6yl0GakY1qy935vFc7Fu98enLkSdfmI7BZo4g9l2V56wmjHjB96gUQnzM
 SQVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CAkeeMln
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update email for Francois Perrad
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
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c5d6dbd8b..934209d7d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1162,7 +1162,7 @@ F:	board/visionfive2/
>  F:	configs/sipeed_licheepi_nano_defconfig
>  F:	configs/visionfive2_defconfig
>  
> -N:	Francois Perrad <francois.perrad@gadz.org>
> +N:	Francois Perrad <francois.perrad.86@gmail.com>
>  F:	board/olimex/a20_olinuxino
>  F:	board/olimex/imx233_olinuxino/
>  F:	board/olimex/stmp1_olinuxino/
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
