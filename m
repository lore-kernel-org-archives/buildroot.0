Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981CBCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72FCF41F0A;
	Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSh9CG9b-ojm; Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1422241F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663817;
	bh=AgynqDIiRU4aMblR5UeoV5SgwzPT70v9Mr6DfBcF1V8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=py+vPmrej5AnL3LiQmPuUCx8JAFDrcYoT26MeWdaIGvJogbJvZu6caq92zbw9Tr42
	 b27c63eSzxbrYRKrN6dDWC6FZkT9NLlRbz0ZTnKGJFD8QB/biso7zJYPksMDYOQgAp
	 +0MAEgbjcBnULXbFFdrwlAxZC5WO7echRKFUPahfdQyl56fsOjzgQEBO6zvG5kA4m3
	 UvwonyPVMgGMsawUiv3LPSdGECO01RwH8SBD7L53Xn89xxbyqbaYSkRq2cJJHrKYLn
	 1WGSgwDJIGDSMDVkxbVwuEhBgIn5avVzDWXKrA3AlAc3AkkmuXUr1lnvSQ2G98ifrX
	 EoCHPaaDVNalg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1422241F06;
	Fri,  5 Jun 2026 12:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD7ACF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C38A74037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jia8Wq93MQIC for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF0CB4037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF0CB4037E
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF0CB4037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45ef189aa1cso1350296f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663812; x=1781268612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MI12+7vbedmy61H6LHwOq5m3R2O20uTPjD7OzXjMD1c=;
 b=rd5kfdj6w2PS1fW4SpnWwQQdM5bnOWsFK0Zi3ZGbkKUxL2N95ZVzn4tC53CAKPIsbz
 fvhfGhFKRmnUHStkPgye6nKXIccWV6fjzCal1ynss5uHSkbYT4BOJOLhzfnKi50O16w5
 /XkKr3qOBcxzbY1WJlUYsXPUMjWEKTw1pmaJW+uZYKtGU6/fhJZLAxhc7apYTMgLBpgO
 MAuwdUOq6Wn8rDxuWOurjIsmCNasDcmBO/MqVaHFg0aJbPKAlR0tNZQ7LO8PUv06+MXg
 nhtj72DL+isAy+UOtqRbYiMc+yFjCiefVDG2F7yKBAdePkEkNm9j/GKVh1taT19XCHlt
 WNUQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9si3S0iDe866vwBWKURY6BoU0oHUfOFq+PXLWAxvbqvNpq33Khj+q+zdZFqYKBdeU6YnUwotPLRmY=@buildroot.org
X-Gm-Message-State: AOJu0YwdwLiXgg1y65D4YXAOKzaXtVRXEmLczSKaGKTOIwvKfa5u+Y2B
 8u+gUNzb4Hn4KLOFbLlYr0QVmtBW/XSCmAlRXxILH+hXdzN17ObxUMMGXWWY2omiXwc=
X-Gm-Gg: Acq92OFkEoxjRf8QGyxo6yNCjNK6pPN0WP37rwu4fZR++Ytd/9mPKyk6NtwJP0ADD6M
 OCWamK1WMuT3R5xM2cB+t6fOA1LzXiwy4CPxj2ft4jfE8405fDZPiZXaRNkKu8J62fJRYdclACv
 JIflOw4ZxmiB9viMU1mr3z+gkwoH9MWSH4Okvu2ZWp0k9UQzZmj2BrEppM5P5J+rflllyNDDXdx
 K0vYpTLyKgvpW7aYFCSE/JgOCOw7F8LFPn5iPHUWULAivRC+FsnzjWYTJaeOyXJD4qy6TMoxgWY
 LILHtDxE/tuzdCsydwjUFrWYc6IpNQHgx34FTbBzKtMLY6piGAIjUFLOYfg0dPn6VWJ0so6JC5H
 09D2ZIv1JK8uZ6kR3vRiYma4Wvj3v1gIo8UA462MgCBNPjXWecSS8kdY9yai75GJ57dcyXIpQwX
 oJ34paBX83eSvn4YjzN6GIrGTdyw==
X-Received: by 2002:a05:6000:c41:b0:455:70bc:216d with SMTP id
 ffacd0b85a97d-460304fc121mr4370349f8f.12.1780663811647; 
 Fri, 05 Jun 2026 05:50:11 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d40sm25296258f8f.26.2026.06.05.05.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:11 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:10 +0200
Message-ID: <20260605125010.272617-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-3-9d25b343a6e3@cherry.de>
References: <20260324-qt5-5-15-18-2025-02-x-v1-3-9d25b343a6e3@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663812; x=1781268612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MI12+7vbedmy61H6LHwOq5m3R2O20uTPjD7OzXjMD1c=;
 b=a7NLPY8iogkRIQB62qrxQtZs0SnvLlXVbuG2nC/dSAuzvBh4hHcGrW37mpdxLa8dOG
 9nWhsKzsz9bQyCiVQxOgIbTYfADaMK+feHfQ281Z3hBuSzdYorlbgfLh9B8ELvzndcFa
 q+9OgET6F70CTS1ElqW1DsgaDufLyxgUssuOx7KvmF2Ec723vDdjUqMwFJ8IHIHKY/Uk
 QHkJIRfpSSgROIxyzCK5MmenXak8gs6IhS79UtpUX76kgEwUrfe5FmcM03up+OWbWFI0
 wSSPEnmT1z5vNSB5iLO3wUt9iXlweMcv/ebXSpEe9wynQPCk+3CE3vZBq2iFik2n6zm2
 TALQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a7NLPY8i
Subject: Re: [Buildroot] [PATCH 2025.02.x 3/5] package/qt5/qt53d: always
 disable assimp support
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
> Neither Buildroot's nor the module from qt53d sources compile, so always
> disable assimp support.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/qt5/qt53d/qt53d.mk | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index ae15b58df3..33e93ec5db 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -14,14 +14,10 @@ QT53D_SYNC_QT_HEADERS = YES
>  # command line argument separator
>  QT53D_CONF_OPTS = --
>  
> -ifeq ($(BR2_PACKAGE_ASSIMP),y)
> -QT53D_DEPENDENCIES += assimp
> -QT53D_CONF_OPTS += \
> -	-feature-system-assimp
> -else
> +# Assimp support is broken with both Buildroot assimp and the assimp module in
> +# the qt53d sources, therefore disable it for now.
>  QT53D_CONF_OPTS += \
>  	-no-feature-assimp
> -endif
>  
>  QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
>  QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
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
