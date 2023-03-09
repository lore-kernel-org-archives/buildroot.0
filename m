Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F830C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC0E260BB1;
	Thu,  9 Mar 2023 20:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC0E260BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWFQVSAnooMt; Thu,  9 Mar 2023 20:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAB1607B5;
	Thu,  9 Mar 2023 20:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAB1607B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 918D71BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79465403D6
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79465403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nmBwnuFarh-7 for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:28:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B52240386
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B52240386
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:28:41 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s11so11960185edy.8
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678393719;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWtYDHg2Ebv7zFQ7y/UPPDFKN/EXtYOpwZg5hi+AWUQ=;
 b=DDu8RRppAaH0J7dJq3THwqdSokn4tlq5rBuNNDrajZ85JtMeo47K+hXUoeHKCHO+/v
 oNTWkBtokEBEJ0ZIQwJF0cgPUWRpdytqlHDTPXUX2yix/h79htnoYlI+alsMt1U6h5C8
 6Hh9DSZ81eKVOjYq9FudTvs1aw4vSIh3eJdZ/eG+ekHLCyFJrkAVVUXXcdKSFVDzZeRq
 4Nnd/mtMWeVaaeTp1VzsLV7d6jDXLGcPsnHnfaVPu5kPcyP60OTIGd3Vg7SxWEMD0LKN
 N+KDO3xzMbVgxRdTjsO/b0NwUOZ/n/4uRnMaHXd2YzAX9mvydKKEsKIgW9WL2aplrvYz
 I0JA==
X-Gm-Message-State: AO0yUKVAkoskh+tsZQSBryZmNXFrxd0BwjyGRnjoWGB9drgdVMcWz9AE
 vRVGyV3lm2dvlh/sKXJ5a5nGUz0fLD66WorfVR0=
X-Google-Smtp-Source: AK7set8m70w+YagOLVVg5QlgCN0YWrZ11M1vBZyQkN+gePWncCVmm498Jt8xWPt2Xwzi22nYDZ+g8w==
X-Received: by 2002:a17:906:db05:b0:882:cdd4:14d9 with SMTP id
 xj5-20020a170906db0500b00882cdd414d9mr28327344ejb.46.1678393719555; 
 Thu, 09 Mar 2023 12:28:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a509b44000000b004be774e4587sm151919edj.80.2023.03.09.12.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:28:39 -0800 (PST)
Message-ID: <7a567a09-486c-e974-a271-95b3bbf2c3c9@mind.be>
Date: Thu, 9 Mar 2023 21:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230227214220.12101-1-ps.report@gmx.net>
 <20230227214220.12101-2-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230227214220.12101-2-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678393719;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VWtYDHg2Ebv7zFQ7y/UPPDFKN/EXtYOpwZg5hi+AWUQ=;
 b=JEF2mRQdwdQ6+oDRJKqiRQPtg/a58QyFi1CGIZemanYisn5p/43GSZrW3mUXmnugjm
 M3nYCZLlECOK6icqeUyCLAoONMF06CFduAJkpvrIzKhyMm3WFvNy+lGrnoh8KfzK04uW
 /7F+IJdxE54nMdMQQx276I80SIzH8lskJ5ZMN8zaGrB9BZXVc4mHLQh9l3HkjNRuADMC
 7ec8Pw4CA0KSKefHfaGBNjNl2hiJI56oTnaiz63AVaChNXcwnth3td5IymPWV+FCM+33
 Q3iBBDNAnd6QXtz8eO4gv/PDPy3ttzdzSNH2ebcoTZbOXAS+hKqdxXX6+Jeljew3PENY
 lmNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JEF2mRQd
Subject: Re: [Buildroot] [PATCH v1 2/2] package/speechd: add default
 configure options
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



On 27/02/2023 22:42, Peter Seiderer wrote:
> - add default configure options for all optional speechd features/
>    output modules (disable all with additional library dependencies, enable
>    oss)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Why not next, you will ask? Well, this is in fact a fix; otherwise, what gets 
built will depend on the build order (if alsa or pulse or ... is built as well).

> ---
>   package/speechd/speechd.mk | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> index b545863035..5944ea3a28 100644
> --- a/package/speechd/speechd.mk
> +++ b/package/speechd/speechd.mk
> @@ -14,7 +14,22 @@ SPEECHD_AUTORECONF = YES
>   SPEECHD_GETTEXTIZE = YES
>   SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
>   SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
> -SPEECHD_CONF_OPTS = --without-kali
> +SPEECHD_CONF_OPTS = \
> +	--disable-python \
> +	--without-espeak \
> +	--without-espeak-ng \
> +	--without-flite \
> +	--without-ibmtts \
> +	--without-voxin \
> +	--without-ivona \
> +	--without-pico \
> +	--without-baratinoo \
> +	--without-kali \
> +	--without-pulse \
> +	--without-libao \
> +	--without-alsa \
> +	--with-oss \
> +	--without-nas

  Since OSS is pretty solidly deprecated, this essentially makes the package 
useless for producing actual audio output... How is it supposed to be used then? 
Peter, you introduced it, I assume you use it for something? Or was it just for 
qt5speech and you don't actually use it?

  It would obviously be best to add either automatic or user-selectable 
dependencies for at least pulse and alsa. And obviously, we have flite and 
espeak packages so those are relevant as well. Not to mention python.

  Regards,
  Arnout

>   
>   # fix missing config.rpath (needed for autoreconf) in the codebase
>   define SPEECHD_TOUCH_CONFIG_RPATH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
