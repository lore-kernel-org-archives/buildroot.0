Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5818C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728AB60C10;
	Fri,  4 Sep 2026 12:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKvVaYbO1zxM; Fri,  4 Sep 2026 12:17:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3816E60C09
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524257;
	b=YiAGPSBSpZ/lQ8VPgiSdatX9bTR2nr5vybOxiFGxrW7xtamt7gkV1pFoORhtqyL+BO4v
	 IKvinjOsOyNbaR86hv4NHLtR+iQTmdC1AC2h4TgWN6nfUqrh9F/5wALE4nUQETO+73pMF
	 Ub8JAoshIOQYgRNq6x4tMCE/LVUg9ACMzyPQpLa/LTAqbWWImp0XnXyzL6feHQln5Ku7r
	 0Z9F9b2Er0b6aGH2nJoXXdCRNLV6TWBbe0AsN1EfidOJv4nT+B1Fb+Nc8Yl3Izj8JTTdn
	 eChavRUVy7vicjP64TTRhOwe+/SpWZMZ2F3VVkjZkf4r5a21igEBlcOIpi87ngvQR3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5rYg1AuCt3VOcQsbDvCKtVZzmm3bbaLpnudUbQS6oP8=;
	b=GYxgc4irtzOjVTblAowI0W0O+fHSO06gNRQg28UNBm93QGE9F8Wh/lkHXEhutbfzVhzj
	 N4idHS7AAZNb3jp0j5sJmKyoh+rNmkemYvO3f+9vwLSMvfJkyE7N1Wz2B6U2TFx7oGxh5
	 JTHg92NacRxPO7Wr0IDPmoNICGbn8B7pnlrZ6k5fScqb7UUEww3K4veDS29AoKfA1lnVT
	 JjpJJ8JJWW2TrFpwU72tf22RRkfwOqEjXIhuSmqtKCiV3+neY1d/pkzWQ9ZL1Ec4SPHG4
	 fszT9Pg5dLT1jUVkr4BcU3xahnXC5PKS8D0sy2uzBJT7BLyEfB+Cj9vST3QD2ukdnWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524257;
	bh=5rYg1AuCt3VOcQsbDvCKtVZzmm3bbaLpnudUbQS6oP8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qrVg3odJM5Y/vJmCzhvmoVbaVnRXOc5WWEV14C1AIvaE4C0RZaAg2Z7HTMEHxFzNk
	 xfDTPQmBSw7LWFxu2Js3eikWPJ69D8rYmF7b3xoqrgrubd+waWfv7Jbe3ElE1+qYRe
	 Wl+7RpmlOAv6+wHuuS6VVG6eELx8FsV/vNGIEw6JK2S8vIig3u+Fv4DEJ8pdeWSbj8
	 AURVm3o1Nm5Nki2V/DJ08BKTNd1CpXPqt65JusoRI7Rx7lbpoyabLvj1hr387/fCau
	 5q7NL9IduwTrTJOmqL44+zPZao6p2v3ec1qPguymp/BKlOTpBICiD3TNSaLUjzH32N
	 s/6t1CwpSpumg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3816E60C09;
	Fri,  4 Sep 2026 12:17:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B68F6F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7CA81172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a69c13o6cNd for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7EC9181174
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524252;
 b=dfr/zGKNaUZZLIR3UrSi/hp7GOlox7FQprIxf2SUiwVY7Zv3ZuE7deg2YMlgSnDUpSf1
 AErrMEOkynzA6P9fx9zJ0T9QCVFMz/oOsnT/g/ZXxE3oaRp+BvqfUFjFd0BSbmXC3bUSM
 J3xTcJ1cXCUjI+ZaS5OtwqWvQxTVsRX+uUPxkoxvft++S02L/8sh0U+udn85vztjyXbsz
 aY3l/h0q54aDxtx+aHXqCoUjcgEn8Ina0wXl0e6zfyWHiEqSVYMOiKZT8u9m/PJfOBLdG
 6PwLXCKN6R8Js67cBoDlbDUOvi+U4TZ2g4GcgsXyzOhE8kGaAjXMypfVbJqmswvmDeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524252;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=DQ9/jjmXRvXMCbkSLeS7uH3pfX5938fkicZwqeeXgoQ=;
 b=ZHPdcwEK1ki4nMQt+rU92IYPcanHkaNMI15VWF4TcakQd3yrr8JVLfxjPICFJy2pD3hP
 gm1yYcVymT8pf6KA7iLt1gKV3ytsKav1n9AZXIV/5mI3q4n+EasuTGItQtL/N9SXsSLt9
 nTKZQ7qyptsshSkvXVqH3oUIG0WRIjMT3XYGrnrTfN+UvkAJlPg+h1DIHgOiFHLICFw6G
 83TfsjDUt45FVv7DPb4aEqgHYwOxXBfADFJrwGCwqQRQMfCgX73Vx05XGRjLoyuxqoydf
 T7EquSQbHXsk+y+Reec9sPAkczhWeCxZ55dJqCY0FoxeBw1raRJI0IYK7WpDTbtbA9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JRG2ITLP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EC9181174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so983653f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524248; x=1789129048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DQ9/jjmXRvXMCbkSLeS7uH3pfX5938fkicZwqeeXgoQ=;
 b=TEheDQHVrdsmUXUU1880lNEOPJun6HjVcvLXr09ENvLKcJ3N02p5x3e0E6v2SIE2o5
 vmEcx2g5OqnET6P9SB0wnR5OHbg4+buxsZohnWQ5FKVSz3xIN/FsEgzO0qgzg6iZMqgk
 HHJhTGmupLd47TRPQfxxzvARAtyGRc2j1cHtCPSPvOueazcp6zHoYx3ZZl1UMupSa7GI
 Bm+h7HKDhRXW5zy9Jadl/iXAJwkqSJDHh4L6JsdL/JFJDqEeeOmirYN/ZNiPg3dwlI1v
 KRiAvXoJr8PRrPMZvFx9WzOAjbQwnXoj2nIiNlrYV9hyFnY/WeGM8zRBhb29kdpY8Lrj
 Riow==
