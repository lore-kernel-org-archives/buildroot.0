Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E780EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A0361241
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59A0361241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001B54158F;
	Thu, 23 Sep 2021 20:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5pa3EBgj6sk; Thu, 23 Sep 2021 20:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59DE7407DF;
	Thu, 23 Sep 2021 20:08:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBFC41BF3EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7580841E3
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGePV8-44cZp for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:08:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA848841D7
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:08:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dj4so27374351edb.5
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=szb7v9gkY+xkP78cvFh2utH06x5d9dR+S7Zf3lXX6wY=;
 b=IIS87AZyj22jkxMtjx3W+sR18gu9FidNUFzoOV5ws6bzeU3ZzELlIL7vC+lJYVjZZV
 mZbiS+Fn7VZoeB3bZKnd1ZlIDHNlPUaC5L3OSEaiMgCT4fcB5Y64N9u0DU+6VXAqhiH3
 2FT8oXjjfgB1fd6uBYPaH3slyJ4mUIO1uWalkk18xadBb88Vk5LWIvNgbx3TOjjFzN36
 d/3J/n04RVFSfebdxVWaIaK1Sm3pkj08mk9X8i0QkSUdWOErc0/uW76B9N0fV79iKOz+
 5gCiANFkEf1Rm9sgiPbFsd1gkvDAxq6iHoOxNzEzX3Rh5xeVcYBkk+QxVqQkzsUEHoM3
 +RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=szb7v9gkY+xkP78cvFh2utH06x5d9dR+S7Zf3lXX6wY=;
 b=REB8+Mu7qkHWEPjGJ/Stvtv73SMJiykC/ws8cmfXYXA4L6g2LaF6Nwqwi0N6wNjTxQ
 ozKNfeFNII96nuyxILmT+HgEXKhXPbTElPRCOvIs/hCd7BxaamEK2BCrHEW6dnY8Ls+j
 dLMQDtUi7DpcNA9wM1Gv6H2eNBZJ05rFwqteZ7ZpJvuuFX/QmOndTlm0iZz+C+gpOj6D
 JQTXUq7Mrx9x4L45Yi0dgUr8BRyWhCaBc/AhtdNO+9J5sCgjU0ASoRkmRwz5tDkxP50L
 suEj2URLN+J2kTNfKdRu3WVLjeyPrfU3p6o0b0gwltdhUVU61rPijA196X4pIUCtqkED
 C3/A==
X-Gm-Message-State: AOAM531V6v6zLCaUTUV3FdtFs6BRhiZHkV3z79ZofF43wgapKgTuHkWg
 ivqI9bdN9Keazj3s9qIFzFbfjA==
X-Google-Smtp-Source: ABdhPJy51vzICyPniYffVSJZ/LjeSTBMlZFlOXm7Ny11zViFMBTYHF+ALul5RWtEwlt+I4NTUvWOtw==
X-Received: by 2002:a17:906:cc57:: with SMTP id
 mm23mr7282526ejb.540.1632427687955; 
 Thu, 23 Sep 2021 13:08:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t14sm3674130ejf.24.2021.09.23.13.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 13:08:07 -0700 (PDT)
Message-ID: <e67b89b2-ce8a-4809-2622-2fb808cd7280@mind.be>
Date: Thu, 23 Sep 2021 22:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 0/4] Misc Python package updates/additions
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Jeremy Connat <Jeremy.Connat@orolia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 14:45, Thomas Petazzoni wrote:
> Hello,
> 
> A small patch series that:
> 
>   - Updates python-smmap2 and python-gitdb2 to newer versions (must be
>     done in lockstep)
> 
>   - Adds a python-flask test
> 
>   - Adds a python-flask-expects-json package, and its associated test.
> 
>   - Adds a python-git package, and its associated test
> 
> Best regards,
> 
> Thomas Petazzoni
> 
> Thomas Petazzoni (4):
>    package/python-{smmap2,gitdb2}: bump versions to 4.0.0 and 4.0.7
>    support/testing/tests/package/test_python_flask: new test
>    package/python-flask-expects-json: new package
>    package/python-git: new package
> 
>   DEVELOPERS                                    | 16 ++++++++

  Since you added stuff to Nicolas' DEVELOPERS entry, it would have been nice to 
put him in Cc...

  Series applied to master, thanks. One changes in patches 3 and 4 which I'll 
comment on there.

  Regards,
  Arnout

>   package/Config.in                             |  2 +
>   package/python-flask-expects-json/Config.in   |  9 +++++
>   .../python-flask-expects-json.hash            |  5 +++
>   .../python-flask-expects-json.mk              | 14 +++++++
>   package/python-git/Config.in                  | 13 +++++++
>   package/python-git/python-git.hash            |  3 ++
>   package/python-git/python-git.mk              | 13 +++++++
>   package/python-gitdb2/Config.in               |  4 +-
>   package/python-gitdb2/python-gitdb2.hash      |  6 +--
>   package/python-gitdb2/python-gitdb2.mk        |  6 +--
>   package/python-smmap2/Config.in               |  1 +
>   package/python-smmap2/python-smmap2.hash      |  6 +--
>   package/python-smmap2/python-smmap2.mk        |  6 +--
>   .../tests/package/sample_python_flask.py      |  7 ++++
>   .../sample_python_flask_expects_json.py       | 18 +++++++++
>   .../tests/package/sample_python_git.py        |  1 +
>   .../tests/package/test_python_flask.py        | 29 ++++++++++++++
>   .../package/test_python_flask_expects_json.py | 38 +++++++++++++++++++
>   .../testing/tests/package/test_python_git.py  | 11 ++++++
>   .../tests/package/test_python_gitdb2.py       | 10 -----
>   .../tests/package/test_python_smmap2.py       | 10 -----
>   22 files changed, 194 insertions(+), 34 deletions(-)
>   create mode 100644 package/python-flask-expects-json/Config.in
>   create mode 100644 package/python-flask-expects-json/python-flask-expects-json.hash
>   create mode 100644 package/python-flask-expects-json/python-flask-expects-json.mk
>   create mode 100644 package/python-git/Config.in
>   create mode 100644 package/python-git/python-git.hash
>   create mode 100644 package/python-git/python-git.mk
>   create mode 100644 support/testing/tests/package/sample_python_flask.py
>   create mode 100644 support/testing/tests/package/sample_python_flask_expects_json.py
>   create mode 100644 support/testing/tests/package/sample_python_git.py
>   create mode 100644 support/testing/tests/package/test_python_flask.py
>   create mode 100644 support/testing/tests/package/test_python_flask_expects_json.py
>   create mode 100644 support/testing/tests/package/test_python_git.py
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
