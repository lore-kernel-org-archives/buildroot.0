Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E095CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36FB184005;
	Thu, 30 Oct 2025 08:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dff2S3hZgXYz; Thu, 30 Oct 2025 08:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E33484015
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E33484015;
	Thu, 30 Oct 2025 08:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 461DE160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37FE640793
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roCWaaePFpKh for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12D9940748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D9940748
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12D9940748
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso9380505e9.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812665; x=1762417465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ntSjNZDKP8Tlq34wF9tiB8wie7gO95ikxfUpjo0qPv8=;
 b=Pgs959bBdQZ/P46sxlAukiyHF+Xfk1iHVNIyCvT/AO4+W6i/38CxV93l4x5HT2ml7c
 PqaOkGNyAV21qQL+TZwmLNH7lQXOrn3F5KT31DBdCJKYj8VXrXJZKlRLIr15NQBTXE3a
 Le43pz9v8voYH5Jh2r6MqVCVo1pvZYzKGsyVo0+mMRzHGr31Zjk+5WVgcpZGCQew2MSn
 gVzS44MMvSsa8SoUSLbfrYJEzxD3vaGD3S2ypOq/eU4M11ju6OJYM2U2lcmOBtzx7DL3
 b+qm+vRWV0duYaMnHgHlXN4j3dxhXGHfdkOg//9J9F3IghxC6fVTsYHrDOC+hZp57r7d
 re5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCeZpLcIOpY7ScLCFihQisoqCWpmvgI8xKZhqPOZQcdHvrDxTrSyGROJ+BnH1HRIDsznRcpp0HbYU=@buildroot.org
X-Gm-Message-State: AOJu0YyMM301QGMkrl/f/dQ4lse9uhXCuSDoPDLvOu3ujGnk0fFapDoJ
 MLkkmlGEWvtK51pPKcRHCyZVb4a8WdR5vyIlOjkKC+MRwaS/TkA+bXtw5l21VPX1qGU=
X-Gm-Gg: ASbGncsV5X834nWDE1OzNDnbNzKfhkbyNUytzd/r3dWeAIFq2lbB+E8P+HOyrcghMk4
 fV0N8rb/EHAekO5rJTDsORFsuiU4opvuSaAjcnrOeXxgQufp80NiM/l4WHgEk0YlG83+HYUJDZx
 HPYIfhbaLnYHaxuidbrZv4FvCil3WASBNmy/90L3b4hX1OEAG3ZgK4nU0wX2nIMerNtattQSf7v
 h8ZEO8ZVoZEPLiKJLEJZqcrMftv/0ctDvtpm60JD6JFZWqiiiW4Kt8oG41re0YE5t47YcxVMoch
 89mFV9ydy9HKdnmTqXkS30NOVHcbti+cYX7yuSVbYPTRPrNiSIEVl2P43srQFoxN3Gwtve7rG0O
 Ewsw5+/+pgrnRBGywsHv+s1HYZQLXpYs1cs1Gh3EIRXPlOzEOAyviB2eyqYc1DmCktHEmv7xDMK
 mf9F7t0UiOHHmRZ/LBsfpa1muypAcwCEX9iG/t
X-Google-Smtp-Source: AGHT+IF0IPdihrAVjwfNp3sKaG/GG+RKeWjSVY1Nw6BdZMXsBMQNaYmhu3NR4k8sMY9puui3sCuKQw==
X-Received: by 2002:a05:600c:4708:b0:46e:4c67:ff17 with SMTP id
 5b1f17b1804b1-4771e39fa14mr56914155e9.14.1761812665076; 
 Thu, 30 Oct 2025 01:24:25 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm31548559f8f.24.2025.10.30.01.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:24:24 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:24:24 +0100
Message-ID: <20251030082424.35986-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
References: <20251022163457.19215-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812665; x=1762417465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntSjNZDKP8Tlq34wF9tiB8wie7gO95ikxfUpjo0qPv8=;
 b=YC4WunLa7Y3lmJxdCPJSC59Wv0+O6ivd0I3qqeBatEKhNFGB+dDY8HZlQTtrDvbTYx
 OCwETh0y6fx2jJD2qGqwMKOEAyHX/DtUIUYKjGevQO4csMAVIzcfCw+2XpBLwUoqGeXm
 XmYF6oA9uQ/w76OLddbP4wB33wZJK2XUT0PoCIiU7l1oENQNxEXLtcsjKs4QVjrex7ei
 dCbdPvJnB8yfptnGHhee2o4pjZGHQwB97n8iU+YwEVBau5N4pDa7KNNwpVr9iStrBMF6
 TNsDh5ELFAQJYqSkp1QYDLxr7oz9ZZzFK6zUPOUgWDMYd6OjRC06+/cskcTF6MIeoLNE
 R4Nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YC4WunLa
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: security bump to
 version 2.84.4
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
> This bump includes the security fix for CVE-2025-7039.
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-7039
> 
> Release notes:
> https://gitlab.gnome.org/GNOME/glib/-/releases/2.84.4
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.08.x. Thanks

> ---
>  package/libglib2/libglib2.hash | 4 ++--
>  package/libglib2/libglib2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 9ed0b204eeb1..129849b21b9f 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.84/glib-2.84.3.sha256sum
> -sha256  aa4f87c3225bf57ca85f320888f7484901a17934ca37023c3bd8435a72db863e  glib-2.84.3.tar.xz
> +# https://download.gnome.org/sources/glib/2.84/glib-2.84.4.sha256sum
> +sha256  8a9ea10943c36fc117e253f80c91e477b673525ae45762942858aef57631bb90  glib-2.84.4.tar.xz
>  # License files, locally calculated
>  sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 7eda9742c1e2..3382790bb330 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBGLIB2_VERSION_MAJOR = 2.84
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>  LIBGLIB2_LICENSE = LGPL-2.1+
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
