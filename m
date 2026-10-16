Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD3CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1CC240B2F;
	Fri, 16 Oct 2026 15:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsKMWGKBFm41; Fri, 16 Oct 2026 15:04:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2E3C940A60
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163093;
	b=pkKsHHG7tTGlZrljiHaMsyj/P7yggcewLNwCyxW8a8/kNTNG1Mcm9EP/71kgeGJQ1F5v
	 KoTeSFbWwYj35ea4KFUU4M1N8lA8GlGEBDeGrO+j5K+1YChQJEqmNZYbbhZ1d5skP8jr3
	 QvaipUM4atFk7eVXjrPb1rRzKX7Tmp8fY5EPejCgwPM6mQnNHNYNnfaBJ3xREeYMoE+XF
	 SR/238BxNLrRB7DgakF5SvFfrn7tvjt0Sd3k0m7Gt3se9ZTh6OviJ4UV+4Ii/2T58MSIO
	 Xvhl+osb5hJqI0dXbw+XMcVbfbStWLJblBYRe45k76SLloijbvd3smroxBh/BFRtQ1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+Fbu7N2kxiWXO7YkevQX8NkbSbjD7nTzTBhLbVi/aLM=;
	b=XjTCsY8BaLcjn//YMuvP8gGIWiX3PzHwLO9xut7WOvgGiO6Hx9mzEKASdGUT/oXHwDGw
	 LsjVSDeSKjEbcDyzbqyub0QpoBuNYEKrokZtELDL8BxVB0LV9JqgtNfH2f0CIpHkR4Afq
	 54rBKAX5tifek8udewWvV0q/fxRbTGriDXGhndNqiHkGlFWOGkPKPlUgCJse1X+APCvob
	 UwnBcE2bqSiC4xyuGrbSyRj+9iOT1kwmVikgmvuqCrSZETYeWEbXnkPlwAlfC6pw3kWxE
	 3poGptJxoBJwUD8bFomGpkot6pHwn1tZFffxYLgZ9P7WsL+Scm/gLpV3Zuro2QNL5eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163093;
	bh=+Fbu7N2kxiWXO7YkevQX8NkbSbjD7nTzTBhLbVi/aLM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tf0SMVDEbTY+M7qHtlxqcKCmR4Nv+Ezlndp4ygBCIPL997kR/rEDGzR1BHD29as6E
	 7mBCy5BDfkbYM6v7McNrVS8el4iSAe1ojwecY37aEVqZfiLjQyDC5TK+EbNWu9qjIb
	 3Pj4koa3IpQ2Rwm2iVg4T8aF9T1Tq1CaTLL684Z9vTPfDbgNjC4OWi8IlceUxxwm9C
	 S2vkz37h+WWX9GC7GlhphLqsu4d7HUeFdRluYMaHu9qiYpaQZn9i/ooDfHMceRggKs
	 nY7QNZYR7qjGE0dDx8ES6urxhyyf6T5OEXLIypHiXKSFpEJ6tHaF1lGi+a0nx+7EY0
	 kF4HgyTZ8ujYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3C940A60;
	Fri, 16 Oct 2026 15:04:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83EA3255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81ACF606CB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2v_7DS_5s89 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 61B0360671
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163085;
 b=scCH05C0iuq5q3xa1Y6fy6tMf6bUgA2rF6aHEedKl5ZlcbGwdRoWyZA1MEPpiIs+UzKg
 TljwbyBQ8kRlDGGd5g88j/0ZxtHnbHviRx9vJUNUDikm85QY+ZU/eBTB0ptHcsBJ6csF+
 ryB028fwdzMzspqp5zSyUcTekZNeLj5EEGdrj1xT7g7aUWKQPD4ZhjnYc+z3DR6wDFn0v
 cBheNgyXd2fIAyWPxMt8aSrStWzGQedsKXdgk54G4vU6joCpeNLk5nfdurmynRZKAXkwG
 pXLFBEba0H9epOpMxCxtLhCj8GV3Uy6NF3vUkMkGpxpAG/LGRsJmn3LMZLuzuD6eDrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163085;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Ela6wOoeYBfm75a48U22hLkpdPdTkahwquDE1BSi1uY=;
 b=kEFqOjiLANLL9/58T1KQWGrXU0nTGGu+4qupiuUpVWv10fhdHHBJi2bTqSgb/Xg4bbOt
 jYYi3Dtsyqu2gRzJSW8tqqAicojrHDvY8tsNLaCU/Hx3RMNK0IsgKiA95DW/1o0e5LJhH
 HmXw+JSM2YkQndl+WGW215fEX/LHPgvQj+drT9QxgJjHiEUhYL48Q+eq0VnXcZ58Ond7X
 qMweLUFcaIBhYzkiXeD9PE90fP4Oi9IRfcNZRPQmf4EylCbsKeKuXZG6oLlSh2k2xQWxl
 kooO0nMAI3XEyJyx8lJTru5OsoLdRAqGNmuLUwVyobTZbkD9SvLIiK9nDJszigmqvUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=StMsw3NP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61B0360671
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4956869750eso396885e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163083; x=1792767883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ela6wOoeYBfm75a48U22hLkpdPdTkahwquDE1BSi1uY=;
 b=zkeRz098LjBgeVVO5j5QooLssE3sq5qBdRWPPDblctPmpl4Y+kA0e2/piV1ckwkjxA
 AHmWdowjKW4QJwNS3Ih5vPkPpz+FAMFGCawyXpwaad9Lo9tmUCQO4XedIw+H7b42Mn3U
 N1eCZPv2PAEb2Rh67ZAC+HPUA7TjIRMAUbemAjGNnFwfwL8m/iVQY+rfyqffBldPzYqU
 y80uRf5oHtyknKbNSM7EvJZtO2ZsXWzs22ZcQSKNyYPNa4t1azJAuD2fxKuZ/RSymAoZ
 2eM0gfsfLxWVw6UomZcBs4aYuOo/12sIUGYaphc105A4yTM8jy3A9b/Wx0nXGMCMXsXq
 Bizg==
