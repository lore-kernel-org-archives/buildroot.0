Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FCACD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1546153A;
	Mon,  4 May 2026 14:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXHXkkbUgdlL; Mon,  4 May 2026 14:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0B261552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906072;
	bh=SoWIcW6Apyjqrtev4YtVqpWaCiFDTAEURdC89Ofogk4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VDYj81ypwZVyHuivEReg6N76bPs+Qch3GVUQjJk3khHij4/Q3VSbSCNvvjOW8BBnI
	 nRrAsZnfn9xUdUpzvDUyvrH7sibnAEMjYZdnuKFrxeCygqXtQ1q3DS5ZfEOD7SJ/jU
	 CjkSOw/DqXs/fOw66SObZOPpUlsIubYSVNplTmP504SEHEgZcT170hHZ6hJiJ4/xpS
	 JeNyZWWz3RGiZtIBf6rhfJoHCpSsdQH9sEVpAub8TxlXL8m7vkKkseJ9eXknNZMYRr
	 9boh8gOoCaipFtOWR2OVngBG0aHsxRUnMloLTR1zc2qx/4OJoXsT1J9IddPgNz0Di/
	 /VDuMYaipLrYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0B261552;
	Mon,  4 May 2026 14:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ACBC25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68D6241BE6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FVrqS9RSd5R for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5354541BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5354541BE9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5354541BE9
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso2517675f8f.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906066; x=1778510866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IZJNrf/x+rrzf4SIDbL+gPPB6sK+rVArUicoHhiFYoE=;
 b=TBn/JflysudG15qs56zaJQI1qp5Tk5CD0YGdb18MRD4tA9nYMT6AC6crq09Xx5lAQh
 iFYJ/ePy3Fa5ipkzN/6pQY0KaBW8XPK5crx05JKWDmVmXl9mKuhsKWc+914eeHSTCBev
 mypjmRkJHjvIEzr/+s+PP2pPm/kUeolDighRqXbYtzFQ0qPQ4DEjOL6RgPLrwGsx2BdC
 xYjzbajTGSwBHib6RUTLxEY8Foed4IOXLGtiLEwcV+GY71ZeHG3QzP80Tk6BxQzvjTWu
 tcEMRNg6PPvKZaDV0lHN4S8CUdC4UG8hsWZ1NyFrslWP0ysU5v09jUMlYWs66mdNl9c6
 bFqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lde4e38HFOYFnV/YUOiau9Hl7UZTxGUV6es24Xy4/GtMCVBrdzUgQEnWATIQTXnpKj0m2bV72TJE=@buildroot.org
X-Gm-Message-State: AOJu0YyDB3pKPy3QXS+0GsrBxSNbnAU0L8xcCzgS+SOBy8evjOSo+rv8
 oaqSHzOqhjVwaE3U5C/kqtP7m0Zs6czbesZm/NgGtuSPfNxNPFCtnUOWsMvTK/syTcI=
X-Gm-Gg: AeBDiesJkMVJ/i1HzH/PVr4P8tSei7VITA6ZR33Iyd1VGl+mli8bMHTCAPgG8o8/rEL
 pJUmqqkapGYoDybvhzsxf4Ei8nwK7ur1cFRutfiA5MGctyqj6HHoBdpW5O4dCqWjOlTAZul9nbM
 9qGiWYLx57RjfX9XEcl0c4ovZi2EdTukb9/w2Bjebte2N3rAaXliZ77YxvlIzJNkWnfCuDOwRqX
 cj9ScAWk80ka0GY0DdYZdeN5xw3HR5SeEfMOm9XBQ/L3dwMjO5b0wwV/eLaA/GUzNe+J7vIjHVy
 fzbIE8QjnKCvK+tPC0XROZWmM5eFPmDEZ48uIwPzS9jJhBf64MemyEW3dmh5CJpu0LiIM7Bg+Ug
 EAM+auLxFpPTHbP+I8CfsUS0QFXb/6pHeetO+WGOB2RD56x9eOb1HygaDvjUi3ASJl826YHuyFK
 Yv1S1g5s8w80+vCis4rZVVKqt54A==
