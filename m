Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C176BC98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94DF760D7A;
	Fri, 25 Sep 2026 14:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuEmeYoDikgK; Fri, 25 Sep 2026 14:44:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9DA7A60DBB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347466;
	b=Bf8v3QzAJIJoVNaSKIPYwWGd3BhNe2GWlc5uyEAcPUQHMKUFgSbTiV1Yti2pdDLJJxSl
	 ofv+p0NheeFXhZegyhe4ObjNmuv3VBVDnuwJUb9pK4Xa2pSoPStNzCucEwgHLHRIQWyrS
	 wX62YXGwTsLBHYUlQjcc+kYnCIaLtVBQtdOcAzJUudNFY3xcAoZOdDhImk+EZXQbMAUuw
	 4AEk2gjrs4Jwg616I5bMJRrOclKxbS8NA4HkuEKZhpi3Wi8jjBkjSdyhcW/2jssa8NBvc
	 /K7352Ef3CfR71HXPtjX3dMzCGZaK6IIvVplTuH0F9gY4o36JtoSr/t/ZehHWANhQdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zmWH+c2KI08MxaN7siuo7pmTSyMJJmLr5iN5EoWD4iI=;
	b=N7picG4ykKZfUJupZ75jnnU35rBXPnw/YwxjqaN02Js45ych6oh726aAhqSB+/H4vWuf
	 dkGiL2M1Qej9P7F4yGnrqGtKC7mcpXEkzU6gtscFZTENaduVSJywKskDcYzQYKuysZGcW
	 tNzjQScHdV/lI7UFfCJfV1r+FHquQCdM2HnVs9Ga5RYpqAtmjl3oV7G2KS4Pp1V7si+qF
	 FflyfpXNy/ygE7nIH+rshbNe/nZU1poSAuMLem9zOcE4/88c3OeysJosz8emXfN95vfV/
	 bbnI2jsSl0iIy36qA9v5R8Pz4Ry6168Z1p0510YjPXgXDo8tJh/eK0MKJ1yiKSywCDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347466;
	bh=zmWH+c2KI08MxaN7siuo7pmTSyMJJmLr5iN5EoWD4iI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EmCo9hHCvR+jnrar/eWuYPiQo0NXrs3DL2GWsvYUDtFTU9TBqiZTOgw60gylhDdud
	 BN3idJCiHjm+R6FloKRe4H0mv2Ab1mZHtaFPtp310LRwrX43R5yzB14ZL84K7v3XbJ
	 Hhr9XteRnzXup/IJrhH/T5DHAYSV8Dom5Dfoo+R7jQAnS1iKV3i+15UPGVqukQ1IJ/
	 2Yq0YACDqvtM2eZ04CNsxcX4wPWIfJR8Y05HK9JA/Vuir2GyWZsUBGWgdu5KDDaVr4
	 ZKgmuTch0EBXVfeofTJJTgdvXtnjzfiGy64nAI4O/jsT3SX6wSZhMVvsS4ZOitIYRg
	 sqcfLAcGsd/ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA7A60DBB;
	Fri, 25 Sep 2026 14:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF6AA332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D188A4016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2UPVW3CkRD2 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C01C240475
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347463;
 b=h2j53QIjQWKR56hRj2FL3wV8b6Dix16WpLo5CKs+LuUHN+00VTQXYjf1o2LeP9cRDDzg
 MNI+GWzWxGQK9mGkw8Mf2OPVBVKN8KtR24/rgTQrvB8E4hsuvKXAIPOV6Sma8JbvT08fB
 Jk2bR0mpbQBQjfvK/qJbV3LRURO0qnNHFK2lHTFMnpOiMIlxqwsASyadsYSmiiba/PUqx
 E3pr5JGRL7oRjyR8Q+fNtK9a8/utUnAoV+RlVjGoUR+jmjnr9/ROlAgdej5ed17eR87gX
 WKFLo4Edb8gwiKhLmux635eccG1ovqW98nihDz8BqB4VjrSepi5ElnBF0ymPR2wAPpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347463;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/6J7tisqFxIJTmzUURij9OcKJtelnZP9443+CSLj77U=;
 b=Kg18oNgiewZCguEmABtxQrNf7zu0sGTXlt2R1AtHgPeCxgL16rSl/5hyLPXPn6PgYfIZ
 aPwKFHDc5XwgSaDv0R9Wl9zWb2Xouyg2Fzoie0rhFVg7qMSnORgLXYMXcpDpHO7Igd28+
 sd0ZBMkxudvhDCQO69u5KbIVrBuuxPv5Q2eC2+pZXL4MzNMM1TG95A7g5yLXfb6nyWHIA
 3EsQmn+CTwJ7T6F5vCwtBRqHaMNCW2u8Y5G3/Ht8HdSTqQY99HU7rGWpL+cpCEdnjdHfK
 x1/hMke8nTueBAkGnh2EUcA6l+eZSrOLj8/plX8ki8VzkxFQb3YrPHZVpuajKP9N4Dw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f4xLDUzS; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C01C240475
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:22 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f635552aso745265f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347460; x=1790952260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/6J7tisqFxIJTmzUURij9OcKJtelnZP9443+CSLj77U=;
 b=ip+43eymSFu7Vy/9B64LfKQ5fAyfVsytTNeqhBFhZir7aYaJt053pJkS8JSa5Vyfk+
 hTK6ie4ob6pwSWoUUJUvOn4UXjy1Pskrv6dmFlYnrO/0hgSxkLvqc+OaokpF8lNUiDCC
 WL2qgtzAZ6s4rG3100txGJZ5D1TWc1uIDIatQUhAI1B4l6ymXfWqGkC5XM0jeaxS4CzO
 oBdc9RZEpA/uuLgLt5peffsUhWgjDDIDvHKWaVWk098cxXnoGMhxZw+DyFGsEtPZwcGc
 kMG2qFskFoneOhFGVxWR8CbqZRsjnv/zJ2Ee+SbQEF3YJD0Sr/77wSTi/xZfy+7dDzWU
 Vd/A==
