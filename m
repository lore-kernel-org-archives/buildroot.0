Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF0CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB01B410D5;
	Mon,  4 May 2026 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cK-GkS5QygV; Mon,  4 May 2026 14:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C341641BDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906063;
	bh=gbf8FzChAoUw71ghJvfYLmldFYumMTU0n9nlwcRK39I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YA9ki+vgaYFJkWzUgVEPs64zteZDuDLXBxOG22rFccRafza5lLP1Cvp8ZFthF/pgF
	 JrWNxC3UGXfLKLo3wMP0NPffaSaa+apOJtTbelu8UP0mlupBS+2jrIoWJVZYnpAX3A
	 orw2cbatFTvU0RSz8JLeLS4s8+6BXGeZGIyZvKg2rTtzbf78Izrlfid8cuVCvQumEk
	 ig29xgLaQe95sXg4rwbLGBN8qatlqilM35To2JbBiKXLdq+0yzWLMXxyOzJVoK9fyY
	 8BglS9ZqYdEZMYPyPk/uZ1qVoCKYTsrgatnLfQIk1XGOoWsIN1eiXXjK8pWLf6FupP
	 kHCSPyi3MkUFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C341641BDD;
	Mon,  4 May 2026 14:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E70B0190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D94EE84648
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAf7_oSvm8IV for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36108845BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36108845BB
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36108845BB
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so2298910f8f.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906059; x=1778510859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qw5M8PeQNHVrmvZMmm1Fmmnq1Rm7KrulIAQXzHG/m74=;
 b=bu8mfQyWUf3Z9GjgjVGOoPTeeXxZHYIXpFctWR/mc01GBNiDDe+hrsnsLf/OQ9cI99
 Y9JtYDXKBwTuZPyqSoxdK1kakVL1LsbRrMHc6gPl2PkY9zZTXPHSZj/Ov7DOHbc3QmyZ
 6MFzHB0SSW2G6cv0wxghSqo6lt6e3Ni4N5j+gvKgDz+Em47tCbrNH02naCZuyTuqOrh6
 Q08K5+IuotXOy8tlfh1bhCujaFztJ1dQ3vLjdjmkbkqNTg+D2WeNE2x2m4ti4qe8w2OX
 VXk9MbRlU3RsrI0sEZl0kChRoM8SFWL756wiGk/9FKb750gLwxTl2Xds8+fMpuIUbOkk
 VbCQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lk21pYDq0xCazZG9MIYP8TT0wwSuUzOxvwVdjIUF9SyPT4dmLfSPrGgmYeR+Ty4RUe8QDSkoYfXQ=@buildroot.org
X-Gm-Message-State: AOJu0YyA0osSiL68qyv3xmWo38L/Qputffe04p5XSq7elS8mEJaCIprt
 2f2BMU9xxcKgpO6uXQPNevuo560TdRrkpM+t2WVfCBIu7xXoUL2mJ2RMIfi4JMEn8wU=
X-Gm-Gg: AeBDietn6BCd8DJJOuFtWB0+7zXKpOLPsxEYe+8JVEgxYQLaQUCmySvQua7x09dmTMS
 A3acmff7rSUWkUJD0upBp640y49VixfXI3z+T6BTwCQNDBT9xUzLIiWwePHcv/Aqi6YLWx+/or/
 50FEq1HO6Zyqq7XblYEahSwTQbXQ/c7URMkuB0bYf4XkiwMPaza65WefdYZ0B2PIcRMkaLDzuqm
 gVnX6lGpPTfiPE3wqx9/YoDgIP4o2Rqjjx+zIEsq0GcjIEmSdLXF2PE053wE1T/jRMcDvtnwofY
 vNxwN6HHnMYUNZ4vxvFRTm+UMxiZ8JnsZSrNW5uwQAc7zn8bqNszNTjiUJintMegFEKACovQC2E
 6WcD2N9sd1XnLj8rZ3a0MqBtkaQlJ3ZGuNn/VOnT5R1ZNQ2AKLu1i8RD2yfNo0+nUbI+ofwpDr+
 nC/XvVYh43h0CRjfBMRWug7G1riQ==
