Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7D9CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9CCC615D1;
	Thu, 25 Sep 2025 20:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGE_YiibYIdq; Thu, 25 Sep 2025 20:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A0526159D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A0526159D;
	Thu, 25 Sep 2025 20:17:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC78B12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B106441678
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9VJzL_0fy2i for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CEBA54152E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEBA54152E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEBA54152E
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-41174604d88so536875f8f.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831416; x=1759436216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IPWLEt/VYVPAGq/WbTWNwZ1ITJ4IU/uEaY4SvyStSvM=;
 b=h+k+yiCFDf1Amg3Y4XeUCxkVC/hqBNL/9YtJJhlTs4ceE3UcF7WT+6Ovz8m337ij9Q
 aG5AjfaJawfnvrhszbEahoI8rl3SZF5GWYxIUdXhlnWDADa8ewuCaVSWzEslfeV+Ua68
 76ZEpJe1FrWapvf3ccWR/rJBtzLdzlV/k0yGCu9p9TE+4FWPgPZDyS3VjRadDAkQKh9V
 EMrbqdPdfbMOJEpRyZLHBlV6YtswbDmaZXzQTp2wM3Qe9I4E77HRku+QZuT3yUToPwhz
 Np7VUnzdoKEIaqtIy9kh4HAJSN2g1gYdk+yXFsPEJdmrMJ7z9eZOOcBaBcZM1c+QPhJc
 PXcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQZc1XcPXy/h0EQKuCg6Ep/f8j4NMKA80kCitPHRG3FQjEDQ6AaVJ68RioRHQkGA/uu8WLoZUGyH4=@buildroot.org
X-Gm-Message-State: AOJu0YxR8KZUZ0oYD/KfrV8gofV1nIA1BxJNjfazT3TQpO3wtHdfA7Y5
 p5Q/vqmj9nFi5HY6FLBEvQwEuzxbZ8gQZG75VKCcJZehNA8ku3YGKgkK2Ghf1bMDp2RANlTVAo/
 Oa1ebbi0=
X-Gm-Gg: ASbGncvmhvl+MrN7J+r+3O5WxCH+A2o1Ncyhk8up08N0sZOHGCjSVQD6NHqO0jQ217p
 YOcjx9S6p/+4AkyVcDDePgRri0+c+F7/YGkLhvCJEV6wLP8fdGnyOqx+dMEOl0qZD3l1GtJmut3
 Fd2n2csC+VDKW/sxq8mTmFbXUC+iJmnos//ZNOEqMDcsTNLYMPgxKoKjxIBoeTvQGD18YovCPjo
 HAZClOs/bzvYiBrbxDLDcFHsBFkpX4fJhwOY/m9hEiP13bXBdILW0NIlMP8Cq6ZIQVF9k9VZgUX
 yavgRHxOAedCNRF/I1DHrAXx47jwpzodwALBPPCwF0kNrES9+5GtK/nHZrpf0KdlZos+b9wqP8s
 1VxYaC8ymAY9jWu4=
X-Google-Smtp-Source: AGHT+IGySEMDxgXaccLP9vlawOo0YMk8/ERrV8J2wU2g7PkksMPeXBeTxQ4+wnwBVD/5Zx5UF0Dthg==
X-Received: by 2002:a05:6000:2c05:b0:3fb:6f9d:2704 with SMTP id
 ffacd0b85a97d-40e46ad02e6mr4375639f8f.28.1758831415945; 
 Thu, 25 Sep 2025 13:16:55 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac582sm92780755e9.9.2025.09.25.13.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:55 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:55 +0200
Message-ID: <20250925201655.44015-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aMuo808NcwB44GKN@waldemar-brodkorb.de>
References: <aMuo808NcwB44GKN@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831416; x=1759436216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IPWLEt/VYVPAGq/WbTWNwZ1ITJ4IU/uEaY4SvyStSvM=;
 b=FWyEIsIIRK/nGVHzlcir/Ch2aXo5UscE5sUjkrL/zqfFCCWtjSVFAuE8hYcQK2lmaF
 kMsqotlOADPLB38huAkjxA1dbR61g305ODRtM4LeJpJoUmUiifAX72VafTJxmZrn4V2B
 AVEt/IGMk/5UbO70IK8i9rojaypC/b8bFRiEoAhXXI2aQ1FqCFi34M/sVpFU/SX3L+3N
 +TLAXulMS+AMnA6ZiVujtsT6oXYyYmF6BLnPjW0UerXjPyZMKZRaeh+dWN7ASjKyq5pm
 fhtqADyfJnRko4l2t+QmLfkhFZouAv4yNPsJHtz6ADL7TKzxFwZMR5z16suVyRynrgyr
 2/7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FWyEIsII
Subject: Re: [Buildroot] [PATCH] package/x11r7/xapp_xdm: bump to 1.1.17
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
> See here for Changes:
> https://lists.x.org/archives/xorg/2025-March/061902.html
> 
> Fixes a compile error with gcc 14.x.
> 
> COPYRIGHT was updated:
> -Copyright (c) 2002, 2006, 2009, 2010, Oracle and/or its affiliates.
> -All rights reserved.
> +Copyright (c) 2002, 2006, 2009, 2010, 2025, Oracle and/or its affiliates.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/x11r7/xapp_xdm/xapp_xdm.hash | 6 +++---
>  package/x11r7/xapp_xdm/xapp_xdm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
> index daf1b0852f..13c9f3dc9b 100644
> --- a/package/x11r7/xapp_xdm/xapp_xdm.hash
> +++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2022-December/003265.html
> -sha256  3e9bf25636797ec9e595286dd6820ecc33901439f07705eaf608ecda012c3d5f  xdm-1.1.14.tar.xz
> -sha512  8ed1d2c946916c24cb4b2de9326f65629c97e53b145312c9cb9c6e4308d8b47d67d3981319fbd4feac9b3ed436b9dfb24a1c905d37d7bcf07b49c18a68c7a6e4  xdm-1.1.14.tar.xz
> +# From https://lists.x.org/archives/xorg/2025-March/061902.html
> +sha256  9494aef0911a031c53670725b5c8c9bb9d3f7c5ea7318b1f72ddd9dcbbeceb6a  xdm-1.1.17.tar.xz
> +sha512  68499cdf73c9b6b48b974a724e5d045bb8333cfd17f1d7e36132e7aec51922c22260b361517c4f0d9fb7d28ce4909e0638e00180e93544bc7200d9bef55e822b  xdm-1.1.17.tar.xz
>  # Locally computed
>  sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
> diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
> index 2a343b55e2..03b9ad58e9 100644
> --- a/package/x11r7/xapp_xdm/xapp_xdm.mk
> +++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XAPP_XDM_VERSION = 1.1.14
> +XAPP_XDM_VERSION = 1.1.17
>  XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
>  XAPP_XDM_SITE = https://xorg.freedesktop.org/archive/individual/app
>  XAPP_XDM_LICENSE = MIT
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
