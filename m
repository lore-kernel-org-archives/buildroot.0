Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A89F9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7162A42B2A;
	Tue, 14 Apr 2026 15:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xDDDJRee-Ss; Tue, 14 Apr 2026 15:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E5542B31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181452;
	bh=jrLeiGjeBsbID6cU/QAjGNxFdwPtJztrxbEXO1fJuHw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kUrDHVA6RyO5DEAjE+liooRQBLyO4vuBWaFcOHWc1BrC+4SKGJBUnIyfUWCzRRdsw
	 8NPI9iPiTXLXDDdfP7yRHSl7gBl4jkuT01EnLyiQfoXJMnRm+oDbvQNRoJ65jQ5/HG
	 wLQzjrMfyK1KCLbhcMklKJbNwN3V+u/tp6W+GxlTwXlfh25maVodIwePjNzSLxuO/v
	 hmellk0wH8CbV0zwBjw5HDu4PQKBZ0piXpMUeXWFfvq3532OMDdugCeEWCIho+twkE
	 ItNWCMZ+tfwzoh7ScgeXFEcXBGKzyVGYF5dFmQgXj89VdGgRcpphsuMMEXet8Yi3JX
	 O10lvHYYx9O4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E5542B31;
	Tue, 14 Apr 2026 15:44:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB9E4237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1BCF6F480
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMX4wm7n5AWo for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:44:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E7186F483
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E7186F483
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E7186F483
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so38183195e9.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181447; x=1776786247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p0iCshYxhWf3V+FlKC8D6wVV56WmTRTitapY3mkrOzQ=;
 b=pic8i/mx26kevY75f/5+TRk2Y+KCcnCldOj0tCAPn2OeVaFh3hOrKxQdCU55q47OBP
 p0Hki/ZHAC7N2/bJ4FAy9W9YvJDUHF7UNocIGmi2bML0ib1D/kamdjLfSRSqbM4GBESs
 cPuUA/MqdSiGEGO35KZlTLenZjR4L7YtB8h0VuJ2FazSk4HPcGc/rzPPk+mHe49GZofs
 mOiusblX5NQDTfydTjsosFu4m+KbJAmE/jKRAwLNEUjm4QPq+LMsbh4TJtcaGg3EFQ52
 ULwWQf1/mBVvMg3WVBBaAt1inrR5njdCkYCn9ylK52k+PiENOXf0vUhA6y19RBZePqOl
 HXtw==
X-Forwarded-Encrypted: i=1;
 AFNElJ96pRFlPVYnyRKcFXrGcWAj4ASMpL9wZH4sgVzlXdg9JMAbguX86BLi5Yaai/u9Q7C/8R94as8aLQE=@buildroot.org
X-Gm-Message-State: AOJu0YwA5nLVffj61H0SD7YQw6LPdUX+ZazrV2pU31t0aYTDJLvdwlTI
 OnOqVTIQqnY13Cf+7ytn8Pgehgq6lJdC0moufBf7wCFppoavUtVj/c3jOjSREUsAfF8=
X-Gm-Gg: AeBDieuX9qr9xW9VM6wwU0oh8I9+GPyMfF8hIgieR4TUYH0tWHLhvP29ImllG05cAqL
 23V62pMyeRUVw0atJGb7a0+dtsu6x79mQwg8WYZ+G5Ap4lW/xnFiU/6X6gcgKO44sbMMkY3u73Y
 oZolqa7oEbp2wH1xdpjURrRiJ/BrAXVdvdgmSGdTZIrWtuVfMz7SQ9qBAPhCqra0a+uq/jldwKo
 /6rrHVLyTx1cqtsLfm6x3eXZXzJavQaOyQntfqHlcbGMczeB+n4K1Sp5fja13JwXbpD8BuvvggV
 iMyFP0cgAn1f6wXzIfK1NR4A1nbRaOi2cKL37XIHW5aZYZjMxKk5fOD/E0pnHqNkIDiX0B9aNf0
 pCoYmZMQ+LKMJefhq3oERyCq5W0u1eRbUV+msU7D5UwWR8FXNgZjO839It2Kpgls55wiO1/5Q9Q
 41/4RLWwHrWQvx0ymF
X-Received: by 2002:a05:600c:444b:b0:488:9c3b:ff40 with SMTP id
 5b1f17b1804b1-488d6acd9fbmr203249315e9.15.1776181447201; 
 Tue, 14 Apr 2026 08:44:07 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede15cfbsm66018525e9.1.2026.04.14.08.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:44:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:44:06 +0200
Message-ID: <20260414154406.334207-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402180355.2779992-1-bernd@kuhls.net>
References: <20260402180355.2779992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181447; x=1776786247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0iCshYxhWf3V+FlKC8D6wVV56WmTRTitapY3mkrOzQ=;
 b=Y3oAkoUOzNr4SnDg8ygxvGhsgtYzm1q6dtqBjsjvL3zLrOwpPGyBY7Bvs0syrntLtV
 AOHFGcTkvI/19JAOVSKdRJfN53eToKjXxvfMXz6ceQmvQuXwWOJAyGsHIrPv1VSmn0oa
 XdqvRhlx6riZ/088osNFcIJ9r49uPkD0VbzucJ98G51cEPm12yu53HHU5KdwGnleJ5yg
 /IvZz/z3yqR1UXcRl7EqVeS1WziX+OIeZTka3mCMyk+XPakFjme8jK2pYPPhRnCzto6e
 /2V6Vzu9dlUNpcfLdX3RjTD1jXpvA+JbxqpJgCri4+9WD9jc6ez0QYQCvzoNXU79XuUE
 izog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Y3oAkoUO
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: security bump version
 to 1.31.1
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
> https://lore.freedesktop.org/wayland-devel/ac3BI2BjKx53LqmH@quokka/T/#u
> 
> Fixes CVE-2026-35093 & CVE-2026-35094.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/libinput/libinput.hash | 2 +-
>  package/libinput/libinput.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index a942bb069c..ec6e52e1e2 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5  libinput-1.31.0.tar.bz2
> +sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
>  
>  # License files
>  sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index e018f87f00..8b930805b2 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBINPUT_VERSION = 1.31.0
> +LIBINPUT_VERSION = 1.31.1
>  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
>  LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
>  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
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
