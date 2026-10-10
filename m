Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FEDCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07CE407D6;
	Sat, 10 Oct 2026 10:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4P2jdBFBtbSL; Sat, 10 Oct 2026 10:02:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 88538407D8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791626521;
	b=oNYfcHg2622BYB/9hpx0nNFgr9BVwiqSu6znXNdeDwJvVEKHZKlGTvvA4QyGWhQFUnFJ
	 JjG4HzdlCrNBS6qrmM51E2TM0wJYNuNsXHlMTjgxcbPCaq1cd9Pdw8Y+tncHKH1IE0a5K
	 8BHpXf56ln5ECKGWvRl27m+a9YDLSFNysrHQK0jzQVHI7RbIylBxvEWseetDz1ZEQRZQo
	 T5NtqdwiMmIFcMKGujGw4RCREIMSfbwZAJ56UZyk82bGq5Ik40Pe3UIKAnULX9DjBYkZJ
	 BCBUgWzwubQruEqMOTmNdqL2XWAErmqP9Ra3xn3BBeY09BZA7KbcIr4ryRoBpWTFp4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791626521;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h2YbovbUVYuCewyPAljVZL5Mr21ZtKPDewkhhzxOrLE=;
	b=KlayL462z9ZLSjGW9nsmRF+AsktYQaSS3Rqz/RFLsojXFuKCnvN+f6aXGzFkka/0pCON
	 7kjFo4hVCxDGhJO9CRHj+svcU0wTo4WhucIj+09Tc3kDXpMYa+qNnilTFVLJs6rXJdRqf
	 hycdkusqk7p7BbLvWms2nB0/2td2n03hLozKTSRfOGIxvrS12GwrNarKIgeA5XHG1WbzB
	 IvgkYkNOJTJsyQay/HG1YRwHJsiKQAgBRlAdAQuHs7KtyfTFjFXaxxrPuSubbUb1Rj2fL
	 IpWGhRAhiMmW2UzGIiwPEsgUhsom84EITNd6oXbsD0dRyKqBN4RiwaZmr99hZqnBoOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791626521;
	bh=h2YbovbUVYuCewyPAljVZL5Mr21ZtKPDewkhhzxOrLE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jquWpyhhspX3QsuSzdwQyPBKRiZd203vVNDSBj/71vFfokZm+9QJwKyqCtaXYXM9T
	 n2WBwUhAmus+36MOF3QnsbOPbrHT9eKpRt81L2GbDH7ILbOGIg9dsO2L+jaP3BpoFU
	 XxvZjTkm9lrwTC6uKtvNqdrEllS8jN+eYvNbtaFc+atFekc4bPuqeJkXrpLTC7RsAi
	 J1my2SSJUYs2BIyqP8mt6w8qWkJow/9SRcg4IMzA4bcuouJIgIMrdImE5CEBtMWfsi
	 eoBAgIKJxHBBKtEZEh1lvKbqvBaEx4jqGvKQyIsWcpGvMLHvUIeftE5yU/C/5IUPTh
	 8/Cu1JvPMqXbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88538407D8;
	Sat, 10 Oct 2026 10:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DC671DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4203D407D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrYaUINz4a2E for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:01:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB47C407D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791626518;
 b=MrJlzm8affZcJYYy1Jt0mLZtNR9y+l8CHx9sDWTupQUuJ2hNoFEl2bYwQU4YXVDxHvai
 ZoGajJCOeSJjvQ/0SjibLZ6YKmNpxpwvSKpusm8Dlgb6TGMybHyVKW5ayAjfoIK4c4VEW
 w7YIa69+QypB/UIzvFr9jtEgUIW0xiqs/bU19+2WhWBkoay/bjilJM7oZNz/YoUXPFKfG
 PShieHvqSm//op8dU2Bo9k4xnvO3cu9NU9SkFhwaP9VHi5uNVlUpOBO9QDKJ/12B5mTnC
 GAe/XCrOBCh8h2i0iv8CKUZqEuDiVks45jtOliTuxHNeI7IIr3OooemJelGpyfu7sDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791626518;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=a7QPEg9pxO8SRM4cvfAK67hrJsMboOKw7/RfvU5lNQI=;
 b=pWTByV/QZOJUsyQzZr911H09g8q1oux75366WNdlJXkf8L64cLbMyETXS2rveyKavBT+
 cdFYsyTMBq9eodCt5SVVqMGRT6c4Q2Wtob0QfXZiRVYOJKsdeeWLvsl0jvGfiN/W5SwSd
 1I0v4J0974q2awR3PwBh11T7hzbFz9x9bkh2F1Eyt+UMgkq760lgdLrJmydEWZLtIJTpb
 9d1y5l5l4S/NGZ0LFNobSaZAFAn83KftyS+KnPkkZyJDR6wbJJr1EjOSTxrsE6NTQZSmn
 Bl9aADbavTeaTCmMtZISuzkU1lBSoIOqHxoGOfxq1+EP8wzEVus8q5gwjYS8MdXmd3w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WOwLM44q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB47C407D6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:01:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so4138215e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791626515; x=1792231315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a7QPEg9pxO8SRM4cvfAK67hrJsMboOKw7/RfvU5lNQI=;
 b=YCHG4NX9Dj+eX9X8Ott+7C0FT2Ul6/Yguf0uSTGlMBpPBLUPSkrgWajEuaFSA5SF8w
 XQ+GuN8GWCr0gegPjeqJjCnbmVYorRwOY3zaNdDAq4546z6BwA3e+0vnyKNUPAPKqPJU
 Qz3l0Sd+B7umjex7KVsvdXXm6fFtjQp51dH/I+OSu1AS4ZBRigmfNoBfhDdDZUvNn7K1
 PMS4xWfkuqnqFdFS7UTzluv0DjdFgj5A21AyBGevkIWtFLx1lB0X4Yuz6e8b9wM4VusL
 jZjrxUcx1NysTPmLh6uHb14ytILa45oWICgft1xffLqo5NaFLNvnTTLsu69OXWEDz6hb
 HsYA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHTwB0a0dmBP6mfb3Evh0sAN3aV7pvTr50MKs9LfjdhuxcS8nh20iVL74QyWLH19Qi7f3vPbPf+bI=@buildroot.org