X-Received: by 2002:a05:6000:2484:b0:43d:7b7b:ab77 with SMTP id
 ffacd0b85a97d-44bb34e69cemr17448773f8f.11.1777906066343; 
 Mon, 04 May 2026 07:47:46 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8f237368sm25217151f8f.14.2026.05.04.07.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:45 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:45 +0200
Message-ID: <20260504144745.10346-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422171252.3200023-1-titouan.christophe@mind.be>
References: <20260422171252.3200023-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906066; x=1778510866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZJNrf/x+rrzf4SIDbL+gPPB6sK+rVArUicoHhiFYoE=;
 b=b5C2znBW26GkqgxHGiMcHoV6NTILkEiGXi557fVuV5mZttt1EV6ukZ0fdecbgAQryE
 mnc1wym8VCd1PwFgdsY4A2zpxTUwkwZjKWFTbEXUNI+385TjyECgW/ejS51mRujxXbit
 Q0wtC0k2oU7dDLm/RAxMp1FokLjMHmQMSzIEfwNNZF+qtckNJ8oijp1DEFAIzaM7mXlg
 fVu0XGMtIA8lbdlXT4LyivdJYkeQHPyjcLymgkttsPv9i1Km85uffyX402IhOKlTq/pN
 /SzQqtAn5WSlMkO/WnmBtMITf9+YAa7zGR/p5cLP+3wKOJZKmcAvoRxcu0zlQ0Ne3b7v
 YyBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b5C2znBW
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-19
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
> This fixes a large number of CVEs:
> - CVE-2026-28493 (since 7.1.2-16)
> - CVE-2026-28494 (since 7.1.2-16)
> - CVE-2026-28686 (since 7.1.2-16)
> - CVE-2026-28687 (since 7.1.2-16)
> - CVE-2026-28688 (since 7.1.2-16)
> - CVE-2026-28689 (since 7.1.2-16)
> - CVE-2026-28690 (since 7.1.2-16)
> - CVE-2026-28691 (since 7.1.2-16)
> - CVE-2026-28692 (since 7.1.2-16)
> - CVE-2026-28693 (since 7.1.2-16)
> - CVE-2026-30883 (since 7.1.2-16)
> - CVE-2026-30929 (since 7.1.2-16)
> - CVE-2026-30931 (since 7.1.2-16)
> - CVE-2026-30935 (since 7.1.2-16)
> - CVE-2026-30936 (since 7.1.2-16)
> - CVE-2026-30937 (since 7.1.2-16)
> - CVE-2026-31853 (since 7.1.2-16)
> - CVE-2026-32259 (since 7.1.2-16)
> - CVE-2026-32636 (since 7.1.2-17)
> - CVE-2026-33535 (since 7.1.2-18)
> - CVE-2026-33536 (since 7.1.2-18)
> - CVE-2026-33899 (since 7.1.2-19)
> - CVE-2026-33900 (since 7.1.2-19)
> - CVE-2026-33901 (since 7.1.2-19)
> - CVE-2026-33902 (since 7.1.2-19)
> - CVE-2026-33905 (since 7.1.2-19)
> - CVE-2026-33908 (since 7.1.2-19)
> - CVE-2026-34238 (since 7.1.2-19)
> - CVE-2026-40169 (since 7.1.2-19)
> - CVE-2026-40183 (since 7.1.2-19)
> - CVE-2026-40310 (since 7.1.2-19)
> - CVE-2026-40311 (since 7.1.2-19)
> - CVE-2026-40312 (since 7.1.2-19)
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 90383c4d17..a308cd1f06 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
> +sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
>  sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 5a03fbfd8f..d88323ca2d 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.2-15
> +IMAGEMAGICK_VERSION = 7.1.2-19
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
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
