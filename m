Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8D7C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7587341583;
	Tue, 16 Aug 2022 20:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7587341583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJI1WkztAc-d; Tue, 16 Aug 2022 20:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570F441570;
	Tue, 16 Aug 2022 20:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570F441570
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 888791BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6379081413
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6379081413
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkXJZgQ46YDU for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:54:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD308140F
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CD308140F
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 20:54:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id c39so154024edf.0
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 13:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=elxtHH4W94T5AP5xe/BpsOHJj1GlzJ0OE4jcsEGTvmQ=;
 b=gztkq+K/0QDOZgZWpsX0mighTIa50yXImtLp3zQ2TrImAg6dqHQ+QmSwHC1Qow4cl1
 iCpHdvCPXU5qvmnCkKQpHqshWC9MwyHz86fucI3tRZo8CS8dbzERlIFDqU4FfxKCa93y
 ZzBCMa37TV0+yopk04Z3prgy+BCxcPVMRZb2SzrnT1Pz47r8pu2ea5sisiARHngOVk0b
 OTAqd7clR1ZyfuQF1H1pO9EREQGBWTVzm88hSA1/4WKs7azCbzRyKH4sBN9q8u0sZfOA
 yuwVeWazYBt+BC9WIJ/D2zYpVYbydnrF4JehdMN0zw4MCKpodmOZpDJtsT7y5h6edNLR
 i2fw==
X-Gm-Message-State: ACgBeo2d+8gHDq8+MBdipZFkC77hURTn3sN6HNkZ05IHdLAlKE9DUucc
 0TY9+5mOOncq7otwfgY4R3nNoJ++61qmlQ==
X-Google-Smtp-Source: AA6agR5KAtlkCS6iDiyT4roRiYAxtBOy6cw12fs9D4mdloqPQ+YEInOA+8LITb7BkVoLrAeFE0VOVQ==
X-Received: by 2002:a05:6402:3697:b0:443:1c6:acc3 with SMTP id
 ej23-20020a056402369700b0044301c6acc3mr20709333edb.421.1660683246509; 
 Tue, 16 Aug 2022 13:54:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a1709060a4500b0070efa110afcsm5822788ejf.83.2022.08.16.13.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 13:54:06 -0700 (PDT)
Message-ID: <5bf3b48f-bfae-444c-3c2e-73235a0d523c@mind.be>
Date: Tue, 16 Aug 2022 22:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=elxtHH4W94T5AP5xe/BpsOHJj1GlzJ0OE4jcsEGTvmQ=;
 b=bZM2nTE41gnl1WZSSk6BH+Xvr9PGiT56w/zi4z1yWHaY8rmazXzWNpkhY1OTGjeM/c
 DxsoDaLKTWi9WX+DS+3PLA4wq3dqluJgTxBdklwNBwwVyhv8NIPbwvUBLB1dMBw/icjY
 BXxKzLqj6Oe13//rKb+7RQ9Uewb1i4AXtfCXS4Qk4BmDXzXS1Vghw/6jYCyzgf1diZrd
 T4zdCYUmVqjIg1P0patfD8LpkX46O2iMyxlhY8Szw1q8hLL253Umbj+JgeFDtyBBXOJP
 1VEPDSDBI9GZtJzsKDW851X7TonK3IED/VksXwB4qWhvaG1Vlw/vOinAHum3xViZxkrz
 5nbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bZM2nTE4
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-meson.mk: handle
 possibly non existing compilers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/08/2022 12:37, Guillaume W. Bres wrote:
> To avoid populating the cross-file with non existing compilers,
> we tie them to /bin/false
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>   package/pkg-meson.mk | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 0632ab21cf..d675f7f733 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -68,15 +68,29 @@ else
>   PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
>   endif
>   
> +# To avoid populating the cross-file with non existing compilers,
> +# we tie them to /bin/false
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +PKG_MESON_TARGET_CXX = $(TARGET_CXX)
> +else
> +PKG_MESON_TARGET_CXX = /bin/false
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> +PKG_MESON_TARGET_FC = $(TARGET_FC)
> +else
> +PKG_MESON_TARGET_FC = /bin/false
> +endif

  Perhaps we should do this in package/Makefile.in instead? I.e. define 
TARGET_CXX itself as false.

  This does have rather heavy implications, but I *think* it should be fine... 
And anyway, the autobuilders will tell us :-)

  Regards,
  Arnout

> +
>   # Generates sed patterns for patching the cross-compilation.conf template,
>   # since Flags might contain commas the arguments are passed indirectly by
>   # variable name (stripped to deal with whitespaces).
>   # Arguments are variable containing cflags, cxxflags, ldflags, fcflags
>   define PKG_MESON_CROSSCONFIG_SED
>           -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
> -        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
> +        -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
>           -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> -        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
> +        -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
>           -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
>           -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
>           -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
