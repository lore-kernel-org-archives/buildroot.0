Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EE3CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E206157E;
	Mon,  4 May 2026 14:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaJkc2M8HxLU; Mon,  4 May 2026 14:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD7E6150D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906081;
	bh=roaI5hJB+lpitwFkTzloW/EZGh5IEV47NDocRwB4MGk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EYXCCJOE0aq2lqaoPvz3iPnw6jGIMuV6h8X81PiTRe63rH7SrGLWEjuKQiGyrYg4/
	 bKF7YwR2beuegWGjhkCP8/SrPxJ0FRiNzAYijnaI6p1Q08ysZxYXB7ZWxFR8f+9gfY
	 Zoj4TpYFTPALePy8zO8bM5OL6CqyhQnY6lnNe7ljT0QRsfjLFvJvK2wu7eE8h+g0MC
	 wtQCLSx8v33IKhEg1KmHOSGb4T/OtYouEQAEPOqtqEG4Q6Ap+If3OcXmF5sjz15GXr
	 VwuqjhegTmK7ud+X6I0XfJ31wALMIieU8Is+6yQLSc69vtKT92mOzrwkYqNSY3FuOy
	 dulNI4hRNYVdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD7E6150D;
	Mon,  4 May 2026 14:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA44190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E94E084651
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRNKi_PTZ0ne for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E537D84666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E537D84666
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E537D84666
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso21228075e9.3
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906075; x=1778510875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wqeQOFxDkbTFAMzoolUweoP6r9r1iImZV6LhmRo+ztM=;
 b=gqyAaS7VmzDH3ILxNZ8DR2/FOrjjGZbW9drrVEpPiBYOS1AArTqfZTawg+tIVNu2t+
 jGh/9FF5+AkYSKhFcddBmGUlJ7fpNq/3QgQxNDu+Rybjd8cG7Okqls4dB/iACJth9dnx
 RfV4Tu7N/5MIrG33LLMSPAXDlt0T7pIIJKlxXodABAKnUuAYSajQF8zUg36r70FqlKP4
 VLGG7cCDWGNfL/r2lpRtzPbjVVSmoR850pF6HMg4AfXg0t9pil/qcvGSyXpONLoLEMAP
 ofqmHKOYYNQZpjZViP451O8wVEX7tYXfUrjDh1jl5Nb91WF8b880og1FzedVt6nyWUR0
 tDqg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Wp3GVUs+lMZpSKeeRl5l4P8Po7gO8zPtYNGWhC4GKOmLq5s8KwU9FHTpQt1sYBFU244HFU1yaBvE=@buildroot.org
X-Gm-Message-State: AOJu0Yw3TbALrA2mmMd3QqHDt075AgY1zBK6kkDBif0b0q968eZPh4MQ
 iLChOahuVett9IdHuXNg7Tkp9m05IrRIuGRNN9nR2fKnGFDzNanP4fdWBehykCskiIg=
X-Gm-Gg: AeBDietKtrVdXG/pI2YftaqkYKHvxAfUW+x9Xa73II4jSF+wPERJPI57O8jHYUUDH7p
 dCMFzGRkEKcLSdzVatrdOoy8F9SrLgIN/RwuqnQ3+OBmYNZ5OfpHNYvWczWhzVdtKafZfYN7mQw
 ex66pCJ/uTAvI2wn6+nhR5IzOsoNXczBYzRgCr2iiUduc0bmRtsshRH3cDPpHIcD5HR9EP64+MB
 hJyp0vXmMz22U9c4KrTgvmu0V1arJUWiBq7S6gqSC3ia72WI0Irre0Ld7zDzdBcvTpEwW20USrG
 xDzo6sc5DyI0A93c2uS91WXYi6H4lrx/SC+sgyZ9Meh8fBMKeUJl1MFgYVfaV/cIB6dq6IGIGob
 7Opxu2MtUTQ4bSSDAHaYuFH4gBDg5Iysv24vY4fjOFzoN0LaQpusA47inOdiLFaKkSLVTXIsH08
 tE2Q3appWpKN800nWp0m+/5+VC4A==
X-Received: by 2002:a05:600c:5290:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-48a988c0fd9mr185408475e9.24.1777906074685; 
 Mon, 04 May 2026 07:47:54 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fede418sm102503725e9.6.2026.05.04.07.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:54 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:53 +0200
Message-ID: <20260504144753.10774-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430090001.339335-1-titouan.christophe@mind.be>
References: <20260430090001.339335-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906075; x=1778510875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqeQOFxDkbTFAMzoolUweoP6r9r1iImZV6LhmRo+ztM=;
 b=G5G0HWQG52oFvlB00bcvsNluPdiZoV6kMiHsnCfu0z+nYc+wspo1ps6gHXRk1JDy1w
 yXmuyEpVvMasR6P2qjIY2sQxqM5+LQ+txRGaGndYX/bVOF6kWaWi2jYRY3/CUTfwg3m5
 xVMcUO/E+m47aRI7G1CSsNAPrCXXqMn49dZ/DT5mHUCSDTI+aJdAXJRd5+WFDNhgmt+d
 NXY2HRDWF+o+ybH3XFxP6v/BEgeTiFvQml6I9tEzq+rF7o/PGbZ3m4nZtyEK+EbkiJkj
 p/wv5grbbd6n5+3nJKBqNMKMbIjuifxZMPh/7ihOXS1WlnNNBqRWKt5G9Dk/FWySqB9e
 VwzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G5G0HWQG
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/openvpn: security
 bump to v2.6.20
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
> See the release notes:
> https://github.com/OpenVPN/openvpn/blob/v2.6.20/Changes.rst
> 
> This fixes 2 security issues:
> - CVE-2026-40215:
>     race condition in TLS handshake that could lead to leaking of packet
>     data from a previous handshake under specific circumstances
> - CVE-2026-35058:
>     server ASSERT() on receiving a suitably malformed packet with a valid
>     tls-crypt-v2 key
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 0123babe4b..957537dde6 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking signature
> -sha256  05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4  openvpn-2.6.16.tar.gz
> +sha256  952ecee5b911a5353c0a6d40af62a7076c6dea1481ef204ce6d3f10481531315  openvpn-2.6.20.tar.gz
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 0175c51d63..a117f6ee8c 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENVPN_VERSION = 2.6.16
> +OPENVPN_VERSION = 2.6.20
>  OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>  OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>  OPENVPN_LICENSE = GPL-2.0
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
