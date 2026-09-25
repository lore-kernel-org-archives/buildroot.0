Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65FCC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B49FD60DBB;
	Fri, 25 Sep 2026 14:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6XMM_pHidzY; Fri, 25 Sep 2026 14:45:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C90B460E19
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347527;
	b=DSYMMDpWfUS6ddVCNfSuv/DuNputvGTldiu0X/ZwT6xAHXnhJHfco3A9XvFzegBeWUnz
	 t7YXyh9ZkYZvN3SIexAtn9FoniBV9/VOkdTDeVKCPoxVTWlwRwTImorZuPRfZiF6F4A/X
	 EVwA0G1OyeIGW9eFea8tzzricr5YljFW31LcqkfwvfIWmk1d6wWxtg20NvlCBpfP+ONyy
	 /KrlNv0NUXXbHeExBDW6SWOjX0LVwG23OGnkqwxpABYdwy9s9VzDbjUEhBw7jTkWLLWes
	 sGutlHl9OG4gj8QdDQmvom11n4/kuDQbWPSTvtBZwJKlJL5zO9BRF5tumpK6j0nqPDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347527;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U+eGXdd2zE9/sVJLXoD3+EZbgtKberfzoVymdEAUwHU=;
	b=szi9e9OW3wHcIOtusyRNEKllaBQe0VwxdbRe5J5tK5eOddhWL94XYP+Fg/MI25O44G0F
	 7AZkZCbcv1Xbmgv/pyhiiojXFJpnu+wKuAkdl/JYYGhb6fZD1yrPaf+4+FG3HRc0iYiFn
	 6uEVpQze24TCS1PAB/+V0Pd8Tw7FCBkUbDusRXHGjsEOnE9owBGA24qjy5i8kPnS7fSu2
	 UQ7hxYhUpZ3FgdKSpwi4NR8mvUPNC4UtCcsTd/Q3KjR5/kQY/U/G67dFs5LN4Ouir9/yR
	 B+mclYL+Bh8K5psHqTslEM45CLtDPcdJaC6jz1G3tIBT3TsKzymsSYYl6rRUdS7rkOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347527;
	bh=U+eGXdd2zE9/sVJLXoD3+EZbgtKberfzoVymdEAUwHU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ePpT8xw9YL73k1JG5EcM0DwScfNWSKDFXDcdAbsD9I4xm5nR4V518ENEQtQdbwDWO
	 iTuf0+vDnKJ59SkL/OzoNU3SDGEDX6vll5Y9uojQyp6Uuvz2pP4kygV+AcY3X+6UmF
	 PlLyqs4NWLW9X2cYWfxc9HX7ncXHO4JdhdxK4Ld5/EflibR8GwqWVHm/wyJ8SKH21K
	 p1EfpavzPSZvfl5kXvJ5pzCfw+ugfGBuFrSf8N0RUUm7AJ3NVcjE79hL11fxpOmXFV
	 9DTuCfOmLjhHedjxz5wTlKUiAYGqy3BbyWie3JPq0oTG8d5cevUzq/e3a0Ej6gKg7U
	 TFwaMyfU4Gauw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90B460E19;
	Fri, 25 Sep 2026 14:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62DBB332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5483A81322
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hzs-NmrC2nX5 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6063681336
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347523;
 b=UDbs0NYpXXg6B1msepxFYFo3yrGS0JRO5BXqGN36Wy8nTQGHCa2k81MZxXd1DbMJcnaK
 o/F8wBtmes2s8FpT0AC7cDY6Z26o8FMNbctJxP+tQIt4QdWWz00xnwsk4u0Ix9aTaN5D+
 LKNK+fF58Z3D6RxJRJgmzm+IxmV0AYFzf31MjC7Pli/L64QR2uG2nhGqo5ReTON4Mx6Pr
 asEqsmvYGeJXny/7UmkXmO+9ibV7DU+/WUv79zQz638BWuJxBPzCka98iDWG1isv8TDC8
 X6hyYGD1wu1fc+n9alslIko9Dilv3O89z7EIqqaZ7WIWB0ZdC7v5W4Gfo6Ri60NQrvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347523;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AegynSBmJ0k+lFIEuJxJDd1wT74MeBrITwYKK7JqCbg=;
 b=afhMnMNBUBVdGyR4WBHxKVRss5la5kDD7hzbJMR2rirHMaknGFz2CKn82IKu8xCGAYKX
 w/tu0r5RdGtnUPBFfYMtpbyKWEabjGVs6GJnMHpy5R1e+Jf9AZaWCb9Cp3BisxuxllMOM
 toFNs67oBzpce9fgZhp7w2x0lU3q0B9b7t+3KgPTrZnksnfqG8vLfpK8+0aBa1/sqMWJ7
 NvUoV8bu8I6qb7mi56AWsIYnyCl2BVNec0SQuxaREtALF2/wghuprYBbJs+CBQdZJRiFm
 yZHd9asMk3BFviYWD63ZkewxQkQxcOJcnbvJhwugStX4BHnJroyx6S8wq4qnNBqDa5Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="e0/RU+Gu"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6063681336
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:22 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so11005265e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347520; x=1790952320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AegynSBmJ0k+lFIEuJxJDd1wT74MeBrITwYKK7JqCbg=;
 b=UGZgoP41bGFP3DKaqVLDVIxqTn/Ak4wILI8GF7CHhxx6v4NdYdP/sinjmRmnFK4dOu
 qPRP4XPFOWpnbjAMz5zlFoi1GsGlMssH6hCbeJSUdZlfnW3KDhaArtT+A3nmL271eOg3
 Jym/2xGoVb5EI1IeieMBxNc/KTqRNjK+Ay1oqDnqsYr86gQvzTrxzTd40X+rl5qmZIq0
 XFACQT3fYN4HtUVTheVUXaAi7mphpk644c2TmpIOnZ5GNlTUI2BLzrQHwXaVOXPEa+3X
 QuROaNtFEf5QL3vsI7N7JS+2CS15Yu4QxwCNugChJJYJ7N5/l/jy0Hs0mt8L92p3cROt
 7+sg==
