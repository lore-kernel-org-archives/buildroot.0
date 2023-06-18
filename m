Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D893EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4986A60F85;
	Sun, 18 Jun 2023 13:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4986A60F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ww9itU-ek5I; Sun, 18 Jun 2023 13:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A859261035;
	Sun, 18 Jun 2023 13:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A859261035
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D86581BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF74F81E34
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF74F81E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oasK2-EnDj18 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:09:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E04D81E27
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E04D81E27
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:09:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-985b04c47c3so351128466b.1
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093768; x=1689685768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLeJE4iltjdZPitVcZOK024nqOXbM8+VaDrC7yuc1aM=;
 b=YahxNSwQRdKHnxVLk/bOlckCQrVpK3pktSSAPJoat5EbYkAhHnjo4z12fvm7Aaj6KM
 JGP0+Y4YMvnEjOFcYylKRV5MGcfgQXDANOiQNNd7F3Ihl5Em+7+qI1SrrKnBjWa2tzhM
 27OGy3tgbmRPwYvDSBD+Zf9N5b2m8+3TiH7pjrgSLIkPzp8nlgwqi9Kk6ltkXZttr+CT
 YGXI76B4225s3PxLQDw3KTnyC+TwjKKO1SuTuhTlFE8auy2Djl7cUeyfb7hoCpyGGk8o
 EGgj7p6XP/KzAYMr/GGS+YBjKtyUM/Q+efpSRIe+F2fyNHAG7NCdA/59oH6lrq3IoqPS
 dESQ==
X-Gm-Message-State: AC+VfDytUs6R3HGSz6AzYAifaA7JB3iRUj++uEpudy1JhXg5sIx/uWAi
 5yUsm5Rb5KWy8dF8NGaHVfvV/A==
X-Google-Smtp-Source: ACHHUZ451aPaFgdkw1UUvX09zqLU6JvmtccbQYu8z68kVYyI/EcoNFw9IVG0mg8qFGA4hIve3PaWdw==
X-Received: by 2002:a17:906:4793:b0:96f:2315:29fe with SMTP id
 cw19-20020a170906479300b0096f231529femr6830216ejc.0.1687093768190; 
 Sun, 18 Jun 2023 06:09:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a17090671d800b00967004187b8sm13188120ejk.36.2023.06.18.06.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:09:27 -0700 (PDT)
Message-ID: <14175f83-01b1-52c3-31d8-81b8b341e188@mind.be>
Date: Sun, 18 Jun 2023 15:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605072937.1885915-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605072937.1885915-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093768; x=1689685768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLeJE4iltjdZPitVcZOK024nqOXbM8+VaDrC7yuc1aM=;
 b=geHh1Z8abqAX1rZS7xltV6O947Qc+o3ipBabGf4VgErIMEQ0UQDVs/OtF6qGfewsAk
 pu/oJRwQf7WcANO3ubPkrY5iEgt4GIj5hkPt/oU+cjC60DIDrPoDlsqWlHf0/3ucMaVI
 H2KR5TP/lvBGAbKq9cvoATDFXF7lx1oWacEy38atw67xolNgjaMBvquCAzpyTfjVrb6S
 iXgGF3v3rCRk/x5Ve7W34nIHSnVbwF4qSuF9ZH0BTcCm7dIvIs3rW850v8XqrteUOc8r
 Jt5+n+9vVPzGogjC27j45L71kRdc2MBTHzbsdY/WsIYPD89dDP1pRCSR27xFeLV1lJuT
 igcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=geHh1Z8a
Subject: Re: [Buildroot] [PATCH 1/1] package/python-selenium: bump to
 version 4.9.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 09:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-selenium/python-selenium.hash | 4 ++--
>   package/python-selenium/python-selenium.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
> index d462abc62b..03a9683a21 100644
> --- a/package/python-selenium/python-selenium.hash
> +++ b/package/python-selenium/python-selenium.hash
> @@ -1,3 +1,3 @@
>   # md5, sha256 from https://pypi.org/pypi/selenium/json
> -md5  e9054eb95920bb2a1d594090f0773f61  selenium-4.8.0.tar.gz
> -sha256  fee36724d6cf0b18c73781bb8ec7be4a35ab1e2564e64e64e64da75e50e052af  selenium-4.8.0.tar.gz
> +md5  02404033a10b2b29aa098f50503c0a1a  selenium-4.9.1.tar.gz
> +sha256  3444f4376321530c36ce8355b6b357d8cf4a7d588ce5cf772183465930bbed0e  selenium-4.9.1.tar.gz
> diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
> index 6dbea6fb7e..d59a16a57d 100644
> --- a/package/python-selenium/python-selenium.mk
> +++ b/package/python-selenium/python-selenium.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SELENIUM_VERSION = 4.8.0
> +PYTHON_SELENIUM_VERSION = 4.9.1
>   PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
> -PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/2e/3d/492cf1a6823c48369328572c6bc63b7a957ba25c0009ee6bdb507cd9a6a4
> +PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/fd/e2/0e5bee6762a7bf7852b47a79c5b12f9e526e6962958dbb9719fa490ba24c
>   PYTHON_SELENIUM_SETUP_TYPE = setuptools
>   PYTHON_SELENIUM_LICENSE = Apache-2.0
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