X-Gm-Message-State: AFq9FYJkN2TRB06pKjQAr9bg4wRivCNjbU3uGMitIBvagtZ/KM1wQfGf
 KxAhBnU8km40m58xl9uNEI7xjT37X0oIpeDL3wLquMCleXrKpYc4Lxpf6DpO+d/00ak=
X-Gm-Gg: AYBFou1FmRROYyNHWGHYFHKFpIyGG3Tv36l62Xfnv1et1bC19QZYYR5c4Oql67LZ8bz
 FKf+sfP2pYc7IIkOxBIu6F/SY/C1qkpQz9fQJfNPB3hxtqND/C60ziwS8hPPobK36pc87gGlrLb
 eN81QuEWc6y/hXCc3XMjQxxzOfW2RFOyIVRflQlCulmBbdXRDCmBM/qwMMaxU5muCQPS4DEa3mw
 C1Xty1AczTkqbdiiTW0g/ca0N/alSYXEHZh71yLO/ub7iK5KRnoBFWFd6gA21lX/ci/wd2fVEp2
 Wbqk9d8dw0fmsbnx/RbNw6CA9DtQsCLzLGG2/BxsLSzhKmzifTj4f1Viovl65XbALuqOGo7Ll8c
 9EB6LUBAdip0TPCCfUi5lvIkLuw75Zpzm2A5qICiWRrcT1UxcqVsDgd970ntG6qO0yf7uIk2qza
 hozqwY1Y0OHEAPendYWkQRnaxVGoDSaAvyVjbZXOZv0VoMd1dB4qvwRYdhBFyn4KAz8fjooHSgq
 J1igbu+HsnTBwuRstgMkdg3vllt2iYcNVcgMzlWqbij7ZN/HU3UWw8E
X-Received: by 2002:a05:600c:46cc:b0:4a0:8b1:f5c with SMTP id
 5b1f17b1804b1-4a18e4b583fmr81388445e9.22.1791626515494; 
 Sat, 10 Oct 2026 03:01:55 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb68abfsm131253565e9.0.2026.10.10.03.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 03:01:53 -0700 (PDT)
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 chakrabortyshubham66@gmail.com, thomas.petazzoni@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sat, 10 Oct 2026 12:01:52 +0200
Message-ID: <20261010100152.490887-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930211826.2349920-1-yegorslists@gmail.com>
References: <20260930211826.2349920-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/atop: fix musl build
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

