Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC99FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0450421B7;
	Fri,  6 Mar 2026 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xF2Kebn-Iw2t; Fri,  6 Mar 2026 19:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373D342190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826833;
	bh=HQk+jB1pcmieMd4/u6hyF73YmPa++RPYyvU7lAfPsjY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o/yRkUq/YhuRGwboBirQ0tVgW+DaDfPaM50t24baQUGzxv0KxjQgr6IGwRwBGMh54
	 CNuy+laNupHah2uTj4Hs1l52TtQGXmVvdAcFQOdUqKvEsd8ztHvb/1hZ0dN4KlAJZ2
	 fpSP1yoU0a0TJ/6fL+v+eLF2ODuGJyr6/xmH3/ErQ8h7gd2OJPHk55W91APMJ8KLJf
	 VMOzoBRCvKKEggsdGz7lFKpLR7ohrqWDBImLfZCE7V6YbDVByyLd2++VLBac0XITjq
	 NkPWcLC3iN/HX8OUQYRD7+YqhSx013E95/1VjKORp4nNM5ctsSbQ+j9O1iPB4XrvuX
	 RJ/pJcMrvvqJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373D342190;
	Fri,  6 Mar 2026 19:53:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B12D169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80BD040455
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3LDG7D5K5Hg for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B4C140343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4C140343
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B4C140343
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso4250345f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826828; x=1773431628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WmtxON7V0Zg+kHKPrdoSLizqHyF9W9XPv64HfkpwGNw=;
 b=cCQUX4Ipji58roW6y2KXugxBgc5vaj2U0VzvUAWUuN+xeBDGMHwF43q4QKfP+alUJf
 1F6rcMqLlKRWL/FxRLyvQt82ySef25OYQZ4FBqgI+UhCR0gjGRWUpoKTbyWCUxNKSngd
 iToeeC93IXFVNMzI9XeRgs9j+GOrmjc5uqGUFZou2GEOJuGHh1wUW2KX8JRDvkSjw0PO
 VJeF9JkNVc4SdgCfsoAb2/7v8iy4hfFDLLhN9ZEnjHLsojMrXd2hcxP3M6IEDjW+TcOJ
 PEB5u2bqk7VGxJrJthitJxw4abyiiVDgZpM28HF+cehXmvnh/6LJcJkqPlT/P3gtPrVt
 1Hiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTMLz97V0fegSFiDvfZxkmN9yp6M3cPIo3pvYLhMdVrm2M9aOxYkFhGqMVPh5Z62h0f//MGl+3X48=@buildroot.org
X-Gm-Message-State: AOJu0YzwzJF7SJG60BgItcmK8WJcAITldF4cKQZZ3UiTEojsiaRyzKaA
 B9Fm5fgeCrOnbP5r09kVXZ1k0fyaZ6FZByJ2w/Vss8YtNftdvQ4DErIAC5L35fuBoqwsJCz85uX
 P8elK
X-Gm-Gg: ATEYQzyE9F9QWBMkpje3pAQR/2qup6SXWWxy94drKneuRDhoKzsnCbQOJhpP0jotsY+
 TWq0P6C4H0QaoluSf+WldlGoNEFiH8OAs0+C4hiR82oUJcx2Ba95W5o6NRl04BnzJj4RAxCPBUj
 7VlzdcO5t72pMAQGyHypnXEeDfRzMlEQNJvj/LZCD6DdkAGRlBoYP0CG2lQGgQdlAR1Wk+eUQku
 KlqjEEMf3f1Fg5O3zHvBsXsClt3xRdBG9mjDEk3KRufPKWCkM9el+yqcHfDc72KLybJwAueNd8g
 KtNmTJaJr6WZG/GVWEjRk7KV3zSctN55vNhKALYttuUvKE2vNCNOgZAfV3suRYeoK4QZRwotd8f
 l4hYh1RugirHjqvCPlTHxB5MFA8utU7JbdKQi7xWzyRYtn1p/dsQn4knpbBbPRT8hHAeXImzWdH
 uTmX+BW0StcXvOREyujQr1TMolJg==
X-Received: by 2002:a05:6000:4313:b0:439:c122:4fd5 with SMTP id
 ffacd0b85a97d-439da65d6camr5828910f8f.15.1772826828178; 
 Fri, 06 Mar 2026 11:53:48 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae46353sm6256644f8f.33.2026.03.06.11.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:47 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:47 +0100
Message-ID: <20260306195347.8941-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227194921.3401564-1-giulio.benetti@benettiengineering.com>
References: <20260227194921.3401564-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826828; x=1773431628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmtxON7V0Zg+kHKPrdoSLizqHyF9W9XPv64HfkpwGNw=;
 b=L9bEe4XXGEKqwcMoUwERULddVAGteZlYPD3s5DE/eCoH6oTOFf0CS80u7PyIxcwU+D
 p0e+0t0IUiT57kQc8WzNC+balt6Da/iAdLnyLGhhWJTvLtcmDyKnQY0z2eGpLyvp8ULh
 pzqeKBwJkWoVz/HChT+GpipXDjMoEZon+LUWEbIG/xEGy4Pl1STOkIDe9rq48wlXqhAi
 2PXqhEJzolU0nI8W0biOP5PNrU6eXtb3Om4dS8c8rs8sZXtom4sPQ4+Sajy1xbGrH7Fd
 aNHvY4XKl0SCE/Ju3jqU2a9K/tfUQ46zrWyJpuBXo9wo9MKIm2ygzVqxAJutghiMXubh
 u+pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L9bEe4XX
Subject: Re: [Buildroot] [PATCH] package/udisks: security bump to version
 2.11.1
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
> This fixes these CVEs:
> CVE-2026-26103:
> https://github.com/storaged-project/udisks/security/advisories/GHSA-c75h-phf8-ccjm
> CVE-2026-26104:
> https://github.com/storaged-project/udisks/security/advisories/GHSA-fcvx-497g-6xmw
> 
> Release notes:
> https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.11.x. Thanks

> ---
>  package/udisks/udisks.hash | 2 +-
>  package/udisks/udisks.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
> index a62e6b5ed6..8a70b90a67 100644
> --- a/package/udisks/udisks.hash
> +++ b/package/udisks/udisks.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  0bf30151fe8d9d2fb59b57f6630739dfbbd16417dee69ec57d43b37335bd649a  udisks-2.11.0.tar.bz2
> +sha256  e88c52bae02fa13414604bbef42c6bb91c2e24177ee0057ed55c6bd7451bcb6d  udisks-2.11.1.tar.bz2
>  sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
> diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
> index c9b66872e9..43d066c9e1 100644
> --- a/package/udisks/udisks.mk
> +++ b/package/udisks/udisks.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UDISKS_VERSION = 2.11.0
> +UDISKS_VERSION = 2.11.1
>  UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
>  UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
>  UDISKS_LICENSE = GPL-2.0+
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
