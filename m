Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D25CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 325AB61377;
	Fri, 12 Jun 2026 11:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ks2D6gG939a6; Fri, 12 Jun 2026 11:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A56613D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264321;
	bh=zFHc5kovtfEB4Ab60qZqA80DjXz5xC36aGJpjFDNL4U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rjb5GaMxeNFBM3EIRE0cqP+8Bem5NtjCQeliWuvP2M6D7zdzOuhjX1bWKpdRszKSL
	 X02oL1FcRyzfJIBrn0KQa3LrvFvJnk4f6wH6EVqaZ2JKw+Z1YAvLm+oWDn94qcAlLT
	 Z2uK5mE2xPz+udtffvqGquCn/2nPqnUmKtv3YgGVyIAzS+sTxPCsEF3oeGSz3QNSBO
	 oYbFd7aneyWIYPkbW80wo2o3LkB1afc/aOkcwDzjOBawE18OzgBkb0i2EJWssvMQie
	 dBgvwsrTM462RGtipxGIishBO/X4jpFJZQAVRBZLiWnISvpxvZ3EUDZhi6UP1HyrdU
	 3GfNkCfTk8kQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A56613D6;
	Fri, 12 Jun 2026 11:38:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6AF4237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8105832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ShNRCY3Pln1 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A238C832EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A238C832EA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A238C832EA
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so7587855e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264315; x=1781869115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kHvCJv9WQsdnUu5K2ac5+Ulk0Y1Nt0sY/p2E388Lkas=;
 b=mo2q/Iq+ESDc/C7vb6pggt0m/XZUisop3mPmpZz8sPWHeVnIRQsQeTfnhIMPnXBkr1
 UUmHZibX9iZd1mRp20vvud77tCHcaTZOAh4K3BrvSJB7KmeqkSjtKqDncdSZ4xKfz94H
 YXmceYkcI4/6pWo5Mf+pl1DgsXUEipxVk3u48UHo/0HjDafspi2/oLOsguNncBCGV5U4
 LbuDtbOQ8ETk99XE4juCA7aA7XOebSKd9yyf6cI98RHLFy2tE1dHe/qip0i534rxbUQK
 PbGDasdIV3vG1T4tjKoy/laA+eJ96qtAN6cP7EDs1LQPY1M2PMA+WFnCzVb92UeO/48E
 qRJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/OkePnF8j+JBwVoMg3cSxDxOoQP/EQV/FsGwAWx+uO0YT5zvxhfcFmZmvNxQgunOVeldFaaOIjsrQ=@buildroot.org
X-Gm-Message-State: AOJu0YwzZVqrzyFiMW4QAJ7moiLi0ktlgdCUMp7wsUttv+JJn7f1e5D5
 yo7axrYOndhHGW8si/bq8IkWbVkhEKJt/Lq+DTzlBgR5sgvV1dWCv7YegD8jo0MoQYo=
X-Gm-Gg: Acq92OEoFkdVmcqDi7CjNcnVg4XN7oGyLFlcZLcucV+QWLZdixZToReoUTsnLYSGBf/
 riAhUHLjygHPSgZRUogDIxYPBXfSHSzpelWMrsQ33SgJ/t3/nXaleiOCilfDipCmKBjTpu3248M
 LZhl4gdT8OjPVuKlkQZYPtIe+l7rbyKgDKh8Uau7/SinJlKCly3oS7tIhd/elvD9sgkbsgXG+Go
 uNe63N/NgaZcq1vU35Iz0au7RM/zCxzyLmUli+wH14Dng3EVEaINZ99Hl4aviVeE+jJZtKZ8DdK
 qxipsbLQ+whLNlPo2t8o9jWYtseiYa/xGhB7HLH2odeUl0q2oXSiHoexGcRaVOaDCvtiKi0j8E7
 2N2D4B8WNcCR5pSf5DWj+yvVOzFhwVTwHqmk7tlI7Fur450xtKU3i4gP++KxPncO/Kpyr5eojWz
 BfL+t8U6+ADkNLiGU=
X-Received: by 2002:a05:600c:5010:b0:48f:e230:29f4 with SMTP id
 5b1f17b1804b1-490ec4e1c7amr25018215e9.15.1781264314657; 
 Fri, 12 Jun 2026 04:38:34 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm72512165e9.0.2026.06.12.04.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:34 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:33 +0200
Message-ID: <20260612113833.253587-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070003.3911896-1-peter@korsgaard.com>
References: <20260605070003.3911896-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264315; x=1781869115; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHvCJv9WQsdnUu5K2ac5+Ulk0Y1Nt0sY/p2E388Lkas=;
 b=XeeQYzitxrgj2wdePErwNM+wI/n8yMxb45EubleU9e6I3ZWB/czFRoK6DFNk7+cPLc
 HkU8pov1p9vKXdFRy1UQxER+SiUvJbGo+NZ7D+q+Orbm/UTN+gJPQ2OHhSNgNu4civUM
 EebBLq/gi1/RQ6TalA7Ma82wYiOODcbfAyBMJF1ihILbP4i9H4LNHgvrvzPRgzNOZRCe
 C50ukKwhCXpdT4mIER+cRaMuf9NPYBQ7zkKP0pK1JR2b3FloEZODqV/ZlwMM6oXG3GBX
 v/H0UuKl5tmJHDeP+NrP0LL9XkK0YbzvTBU/2VakT52zpWiJ3LtVZBl3Io/n0/N5cMWV
 0czg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XeeQYzit
Subject: Re: [Buildroot] [PATCH] package/libusb: security bump to version
 1.0.30
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
> Fixes the following security issues:
> 
> CVE-2026-23679: libusb before version 1.0.30 contains a NULL pointer
> dereference vulnerability that allows attackers to crash applications by
> supplying a malformed USB configuration descriptor where an interface claims
> bNumEndpoints greater than zero but is followed by a class-specific
> descriptor whose bLength exceeds the remaining buffer size, causing
> parse_interface() to return early without allocating the endpoint array.
> Attackers can exploit this flaw through libusb_get_active_config_descriptor
> or libusb_get_config_descriptor by providing crafted descriptors via
> virtualized USB passthrough, file-based descriptor parsing, or network
> sources, causing any application iterating over endpoints to dereference a
> NULL endpoint pointer and crash.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2026-23679
> 
> CVE-2026-47104: libusb before version 1.0.30 contains a one-byte
> out-of-bounds read vulnerability in parse_iad_array() in descriptor.c that
> allows attackers to trigger a denial of service by supplying a malformed USB
> descriptor whose bLength equals size minus one, causing the bounds check to
> use the original buffer size instead of the remaining size.  Attackers in
> virtualized environments with USB passthrough can supply crafted descriptors
> through libusb_get_active_interface_association_descriptors or
> libusb_get_interface_association_descriptors to read one byte past the end
> of the malloc allocation, resulting in a denial of service.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2026-47104
> 
> For more details, see the announcement:
> https://sourceforge.net/p/libusb/mailman/message/59335553/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libusb/libusb.hash | 2 +-
>  package/libusb/libusb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
> index 4c76609930..7b4b92e6e9 100644
> --- a/package/libusb/libusb.hash
> +++ b/package/libusb/libusb.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85  libusb-1.0.29.tar.bz2
> +sha256  fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf  libusb-1.0.30.tar.bz2
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index 95ce8b17df..1352569f7b 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBUSB_VERSION_MAJOR = 1.0
> -LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).29
> +LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).30
>  LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
>  LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
>  LIBUSB_LICENSE = LGPL-2.1+
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
