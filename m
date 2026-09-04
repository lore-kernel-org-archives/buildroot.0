Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADC9C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E5960BEC;
	Fri,  4 Sep 2026 12:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf14zCu2nWFl; Fri,  4 Sep 2026 12:17:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1293060D97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524276;
	b=fNOT7m161Jsl7W5bc+Kkrn+NlOKkGIlzGSr8u+XdTitOeRo9YN8d0IBssIh3XPkG4+zS
	 bFQp7pzpDkkgnK5E5qd1mhKmlsgPp34XFFucHIegJ2VwiZ2pUuYSgU5qsWjWjhobqPW5K
	 4dtYQDGw187lrS56lUpwxWcrUigJWh1eo5ri3cp2V9UY/mVHQ7pc3+zgncoI1K05vRqWu
	 BJi831YW9l+Lj3e8uWiDwxtI6pHqxnh2wp/wIGlRYgvxqePcwXhj7EHscqUPwPH3wgMFU
	 WMBRY3ZM37U8xcy/A6tB8YBLpNGHG2lmw2HZ6LnFN0Veth4337vu3J1rtJlawCTH/QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CZE7LvRGVGABbHQKj7ND5A9tGUUcet+roZL0CDwWZck=;
	b=VCgYGCacqQZm/oTmZHFoySpWst2M7F/BbkFECH0+AJWtYxf2k8L1LMM29udfg2R0ChXp
	 Awy3dx0mSfUyUbUpzNV0K5p8Ez89MoNn5EyLjM23QqqxyaHOYWy0Qeis4NiBF0oItWtxi
	 +AbIzmYwIwDVgEMxrGGZCjAV7X9+sXsFbQAKEs5Jsl94dLDhPKbYaURcKatlUZdi3cr78
	 zpKp9wl/M9nrN7sQUYiyK/8gR1CH08F31vPRGDsNbfTnog2srPcgFFxT9lM8YcFLvtoEc
	 SMAf+IjUDlqtuFBoe19yC9RiPRGufqQHmiTuN5synlZmcQhOSKtlItnsJ5+lUm8r2Jg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524276;
	bh=CZE7LvRGVGABbHQKj7ND5A9tGUUcet+roZL0CDwWZck=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MvDYaSrBzB8vQ11nY/UbdN10LVIZZ+Ua3dx5U0P3iZZ6XeDtVIbAMlvQTbkgZycx+
	 TEXAV0ZA8we4zh4NOb3m2aVEcKSYM3Iublj+eemucmOg/f3igVi+NYdsQ0T0ZFGW8B
	 HX+7BgBzIXGdtZi3IlE5nn7KvALuA9v8Ys+Or+XmZXblsxXCs3E+iXyej1aF44QIdR
	 dcniy6X/gxOuoJ54VoXA55El6G4WnDFGS8V0v/cQSZHa6B1iqDGqjADhLC29/XHQ/t
	 VFmhOc7+nIixLtyC2iSUYPph+anZRovcA6u88dniMitq8RgQRL8sRuRtLvHl7H6h7T
	 yAMoU0T33jg7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1293060D97;
	Fri,  4 Sep 2026 12:17:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF0DF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43AD280859
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxEFNSSJiAim for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0CE5D807B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524268;
 b=kkvFX6gqEOkeZlegAt10WN/yNB6RmpF7cLnrOOpIKwOLy/1yWoyVp4tWrjyBzaPT52mY
 RFvhkytgMzyY10J6qzS0tm2g0bNl8aHXlbJgeSUUPCSN1ZOW0+VvpfFP8qrf69PBpc8Sw
 zKwb70WOVjWGm5a2Vr4CyiOQRpQXJ9rGP3xbJxsuSN8PsHNIDK6oyBGYlKjYqnJgZ2Y7T
 q3K+btBdPjGn//X3UFx94Yi3D7mH7slTy+Y+vLcp2CrST/oBa4NHEhYDvb1KK0z0kxwGW
 drNA8/7vZBS/GX42BtlrqQYxSbL55N7PA5xwK2CGM8r/7eCgc0tHPAaxsiOhiKgvrrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524268;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=ZcO1mA0QE+j3/wuotGCM3C/o9oo1MQKXXzchCl9fMb0=;
 b=WftSDnRhm7hpdCMU6+N6Rx9dnEuc5E6+BKeryHU2fzD2eDDdt1Y81kzDXARomkZCI0Nx
 HFWH9fFlxnk4wewaiSyKvVo9UVE5+JETDyrTQQdG1RcNsq9UHXdvvULBekgpmwsU6Zy3i
 bPpgfrX9NfOTR/zfIxchA/uXDEAzsytfGE6O1m0aJh13C5J/Riw9rOWY73bxKc56iyhrZ
 MAV0X1R6Q3N2ftdPz73tMqFqpdv9XTWcbG1uDCr30hknbtvlTAN2UPEhcPNn71LqXRyeC
 Lwf055ybxPM5cxy97gZVG3WF6CxtRomY1v26WXwdIJ+ROIvVzScjHMfDQB89KiRhVIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="huQdP/5W"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CE5D807B3
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48586861639so653120f8f.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524265; x=1789129065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZcO1mA0QE+j3/wuotGCM3C/o9oo1MQKXXzchCl9fMb0=;
 b=lFZmgbOl+ZS7CQgXt1Dp1Sp1qqwXQSGsGLgMIKisQjIWgv0fB3P9Jf82KXOmkjJvjQ
 xw40PmvMTgkvwb/Zk4dOIwArJGsyafJJpns8sLH1W65N6E4h+Sf+SkS8u6eEXnrsMeFZ
 WW5VSU8lVBNzsHNf/DZl+kUwLnvV3l/yGKsNAnDSZMgu2GDW1qd6EuGm6ymR3QNVoV2C
 2BoOTEFTHDgrvzX8vrjXJ/24guTkqnSf4IFNm2J67z+h4Me1VJ3A4g4Pe/dlHZt9I84E
 YLrGhODV1QshmTsOATkGHjXmwelxpS9RTT9aP6WSKwStkUyYuUMbp94EGu9KjKu8MDJK
 Pslw==
