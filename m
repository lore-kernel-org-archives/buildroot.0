Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE688CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC4B40A7B;
	Fri, 16 Oct 2026 15:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfY4MXmaYfSz; Fri, 16 Oct 2026 15:04:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77B2240AEB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163052;
	b=qimqrse1MF8abmL/m3IZmt09dmL/ubYogDZgQx1EUmzPHK/QONXT8Eg0+n+437oxXgLc
	 uv7id3tiwUOl0alFB13RDZe6qI6JYXetxSOUoe+FKheMfNUo77GtSWwwdzBp9nD/6YVg5
	 Z2huA0eWyYqf4I2jDVZhk8EQU6gLvkZ/Blx2V7+TQLBLslkkiI4J/JaHahlzWT5cDaffw
	 lpq1cHv5vutdHWYocDXwdsuabqmGzUpX230m7bkKpbFCjt/Ox1OGBgSI8cFSB+9CL2kZ6
	 Um+lNlNbjB9rn2swSXrEq8Pg6I0W1O7Bf4cU5omoJRolXpCTdYfA+VoKA3MK8eJ66Ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=81HwHYyZQ45EdKeJqjSCz6Id9jOxldcfbcRcmlmIGXA=;
	b=fLgoMDPHAlVJC7IzpFBnxGW+5YqtGjcdmlDRdGMXWog1SO81Cfk9nrwj44HxOyG1qbCr
	 8Ek0x6kZ350IIsuZ6rn9ES/HO4ffcG9ktz6mQEGWWxNwjPb5cr0hPn6bYa0WyK+fkG8Eu
	 YSZemE9ksT0yzoS0wdam4HyLCl7Y1qpa17J5Gx7kqopxpFAD/gyqaqCNYJRgNIpzXQoSn
	 607wuvfPXZ/1WH0ClKjAWicihLlHOjlh/7is8zo5s/P7kM0pdiAupDuOOF1JcvalwuMog
	 FIQ1E3W6wYl7NB17v8z9Fa1IaAxcZIzbjjzVxsujJ4bzvDn11ERDeeTXVnff3ctD38Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163052;
	bh=81HwHYyZQ45EdKeJqjSCz6Id9jOxldcfbcRcmlmIGXA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iM9nmjQZreHxBlrQ1Byhw1WdNKLtIKJYLQwRG1aY+bT1jexlQvrKFzy/G3o4vbLgE
	 3uKI7acmqwbKCeEMNFRBhd5I+DXYOYf8n8TDUNmq8j28qifiLEAr9khLKePBdNqd9K
	 7VVNUwAPnktBQsHJa9jwda10iVdwjVmDo6YIKmIXi+xdn7vS0Ukmf7PvQPro+SQIAC
	 tkVfT+Co2Nys8kQ/2mhrU/COwo/FUlfhd8gSMhfLXRNRtNxnaMBZXxjylyCrBHKBu0
	 2lGWY/cNsAXICtjU6o114lKtPNwGZPZYOrsgboRM/rLWXpQf7Fb+6woLV1zBBf3tlF
	 uH5Mjyhn4+9SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B2240AEB;
	Fri, 16 Oct 2026 15:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 956C3255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86DE540A7B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETrqiKq6F_aJ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B02440AEB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163050;
 b=oEgyfTo7gPkYTYkaA5DdxomDvtGJot3aX2JV374GmUU7LfWDOlcrWlnwSNs19trQjGXh
 iUS1CPHbpE4JGgQ96Fx0JpzYqUvrjp/lUr392762nxuFdXX29P6cdefCrliCuu6URPfat
 nwmqwXg0RYIoBVWgBxeVTZY5LQ9a7OVMR67xJgD0et8OnQA+XBIRj4Joon22jUPhWTetw
 E8xNEEMsbZ4Xac/6dZRsK3hVt7f2dOzVZsXODJLQ4aziZa7EVDcYy0ksPK1bdtYGJDagW
 4oIkKbZRuSDSkBnR3GA0/HpfBMu+fUlnY3hT9te3UmNEvQuwyFKh/ceA/mT7BmDVpxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163050;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=J9dglfuzZPXsIpg86zQOelfFV+SxJCHfBYWNULCm0zk=;
 b=rtLq9dofABKe0j3Q/I+dWjiQDmGvBNdHD+TkYxCiV6s1EnkqzkoX/vxPZBCaw3OBx982
 RnBtoZNO9yxMDkoVBDeCKURfSXScmjUzrgrJi7XAAz+R/ptW9PJEY3qkAbw+sopaZlH1L
 /kuxWvKH4NyOTmPmxjHmzXugeY2d3qqp50SInG7rXTK3ztZ8fEiQb5GBhsyBijSJCVXpk
 wcVtzQUrVMAb4igXQcMYl8BReppgWg3edRays6Om1/hlh4v3MspRqjkK/W44rlgD8AnIC
 BxmN3HdJ1yH0z2ODdTvqkWQvUJbLJkgguO9dhET3xdSW+2sqaueRkQQC2J6UFLJYAIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Inma9dMN; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B02440AEB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so310955e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163048; x=1792767848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J9dglfuzZPXsIpg86zQOelfFV+SxJCHfBYWNULCm0zk=;
 b=NrMgVtPt79cu7yzTjF0H7Hxf/prJKGnHLGpcu+meJU3rVTbdSBFgGxxa3DYxFMyHAt
 LEsWKuMAn/KCJLqVtjOAUsorx2UlkK2bygh+yMyEn73U/0BVndYJETsnO8Qhq1jAaneP
 bkHFLTvBH55XJLF1CzaXhpSXKWxrnQnBaGoADbh41tO7fqZei28nL/7hCTp8I6Z2qsfq
 P7a5U9TFub3SPh3XDluNTpa0cC2KMXbdbvNXrQulnZICU0YYutab7pnsoTtiT4O+8NGv
 58zQf3eN/4ljumEv7+wS58Nj0Z2HeLe84d6dvcDR/YrqV9ad7SuEAgq6L3yZn+V9RQPC
 alEw==