X-Gm-Message-State: AFuF++mne/r/Ckl9Cp5tMtd5oYfLTLo2Uh2zeYqZ3UYitGjAxL4+NY2D
 CGGLxSYig/Du40tdYcKEWgJfZFfFjO2JVVg7ZjQyDikyhpRpeN0BmYi5UlV7KpkicA+Yfanu6FA
 ldHPpJUGTqg==
X-Gm-Gg: AYBFou0UWzswwlORq2Fs0b3Mb2pQ5KQ7gQxISmBREjW0vvoIi4mkj+fn60Wg8OCr4js
 Kx2d99td5f/bTDY7OI61fqSXZYou643DtGyZe6M/VLUGB9jUIKsRQ+ZqGJ1uLhAvh7ebBkmEq0q
 EUQJxLqqb8RVjk5kbJxcZhOxglsJiIfdacUJRlukw8jk20OsDdg6fMqRKshCG/dUgOhZApuPCL0
 8isNcoS4XIiltAuXSUMFDe7e6OoQaQ476+m2RagpxAqpSG10Qli/fQlF7cADfmL//N6SRXFa+hH
 Qhl3XKIC0FTd0iNPhT/J6IdFBSBZSTzGvJKysEkKKiLvOCFgj+aakKpGYl7X2yNhkWhKiakS+Hv
 VytPcux4CVEuVkxGbigwHsOC/iigrMcYFyUIDGpzm+MUP7qM+5JDb0KsZlriDedR1hf+nrP7zW2
 dV+dn/qMkQgx1qZdfXV4sYLglvkgN+Z57gYYoR+M0hLSlt8Uflv7aTUrS8XtPfjJM4yymAmxv7j
 UiYoxLs2ObvMK1Fv1rBrFobOWEr9o8MuPof8Kx68mM=
X-Received: by 2002:a05:600c:4e53:b0:49f:d58f:1f8b with SMTP id
 5b1f17b1804b1-49fe66d807bmr101762935e9.18.1790347520134; 
 Fri, 25 Sep 2026 07:45:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff06bdef2sm65491825e9.11.2026.09.25.07.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:19 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:17 +0200
Message-ID: <20260925144519.4097574-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915120830.1926973-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/strongswan: fix
 BR2_PACKAGE_STRONGSWAN_BOTAN dependencies
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> BR2_PACKAGE_STRONGSWAN_BOTAN selects BR2_PACKAGE_BOTAN, but since
> commit 10a70b1af67cf79986c2e401f7a54aa850ea82d6, botan needs gcc 11,
> which was not propagated to strongswan's botan option. This commit
> fixes this issue.
> 
> Fixes: 10a70b1af67cf79986c2e401f7a54aa850ea82d6 ("package/botan: needs gcc >= 11")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/strongswan/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 10efcc1616..6847ca4f62 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -35,12 +35,12 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
>  	bool "botan"
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # botan
>  	select BR2_PACKAGE_BOTAN
>  
> -comment "botan backend needs a toolchain w/ C++, gcc >= 10"
> +comment "botan backend needs a toolchain w/ C++, gcc >= 11"
>  	depends on !BR2_INSTALL_LIBSTDCPP \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
>  
>  config BR2_PACKAGE_STRONGSWAN_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
