Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2640EC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21DF181F9B;
	Sat, 25 Mar 2023 20:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21DF181F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGqDRS6lhg0q; Sat, 25 Mar 2023 20:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C2D81F40;
	Sat, 25 Mar 2023 20:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C2D81F40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 653DA1BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B46460AB1
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B46460AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ev4TeXLOnM8 for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:49:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E428360A7D
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E428360A7D
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:49:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eg48so20958999edb.13
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679777341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t4/dgiWLhYt7PlKBFJy/TuNiS15wZsW4lSHyCbo3TWE=;
 b=lJepQQbDu62r9LXGQWgiJdZ0+Q2YepgOTky2BmCWrNaHZiZxPTUEQxYVAURlujCm7t
 XEQ7mlLgYHu1yJ9sG6tRQwvyC/aph/7VEn9FPcebGyx8exYOCPXiO/XvwdyGKsejRVTM
 Z8JTFbj58E7ybzg61uVlJsm270DYxayzuvHXxSdS/wTW9u0mVELlesQl0wqMkkCXvEf4
 4VTFPlYb3O6zTbUhGtBgtDlCv9lXzdPKvo/mAzCcNA3XChxaefcCZHJmQO4uRl8DIQSM
 nX3HyZxd4HA0I1QrvyrOGV0pz0VcqtF8HA3hXXusgu7GxT+9CsLSrdPVE/meiD5uMwEq
 PSiA==
X-Gm-Message-State: AAQBX9efH0bsrleOrce54234tnJ2hr0E2OqB3PFIpvXGh22qNsTsMbeV
 73a06AhGO85x+/zs9pJIv+O23w==
X-Google-Smtp-Source: AKy350ZK2xv4236gHr9hhDzsXneUktFqFfw1/ygB4KYoC6b7f1Fu26y4qqb0MH9p52euRBbF3+lvkg==
X-Received: by 2002:a05:6402:1356:b0:4fb:1c02:8750 with SMTP id
 y22-20020a056402135600b004fb1c028750mr7552280edw.23.1679777341103; 
 Sat, 25 Mar 2023 13:49:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a50d505000000b004c09f0ba24dsm12706273edi.48.2023.03.25.13.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 13:49:00 -0700 (PDT)
Message-ID: <deb2f372-384f-dfdc-cc5a-febbc8905a46@mind.be>
Date: Sat, 25 Mar 2023 21:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-12-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-12-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679777341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t4/dgiWLhYt7PlKBFJy/TuNiS15wZsW4lSHyCbo3TWE=;
 b=LIqP3O8S3p4fPQW2icWH5rhW9/AO4UWShvEitc4A7PV7VjVvIx3QRmKFvcoHgfRUTV
 0c12AxchGDOcfN4rG3JS9RBkdq9QCODovFRYD+KSzV1kzYph4qal/2lYo/zDXiBQnvIa
 ZPhCbv5Y4bpbFpB7MxpghlyTXpwq3SXOruj4mO5rQDZE52pbAmLfqOsve6UJIlVyc27E
 UC3DqJL0/0NWjR8WkizgoqrVj1tSKZUEz5wmM7/BjExOh41HRTi8en3cBcnf8PC48VpW
 lQlc2az62SMvjpLgZqNLG0YTHvll/pOCWYN7rQqPdkx/mDO2EC1IEnZo5xQV5cEvziaD
 7DYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LIqP3O8S
Subject: Re: [Buildroot] [PATCH 12/15] package/popt: remove POPT_GETTEXTIZE
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 18:22, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Commit 895bfba dropped POPT_AUTORECONF but did not drop POPT_GETTEXTIZE,
> which requires POPT_AUTORECONF = YES.
> 
> Fixes: 895bfba ("package/popt: bump to version 1.19")
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

  In addition to all the previous ones, speechd has also gained _GETTEXTIZE 
since you sent your series, so I added a patch to replace it with autopoint 
there as well.

  Regards,
  Arnout

> ---
>   package/popt/popt.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/popt/popt.mk b/package/popt/popt.mk
> index 842cf0d035..5cee8e9673 100644
> --- a/package/popt/popt.mk
> +++ b/package/popt/popt.mk
> @@ -11,7 +11,6 @@ POPT_LICENSE = MIT
>   POPT_LICENSE_FILES = COPYING
>   POPT_CPE_ID_VENDOR = popt_project
>   
> -POPT_GETTEXTIZE = YES
>   POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   
>   POPT_CONF_ENV = ac_cv_va_copy=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
