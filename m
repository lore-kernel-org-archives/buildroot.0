Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E2DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 21:15:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D96617E5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 21:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30D96617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053E360850;
	Mon,  8 Nov 2021 21:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tP7YR818Gdac; Mon,  8 Nov 2021 21:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FAF6085C;
	Mon,  8 Nov 2021 21:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 271F21BF2FC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 21:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22FDA80E04
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 21:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRqprT9Wrrvj for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 21:15:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B50F480E09
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 21:15:48 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w1so68411652edd.10
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 13:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4alZXOrwjPBOZVxUWCjKuJiQUjzvV+QQGFgci7Ao4a8=;
 b=LElLVyUgxoiMmXirPI+bON0BXvrXdjij9bKGUi8ImuieRQ8yO2UawSz3bxVSdzU6tE
 X7B7eIVvJo5fsjesCuai7x5skDmUNXJ735Levjs3tjjKeSUC/Vyqs1yJnuwTyVau6GSk
 MB1p4qhkdcNMlIC/JpQXmdukSSaMvzMOaMxX1iJc8XRlm3lQGy7Jc2naiwl6vqH9BVKf
 NgYYGCDnR9hcfX30j0/b05riSYNAqZ17SGBdi0hlcQaBQljG0N3FuoCaxYLLfjZ5orzw
 zX7TI4YDeyzhwxMKGwNZ/fft+/aA4u2EN5Xob4wubs5GL1BWhk0OtnO5bmWgUTB2FAjq
 7+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4alZXOrwjPBOZVxUWCjKuJiQUjzvV+QQGFgci7Ao4a8=;
 b=AkpvDus4rpG9W7WOtkF7fXk708bm0hnXXewViB6xRjEQ7tZhB3iba5p8b38+eqefWD
 v4gJftTlFDQ0vtXQjdBP4zAWhFrnF0fCVmEnZHE/azVDPnBj1VjJORNlUn0rkLCoZTdV
 CgEfzyzg/2h+blpo4My9hu6X2U9P/zuLpsG6AJhYhdKDWZdCQ5TybuEV4Ws4gqCiTSWU
 xdBYI/IDt8zPBeTXQSOjimM5LIr0fclA20tEkhYe3iaI91GMZJVInl11fmZ1LwE9E/cB
 qOwaQZAe0iIiFhpDl0OgXJ6g0Qssijx+SWs5zbdIfk1rXUc86yFKKwwvhGdat+K5nMG9
 G1Hw==
X-Gm-Message-State: AOAM533aCIWDuuBM2vuTbxS7As5kOSoDtHW168i2A82UDd9eBcYHwDpw
 3kypnwv0/5BWNzk5wbO7zPCShw==
X-Google-Smtp-Source: ABdhPJw9uZKm8+FWztqojA/LmusJ7Juu1pVByoM12Vu2ybISwWJJxt1Fpug27K8s4/bw7RKFXtSWTg==
X-Received: by 2002:a17:906:3385:: with SMTP id
 v5mr2864256eja.45.1636406146961; 
 Mon, 08 Nov 2021 13:15:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id jg32sm3984230ejc.43.2021.11.08.13.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:15:46 -0800 (PST)
Message-ID: <9ac8ad98-177f-6cdf-76c4-b31f6617ba48@mind.be>
Date: Mon, 8 Nov 2021 22:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
References: <20211108192706.456116-1-texier.pj2@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211108192706.456116-1-texier.pj2@gmail.com>
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_python_unittest_xml_reporting.py: fix
 flake8 warnings
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/11/2021 20:27, Pierre-Jean Texier wrote:
> Fixes:
> 
> support/testing/tests/package/test_python_unittest_xml_reporting.py:3:1: F401 'time' imported but unused
> 1     F401 'time' imported but unused
> make: *** [Makefile:1220: check-flake8] Error 123
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

  Both applied to master (and next), thanks.

  Regards,
  Arnout

> ---
>   .../testing/tests/package/test_python_unittest_xml_reporting.py  | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_python_unittest_xml_reporting.py b/support/testing/tests/package/test_python_unittest_xml_reporting.py
> index f08c88e3da..446c231a00 100644
> --- a/support/testing/tests/package/test_python_unittest_xml_reporting.py
> +++ b/support/testing/tests/package/test_python_unittest_xml_reporting.py
> @@ -1,6 +1,5 @@
>   from tests.package.test_python import TestPythonPackageBase
>   import os
> -import time
>   
>   
>   class TestPythonPy3UnitTestXmlReporting(TestPythonPackageBase):
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
