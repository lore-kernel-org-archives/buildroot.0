Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE9FCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A2A61081;
	Fri, 19 Sep 2025 12:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36e2PorkXrVK; Fri, 19 Sep 2025 12:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1FFC61046
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FFC61046;
	Fri, 19 Sep 2025 12:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7B19E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A924840DB0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg8Dt4HCEwnT for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AE0F40D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE0F40D31
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AE0F40D31
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so1623898f8f.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286671; x=1758891471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIEvhOxaby/kb8CzGUY1LB3WSg1uVT4ltyjB5FI7JZY=;
 b=Knv4gisZZAXSZwg1Bl7+Js0Sm/bBgFhKuL87MPBBeDpZMur+fUPQgSQ/OFX9KHJMII
 pzeBcDfKyHxKFXQ0+oVJDezaeV0QAYXH1wQE3zGyIBXGVgl3dcfiAJyaHC3wqcRdS2I9
 KJ0qPiEXzEz+AoQUqPqgH32C/VtpFH1/HncDWoSvqzWt1e3OOsTacw2GpOe0tQJpqSAi
 dnZR75/AO59SY9zt4ujEoYT4ZPirA81vMCH9AIdLWIqq+IRVxG63OOfeNseWZLMIndtu
 XgSLUQOwFASPrTL/oR2VPOKGQUnCpdYaTlmZdvcx8XL5/S2JRD17r/uUH2kcZnCDf/BN
 PG8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOmcW205nLvwPdq5Tr/QgMaS3qV5crPTxdugARIUwzXNDTUqdh/F2x3HBh/QfyvcJQNa6NYsms47U=@buildroot.org
X-Gm-Message-State: AOJu0YxST50l5RTyKK3WJGmLV2GRC3TQUq4Hg0ZXqhrnIueH+hKOtCe4
 byunlptJrl16cdBADCrCT9c2fbrMN5pBEj7+co1rH6VM0ZKKXjLvkB1y479icJXKUWA=
X-Gm-Gg: ASbGncuoA24GUU2trvsLngCKtjdgE5sE3dMTnXLnms2k4doY9wXyIUW9YZX/RUMq1Tx
 5nXrl56ULDrz9nVwG4ymPV8kpj8ErN5EtCEQYBMeBd7rr9r0t/F71GwVFAwmJB+GFjNZVcyc/It
 CA9Pm4nICDginCdxgP1yLzeaXGDjQfKVhT+4eEmDNyBGsvm+mLyrK4kT4ic9HAXm+pajiafVp/S
 AGW3wAzIjqxUqYZnhjV4IQsu5sKDoymXQ50jz3bYaaavhUn5PhfzYw8J8IPvDSXxoxSIDJ1UG1t
 9+EoQkQT7OIEQX6zrzYymrF5ZSN4GP/Tk5Yw68oxqEiuI0C+HD0buR4lNhUfft5h1kHg5/nE94T
 WWGtMIv/NiWhuxhk=
X-Google-Smtp-Source: AGHT+IHZQ6T9F4LOzWXhqStk93mHydgEdxbLBOPgG0jg0k9YzcPZxjIfUpVMYC5TVQ9IcoZVrkTkXw==
X-Received: by 2002:a05:6000:400c:b0:3e8:b4cb:c3dc with SMTP id
 ffacd0b85a97d-3ee7c925658mr2816397f8f.3.1758286671127; 
 Fri, 19 Sep 2025 05:57:51 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee074121b2sm7889965f8f.27.2025.09.19.05.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:57:50 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:50 +0200
Message-ID: <20250919125750.137329-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908192435.214306-2-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286671; x=1758891471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIEvhOxaby/kb8CzGUY1LB3WSg1uVT4ltyjB5FI7JZY=;
 b=MBDKknlpboEF+hkSbtkEOG+BdNSx3n0ZCQAlFask+Ld4IfjMnWeJLfZWxhM0KN2JkP
 zPfEKVDul6XQpe7WHieXmSy2F1NwCFGOhp7Y5YGPoWaBlNo6DJwC8mU82YZZCHtr0xcN
 HOXe0uqA4ziSwnzvfHc7DnP2S3JT1ymy7OOCaX6u7JkkcOpmHKdp/mUMVaSuH0Nw7O1K
 qONFi1FImju4p9AvPHYXu8E+AGe9om9rBLvQ6JtaXR0ivjmPU6qlBmOcS9R3NbGG5p+a
 SVgOqKwkNc2liEgbatVsSyjUqtjgvfvBCi0e0+PaTy7V4NcTEDwJqC7v4iF08H++zM6k
 b0bQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MBDKknlp
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-09-08
 version
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
> This version allows to build with Linux 6.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.08.x. Thanks

> ---
>  package/rtl8723bu/rtl8723bu.hash | 2 +-
>  package/rtl8723bu/rtl8723bu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
> index c0216dd1eb..39d2202d6e 100644
> --- a/package/rtl8723bu/rtl8723bu.hash
> +++ b/package/rtl8723bu/rtl8723bu.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  e50ce66539a5216b91460b8278606874040f3c21ce8afbe1f5e84595dafa6868  rtl8723bu-523cb38e4c62bb181d6b95024884e938835cf8cf.tar.gz
> +sha256  f0d5fecf6f8fd9668d46c462d0cdb13d5cb91ecc383123989812f3d50ff28e65  rtl8723bu-89b6e527ad6bbae19caa6781ebac849b927d87db.tar.gz
> diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
> index d9719a2cad..92fd93ccd2 100644
> --- a/package/rtl8723bu/rtl8723bu.mk
> +++ b/package/rtl8723bu/rtl8723bu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
> +RTL8723BU_VERSION = 89b6e527ad6bbae19caa6781ebac849b927d87db
>  RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
>  RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
>  
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
