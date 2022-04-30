Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B58FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11B5960B6A;
	Sat, 30 Apr 2022 18:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MWPqWtlKAZQ; Sat, 30 Apr 2022 18:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1175F60B5E;
	Sat, 30 Apr 2022 18:44:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3EAA1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91B8482C21
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSgVN9Rt6ZZJ for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:44:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94B9A82BA7
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:44:48 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y3so20989854ejo.12
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EptUZp88W9RTyL6jbyR2oTDBiBmDU3GW5KF0MWPKy34=;
 b=YXjkYYl74qUVKIR6oj+0gre5f4wHzPrrhJwm0AZLeptnUFsFPlHw69ngWOm70uJqpW
 RJM80ZzBn90KyRVdsmyHDUokUSLKDK0Imf0hc5DM44KpExlU/2yaBCz7dgWHJxDKgsvr
 fgCXAQqoXTcRvo9G/m84hc94zBZW5LEuWiM8i+aS5ZD7lHexEYzRdHWdqmkOxpDimmP3
 mT0tfWF/9a+lavJbe5ghJ5NSgiNL/Qiqw8dDs830TYSBPMClKrXdF1FplPsIusF+PH8E
 d2Ta2SnvyQtkEX1Pw+7FE873He0+Z/lBhoXheFpdOD6JDCFp9424M0Qd0PtUWZbB5xXr
 bsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EptUZp88W9RTyL6jbyR2oTDBiBmDU3GW5KF0MWPKy34=;
 b=zcysEYoOfcGcsmCG4rNOO0x2JUst6F9v093gNUer0IJzD6fMqntEkSgMxdvEPfgcQ0
 s44Zdmuk30bFHMmciP41hTe0Rx1uwP9GjaV4wbLTurD/rEyrCP3D10TTUWBLzlVv+SQa
 pc/kG8KeMaa/nS5jgJryyWnWT+M3iEGo2FJ8yoSDDcGYEjGCJyb6+cebFT4XSVxxnfOC
 f35K+V0bHAlxe/toFBIzFWmTSeOSgStif5roLoZpWHvOT6/QXfVfffn64SvfTQ0GrJcY
 5s0xgIdc84LxNZhsdpG/jZloi0f8btD/LcmlZxFQ9warcziO6l7/NWXuCX8GChndremU
 Eltg==
X-Gm-Message-State: AOAM533vpTHD/QBpDGrb6rI20Yboydixoq+way3w/hgjDIWnj3V2HmJv
 wGaU+mLe3QcdgAMKR/8djocDQcAL79kRfg==
X-Google-Smtp-Source: ABdhPJxfdbKdDo+ossD5izKgHNOT9LemnzL3DqysnId+UkTKeUvcY/lbsut3//MwFwvcWyF48zJZuQ==
X-Received: by 2002:a17:907:1c25:b0:6f4:342f:51e6 with SMTP id
 nc37-20020a1709071c2500b006f4342f51e6mr366164ejc.740.1651344286627; 
 Sat, 30 Apr 2022 11:44:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3ef214e60sm1852680ejc.198.2022.04.30.11.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:44:46 -0700 (PDT)
Message-ID: <6fe43d11-ade1-0d85-b5df-5070a9ca8e1f@mind.be>
Date: Sat, 30 Apr 2022 20:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220427201812.4037832-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427201812.4037832-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: fix build with
 argp-standalone and NLS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 22:18, Fabrice Fontaine wrote:
> Fix the following build failure with argp-standalone and NLS raised
> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
> 
> configure:14644: checking for argp_parse in -largp
> configure:14669: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -lm -lm -lm  >&5
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
> /home/giuliobenetti/autobuild/run/instance-1/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'
> 
> [...]
> 
> In file included from freeipmi-argp-fmtstream.c:35:
> freeipmi-argp-namefrob.h:62:32: error: redefinition of 'argp_fmtstream_write'
>     62 | #define __argp_fmtstream_write argp_fmtstream_write
>        |                                ^~~~~~~~~~~~~~~~~~~~
> freeipmi-argp-fmtstream.c:395:1: note: in expansion of macro '__argp_fmtstream_write'
>    395 | __argp_fmtstream_write (argp_fmtstream_t __fs,
>        | ^~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/26090162396b1b8cedfc58e1790ced528fcc35c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/freeipmi/freeipmi.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
> index 9fb59245b9..b26ed0c0bf 100644
> --- a/package/freeipmi/freeipmi.mk
> +++ b/package/freeipmi/freeipmi.mk
> @@ -20,7 +20,8 @@ FREEIPMI_CONF_OPTS = --without-random-device
>   # Work around for uClibc or musl toolchains which lack argp_*()
>   # functions.
>   ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> -FREEIPMI_DEPENDENCIES += argp-standalone
> +FREEIPMI_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)

  I've applied as is, however are these TARGET_NLS_DEPENDENCIES actually needed? 
argp-standalone itself will already pull them in, right?

  Regards,
  Arnout

> +FREEIPMI_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
