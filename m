Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D2DC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A857A60D6E;
	Fri,  4 Sep 2026 12:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKj5Ed0buWpx; Fri,  4 Sep 2026 12:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 221A360C2A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524326;
	b=A34h4XON0mjiNrW92Oid+4NNn4ZbbklZ98ZgnsGWwoIbNOn4EbS+HNeJ8V+ECahhDzXR
	 +5WOq/OflgfB3Pv/4LECgMbdpiPoWLuWlDBgxEdNyjSbCrTae9n1IvyQyZSl5C97nNpdr
	 kcLtqsJC6XPlC6tVNARkBSNyw2yRlu9TTFqICqXgRFDFZnaRm/4KacC7j366EisotJ9Jj
	 RSIa6dTVDVxropVZ9H1LDqrQjBoVWoVublXzR56Dyq859Pmdsse7Vha4vB2AOqV3HVqlY
	 8GtMqf4E1gJOJ5EHHfCgLa1ejz9zeb037wcr7dW+LCv2/o4H9LFdi4kTXiGGtnYPARQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JVYRtoSMD0m1bXjtcrcdagqYIgfw1XCmMSFxSxDFF6A=;
	b=qmaINfPG4u/5fiKff4kzKDeISe9UxDs42192nuR74jgSadZBKqrtD1xayuyWn/EvkimG
	 Krx43Ll4+csyRDADVwAGO4PrkATfTYnDN5S1fy0PeWbJK3j/HMWt5a+BDdFRzwPkOxAbI
	 SVY227MxL+ODM87ERImofZTSUE6jWicWM+1MjUY88o4IZb2xxGTzLHo9q1lbSYhfbjnZu
	 roqfiHjCg3ak3Etlvz3ZKxkSyOyLbzovUSYGgdB7HCNHVIX1mGz3OfzOel4q8GzgIxQRY
	 6dI38rR8aLWk89a61/yQ72HjvdApf+Ki09HYaIBB58xanEiszTXEmm8hSVS9uglXkoA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524326;
	bh=JVYRtoSMD0m1bXjtcrcdagqYIgfw1XCmMSFxSxDFF6A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A5uk/n/Q7xawlRquh/LczB38llHAHtERrVawYsByZTB9fyEaS15hddg8pjh2jZhc9
	 LPWEkQYhNIwXMvnT/iumcHyoXBuG4L1dOj3G3JgbxtctbqSGY7SUTnXOl+lQiDn9Xk
	 aj5lUeTQLjcGK4pXoirdXFawPAqstWSsN2uFmAg9Grdx6RqrsBvT3i+1K5lpt5YbWc
	 UGsSQKhb+WjWQWKA5vGbdNC+2XYZDNLmNwV125iVIonVy+SryHqFMzctMVx7ucDGvj
	 NB/MABFzUmylhzVs7ewWfKxXF83+bSwZvIIEzIyeg2ny2UhYMuqU169MbYEh/9XdjN
	 wbJKZdjNuWJZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 221A360C2A;
	Fri,  4 Sep 2026 12:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0495A10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF21F40B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYbnMupvXg4Y for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AA51540B8E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524324;
 b=m8eHlvaLqECsH/t5P43OJKVVQaz3VI6VUgPPtCv/a266dUjGRHKiCI4VxNB7Np16uCDm
 jqyTLktt4YnLkNcphw50ErTWrBqGI8RhlPtM7kOsyUjFzF5LLCb4KXnIaEVuwkbFzYMf/
 YiPSLTjWe77YuL1VBLqevlB93vIxtSsoY7OtVAW+DIB6h+Y5/+IS18DAjNwPtbrkH4Ekb
 F0KeUBbrnHQN6otRaLPJ3NcJu3Q23LDyl1vjgph06zynRwX+WF3axPVJs4gWqzjdMLaP+
 V9ewWoYFv+IMkK+NGr7JDMXzEPKAqfTu5iZQ/2ZsPTSvKC7YI5O4XtSKsljOjxzcbfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524324;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=WUVQll7uNdr3mR9+vuNZBm5avd/f2TAnGk1pSkiw8H8=;
 b=r6947T0RuZhKlLm3RUWwepTdijdVTDzdfLja2yRlzrRGM3bNK68ekvmWCbu1eh3j8nfN
 NbXI3wahx2sRXJCQ2McRtl8gafJAxq+6vYx1VRKck6+xEObycTNhZVBYFg+i17GvFTI9y
 g5D/pAK0g36V91Qn8NWeq7SllpKcghfYFR0oh6XQ/nyljKE/YNXR+8B+HEpd53FyKbj66
 rD2talWurwuKYe8mRiHMeX6xPFFaxoEqxLdrC9lyrOT6qPCFxGcny0wJ4T0Eziskm1GUv
 tuhhsPDs1NtTAP8P0x6OelRsEVJLS4Oy7yMckinf8fSqVkTz7tDfoW6pTboTHvEK9ag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Fei8LZB8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA51540B8E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso8696485e9.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524321; x=1789129121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WUVQll7uNdr3mR9+vuNZBm5avd/f2TAnGk1pSkiw8H8=;
 b=lZ3AMbEnGmOK3scv2OBPKOFkZO+79jF3OuJx2PPBDCXCAz2l7Fj9/Bp/e8awEqHEE6
 igA9+m7lcvDT6+/y19rgJUlH2fBBQW7xerpl2tVdMCRgz80Pb6jVECkidLTQdUIHURXt
 FaOUImpSgPexa0UgEIqTfCkqGXvJ8lkLu9Z84Vj2zAKrhZ/0hjQB6rshjqYCCtvOvi/4
 kAhBMZRZf0hYPI3eVkZG2Vr/qROwTpCo1EJNL4h0vrbCo97znVB1qlbSqECIOUjpcGPI
 y01vyA+iMwHind0/9I6NOMQgGUhy+QmP+LLOGLyjq3R8tIunaEMKO6NLWYmsIu79ed9c
 vIKA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcVbPUJVYDmNVfKVEoMTNbE9loT2lu6uuWzlL2ZVZXVZhcpkONlZW9rWtgrp+bR0A2NPVDckKjFaM=@buildroot.org