X-Forwarded-Encrypted: i=1;
 AKwUvByJFF+LKDfcPVrisjBTI9+jDPxak2buUyueeFZeEte+DP47pl7rmMgaGyZJlU/GDgPAndNhVCuagD8=@buildroot.org
X-Gm-Message-State: AFuF++kDTVy9z/AC4VqLWilE3rBkGWdkEWJTOJ0SIDWTrWMT0fBgl33V
 FKVg9wB3CaNpiUBVhPlGs+oy7ggw1PPgTTG0CzV433PsulJuM3tZL5O7HIDOGCHoBRzfGkdj8EC
 PDWc3
X-Gm-Gg: AYBFou05FKnQm6BCbo5Fk33jHEVt7dnz2PjcO2r+gJTHhdaQu0sFAXR2VQKaLO2yPDY
 r2laJx2pHHyahU/+aPgQfy5NdN72uyDPVk6WoSmyW5E22gDveowrt+Qooj8nrVmPsSpq+7jVb6E
 kch1BQHyEhvDo+7iZdGQw6L0UFNL2r9YADDCdojSJLhVfiGZi5DWaTPJEOUgzLvNd/mEk6drraq
 0S60VwMNbaGCZwR15F38dxctuqVkVK8qBG7Rs0A1e4skX8+bkgqtODe29RUA83ls192DIldHdJ5
 cqFL2XkouN7aXuaBRHvt0jkhUjaujI71di3bEq8esmA88HkcxoPNGB5XOuNDOqSwSqUcjfjzzRh
 +YqxkdjKiO/K4dDy4qoDk+JACwx09bDCXR5jpRaUQLpK6WQZyoQKXXlPoAAQPtGbHpy4JUPZFi2
 b7b2ar/p3MQ1TZRTpS9qGlb2ZVQqyAP60MDVZ82CHdzKUpxIvf6dgH3g==
X-Received: by 2002:a5d:624c:0:b0:481:50ae:df9a with SMTP id
 ffacd0b85a97d-4857e4fdf87mr12270767f8f.9.1788524265045; 
 Fri, 04 Sep 2026 05:17:45 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c81c3sm5700786f8f.26.2026.09.04.05.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:44 +0200
Message-ID: <20260904121744.404266-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830194153.2400025-1-bernd@kuhls.net>
References: <20260830194153.2400025-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: security bump version
 to 1.9.2
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
> https://community.nlnetlabs.nl/t/ldns-1-9-1-released/3403
> https://community.nlnetlabs.nl/t/ldns-1-9-2-released/3404
> "Please do not install ldns version 1.9.1 as it has a wrong .so version.
>  Install ldns version 1.9.2 instead."
> 
> Fixes CVE-2026-10846.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
>  package/libldns/libldns.hash | 8 ++++----
>  package/libldns/libldns.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
> index b8bb3f55a5..c346fdf154 100644
> --- a/package/libldns/libldns.hash
> +++ b/package/libldns/libldns.hash
> @@ -1,7 +1,7 @@
> -# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha1
> -sha1  9cfe5623dcd40cee0e480b438318c3c4a26c1ecf  ldns-1.9.0.tar.gz
> -# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha256
> -sha256  abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3  ldns-1.9.0.tar.gz
> +# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.2.tar.gz.sha1
> +sha1  d197d9fb46e1802a7160368b38bf063b493f1be1  ldns-1.9.2.tar.gz
> +# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.2.tar.gz.sha256
> +sha256  b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d  ldns-1.9.2.tar.gz
>  
>  # Hash for license file:
>  sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
> diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
> index b4734ee54c..8ad3f618f4 100644
> --- a/package/libldns/libldns.mk
> +++ b/package/libldns/libldns.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBLDNS_VERSION = 1.9.0
> +LIBLDNS_VERSION = 1.9.2
>  LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
>  LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
>  LIBLDNS_LICENSE = BSD-3-Clause
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
