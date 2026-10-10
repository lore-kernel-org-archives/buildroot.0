Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E097CA9EC5
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38666090C;
	Sat, 10 Oct 2026 09:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyqAJx8lfV9F; Sat, 10 Oct 2026 09:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 020FF608DB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624191;
	b=aWEnwnEZRqBMx/LWOVeD0B3kYFOAaV54xyz64n+A/HfqTrnciMamqrpA93GoZbILsdWR
	 z7TTq4p50GRNqu5f08FcE3OKV5ba6u5vMmnaEyd00BgSOQD/WH3utIYvUepRWn4ItbJQW
	 o9VTwO1CYXueF8fpnPmOsLmbYFKcK8qfZxstSgqyhLYB+4MOG0F1mdHShRzn47PompRSC
	 CM0spMdrILYqW3cdSpsh8jkg4xg5bfTkT0+yimJD2i4mFE72KaLpzVcqrYixeJt6Vy8WL
	 U0Epp7EQtVPGdJ6/QqDONCRX4q5fIxeZ+ek/3vlKtnRsySTAC/LZupTtNraHDJ6Q+Tg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f69IXf5DeBiGY1tPODxFsgCFxRoH3CmepInkaaf4Ims=;
	b=VzJWazEL6yX3t3MNvvrhT8m1osZoOD/ypynvx6uktPyRrbD7MBKOO5V/8sW14xzNSbIq
	 dZ1N4P948ouGjsJ9CTSJvgy2QJQDFLdSs3JU/ez/hGojzGs1gx2QmMTSqJDAH7MGIg0u7
	 HtjkrFXzZnBsmzo1zQ98GgGkaZBfFpCZ89bOOCjdo3jvTVGCVQlQWuXNeco/vsc7WMsIU
	 SsIXXPyFnHFS+VD6GpDqp3hGwnrqw3JR/d5+TzrBCGJ3cIJSlck1mGe98tDL7/wKKnOWX
	 GpSsnjBTasNIQ9qgGUWqgWWw0EfzD4OCx4UbUvrao3ozrERwkzeI/5AfnG0lPOWxRDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624191;
	bh=f69IXf5DeBiGY1tPODxFsgCFxRoH3CmepInkaaf4Ims=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Rg6QUawEv4npeyBD5c4QRJRLiHIulSDpmlkb7W5cssRBq5sPoS7Y9uI//eDFW1TU5
	 qF7sRnlu2FlNVVB1EpVk/rca7m+OPuzOwHCRs4r23uJCyrR+mG/7BH2yGwxIfM/uj8
	 LIY44yyLwglWXa1c3Y4TwLYhI06BV7WsG1+p1RearYJ22RJqtqH99JnjK7BI+Ht/Sl
	 olz2xjbynJA1dnhHoRnFGCDYLd7plxPqunjBRsp/A+13DmP1CEGpTvQ9TZdLzElru8
	 tJ0rdT+bUZ3vi9iyU4DaeR9R47rjyQM+eDA9bWaJdT1VAeSuF9ipw+RHJVhux7IL4C
	 Vq/v2x5ei56Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 020FF608DB;
	Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31EA8356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23C3F40952
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmv9l9TccUMJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 614064094C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624187;
 b=hMhxghcZbk+4P8LHWyUyAo0Zi9jviFjASbyqApWmyu0vWtwN6kdxLq2mmOhtIFHIER5L
 LokQK/l6Rhl8wtG0o4kvuNHLLo9ESY3UiFJNQq2nkTgkbCr/TpvhbCdT7rvTUqpXqd6ks
 7pKivS+j8nhoXEeyU1lC2h/wSnA6JOZHQ/O+FR3vHLUf+avSC7kr7iyP6V9XfAefLmAs1
 aoRh5xIMbhUBe8XquSSrsFF7LmfwJSNSZYtzWBowlT4PWI3341uW1CVHaJCg/31xdSAqf
 e/WrSK9e71UeLKAL2FskUvhprYoZXNQQjDm3LA/b8h5f9EaY99h6y9QwcTa3tgxeTfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624187;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=Tq6+MTOLhmzoxA15lQY2Th1TwQp678Edkebrqzk7Bdk=;
 b=iG6dXPB3DWC3gelpEn0lji8Ge5jegeY7ykXTSQy9ps8D+jwEaQ+Bb/xvoR7Kjuqo/lXO
 smLKEuqNY0hEQA7sYQ+FLjpm4/tEl0r9T3w0zVy+63OL9dOFTOiHcTjm7Na7/Wf2mMbs/
 0QaYb0uqhetaJFucUSlvqcMEuTAq1oCVdiXcAZxH8i1ZL/kC7V9+hxxP6XG2koTF/YlT/
 pdJtjWGqY9yfHKg42qz4H1lAUdF79VvrK62hv54qHmjrAFXdzNb2DenUidjptvCbKFbh2
 E1mWjOmVV6bCrE5mSw0eCKh6s9POpmg2QssteCIog7zB7eXAfYabyOnfq632AnmzV9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WgZzOlyU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 614064094C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso412924f8f.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624185; x=1792228985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Tq6+MTOLhmzoxA15lQY2Th1TwQp678Edkebrqzk7Bdk=;
 b=UsGZAGoP9wxxJiGbkgHJwtEKmAcMix1YUYth4YmN1Ydj7zgYEw4PF9P+x4rfxfRHkS
 Agt61zku1h4U0MAgpaGy8qf2172dCfIwdAWnbC6XwcuA+4j6pyChHtkqKUQ3R/cQJeEZ
 9stBIES8tJ/FxNzfDthjqNHJwZfDEEZkQNvjAZ5OMHDdAm6YYEui6ccKlP2eO+64gqtl
 EUr4DLiNIA06d9EjiYZR7Xzz/QKvbQFmzwfUD2e5mVc0c0u1GZ2u53u76KwhMV0M8lhi
 BehO7j45ciT0dQ9DgN/pI2rN1YmNLE7q6Iemv9MPdMknz6yi+ZVo0CuodxAV7i1TGOwX
 VyjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByzLlFjkQssgzdkh9wicB2Sf0dF3H5Vc2hYSbPYC7D8AMkOHyxcwaPW+sbjweYIdTdlss8cd6lHE2M=@buildroot.org