X-Forwarded-Encrypted: i=1;
 AKwUvBybnBpy1zAvDOuAIDsr/LTY2iaIzBu1Y6iqJVqn/crfT4b8h6xNijoP0EgX/UJWIeVbMPicIIJEKek=@buildroot.org
X-Gm-Message-State: AFuF++k9I/mKvWbpH3gspT75l6FjA1+vret3oRnGg1vWSZzRFbGSz/yv
 XKUjgysnJlKHYfw8gvzQDBw2OEAC9KG98WCuQ3ZndF0xpSdV9wK2QTsnCt6jTpE/vbo=
X-Gm-Gg: AYBFou2cW1m4UR/rCqK6qeWmjTI1QgMM+XnH0HIudmWyFMIzZdy5cAildKJKpzIBssZ
 J3Uv3JLpZtbpoEcsR520akUSyhcvgt2yCaVdmenPy5SrA/Cc6FcgtppUmVjh/mGDOgMBghoJPfM
 Ggsq5cnxTjN0W2daRvR5slvCHd9HZ3BLXgIJPRr8VDcty5I5Yknyh//TRhnbqPJ5aeH+ownlGxI
 SDMuk46M5K6ur3Hnf6G6FHVglgdZ6cJ0ABV7BbUyNgd+2gwXd+i4PJj2UY67Xcfg2zC4Ngs3nj0
 kto7ZPlNDITKDvfl0/MBsxbCI+LgdoBFZ+dq5jKaLj1VkfK5B/M8IGMZoMgiPKbjgYoz52ferZt
 GnM8grhy4UOAaFDYe2xShrkKZCThYtj0Fe4+zSP4e0n4kYUgHkQR0d390opUw4j2HrCWOXhMP2O
 rGV4yUZo1EsyUu0EhFAnmXNeUOOw1gLhujvTlnHfupfdBYK9/A66rov3uWQLORmEGi
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id
 ffacd0b85a97d-485870934f4mr7779566f8f.21.1788524248062; 
 Fri, 04 Sep 2026 05:17:28 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm850402f8f.9.2026.09.04.05.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:26 +0200
Message-ID: <20260904121727.403691-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726212249.155140-1-bernd@kuhls.net>
References: <20260726212249.155140-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/jpeg-turbo: use configure
 option WITH_{TESTS, TOOLS}
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
> Buildroot commit c531fe65209defd356e5ee8142896478a20ab371 bumped the
> package to 3.1.2. This version first included upstream commit
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/942ac87e479c48199d48781e9a5b2cda3b910d7b
> which added configure options to disable the build of command-line
> tools and tests.
> 
> This patch replaces the currrent _POST_INSTALL_TARGET_HOOK with the new
> configure option and disables the build of tests.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> v2: no changes
> 
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/5f39b7407f7f8aaadb9870a79b354fee7d4550ca
> 
>  package/jpeg-turbo/jpeg-turbo.mk | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
> index 9a10110766..073a607188 100644
> --- a/package/jpeg-turbo/jpeg-turbo.mk
> +++ b/package/jpeg-turbo/jpeg-turbo.mk
> @@ -15,7 +15,7 @@ JPEG_TURBO_INSTALL_STAGING = YES
>  JPEG_TURBO_PROVIDES = jpeg
>  JPEG_TURBO_DEPENDENCIES = host-pkgconf
>  
> -JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON
> +JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON -DWITH_TESTS=OFF
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JPEG_TURBO_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
> @@ -43,11 +43,10 @@ ifeq ($(BR2_STATIC_LIBS),)
>  JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
>  endif
>  
> -ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),)
> -define JPEG_TURBO_REMOVE_TOOLS
> -	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
> -endef
> -JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
> +ifeq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
> +JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=ON
> +else
> +JPEG_TURBO_CONF_OPTS += -DWITH_TOOLS=OFF
>  endif
>  
>  $(eval $(cmake-package))
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
