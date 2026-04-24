Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3703BFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB8B84EE1;
	Fri, 24 Apr 2026 16:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mi7tzhdh0oV; Fri, 24 Apr 2026 16:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F26BC84EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048063;
	bh=JSN2+NTzJZot95BnOKdBolklRdgZW4rxSy+BAq/vNdI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GJdgBe+o5Lkk+UGn3lIeMYQKxXJI7hvlEbrOXUyjp+8jUAlg5PIMaZXLLbD7S+zp2
	 +NsphNxJn8Wr91MV1g8xNTaF/407rd0Wa973rIohLN6KMnjIGQpevxFlkJF55SUEIc
	 xRK1phmIHIAKhKAMlR/v79xvblg/H0XTuYX7rGAc3OtdBJK2M1nWkmWcXoPJvrou6T
	 SLzgQmkRsGRrwqcjDDnTYEgoGsP67PO/PiZ8W+UXZxvvp0pOfECLUXWNkoLSLgon/1
	 o+waMncNdh4b7gD2cfwr1h9scOlKDxxaNZQgfF9kA1WfY5DmSMteasEpJSqCAcvzNM
	 OgVoO+B8gMe9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26BC84EE5;
	Fri, 24 Apr 2026 16:27:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72A85194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10C4561C30
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfkQ8_VAF1HT for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E30D561C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30D561C32
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E30D561C32
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d03db7f87so5516113f8f.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048050; x=1777652850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+c7ckfQjPiMJ6lM15y9fa9YR4rqw4TNpDYaRbFJXPtE=;
 b=TysfqECmVcygxxU99F3qykHq5ve6sXhp/GXdLpFcx6jkU3NgnoaZVgHWLgjDxXCROc
 6qCdFGm8iDA6/vXWAgj1iNxa4V3rCPj1mKuh6k/b7tAf9NuzQa+qJwcPXXbdvau8uBI7
 e9Q9kIi4tOA5POmZBE2UdN602h+eGbAPF1L3u5AQYDXVepdBSnBA4y/Gy6gBV5OIdct5
 AoIz8nURCBWT5wDxlJXiaTYHHvWY6Y3ZlPCmBwHSqc8DJgf5fUkvmdICt16oh7r5m0KR
 rvboYu0bCig4/xWXCZTTelJ9uOxHma6g9Mk4y1QbczkI/9SrtcXDP9QyerBKecQF76Wv
 nw+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8TSR/sHE5WEaBnt7yRfBxQC4vQcuIH/gsXNbNO7IGFpbFzyBc+NnS6JftTbKpBCpBg7Hw9aw4u8eg=@buildroot.org
X-Gm-Message-State: AOJu0YyNXc/kYKV0O4H5u0IerLdgE0/oD7BBpr6SYhnxi5IrhlVrPWYL
 eJxBAcLkDQv5HSJeQuC0bskBwFwlanMGvSGwmNsPkP/ykTZlzHbGDrnhfs4D1E1vGCwcOna/vMK
 BPz6T
X-Gm-Gg: AeBDievTQUyHP4r6baGIpimKG/7f2gz89yMxbTQP6WlLdtG/fhUppHHJXcBUF7RFYtR
 Yj3wM2+NxhCzuCYcA4FTy7B0ONqzLO6ncXhVncpzryPSptdBIDoPz5lxYCpqWY6n54SAicpRuf1
 JtgoKDcQgBDPnjaG3VWu/LPZ1j6uj53eXM4gbKASNy465yUkpxNvTXTxUEM8ScIa6/s1ZGe7sT1
 Jq32AD83oapuXlAqMMHHxXiHKhTHnoryZio4a4sqmZ5lxFH6c5NMnB2T3v4c8aPC2VOe6gbfmP/
 t2kfGLaWjMdrNjb+WSNMXxX/b++qTTo/cMEp4Hgzv6D1BHtZ+s+f0U1s4Wcbe06ODxkcuhMIgEN
 hUlQKsj3RGiwuyWK3rOEVz52e0P0EUqyVBzn/OlTQHDWrZ2rg+kCz6rgwyjlyMtNOOHIXmljTlq
 XoXMs8oMVhcZ16LD1D4H7ffD6aDg==
X-Received: by 2002:a5d:5d02:0:b0:43d:77c6:be6d with SMTP id
 ffacd0b85a97d-43fe3db39c6mr50496458f8f.7.1777048049821; 
 Fri, 24 Apr 2026 09:27:29 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4eec9sm57684304f8f.34.2026.04.24.09.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:29 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:29 +0200
Message-ID: <20260424162729.162388-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418144531.706692-1-ju.o@free.fr>
References: <20260418144531.706692-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048050; x=1777652850; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+c7ckfQjPiMJ6lM15y9fa9YR4rqw4TNpDYaRbFJXPtE=;
 b=eUO8vnROO4GVRvBhVECBTsdBiSz4Tdk7tAjIi14g1HE9w6GzLEi3XTxvoHJ0oSEYkg
 ZODfiXHuoTMiFue8sh2VAfV7qI2kxrXj5cgx1rGmyCiWOja8fex6NjxpRZ46lNl40HBn
 TzxSENRnCugHUsT+fGW8HiZzXHoPwylLgbtODriS7+6ZsvoKCb/7fR7IYQUbO9XNU5v9
 dRlEhbUck3xan8FiH3yiUV3pHcz0XVvMLe1pmwBL8ZDkjcx1gKiCVX9DhaCB9ZZInS8X
 eN5cUILGHrsfCd1nFfspSJcO5NuPbFqL72Jm4N8ZmaIVePVcy4M9uUW/AYnIOd9P4RRx
 XSDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eUO8vnRO
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: security bump to
 version 0.11.2
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
> For release notes since v0.11.1, see:
> https://github.com/libjxl/libjxl/releases/tag/v0.11.2
> 
> Fixes:
> https://www.cve.org/cverecord?id=CVE-2025-12474
> https://www.cve.org/cverecord?id=CVE-2026-1837
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libjxl/libjxl.hash | 2 +-
>  package/libjxl/libjxl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
> index 56d1909110..5e76f0ee7f 100644
> --- a/package/libjxl/libjxl.hash
> +++ b/package/libjxl/libjxl.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  1492dfef8dd6c3036446ac3b340005d92ab92f7d48ee3271b5dac1d36945d3d9  libjxl-0.11.1.tar.gz
> +sha256  ab38928f7f6248e2a98cc184956021acb927b16a0dee71b4d260dc040a4320ea  libjxl-0.11.2.tar.gz
>  sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
>  sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
> diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> index 18bebad662..b877e42d35 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBJXL_VERSION = 0.11.1
> +LIBJXL_VERSION = 0.11.2
>  LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
>  LIBJXL_LICENSE = BSD-3-Clause
>  LIBJXL_LICENSE_FILES = LICENSE PATENTS
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
