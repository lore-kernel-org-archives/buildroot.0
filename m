Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A4CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBE540664;
	Fri, 15 May 2026 13:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-D7PLGq_kXq; Fri, 15 May 2026 13:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F2B40588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852045;
	bh=2fKWK8DMa/iJ0eBKrVcrryoVNJn7ODepzyDmniEfSFU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BLaIBaJ/VI09GNBOL+HdUfWjyQN22EcWmjoN/2O66HLPCOJU4I7F/IZQshUkL2aw5
	 wOx6u+OjMwhv3XRxaI9w7Jnu+Pii4ibN0JBSMIGiUKXE9A8OfzZXKxpSJcY6LVLrr8
	 pzNhPMaCMwQ3BPgxewbl9++Sm9DZgYgXwoF5OOP92GYRxuqJZ3d2N8aeygvymRqvHg
	 wQblAZ1PGZQbW94NWP7Kmluxiitxa/pscARcw6020fl2stQ0soeVftJElj1YLPaqd6
	 msOYTCG5kHOW19MNMCOM+8BvwjAaxD/Q8pdLiMGLRfSA3Jta6+BAKnS+LrpQ0c2zF8
	 6J8mlUDiBlkEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F2B40588;
	Fri, 15 May 2026 13:34:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9163A36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 773DB40585
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPDmYT-Tfxng for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB6274053C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB6274053C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB6274053C
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so613772f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852040; x=1779456840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t8CVSwaEzrxwlfdaD+rV/fPazbQo/Iabtn6Y/bpe2/c=;
 b=SotEo8fxdHIMQoCUflO3tglbHLZdZBvmLMcZfqT1MaLmxG0PfCL7wOoxsHGA5fWvrx
 bzKXaEaqDGAo/sY8O2E8hZ+RkkOWi8TLdkN2WDh5wcqL9ycFRmPlktADN8yUy2iAkvfs
 medQztmJEtMgiIBqfv90nKLjjdjcpnLX3B33YRcEXilQtucTiAQf6Xr2AaH+wNQp5n4q
 okzQQvqvxZdFOUYNPDxJ/KaNNEK7uUOzfEcbMkUI8vAhloJv4X315ia76or+UG/gdDNV
 jhDCO7h77sIenOIwr1mWJLlETWaEcmxtj2JOjltgMmrOKegkGK+xAwzZnQnWW+oWICU6
 UGVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ioM2b/F56BGjMN5qyPYVwuLlKLRxYzvKtGjm7sMm2Wih8He6mydwS/QTyTtXXyjt4Iz27SF6ttaw=@buildroot.org
X-Gm-Message-State: AOJu0YxpUHUPD0/0nF86/Ptsbh50lh+Z2c6fE1xRgF4pN2EB12lQtezn
 g9kmQKZEzcvkLb7sTD7rm//ytV5X8pe4oBrHQgSSgHSZ7BhrkD3xR+5a/Apttpc/Yms=
X-Gm-Gg: Acq92OFn4tdt6HPUme0TBvaT8OS1f2UStvI6Hb6qn4u8eMqHkEzjomaTrYZg7Hsqrmq
 eQrvbpSrEQovGl7+Dfl2p/IwUxwliRKg9VR0LnU/dczHNN/8Va6r1I9lTkwMFp1MxyWPVaBIcDc
 AZBzzBR+W3/cqRQ8JRlMyw73fGXeWFJEa2yWj8IuZsX8a0LA0hW/kdKuBvdn/HRit4czhecmKIF
 BitpWIMEdCUxUP03vrQz1OTtamq9L8OzCV3/8XQCf2EVGRMeV6tEFSVZ3Oiv+zfYcfiQ81ArCvB
 lYhdNnQlx50EKUvjx0VPtKeVeLR+CYD+CNpgIXbu2efCPWe9Gn574D1Yfb1v0xdW9zHPYQRdM3Q
 TtHN19h6v0thhgAUWFZg8Ly0hhPTba9Ajg+lrtAJf3fYiUdsFeueKJRrA6rWqo308IkdVuiSeKL
 HZniVfPXiCJEhkYo42ETGgwX1dhc5xmV44m601Va4LuR3D
X-Received: by 2002:a5d:5f86:0:b0:451:b3ca:674f with SMTP id
 ffacd0b85a97d-45e5b739fcdmr6065442f8f.1.1778852039821; 
 Fri, 15 May 2026 06:33:59 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6449sm14357533f8f.37.2026.05.15.06.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:59 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:58 +0200
Message-ID: <20260515133358.315905-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251207144243.3696572-18-bernd@kuhls.net>
References: <20251207144243.3696572-18-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852040; x=1779456840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8CVSwaEzrxwlfdaD+rV/fPazbQo/Iabtn6Y/bpe2/c=;
 b=d9ZwCVz0KhmDdp8uVUZDqtn5sOIydQSNSGaIJHssxXOxmJl0LRSYuLu3Y/X/a/Qdm5
 1ZeklpL1zZEbiCFzBXmWR+GJXtK9GL5vq7A2ipqwPhhSYoPXwsCuDJLmXFzt//0Gx34B
 WWiACz1rfxLFRmWEKobWmRggEr3BNT0abnHFFL2RmulP00ilbEdDTan9aiJ0Bz9GNM4c
 6H/xeOxO+phLzSt9zUfXyuI/4BbAC2tw7e6X9p3Ay3ztMV28y5dQ9xsBskVSKlLqm17/
 ABzFjPvkP5W5FEYoyT0clGOVYHo12mz1blD+0pCDGecO5ZmoD5mkMh/i5Sq+3kapOdt9
 4cLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d9ZwCVz0
Subject: Re: [Buildroot] [PATCH/next 18/33] package/thrift: bump version to
 0.22.0
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
> Changelog: https://github.com/apache/thrift/blob/v0.22.0/CHANGES.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/thrift/thrift.hash | 4 ++--
>  package/thrift/thrift.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
> index 20d6baeace..a517900c82 100644
> --- a/package/thrift/thrift.hash
> +++ b/package/thrift/thrift.hash
> @@ -1,4 +1,4 @@
> -# From https://www.apache.org/dist/thrift/0.14.1/thrift-0.14.1.tar.gz.sha256
> -sha256  13da5e1cd9c8a3bb89778c0337cc57eb0c29b08f3090b41cf6ab78594b410ca5  thrift-0.14.1.tar.gz
> +# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
> +sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
>  # License files, locally calculated
>  sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index c36efce2ed..177b75903b 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -THRIFT_VERSION = 0.14.1
> -THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
> +THRIFT_VERSION = 0.22.0
> +THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
>  THRIFT_LICENSE = Apache-2.0
>  THRIFT_LICENSE_FILES = LICENSE
>  THRIFT_CPE_ID_VENDOR = apache
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