X-Gm-Message-State: AFq9FYK6tpx2zGzi3vQJ4A+gEfWc9IvTrndEn749Rxk8kkDeilf4n6+7
 UPlyLakCU5P6NkKhteaBI9XSQmQdR3GQHuQ6NnZJVvbxFzDzZYdibvhNNNaQVeoWFIvnCLnvQA6
 MJwQX8IA=
X-Gm-Gg: AYBFou3QMtSTjHnX+PYWo5cN6zHDIm+FtW6z7bU7D53jURbAMwtkc74VBxf24vWQ1wK
 q6UuBMyEgCg4/nqoSPrRW06htUZyR5ZYwGvAKzR+fy+XpW4WRxOljsK4JfH6CKY7sYokqIvD1v2
 vlRuEa+8o4ILPq4U/jloBEBDHSoVlT9bfGl0bxxPJv/1WZdJHK9S+bUQt0dtundVrzBdzBacHqB
 S45zyRXheBBpiHeihavwDYvDQ110wkNXxJs3MvzIBFIXJuXfQcg8c3CWCd3v5Hk+rZ6cWpqbqIb
 Lvmz9KymalVBaPNPkXpLqPAjlhB8HRFzGgODfh/av5jWBcjIfsm2XkXEitOQ9q3rvbOk5LwlEog
 h9Ggb48z9UgYG7RdY/cfIPYC7iDt0aVcMAyYL5ZRJdQV1YF6f9xuP9clh4WTAqWxICrv3c0JltM
 GvodR1dAiGnd/8CqmpsuiU0/KWvfqU1Trt4jegLdUC7WjA5Z1vb189Rqhcv9LvxIqIck7A3CbiM
 /9qfZZ6UiW1xsfYk1xF7jTiHAHVz/2wGJ05fq9MCshwIjLPUFDd4uH2
X-Received: by 2002:a05:6000:178b:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-48dbaae6f24mr7619559f8f.24.1791624184954; 
 Sat, 10 Oct 2026 02:23:04 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9adeacdsm8092675f8f.55.2026.10.10.02.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:04 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:03 +0200
Message-ID: <20261010092303.138977-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904165427.1893579-1-fiona.klute@gmx.de>
References: <20260904165427.1893579-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/e2fsprogs: enable libarchive
 for host package
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
> mke2fs need libarchive to populate a newly created filesystem from a
> tarball with "-d tarball|-". Enable it in HOST_E2FSPROGS_CONF_OPTS,
> and add a dependency on host-libarchive.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> I need "mke2fs -d" in a post-image script. I could add a config option
> for host-libarchive, but it's not a heavy package, so simplicity is
> probably better. :-)
> 
>  package/e2fsprogs/e2fsprogs.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index d9ebf4c73d..e9dd367ce9 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -16,7 +16,7 @@ E2FSPROGS_INSTALL_STAGING = YES
>  # This prevents overriding them with e2fsprogs' ones, which may cause
>  # problems for other packages.
>  E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
> -HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
> +HOST_E2FSPROGS_DEPENDENCIES = host-libarchive host-pkgconf host-util-linux
>  
>  E2FSPROGS_SELINUX_MODULES = fstools
>  
> @@ -34,6 +34,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
>  	--enable-symlink-install \
>  	--enable-elf-shlibs \
>  	--with-crond-dir=no \
> +	--with-libarchive=yes \
>  	--with-udev-rules-dir=no \
>  	--with-systemd-unit-dir=no
>  
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
