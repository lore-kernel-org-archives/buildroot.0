Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE468CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C22E1846BE;
	Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgvE07R7MPen; Thu, 21 Aug 2025 19:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CA984716
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CA984716;
	Thu, 21 Aug 2025 19:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 677E61C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 598A161B2B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pv4ZVpE6gN3 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48CFA61B2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CFA61B2D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48CFA61B2D
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b0bd237so10395295e9.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804044; x=1756408844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dz0pjgnBcGOzSnJYGkXBlYBHMa9kGqMeBLBTrA9vDkU=;
 b=Tr+ukMutrU0DZPX86uplkqz9HtSbv4BLne3Km8U88CTxsAS87yAil1k+rUirjPdAER
 IaLoH+eJGNlLTt0pDpiP0vfULG3W6s4NoSWFTrZSZX8QVnYvcmz4021tnDz9fCDoGVtf
 o2IvSSuQtWXmPDuFt0GfFFG10Zn2+T8IId0jyTO1blkP5kiIh4bolSsgW4fwpRDLT3DK
 oDwUh02Z+6ngOeYjzjPWyBXVXrYOjqq9+3GBcLskGbAA+m3CP6QKiQ9+LrGbAGyOAP9g
 wXiA2DwVSTZQS6HTAMovCuQDxhy573j3AmsP+RmruXMIBI9+m8948XURNCJQF3uWIfcY
 dI1w==
X-Gm-Message-State: AOJu0YwptQxLqtP63ebP8d//bF2k1Awyeskmyefg2+wRffYt0XcXVsRQ
 SJUYOzESVPDUhpbzKUsq9BddfEG4MSrFxLPnEaPv/JsHwatdNz0OqE3Jiey1jUytICOMNIbg6aU
 q18xi6+I=
X-Gm-Gg: ASbGncvVdQYou5o9pXwytkDFZBn+M4GW20iMO1XnBIOo9iJODqeJJ+Jo/+GM1EycmFS
 FQIYAwCtmwFJXgqj/Dg9nvq/QtD4jmf43EH6ak8Pg0c2v46chEygNKHXK1jeqvskyHZCCGZ+aiI
 MNi4qCCtAV/pNIp5mdUN+gMLAesJtYbzzju1V97dIX/tOgDC43IW9i9umhvCHV9gYPXJ8Zvp1gI
 TMp/J3Wn9zqABIzO1CSGQ0c3rfcjH1eC1goSosWtwqa705NRtcDjVLe9G4q3amN9alwtDKe+ZQ8
 WxXEi6iCrXiukTwZL3FnNfaSDQX6sJrg9X5+4Lg3hJkfmIEH9/0WYU36vWYJuYdSKyOVJ/mmOOa
 zzED+Kme5jlTRfA==
X-Google-Smtp-Source: AGHT+IHE0MMccdFBzfFs+gJSF8UplAhMoPSmLdqZlXUUrV8feL3wegUd67dlWZoDQrknV5+1UTv9ww==
X-Received: by 2002:a05:600c:1f0d:b0:459:e200:67e0 with SMTP id
 5b1f17b1804b1-45b5179e7ffmr2001945e9.10.1755804044226; 
 Thu, 21 Aug 2025 12:20:44 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074e38d7dsm12535987f8f.26.2025.08.21.12.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:43 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:43 +0200
Message-ID: <20250821192043.23452-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807152907.3225581-1-thomas.perale@mind.be>
References: <20250807152907.3225581-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804044; x=1756408844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dz0pjgnBcGOzSnJYGkXBlYBHMa9kGqMeBLBTrA9vDkU=;
 b=cbeJBj/B4bUsiEJRyOyRHIN0GcG7RIdHKznly8+PFk/3qqRLqnyIRQlmj39TKJw951
 OJJbpuldbIgGdb3XAbjl0BvL8v3rx1fsBd+ZAnoMQEEdwY1j8lkEiUij5negGyWu7IOc
 G89+5ruXj+07fSpJ+3xj+27AIIKa8YLMSiNGt5b5i4hXhNcmMZQyosSssYg0YHRrFQmV
 ATN9iVrnSDWeEV7A2ppB+RhnUrbnc2ef1wXQQVf8y3dWDbFvVj1yvH3w71nkRE+CP2ke
 SS5xjLxYlr4+jWQ0SPKPaDL7EU0aj7R8bItjOHmA5/mAfU7vpbSFYDZpDGGKTya8aAF7
 Pqcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cbeJBj/B
Subject: Re: [Buildroot] [PATCH 1/2] package/luajit: add CPE_VERSION &
 CPE_UPDATE
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
> Since this package hasn't had a proper release in a while this patch set
> the CPE_VERSION and CPE_UPDATE to the latest tags available.
> 
> The annotation available on NVD all refers to this last available
> version `cpe:2.3:a:luajit:luajit:2.1.0:beta3:*:*:*:*:*:*`.
> 
> See https://nvd.nist.gov/vuln/detail/CVE-2020-15890 for instance.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/luajit/luajit.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index b030a16cfc..ebec4d87ac 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -9,6 +9,8 @@ LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
>  LUAJIT_LICENSE = MIT
>  LUAJIT_LICENSE_FILES = COPYRIGHT
>  LUAJIT_CPE_ID_VENDOR = luajit
> +LUAJIT_CPE_ID_VERSION = 2.1.0
> +LUAJIT_CPE_ID_UPDATE = beta3
>  
>  LUAJIT_INSTALL_STAGING = YES
>  
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
