Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D907C44507
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DAC40CA8;
	Fri, 10 Jul 2026 13:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHZEfTV9_BD7; Fri, 10 Jul 2026 13:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4207540DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691579;
	bh=H+XQvob/I3m+piY7tkwwD6CvAo+8ipa5qigKmpS89vk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zcx0Gs0Gegp+jEdwuxF//JQ8ln+NfITGGKUg41fydCF4629/QBePA+aWFi6dVEQ33
	 2Ne1NAspr5Cf9nbGeMEMNCQH/L/P1ymp534l9/oanoNKvW4hyCRC6UHDQNr7fR2j+d
	 4XbGA8ZtJCUOhEPI7qxmyPPelw+ZjTOHkactlLyC8k90y3piaDHs2V1BZ3F0XtWb/7
	 so30XLZw4YDtC9YMxbJWeybHVg8fNOG+jflf8fBnjmGr8SbVJjHX+cuSk06uYs9YYM
	 ItSfS0q7auc8iFiudvitiSuD/oy7Eblys5rAroRT7qVwpnWb7Nstf9JkVFt8L+6ATw
	 yTXKA63scAt9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4207540DE9;
	Fri, 10 Jul 2026 13:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BEB62FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E184606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsPwonSoSnMX for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF594606C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF594606C6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF594606C6
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so6465325e9.1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691572; x=1784296372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SRdcr1tN59zOrauKBef+GnBt7TJdTcLY5AzgbxehPyw=;
 b=duLiUltXiCNaylK2sR65QNt7eRbLQkiceM8KTQlTgjl6F1MTbMI/eysPSoOewpfvGS
 gkstyveD+r4npVsIpn9OlbRQGmT9br3o8B3axR5gFlCjOCcEnQ1AfonfZY9xZ6Cj0Izy
 zWMZsJtvFb81fkQMfHp9tj1OklJJmSKakLYBJsbDSTR8RSrjuvDr+snZYEYwtj87IiCs
 Xatsd8wDePeJcshFYCOvk3BLv2325i/Ft0HpXEn5bNKNFNfTvdDTww/yE4S5AANe/hVP
 vg0Cevo7UOKfnzjWST46W0VwX6Gc75E5qOEc1MT2cbAADkD9OoLC38U1CGSh6UTLbtu4
 O4rQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq2a178cdqE7C1jappYpuQi9tcS7fqu2eduaEplcOetylqmwPOrAgz5hn6e8/X3GBqvkNVaNRpEB0c=@buildroot.org
X-Gm-Message-State: AOJu0YxM8qysRXgP6tMBGCYG+8PmHE8SR1gnoQYcdlgYyxYxQmjizhWd
 3EiVa9pUEOVzhvNjLMA/5FjnN2V1XUBslXwuqQPwlENjsyQ2xfLxtqscCq+o6vZ0K90=
X-Gm-Gg: AfdE7clh1wAYq6L+8iiS+1UYnoT0hppxASyVEIuEzrrrPr87gAbUAx1AE+ogIgQTKa5
 6OVp8SjI91i4LuUPIQxVd0Lg8E1P34NaC3yWHEwLyI8DBDmMDT7X9U+83b1+/DWvtT0smMNbGQ3
 UFOZMA91l1ta0b59nf9XuklUmPyTD8i3WfvbDEIiroKNNyRBgBLRjAeiG4Cu2I41FWurxH+B5Kv
 ACuWULmECuCWTjqhaHgSeT7T7164m1hk4Hcn4HmR3newkUf4SEU0XnATDwUokkvYpkdJveuUuJv
 myKwNQB2h+xrIfZTUsyKf0j3x2G2ZH/eOkzoky5nHvbXZQTQH/g+TJZXhe5uV4z6VkU+/T2HY6l
 U9N17lgN0UBbe2gNuCByLe0sd12OSBo4i8hr/IRhTyNAG5Tw4u1dQ7qvkduYaG7OCOmXB/Ac91L
 9WhG1pCQ==
X-Received: by 2002:a05:600c:6206:b0:493:c42c:7e87 with SMTP id
 5b1f17b1804b1-493e68a0e71mr120033465e9.33.1783691571922; 
 Fri, 10 Jul 2026 06:52:51 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d780csm60536136f8f.11.2026.07.10.06.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:51 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:51 +0200
Message-ID: <20260710135251.761210-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705092955.182945-1-bernd@kuhls.net>
References: <20260705092955.182945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691572; x=1784296372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SRdcr1tN59zOrauKBef+GnBt7TJdTcLY5AzgbxehPyw=;
 b=GUtvnb3YnQqkHKzPbv5oZxqIVWo7acrQ983vnvPM/fu7G4gzKpMOZvsN9YRdMjvcnx
 wgFVGs9Mp4Nu1L3Qmi4PLX95MU26rXdYMD5lM4o7/Lqc5KMEH9b9YeQZ9NleQdcG+jXV
 gdOkSpuNUL39Cvjn4ouWLoxShRUEMWHxnP9XRpyGasOcwe6tmoBNp7AgOieJNW4EEHPS
 isEc4h6AmHB8Y49yXH72SZley/iIJTvyJBolLyZBWSZkMCuv4iD/3zvld9//Jh6hpfca
 qJsUtE2gteHUry9eSTkoHiFGYHukPO9oesBj4uqRzXG71ipjlwty5VB9TVt4auGuCbFe
 LF3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GUtvnb3Y
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: security bump version
 to 2.5.21
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
> https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000506.html
> 
> Fixes CVE-2026-34182.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/e403405eff557c97066dbc3634d3099d3a287ae2
> 
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index f69b7c6eac..a53f46c67a 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  96371ec0260da5a22edbf8e4d3bf0e54b3ea5b8e  gnupg-2.5.20.tar.bz2
> -sha256  6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6  gnupg-2.5.20.tar.bz2
> +sha1  51fae4f4d902787624eb7047f6d3e7c263ad7690  gnupg-2.5.21.tar.bz2
> +sha256  e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352  gnupg-2.5.21.tar.bz2
>  # Locally calculated
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 7756023798..05acd4811d 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.5.20
> +GNUPG2_VERSION = 2.5.21
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
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