X-Gm-Message-State: AFq9FYIktDUB52wP1T48JaurMi7AD91JspzcU/Sm9lr/QS/GlgUcQlhm
 Iyhpql2bH9kbqu8w9MiiPwl72833WOYuqwyhimp8eTSUr5iAYnCCU7t2/mKl2n0BL5HyGPbduQJ
 nzXqimgM=
X-Gm-Gg: AYBFou3VQdjIRFJhsw8oPbEGh18ubPAtuW/eCpqYGMmNvtkD89ROTlcx4pBTAccaBJh
 zev+c4t0UAmXukUqXz80f50HKU4cQbuc7J+OfvuP9O9ruzDuf9ngeLgYqzUtigzGHGCTe+J6f2c
 w00Z1aB9914TR/nxE9IDz3Rxq4XeQQEdwI3zsCGlTVo+bNVJ5wH5VfXUAHJvH1xg4D5Ty91CGTp
 PWKXj84R7zl7Cnej3xO2pImBpkpnWT3Zsax6Yo4+nf1RSlWRvEcjWNpH/T65ylvc7AM7t5Nwg4T
 VkRwI7mpvHyUTSNTXyg0hyWY+52TSFCUyrMhZRGoWKqrQTQOJk8p/EEpVz8hKAeAarQ5Vr8x4zj
 OPJpgXD9AXrQmYRmrGOGpSeIv8YOMaJVEWIiX+LxouIVQ5ac1iKXDOvge58HDTyN0tACVTecimN
 T55EKpqFA+dWbhKULnXklracBbZU78e+JkybLoyCyfWZl/BpvWAdSVktfukn5UkGBprp8Cq/VFH
 MEA+JXv5Hbo8nZsZD/nG26UzvTXiTLcKFgXxOpe5IgWPsY3WAuj
X-Received: by 2002:a05:600c:3546:b0:49f:f099:6fb1 with SMTP id
 5b1f17b1804b1-4a1d75f8b58mr1974045e9.15.1792163083311; 
 Fri, 16 Oct 2026 08:04:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cc642573sm45383485e9.2.2026.10.16.08.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:40 +0200
Message-ID: <20261016150441.68797-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004180224.1782750-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: remove configure
 option --without-cxx-main
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
> Upstream release 3.12.0 first included commit
> https://github.com/python/cpython/commit/398ed84dc40abc58e16f5014d44c08f20cb4b5f6
> which removed the configure option --with-cxx-main.
> 
> Buildroot commit 36e635d2d5c0166476858aa239ccbe78e8f2af14 bumped the
> package from 3.11.6 to 3.12.1 but forgot to remove that configure
> option.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python3/python3.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 0a7bb05992..a75af82ce4 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -18,7 +18,6 @@ PYTHON3_CPE_ID_PRODUCT = python
>  
>  HOST_PYTHON3_CONF_OPTS += \
>  	--without-ensurepip \
> -	--without-cxx-main \
>  	--disable-sqlite3 \
>  	--disable-tk \
>  	--with-expat=system \
> @@ -202,7 +201,6 @@ endif
>  
>  PYTHON3_CONF_OPTS += \
>  	--without-ensurepip \
> -	--without-cxx-main \
>  	--with-build-python=$(HOST_DIR)/bin/python3 \
>  	--disable-pydoc \
>  	--disable-test-modules \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