X-Received: by 2002:a05:6000:25c2:b0:43d:7d6f:f535 with SMTP id
 ffacd0b85a97d-44bb5f24ab8mr16035356f8f.35.1777906059000; 
 Mon, 04 May 2026 07:47:39 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981defb3sm35572327f8f.20.2026.05.04.07.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:38 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:38 +0200
Message-ID: <20260504144738.9918-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420214451.2704785-1-aperez@igalia.com>
References: <20260420214451.2704785-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906059; x=1778510859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qw5M8PeQNHVrmvZMmm1Fmmnq1Rm7KrulIAQXzHG/m74=;
 b=QOC508m9R+XyIowpOzz4mLOKNkJSLe3mK4RfUG1EhgwV/Bo/0x8su8lKDx21Tr0J/4
 AKjjvdFs6hHhLL9nNgUUn9n5PEeHxCo29JnAfd6LQnJqicA/Pi7Kiw4MZ6c/1lFCCgGP
 3xkxjkkPnKvVkcTqS92OyIzfiJjvl/SX6bm9+lcFepAT1l9/HCB459r2VZf0GXpU5tk8
 Uq8WNnqPYywUGGe1IANcaVxfvLqtzTWn7Ngb1NzfLj9XJMZasaiBLVve4CxTicNLCRdp
 xS1AsFkKrO+fScQOi3G1Z/LTeb8EYe0BuT1GrjUH53EnFMcwyprUh/hNXsKkc+xp8K0k
 XDMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QOC508m9
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to 2.52.3
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
> This bumps WebKitGTK to the 2.52 stable series. A welcome change
> is the addition of the USE_GSTREAMER CMake option that can be used
> as a blanket option to toggle all multimedia support, which matches
> exactly the intention behind BR2_PACKAGE_WEBKITGTK_MULTIMEDIA.
> 
> Includes fixes (among others) for CVE-2026-20643, CVE-2026-20664,
> CVE-2026-20665, CVE-2026-20691, CVE-2026-28857, CVE-2026-28859,
> CVE-2026-28861, CVE-2026-28871, CVE-2025-43457, CVE-2025-46299,
> CVE-2026-20608, CVE-2026-20635, CVE-2026-20636, CVE-2026-20644,
> CVE-2026-20652, and CVE-2026-20676.
> 
> Highlights of the 2.52 series:
> - https://webkitgtk.org/2026/03/18/webkitgtk-2.52-highlights.html
> 
> Release notes:
> - https://webkitgtk.org/2026/04/16/webkitgtk2.52.3-released.html
> - https://webkitgtk.org/2026/04/13/webkitgtk2.52.2-released.html
> - https://webkitgtk.org/2026/03/27/webkitgtk2.52.1-released.html
> - https://webkitgtk.org/2026/03/18/webkitgtk2.52.0-released.html
> - https://webkitgtk.org/2026/03/12/webkitgtk2.50.6-released.html
> 
> Security advisories:
> - https://webkitgtk.org/security/WSA-2026-0002.html
> - https://webkitgtk.org/security/WSA-2026-0001.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/webkitgtk/webkitgtk.hash |  6 +++---
>  package/webkitgtk/webkitgtk.mk   | 12 +++---------
>  2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 77bdc5485b..03b8d0a9be 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
> -sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
> -sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
> +sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
> +sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 26c70ae6c8..54e769d589 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.50.5
> +WEBKITGTK_VERSION = 2.52.3
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> @@ -56,16 +56,10 @@ WEBKITGTK_CONF_OPTS += -DENABLE_BUBBLEWRAP_SANDBOX=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
> -WEBKITGTK_CONF_OPTS += \
> -	-DENABLE_VIDEO=ON \
> -	-DENABLE_WEB_AUDIO=ON \
> -	-DENABLE_WEB_CODECS=ON
> +WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=ON
>  WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-bad gst1-plugins-base
>  else
> -WEBKITGTK_CONF_OPTS += \
> -	-DENABLE_VIDEO=OFF \
> -	-DENABLE_WEB_AUDIO=OFF \
> -	-DENABLE_WEB_CODECS=OFF
> +WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
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
