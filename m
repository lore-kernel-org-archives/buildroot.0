Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B92C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 13:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029E0416F2;
	Sat, 25 Mar 2023 13:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029E0416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3pmIXgbTfeH; Sat, 25 Mar 2023 13:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2256C416FA;
	Sat, 25 Mar 2023 13:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2256C416FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5C01BF3D0
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 13:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F145416F2
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 13:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F145416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiWFQT0P1b40 for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 13:39:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E04B416FA
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E04B416FA
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:39:06 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id j13so3769308pjd.1
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 06:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679751546;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZeICy5Sv7ZtkqGteCqYMHjIhJvocMynRLjWNRWpW/M=;
 b=1RnPJZRQ+zdu1+vEt4w4WiScKfefrst2bUcsiKaSVEYvJWrizN8lQTQZGa5pQjitYS
 u2U5rGgrhlGjuKu5Wq93WS5hW9bNZi2WeQ0V8wvqizUPl0LDF0G+NS2A93HQYsA1N6pX
 pdd7eekyYVm7lcNGG9Mx6p7sYrYvESWyTWqGTZRCLd6K/D/aUqIZQ6F/Fxih+929cyRb
 9Hf63+IRUnuyjuAUA54UxnEwOGXBs1kYwJYx17qSn/79hWxIzqnQQD3fLyAMdGx91zVr
 aqWolUbcHtkhIvoUE7inwfedjKJk0/IwjknOx4DsO7DiJlvqaGwQG0WVcX6/yYdHX8Xe
 Mq5w==
X-Gm-Message-State: AAQBX9fFOL3rBf0hpYajemIDAhnga0f03/vK3xbyAebCFfXjxoEizw5b
 2ePqLUSsvENlBMPRA6JPtf/UQ1xYnWwrhA==
X-Google-Smtp-Source: AKy350aiyavUt0Cd4uFsj6zzzclxYBOFh6x72r3ynSfp6SQNAunPYqvZ9GpPuaQR3e+aGpB5OALE4A==
X-Received: by 2002:a17:90b:3ec4:b0:233:fdfd:7122 with SMTP id
 rm4-20020a17090b3ec400b00233fdfd7122mr7152754pjb.37.1679751545978; 
 Sat, 25 Mar 2023 06:39:05 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-4.three.co.id.
 [180.214.232.4]) by smtp.gmail.com with ESMTPSA id
 z4-20020a17090a398400b002405d3bbe42sm1419925pjb.0.2023.03.25.06.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 06:39:05 -0700 (PDT)
Message-ID: <afb7d5f2-ba49-c6e9-3f69-2944786cc878@gmail.com>
Date: Sat, 25 Mar 2023 20:39:02 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20230215073256.186476-1-christian@paral.in>
 <275f7c96-36c9-e6be-f15b-ff164d8445c5@gmail.com>
In-Reply-To: <275f7c96-36c9-e6be-f15b-ff164d8445c5@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679751546;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yZeICy5Sv7ZtkqGteCqYMHjIhJvocMynRLjWNRWpW/M=;
 b=KTBRjuhNWHNBnZoXz1Hu2xDmfhK9ZHzSlmxfVVPqo+3p5jHVLIaw6DVPmwg8F/YBIh
 6nEg44d+xMWr4cxggO01oN5+i+p9d2YH51kFxPicZ9nZVeJHsuIiJJlcIQZxfDMFBpBz
 nVgnLOay3RlDBlhfCmwu6OPRbCucjIEv6JF3w2nTNNdG/tPZkn7i5RfQrIFPvqtvU+oq
 hLM3P7PVIEUvz7xzVv+mIs9Ms1p+7fbr2f9wp7c9KRh0gh2negYFl2V9zxnWNAbXlNah
 h0G+y7NypNHsnWwoH4g/soLHyOzXXbx1fxH03ft0i90xUSKofiktfNtlpA1oBX5KFwY7
 qnAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KTBRjuhN
Subject: Re: [Buildroot] [PATCH v3 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 3/25/23 20:34, Bagas Sanjaya wrote:
> 1. Check if Go version (either from Go distribution or from gccgo) is at least
>    minimum required version (for now 1.17.13). If it is lower, bootstrap
>    Go 1.17.3 (I call it bootstrap Go). Otherwise, go to 2.

Oops, I mean bootstrap Go 1.17.3 first then use it to go to 2. Otherwise, skip
this step.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