X-Gm-Message-State: AFuF++lmA/awNlR3xyprTGxTFBF9nC2TRbtiuO/AHZYNWdZ92uF/ii96
 qdu/FRkX0ASa/yXLJTzGHMc8BYFxIAb47sMqjFxt9x0cwqPI84D/y4NfcvbwBRFf8vlVgE33gFJ
 T1wru4wBQdg==
X-Gm-Gg: AYBFou2wcYGJwNm2l+2ss0HtKJaBaYULrwc4Z1YDD8sWBJ53B7uru4cVCgwcBdg4vsx
 IboxSkchpDstftfCVeVbF2dNktAW6XuGDO5mE+a9uffTP4ncZjwi/7dCOEVqCaQuGsfHZCJdF/k
 tllelh9TwnJE0KJy921P3y80KUxIOfW51SD5xRjDkRSbzXKWKUVwrXUDIfAF9U029jtYkoF4srO
 P8FZ7hfNB7HUhgFr0c1Mpl2O+0BL9oYMdseAFX14ncOouj5Uxl8l0RiIUgwbRTgMOcqtplmyVfp
 GrWWMY/G7e/oYZXV1+MpPUq6xWWR0GvxpkurRXjN6g+8ev37fD5KGAZiE0P60j1iLW8ttaMudLn
 FWUQ1OPvd8gFrOQupyWg3gvROGu07h2ZFg2fFy40EXK+vCLprQQf/bSxTvfqqr/eg//OWf+LSK5
 s5OH+r6BT0/1w+A2O96ccsxcN725qS+hLpHTTC2cvJiI3STy2JpCvnv4aU5ErtsS3ItY6zW6Gft
 jDQFkGMvXA4gfRRl47U1yORUli4D+8g32Mn18QcUJY=
X-Received: by 2002:a05:6000:41d1:b0:488:5db4:791e with SMTP id
 ffacd0b85a97d-48872a5c50amr10378836f8f.11.1790347460465; 
 Fri, 25 Sep 2026 07:44:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a84221bsm7699374f8f.36.2026.09.25.07.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:20 -0700 (PDT)
To: buildroot@buildroot.org,
	Francois Perrad <francois.perrad.86@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 buildroot@busybox.net
Date: Fri, 25 Sep 2026 16:44:17 +0200
Message-ID: <20260925144419.4096028-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911080611.55857-3-francois.perrad.86@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible
 pointer types
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
> see https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...0002-fix-Wincompatible-pointer-types.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
> 
> diff --git a/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
> new file mode 100644
> index 000000000..910d684b8
> --- /dev/null
> +++ b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
> @@ -0,0 +1,37 @@
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Wed, 9 Sep 2026 20:36:07 +0200
> +Subject: [PATCH] fix -Wincompatible-pointer-types
> +
> +src/unix.c: In function 'unix_sigaction':
> +src/unix.c:9721:32: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
> + 9791 |                 act.sa_handler = unixL_tosighandler(L, -1);
> +      |                                ^
> +In file included from src/unix.c:48:
> +/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
> +   72 | typedef void (*__sighandler_t) (int);
> +      |                ^~~~~~~~~~~~~~
> +
> +note: this warning is enabled by removing -std=gnu99 from CFLAGS
> +
> +Upstream: https://github.com/wahern/lunix/pull/25
> +Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> +---
> + src/unix.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lunix-rel-20220331/src/unix.c b/lunix-rel-20220331/src/unix.c
> +index 2e0d77a..6d91e51 100644
> +--- a/lunix-rel-20220331/src/unix.c
> ++++ b/lunix-rel-20220331/src/unix.c
> +@@ -1278,7 +1278,7 @@ MAYBEUSED static void ts_timersub(struct timespec *r, struct timespec a, struct
> +  * manipulated in C as type pointer-to-function. Accordingly, our code
> +  * expects lua_touserdata to return pointer-to-pointer-to-function.
> +  */
> +-typedef void u_sighandler_t();
> ++typedef void u_sighandler_t(int);
> + 
> + MAYBEUSED static void sa_discard(int signo NOTUSED) {
> + 	return;
> +-- 
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
