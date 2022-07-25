Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD56FC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F094067B;
	Mon, 25 Jul 2022 22:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74F094067B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KShOZTdo-FpJ; Mon, 25 Jul 2022 22:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FDC640545;
	Mon, 25 Jul 2022 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDC640545
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1F171BF9AC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB2640545
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB2640545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LykXaQ0P7Tyh for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:22:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C62A4017A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C62A4017A
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:22:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m17so17556719wrw.7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SWrE89XDGnbeA7H8MYsInyD8RAChiFrlXKuQ1gYZLTU=;
 b=1Ywu6HeboKFBNKGmZWOpeGoupqzaEzUsst2z8jAQFwuY53dNVxh06pcm22oI1dxbTg
 hAJ8Q41EHfuRmk4kJL+L12e+ynYqzq0TtSxCfP5Kf1OdZGLy/wA3QtYpukhIV1vd0bll
 DlOffQ7rzYYR3eU9ULOjcD4/XcngvB0HnOmkvS8p1g8u4jRsB4MECHAVhYdP1ckHgCoy
 vmXslDl8HzWZ3EtY8rA6j3qups4t3GE4ek9rcTpcQdQGIL5iGub9YX+tisbxFjaua84A
 Mb3qHjZbv1VgOdI6+2CCDqJiEhn2yaJFWR8gIb7VXGqQVr11zbsHTGos/PhX75VzpuqI
 shtA==
X-Gm-Message-State: AJIora9VrsljyHYRMLZRREm+sXJVJ9BT5vk5/3Olgi33ly7JR+aXwXoe
 K9KPsv0lB9ZZ4smDLa4b2imLGDAidPBA0g==
X-Google-Smtp-Source: AGRyM1vya7cW9ejF/PcK1up0Wihyyd47GCBBnLyMPDVc/FJSPT4fyjsa9n7+W0+gKcx3RilUUF3smA==
X-Received: by 2002:a05:6000:224:b0:21e:7efc:c506 with SMTP id
 l4-20020a056000022400b0021e7efcc506mr6706768wrz.313.1658787773666; 
 Mon, 25 Jul 2022 15:22:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 b18-20020adff912000000b0021d65675583sm12704879wrr.52.2022.07.25.15.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:22:53 -0700 (PDT)
Message-ID: <7f39a4ca-a32a-fe24-95bd-91bc04e37e77@mind.be>
Date: Tue, 26 Jul 2022 00:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220725124303.3986-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725124303.3986-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SWrE89XDGnbeA7H8MYsInyD8RAChiFrlXKuQ1gYZLTU=;
 b=cIhF8zM6lD31yS+kX4V+Wj2l7pJO8FbADfRQ9/pklmsTngt4OznvkCS4ZXR1dAZuQG
 CGWNW6lw8IL4JPwDzs4Jerp22RsiiftCGgfKMboCrWLa7m4wUfv2i9b1v5DNb7gI0xJZ
 ZRSc+Xbq2QqBVv5wFAM7BMD35Rznyke5EkhDD7b9UGfrTz3Vz8l7zcNHQUwDd3uW/p0c
 y/4RWan6yPtPwv1G2yXmFufYx6ekcIAFpC9l5rJ2G/RMifPMu6IIaWdW9Ni5Ubhe4kwE
 t/xL35YyJMDQxybhnKnBo+I/1WQhS2Uwe7xhM02Pb86QXLNUtDV7UCjINfoC4YIJjWkG
 6/uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cIhF8zM6
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: add OPENSC_CPE_ID_VENDOR
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
Cc: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 14:43, Fabrice Fontaine wrote:
> cpe:2.3:a:opensc_project:opensc is a valid CPE identifier for this
> package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopensc_project%3Aopensc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opensc/opensc.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index 538151c12a..e1ad5d61b0 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -8,6 +8,7 @@ OPENSC_VERSION = 0.22.0
>   OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
>   OPENSC_LICENSE = LGPL-2.1+
>   OPENSC_LICENSE_FILES = COPYING
> +OPENSC_CPE_ID_VENDOR = opensc_project
>   OPENSC_DEPENDENCIES = openssl pcsc-lite
>   OPENSC_INSTALL_STAGING = YES
>   OPENSC_CONF_OPTS = --disable-strict
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
