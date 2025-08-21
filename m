Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB6BCA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523A1846FA;
	Thu, 21 Aug 2025 19:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4vFf-IL-Sxu; Thu, 21 Aug 2025 19:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D00846AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D00846AB;
	Thu, 21 Aug 2025 19:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CCD51C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53AC0846EE
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQIfDCZOzW75 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5ED0B841B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED0B841B1
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ED0B841B1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b4d892175so5390415e9.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804054; x=1756408854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CUM5ep96H0AuJW5LMRmEh+Ygb0c9FF1C53reTJtmob0=;
 b=ongTalt4a75tWwqVI4EB8TWAsbSDXdAYyEJv9yzrvEC8AYmSGcjRHfhEYjhp3Qy6My
 l9hqU0Dp0hwPeZTtoUkFT9SRHRGFP9VCDIXD8sIrGX41lDZU10gN9GxVsHGGkIw45dfI
 42l3aXntmbUfT2RxGT9xk9PY2aPCGGZoomZFTOTOBbjkrtofrzY1y9Ptj2yqVvrWrOkn
 OdBXTic5Fbo9O1m5jqS/J+4c33V5MT11Z1N9fjxEJWEMc4fMV6IGd6pPh9T1l3SpTf/7
 aIVyg/BJFQbPoEMS1V5HMaAZ8AsTAGXuTKJwuN2/0a95oktEYRPF+a4/gh0HnUZuf0Tz
 Mf2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxrNpguq7pwoYBAAwm3PVXbIXMb93UnUNCSR1MeIhofSrIgBiVOCSUU24gVmsXsoyxpbJQL+9qG6A=@buildroot.org
X-Gm-Message-State: AOJu0YzPqvpnZdr0bpUR9HXCvGhNPnqgByWwYwl1NO9+6f1TE3l3rRBE
 g5Ud7v6lXjejevNF0oPtIuXjMRzVq777AsZEU/sI4+l+tKMNKp2I/b1rZ1yw6yXwVDiO6li2V6m
 TzrJ3xjs=
X-Gm-Gg: ASbGnctf97dKFbZquPNg46X+3fVXlMAXjFsTT3Z79eq0+p48vb29/qpVAiymo5mNGHw
 1w7XkAqNH0jIOQoRkIv6T/+6szlPCcMsIyLNItCsr4f895CvQ13WcjSD/WLenD0rCYyT+tvK7Lv
 ImD9iaujGVrYmcvz+MYkQQjv/lK8A2OZUd+AtYXGO/ocpowwp5ko+/97cwvcHeXwXIdO56PW4mH
 eHrJl0/0ZbrkQbvLsI0j03cKQ0I1/3aqQ38PDZ1kdt6s6e7qHfcW0Wn3p/S1bVP9uUVKhTlf6uH
 KnrK/Cy1vr5eTr0K2F4dC/Csxb0LlHq82WdovGNC8l2qzAnkv+VdrHRnPZSmpyCDV1qlQEMJokz
 rIRZxPvU4S0U1mQ==
X-Google-Smtp-Source: AGHT+IHEEVM2ZGMTTWdN77CPPtnZY5wRbAcDxta2NHbWVQ9ss5aJn+4HlJ+CWV1Pz55kphBn5ZyHlQ==
X-Received: by 2002:a05:600c:630c:b0:456:2b4d:d752 with SMTP id
 5b1f17b1804b1-45b517cfe7dmr1673215e9.20.1755804054465; 
 Thu, 21 Aug 2025 12:20:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50dd02ebsm8042755e9.9.2025.08.21.12.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:54 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:53 +0200
Message-ID: <20250821192053.23931-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812100148.717381-1-titouan.christophe@mind.be>
References: <20250812100148.717381-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804054; x=1756408854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CUM5ep96H0AuJW5LMRmEh+Ygb0c9FF1C53reTJtmob0=;
 b=UGnTmbeDdPzC8OKLw/YjF2RJnpKEbOvBYJa1IMMC81jU5CrHcU27r0q43eLskq3+Hp
 9bEA+hOOYufJ4F3uwiVyb0yFWToAs9rgPgJOLZI5gT+ffRHmMykR5+UrtB2jsfLxooMf
 J6d3KVq2iIS3GWNbcITNdV/BxPJKpckkyAo1xpPpCeHujPXktauupmFAR8y14mQJeRlU
 FQzTozykeHuux5jA5b6C7gvYa6gd0ntyfjEp8fHj3DJFp4bkgBz9r/ladGPPHB3cDuoa
 MQ+pR4GGTNJu+tEaHHowIFzThgbkECEb9E76JEo/lw3pBQGSmH5ln6G4y5STrmlqB0GC
 7CHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UGnTmbeD
Subject: Re: [Buildroot] [PATCH 1/4] package/openconnect: add CPE vendor
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
> infradead is a valid CPE vendor for openconnect, see
> https://nvd.nist.gov/products/cpe/detail/2877E5FD-6361-465D-81D7-AE1EBB3E059F
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/openconnect/openconnect.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
> index 3fd9f990b0..73716d708e 100644
> --- a/package/openconnect/openconnect.mk
> +++ b/package/openconnect/openconnect.mk
> @@ -9,6 +9,7 @@ OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
>  OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
>  OPENCONNECT_LICENSE = LGPL-2.1
>  OPENCONNECT_LICENSE_FILES = COPYING.LGPL
> +OPENCONNECT_CPE_ID_VENDOR = infradead
>  OPENCONNECT_CONF_OPTS = \
>  	--disable-dsa-tests \
>  	--with-vpnc-script=/etc/vpnc/vpnc-script \
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
