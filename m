Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7CCF9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F7D4100D;
	Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3btX3iotpPnM; Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4BA042A8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181571;
	bh=d82GpRDwoAumX7Oz/dUXvvnCKlan9VGNNGgoOVe3oAw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lNuGOvRSH9SfWqAoLL2JkzPe0j/2FN9ckM0dj1Z3W/UHCOrYn+oIbLiRve3aW2W1C
	 oDwujuXPEyVOG7N+vkO4+NcBuq3fxqv4snGvJyT6Dr5JiGxSndOzLgQPLHRpqw7UGq
	 TjfYQgUsyayvRODqZF/yU4kPSXuUb0rsnoKsRjREW4Y8+p+8cJ5RYCZ6hpBk4SqREZ
	 wJwNbshNRiu1hZY0UUT2P7ri6wKB7Kx7Yerfe0LJf7OzD7Nmg8FoN5bEAo6wkwhQ+O
	 CctHMLBpjD6jYJuIaZgOFYb8lb++n8Er24B/H8+Tcq3ffyxJPGhLRKpvxGyPHMP8Fc
	 /S4tgi4rwbgsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4BA042A8B;
	Tue, 14 Apr 2026 15:46:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6568237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3912606D9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PW6DYApyBizj for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B34B608C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B34B608C0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B34B608C0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b0046078so57377415e9.1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181565; x=1776786365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SRfm4be3Nl3O15aT+ytKOqOnIwXSPav+iSZm0Bd8X9o=;
 b=IkvH2lSrf7gtR0u4YGtLxTNDIikyLOkHqihHpRquZxL1WFdsLzKDuEzPEB66xwtkDv
 KZhJ0B2L+WH4ZWGAfp5rVQy5gEgQchjB/Cr/n/eX6nY3ssW2FmXIKvvPQ0vaEfzzFlr3
 4zKS8l+PSIQvsMpZBsGzvMGtDOJS2ktTfz8D+sNDxi7AhD2TiR5xsrzU9bsYqIoQ3Sbd
 uw0fKinRBq8t8PDSaKbUXqcnUoUzk0tsOnHN9JyjfE4duIyPKyRAEf79F1GbA4j72GJS
 FfVsVluUw8YQI3zVqO12hWYKk6XZkY1uOJygqAAHwgiOz2WJqNjiuoT0CPotaMaSv6M3
 KKOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ITZhSKES23TCW9LYN+nH0CA/B1AKJ+4fGvLyZFDi/HVlPmxzUACDZulYIj1V0rix0z6j1n5A5JIM=@buildroot.org
X-Gm-Message-State: AOJu0YwX/8QrssOoo6EBlho9aTzcqTMaNdEUUGNrhE4P4hBIsCvfoHvZ
 zdjiNNqvDheCPFqHhwuA3EFeDryc7ToQyqRz8JyGRMX1u5R9NQvZDJxRFBcSi6lrmE/2JQq6cFJ
 +HreU
X-Gm-Gg: AeBDiev/kjDF+wf/GVH6odDcnV2qURDRCizyP2sywPn2HVMB2/0CfHQEEfSm9wiBRbh
 GE3ReOSCX4111MC0C9dgwd4WH6dVWrd7rFwcuHfF1fVVk2okNpR3VpDommS+4LzchxGEIKYgGQD
 71G7cfbPdV8hLE/C2ck2PeLewzAtQgnzxJwFiGPtQpfZyGeTlwbFOxAX8A7e/4ihL1pg/LQbh0n
 BpGwncaKPip4+Zjm/QkZUmiI12VNYZScR2SA4oWVnaqwH+VVO7utZ3XsdfjAY9ds+R9i/pawTfF
 TkbBMs5BhehsYHJc2KrupPW3s1V+R0Qe+ekHNh39rIkBDdAdhV2y/oOJoZiX/qq44Mi/B+/RAsu
 yAw8FJQknbJyGg3YxU4u/7XtL13QHpx1RI+YtWOHPTK0Cqwr8jSQfILSbT2dg3PGLKt4wp7K0bO
 ox1YnTwr4Hmih7Bct5
X-Received: by 2002:a05:600c:8907:b0:488:c744:49b with SMTP id
 5b1f17b1804b1-488d67d2cfcmr175095245e9.7.1776181565563; 
 Tue, 14 Apr 2026 08:46:05 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488e07f8207sm120970995e9.1.2026.04.14.08.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:05 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:04 +0200
Message-ID: <20260414154604.335800-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402165535.1464368-1-giulio.benetti@benettiengineering.com>
References: <20260402165535.1464368-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181565; x=1776786365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRfm4be3Nl3O15aT+ytKOqOnIwXSPav+iSZm0Bd8X9o=;
 b=e/8TBhmjmFuvOELWY912o9AEDwLnVgF+zNZejYLpa4EoCcnpC7vntZfHNLcJX0w9WS
 NFjT5B3gBB3MIF14dw22CpJdmJAtht5L9C+CudBHXUANg/LliIZ7FAI1/sqazeCpE7Ru
 y8hywZn3/u/Bp1JAEdYCdgFiqt5U4OXx97WcQLXRSLF3UBgKwdtyWUH6hvcEuPDIVkAF
 z/jXDPW6P/pWqMB9CPYTndvTiL8g/WMxzxZr90yhdwdAxcgj+G+KQbWDCQofWshtz22s
 x31x77JbpOVFoa3nIJRKX112YNKrJv91JNj9LzjGQRj6iG4uk/hIgT5quOaZcrV31vfU
 p7jA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e/8TBhmj
Subject: Re: [Buildroot] [PATCH] package/bind: security bump to version
 9.18.48
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
> Release notes:
> https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/changelog.html
> 
> Fixes bugs:
> GL #5817
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5817
> GL #5800
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5800
> GL #5826
> https://gitlab.isc.org/isc-projects/bind9/-/issues/5826
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 09d35a3698..7b268a49b4 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.18.48/bind-9.18.48.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
> +sha256  c742a69bff2561c23099d7c70c6984c145bcca1c1e3c67fac1f68a8132e8e7c5  bind-9.18.48.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index b889f922b6..17ea50c5f4 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.47
> +BIND_VERSION = 9.18.48
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
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
