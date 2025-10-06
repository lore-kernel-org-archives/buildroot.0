Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFCCCAC5B8
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 16:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B1A4169A;
	Mon,  6 Oct 2025 16:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l09Y31i-km6Q; Mon,  6 Oct 2025 16:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA35415ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA35415ED;
	Mon,  6 Oct 2025 16:37:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17935272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CB9415B3
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V30v4qOxvOPK for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 16:37:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8564415B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8564415B6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8564415B6
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:37:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so40856775e9.1
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 09:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759768664; x=1760373464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjkTK8/6j+2QKxyR9a1uBD+dkT3/4JmmWC2EVdZ1MpI=;
 b=S1cKTb1vkEMI0GLXSS20q9yfqaJE86us1WeM1SdzswGPpg9ZYUHLKBTM9eZ5bLX5Cl
 UnvJTR6ZlMPe8t+DgfHkNs4wFQ9IP2wgzDjuPROD0Vyt/cIy1R3AtdvPA2JuGqduV49d
 KuyS61HFsNnXbROnqtqEdTE9KeXvHC5/pTwYxfjKoo75triCHGj/RPttU3x5+4GZ03Cb
 I1d4aiCKacTzMIH8UqpPZcyaeZiRatkv6xWWsq5x2XVFcbbuJhwefDUxmJEUm1eSwNEu
 7bGvovkIzFKO8cQm4zJ8hI0pc71qfqkAOuJgVoYpfDOBHEm4knewWynTgNf4KOuWm0ip
 Batg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSM/uzT5zM60ng7vHaz6Z+GebnVVI1QFdHv4mLMxXIXkf+M4efKKA6J6VHZlWECmwzNuxE0NTraJ0=@buildroot.org
X-Gm-Message-State: AOJu0Ywn/ePctKOdktGeAlBcaTRekQ06BxB+pLxztBpaFTqGyTXJKTTB
 o6bfvoWhELzIE8aJSITP3j6NSB2aXUqr3BWgR5+iz/y/8QHLmS4cKVJLOWsamRpMTgQ=
X-Gm-Gg: ASbGnct4GN8F4UxTplCvwhe0/o16zmyBTLe54m5os/zTkz4G4Zgklj6a786RiqWujXQ
 E7Acabu98heWOQrLApIOyarUeftHCDOeVK1ns3Mf0Nlp9YnEUvKSTRXDE55wczWgQ8376dqxCpl
 n3OqvMjxpgkCloCJKG/n+/w4RvzPBCcwq+CWQEY/ZVkm3jgkwVNAzz+5buWX1Zmh1SACzWqQD5V
 SLarDlTkN45HP1/3cE+91b/gF/kWgnoBlpW1HZBVxcWQOybyDTEbYq81cPcQrBKxpACzyRUi6VJ
 pAQkLapNnU+2G6xQTmFzM6wI9y1t09WtcNVOI52HLnzwn3JyJ1RTiqHR93VM8lUf0FcrVRFoz/M
 VGBgMeOVNcmUCxpYIlNwt7G8QqQ9EkUdMvMaSTby96K7cjsQICNc=
X-Google-Smtp-Source: AGHT+IGbbZ/tvptOvs1o9cbgpnvpSHFRUOJiY8qWl04aokE4AOpU4oJwLsZPZefTqBWDHf/Wb1eQgQ==
X-Received: by 2002:a05:600c:1e20:b0:46d:fd71:f69 with SMTP id
 5b1f17b1804b1-46e7110aeadmr73669615e9.14.1759768664060; 
 Mon, 06 Oct 2025 09:37:44 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72359e0asm173293365e9.12.2025.10.06.09.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 09:37:43 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  6 Oct 2025 18:37:39 +0200
Message-ID: <20251006163739.15079-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006150949.499972-1-titouan.christophe@mind.be>
References: <20251006150949.499972-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759768664; x=1760373464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjkTK8/6j+2QKxyR9a1uBD+dkT3/4JmmWC2EVdZ1MpI=;
 b=aapVu5eUbOISQvOdz4JsX26AKJdZs5ZD+Bro2jchrQohU/bWop6kKFcKuZ30CRqYhK
 PTEnRJCq8/FOCP6iOInj2HOXsEq94qLmrlvmIPlZlL2JBl3FPrSmq6IR0JNsN1L4TfcI
 a+mVAAUAq8jKtqtTv7ptuSe/A47s87X+tqB0FbbL/NwGDg0XsJ8PFYR4LMaj6ivBsilT
 vgDoASxvD41SIjpNjNOK+UWUbpXxJzdHIoCscYpYkugQan94dgyutu09HHR+RpDdWY0f
 pm2SDP/TcV+UNrE3HkVYZowoVtS8EAhRh81tCigh5vxTVzLYTWYO8FxbI/UicaB/iTC/
 PhKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aapVu5eU
Subject: Re: [Buildroot] [PATCH] package/xerces: security bump to v3.3.0
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

Hi Titouan,

In reply of:
> This fixes the following vulnerability:
> - CVE-2024-23807:
>     The Apache Xerces C++ XML parser on versions 3.0.0 before 3.2.5
>     contains a use-after-free error triggered during the scanning of
>     external DTDs.  Users are recommended to upgrade to version 3.2.5
>     which fixes the issue, or mitigate the issue by disabling DTD
>     processing. This can be accomplished via the DOM using a standard
>     parser feature, or via SAX using the XERCES_DISABLE_DTD environment
>     variable.  This issue has been disclosed before as CVE-2018-1311, but
>     unfortunately that advisory incorrectly stated the issue would be
>     fixed in version 3.2.3 or 3.2.4.
>     https://www.cve.org/CVERecord?id=CVE-2024-23807
> 
> Also update the download location to use HTTPS. Unfortunately, v3.2.5 is
> not available from the download site, so we bump to v3.3.0 instead.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

> ---
>  package/xerces/xerces.hash | 4 ++--
>  package/xerces/xerces.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
> index e6b5b922d2..1bcc5422a3 100644
> --- a/package/xerces/xerces.hash
> +++ b/package/xerces/xerces.hash
> @@ -1,5 +1,5 @@
> -# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.xz.sha256
> -sha256  075bc57940da0f9be6dd183c550c8ce0b9833e4550dc382048377a1a5e3b2bd9  xerces-c-3.2.4.tar.xz
> +# From https://downloads.apache.org/xerces/c/3/sources/xerces-c-3.3.0.tar.gz.sha256
> +sha256  9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde  xerces-c-3.3.0.tar.gz
>  
>  # Hash for license file
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> index 08efa6fb5c..36191caf9d 100644
> --- a/package/xerces/xerces.mk
> +++ b/package/xerces/xerces.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XERCES_VERSION = 3.2.4
> -XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
> -XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources

I would keep the link to the 'archive' location, the 3.2.5 is available over
there and once the next version will be released the 'download.apache.org'
mirror will 404 for the v3.3.0 and make the autobuilder fail.

See '7407f797a6 package/apache: update mirror url'.

Thomas

> +XERCES_VERSION = 3.3.0
> +XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
> +XERCES_SITE = https://downloads.apache.org/xerces/c/3/sources
>  XERCES_LICENSE = Apache-2.0
>  XERCES_LICENSE_FILES = LICENSE
>  XERCES_CPE_ID_VENDOR = apache
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