Hi,

Tested by modifying `support/testing/tests/package/test_atop.py` to use musl
library.

I would just add the reference to the buildroot commit that made the bump: 2110131cab2a613567c99491ba540bb33440e46c

Tested-By: Thomas Perale <thomas.perale@mind.be>

In reply of:
> Since the bump to version 2.13.0, atop fails to build with musl:
> 
> drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]
> 
> (Before 2.13.0, the same configurations already failed earlier on
> uClibc because _POSIX_C_SOURCE was defined without a value. Upstream
> fixed that in 2.13.0 by giving it an explicit value, but the same
> pattern remains for _XOPEN_SOURCE.)
> 
> ncurses only declares its wide-character API, including waddwstr(),
> when NCURSES_WIDECHAR is set. If the application does not set it,
> curses.h derives it from the feature test macros:
> 
>   #if defined(_XOPEN_SOURCE_EXTENDED) || \
>       (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
> 
> drawbar.c defines _XOPEN_SOURCE with an empty value, which makes the
> check evaluate as 0 >= 500 and fail.
> 
> This only breaks with musl because of the C library's <features.h>,
> which curses.h pulls in through <stdio.h> before doing the check.
> glibc and uClibc both redefine _XOPEN_SOURCE to 700 and define
> _XOPEN_SOURCE_EXTENDED whenever _GNU_SOURCE is set, which drawbar.c
> does, so the empty definition gets fixed up. musl never modifies the
> application's feature test macros, so the empty value reaches
> curses.h and the wide-character prototypes are left out.
> 
> Add a patch that defines _XOPEN_SOURCE as 700, matching the
> _POSIX_C_SOURCE value of 200809L that is already used.
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/914c1d8fa0fc8bbef64e4a64d58e5941d0077a3e
>  - https://autobuild.buildroot.org/results/b91/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...xplicit-value-for-_XOPEN_SOURCE-macr.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
> 
> diff --git a/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
> new file mode 100644
> index 0000000000..d526d58433
> --- /dev/null
> +++ b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
> @@ -0,0 +1,48 @@
> +From 54799216beac63a195cd6d34b22476fc15a80295 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Wed, 30 Sep 2026 10:59:49 +0200
> +Subject: [PATCH] drawbar: define explicit value for _XOPEN_SOURCE macro
> +
> +drawbar.c uses the wide-character curses function waddwstr(). ncurses
> +only declares its wide-character API when NCURSES_WIDECHAR is set,
> +which curses.h derives from the feature test macros:
> +
> +  #if defined(_XOPEN_SOURCE_EXTENDED) || \
> +      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
> +
> +drawbar.c defines _XOPEN_SOURCE without a value, so _XOPEN_SOURCE - 0
> +evaluates to 0 and the check fails.
> +
> +With glibc and uClibc this goes unnoticed, because their <features.h>
> +redefines _XOPEN_SOURCE to 700 (and defines _XOPEN_SOURCE_EXTENDED)
> +whenever _GNU_SOURCE is set. musl does not touch the application's
> +feature test macros, so the empty definition reaches curses.h
> +unchanged and the build fails:
> +
> +drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]
> +
> +Define _XOPEN_SOURCE as 700, which matches the already explicit
> +_POSIX_C_SOURCE value of 200809L (both refer to POSIX.1-2008).
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +Upstream: https://github.com/Atoptool/atop/pull/415
> +---
> + drawbar.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/drawbar.c b/drawbar.c
> +index 651a81e..e4db0d6 100644
> +--- a/drawbar.c
> ++++ b/drawbar.c
> +@@ -104,7 +104,7 @@
> + // the other.
> + /////////////////////////////////////////////////////////////////////////////
> + #define _POSIX_C_SOURCE	200809L
> +-#define _XOPEN_SOURCE
> ++#define _XOPEN_SOURCE	700
> + #define _GNU_SOURCE
> + #define _DEFAULT_SOURCE
> + 
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