X-Gm-Message-State: AFq9FYIgHuDPGuF6y1WjM6VvIse7Em8TCqci4AkVaUSVAcwOoc+6DJ3M
 pia2HyBtYnUDmmngK6mCq+TnT01CVvry9H6lS067r97uRB7me6oUK27hx0nM6gIX9KkRd2cZ/MT
 v7q20caI=
X-Gm-Gg: AYBFou00ps2ZN0q6sWVbKcyGgLgCSNXVZVTJ4qLCi6WOks0Yml330SzL51ep1U+4z89
 j6e1bPCBrn5+YoL5Na3rETBRpekjSFi2/UfvYDa4uPHrqt4PswNZ27f/o4rGs4Fxn6t5po4ew3c
 6cEGuwEL4DAjGykOrpI0JdsHgnotxfhJi8eWFsoYJH+B3JuQPWCw4rh/h2BIWKsupBBejwOMRDW
 oAaOBc5s4Fh4c2qCWkHqZrG3g9Z572NbKgutkZl+zLQCZFbbha6j/2JQmRQFj27N3N+11gQTzIS
 vjpETVWYc5OqH4yS/eX2/lp/NDz9ZpkGyuwSuQWvdbj7pVlhaZTgesb+qxpTgPLGU/Du/ntScCD
 FGkJgdqXxpDNzzH1SImMEvNeHzaEPG6uEQH4mopoAgda9D/7dY3iDWjZ6u1Y3D+7n61jXskz6SE
 7kspIM5ANVa4XGgp3aNqe/A2t+Tn6CRpkGM7LbyEfT4BWylZtaeLSwWxHx6cdVRirVQmPNI1L31
 DG7j4JBigJZuRf3BES7fyVLhHaYF23YBLI0O3CJ3A==
X-Received: by 2002:a05:600c:8b25:b0:49f:fe39:5bc8 with SMTP id
 5b1f17b1804b1-4a1d75f987dmr2280275e9.12.1792163048022; 
 Fri, 16 Oct 2026 08:04:08 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cca43012sm24527965e9.3.2026.10.16.08.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:06 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:03 +0200
Message-ID: <20261016150405.67562-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930211826.2349920-1-yegorslists@gmail.com>
References: 
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
> Tested-By: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.08.x. Thanks

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