X-Gm-Message-State: AFuF++n9fNwIappTHSnmnL0vpx0CVvOvdwP8oh88v7EDefLrv4WqM1ju
 k+oBcyIVvhxSpD14M6S8huyljdNnCIIbz+aBagpXMP6Lx0sgbncdJCkhKQCjFk0YnbY=
X-Gm-Gg: AYBFou0nGl2i8StbHyNSy3zLYmaM5V9BVyAIJRmhm6qtz4zXQ+ab8QbxGGxu/6oZ8CE
 T/ddRycMo4T43XxoNnlbm3LIuDihkc+iLnFRrsV15Vbe/MCiYVOB0iF+BtRJBzaS3EfrOz1nQvk
 4Bz9lxJVxJmYP9CBMqeZFt76WlaKCeBAXMxYWOZ3NxpCN4Vekcp6oG1fnDbU8ZaHNFqL7cW91wL
 DLRfQH0AHICkWDTfAa/Q9D3LDmfZFhfvRJAzIVztiEmSZKNnzgx9c3Z0g1A6APiD+ftMvf4VIFe
 NYp55rbojoniiCV5JwVO6LEr3nwRr3SJ3IT4klVkNhzBuFaWJtl3DvJY5Xn12KN3PyjZxHyqBhA
 sKmVRgDXdsbHNvSnCuUjZdqO5JGyKhVAzpYNIX0G6wSDisF+4cGSlPR9MJyv0A3x9BpCVBYf5ZS
 hq8hbEZyFlQizvC3k1FHpGQn/433WTrdmUYl89YDfz9CXseXt1YTiDIIpy++yNYIOj
X-Received: by 2002:a05:600c:620f:b0:49c:fa21:e73c with SMTP id
 5b1f17b1804b1-49cfa21e88dmr31554575e9.18.1788524321487; 
 Fri, 04 Sep 2026 05:18:41 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff8195ffsm4962135e9.14.2026.09.04.05.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:41 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:39 +0200
Message-ID: <20260904121839.405797-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825214649.3710109-1-thomas.petazzoni@bootlin.com>
References: <20260825214649.3710109-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bind: fix thread dependency
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
> In commit 54f96add94901511862df18e527e456982005b8e ("package/bind:
> security bump version to 9.20.24") the depends on
> BR2_TOOLCHAIN_HAS_THREADS_NPTL was incorrectly downgraded to
> BR2_TOOLCHAIN_HAS_THREADS:
> 
> -       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
> 
> This is wrong because libuv depends on
> BR2_TOOLCHAIN_HAS_THREADS_NPTL. This causes unmet dependencies:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBUV
>   Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS_NPTL [=n] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_BIND [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y] && BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS [=y]
> 
> Fix that by switching back to the BR2_TOOLCHAIN_HAS_THREADS_NPTL
> dependency.
> 
> Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security bump version to 9.20.24")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/bind/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index 6f5f14a6bb..ab8ddcd0a2 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_BIND
>  	bool "bind"
>  	depends on BR2_USE_MMU # fork(), libcap, libuv
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
>  	depends on BR2_INSTALL_LIBSTDCPP # liburcu
>  	depends on !BR2_STATIC_LIBS # libuv
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
> @@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
>  
>  endif
>  
> -comment "bind needs a toolchain w/ threads, dynamic library, C++, gcc >= 4.9"
> +comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
>  		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
>  		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
