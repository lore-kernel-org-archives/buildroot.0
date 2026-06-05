Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B717CCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91C1780E1A;
	Fri,  5 Jun 2026 12:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1BytsHlPbLj; Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA7DB80E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663861;
	bh=2wTq/qNrGtafN+Vpojp74tiZUpjzrdcDNa1w5ngSDb4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M9YZbs5WaTgPIBaLiIsLYwaGDsqf79Cv4AbbO+gemiKRYnpL17IgF8QINKmMqQAu6
	 KOPYkNnKjgJVKxmnSuYptkzAwSw0OogGFzr9lDMtkV1+9hz7Y3ECeiF/U3eThmgGAq
	 tH5uB7QyOiryxndHzINS8AQ7/jgo1F/YpeFXa/J2fQ1mHKS1zk6syp9O3XgMGmi2DR
	 27HvAoSnOdk5h5+PEI+n2NK4meYFNMuyjzQC92oTAgmlxhsu+3x3j6LdYyurby2N3Y
	 OL/dAT4+eWyZN2TLFYmUO28Z9c1CO4pbZHRnY/yaLfp8Y92i4p1DzDfR/OU4shNu2P
	 nrLMhn9FqeWtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA7DB80E0B;
	Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32494388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 192D0405BB
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLEYIrdji1tN for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AF224014B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF224014B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AF224014B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so15537715e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663854; x=1781268654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aPcuJunTO6AE/HWAykdER93tw2kbZgLn7+a3imlVcCM=;
 b=e3uQIVBeaufNQnmzWLVyY46oAwM1WP/lwnKQAcIMQ1rNPC8Grg1/DfOxEHG34zYDmZ
 Vs4NRU7ePR6gp5sb1wwYHJ8Y+ZPyzzbO4KrNRnm3O1laS77C4M3IIHVlsO0iiySAYwcH
 z6qoIRbXZxmK92zYPa7ghElYC+SQgEf10JGImlu4vTSvv3l2nsh32rKjKcDLsU8FGv+K
 lw3NJPzMkYx4zHUqmlOQLkpD+nH3k3ADsTzbhVdDXscZj2Dcb9hnjNqNDrostX5sjxff
 AWfjw6zm1L1dtZyDJ4bKuyUXqqG4dN4b2lERWNIcyB6f44hWMS1ppj+t5X8daS1Fr/n4
 BlFw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9A8z6e3nHLaMWCtGYeJBNOnMJ5O2dontzxCgXfmyIcd9fDRnIO53Hl4I/KkYTPi3L2yR2igdD500c=@buildroot.org
X-Gm-Message-State: AOJu0YxKf8zHKwVnY0PjWfEg6pW00b+mEThRL/1UmTclACjsqsYZmR5r
 nE+DGkP7sMFYYwMimLb8UET+O/Lsa+GND9HN/XeeRXiuERZyWilhrEjHJoUjyNZ+MFM=
X-Gm-Gg: Acq92OE9wlcGSfl8l6eexlEwy5/X+3Py1pET6/fU765P1IHBOwVpkzRMHyQww7dPnYL
 GrSBiPJXP8B3qQ6Sk7tgjfOqsI++v+GQQ8o45FcdaHN1fEVGDurSXjYIbPkviwOJU+DnaBPvn+m
 kQzypDdDOlEonSs2AQp743kL8BGaM279AgNCuKT0Oq+Fr5ToaQitCCLGTlfGIrkfsg8s8xhflZh
 SQFn1xxizIAGPlKskrgIUtJCJ0iDBtPRH/e+H5kmiB2tDmZNlQnafX6Tyfn8LoZunI/dEnne/YV
 04NkoIOZDH451gK2YZB03kURbr2+zAncKbAUZOixR9LgKdoRQT8MVMNZ6MmrwBQae73pwykjg5H
 WWsxftfPywgb514u4IbgBj8krSJ8Q2GSFuQWuk03y0n1Qhs7T1c7wfCTrDZ0c39QfazloLkSZqE
 SgN6XEW1G/W90HAIcb8lIRBlwfqg==
X-Received: by 2002:a05:600c:3492:b0:490:aeae:1eea with SMTP id
 5b1f17b1804b1-490c2597362mr55215945e9.7.1780663854109; 
 Fri, 05 Jun 2026 05:50:54 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3d663csm167468895e9.11.2026.06.05.05.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:53 -0700 (PDT)
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:53 +0200
Message-ID: <20260605125053.274684-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528172452.25273-1-raphael.pavlidis@gmail.com>
References: <20260528172452.25273-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663854; x=1781268654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPcuJunTO6AE/HWAykdER93tw2kbZgLn7+a3imlVcCM=;
 b=ZSMDLgU6mPk4J5ElfAjsM19LaUYE1eLijeZa3CvktopaujXBf/DxwZF8XczfivdEYf
 Th8BpUN3iH6QRbuWVd4OkPA+ktyGvoDlA9Je1/s8+ZI5mPy6gng8JnkyiEci91xxxuYE
 JCfUYbGp0ZzSwNdrgXg6LZlv9iab6itzT1YbXChymY2ebC9dpsk9F56Rjt1VOBJUAZWs
 cvMlruwW1nyJLCmVszcjWv41fb8nm0bJWkgCpEwYyOk9BnDBJi1bd/5PE9KBQoPqBetD
 IGbL7e6JN8kv7tK1T6d3tqmVMdFmkB3MQw1bQVDXEJEj2dwZj+31syJjwBnHC5GWEcLS
 aQAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZSMDLgU6
Subject: Re: [Buildroot] [PATCH v1 1/1] package/xwayland: bump to version
 24.1.11
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
> Changelog:
> https://lists.x.org/archives/xorg-announce/2026-April/003697.html
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/x11r7/xwayland/xwayland.hash | 6 +++---
>  package/x11r7/xwayland/xwayland.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
> index ba84d20b9f..6204400852 100644
> --- a/package/x11r7/xwayland/xwayland.hash
> +++ b/package/x11r7/xwayland/xwayland.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.x.org/archives/xorg-announce/2026-April/003679.html
> -sha256  459762be8ea046c94386687d77a87add6073868bee14f02913eafebb945b7aa0  xwayland-24.1.10.tar.xz
> -sha512  bceba1db7f4d7ac92d2b2a3c8f6f7ab0cc093f396fe89406f8dba25e32ffc3edfa552df246cbfb3b0708c1d28b3e179694d11870b063d5b8f9ab2db9fb861a8f  xwayland-24.1.10.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-April/003697.html
> +sha256  27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff  xwayland-24.1.11.tar.xz
> +sha512  586d7e60c8bf0d92cec66451284c6c43b960010f14a1e204b5de722c610dc067481fd6ece0ffae615ca53ca2d0262e2a3dbb916d04811b8d57c1085bc363f5e9  xwayland-24.1.11.tar.xz
>  
>  # Locally calculated
>  sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 5902f85d4f..0643cc5c4c 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XWAYLAND_VERSION = 24.1.10
> +XWAYLAND_VERSION = 24.1.11
>  XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
>  XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XWAYLAND_LICENSE = MIT
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
