Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7F6EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12721817FD;
	Sun, 25 Jun 2023 13:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12721817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWwml80-W-pu; Sun, 25 Jun 2023 13:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E18081A9C;
	Sun, 25 Jun 2023 13:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E18081A9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8641BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05926606EB
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05926606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spg4V92gaqut for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:44:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F010E607E3
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F010E607E3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:44:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51d9865b848so203475a12.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687700646; x=1690292646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35375S8CQY75j3ykE9eO8+Uzu3sX+Zkj19NyZWZGCmM=;
 b=dXcd9xS7ayvrmdgTOIzyRmjuN0w8x5p0VBPRsTq7HHzzMcI4CYS79iSMRSbFisPxqj
 z9itBIVk7zsIrSkJXgg1OtSNNE+KlOwsnAyYHniDNVnDcER+KrNrmIIy9vc9QHeKmudJ
 8GxB/x9UAQNf1iY5zQcvfo7Db4rutAYwU9r9lMcq1TGkuP57d6+dKv9mlMeQEGxF4DdM
 Ti/GL6jPUeCDg+Sq5dk0kW/i2kIb/N7lCz5dxB4W7R1udY9qnngi+/3CHXtKLzqwr8p0
 faaFujG7nBD+WfpFWDYumTZj71xkfJkdNaRPOdagJCtR5ZP1o5IzcyMZsGxMKC7dsFEU
 nlUA==
X-Gm-Message-State: AC+VfDzkx3Y5yumLCxeV6Mrf/UCoBzOfIOLu/P2YhGdmh21fdnML9Xl1
 QgzRgyPBNcTjW3UtRujH8FHAIA==
X-Google-Smtp-Source: ACHHUZ7MtMA8d11E/YwgJYj8CaL8FE1ragDwD1j4DPddxA4laP2vaalf/SHgaZelR/ame7jkcyDfsw==
X-Received: by 2002:a17:907:d0f:b0:94e:e30e:7245 with SMTP id
 gn15-20020a1709070d0f00b0094ee30e7245mr25724648ejc.8.1687700646163; 
 Sun, 25 Jun 2023 06:44:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 br7-20020a170906d14700b009893b06e9e3sm2100345ejb.225.2023.06.25.06.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:44:05 -0700 (PDT)
Message-ID: <4b9e8301-d817-8878-c70e-f0eb91c47126@mind.be>
Date: Sun, 25 Jun 2023 15:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622061441.3801984-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622061441.3801984-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687700646; x=1690292646;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35375S8CQY75j3ykE9eO8+Uzu3sX+Zkj19NyZWZGCmM=;
 b=BdodQ8LxftSEFFivZSAYjVNMDU+5kuij3xPtOcmXBEJNkyLnoqYoyxECCWSOAbkeni
 /AQpQr+RmOV+I844ly01tJX3DqC3jc1Qe0Lp984ihaM8u/xPcltmMqXCVLGusXmderSq
 EqGo0hI8vRil4LmBtBNTDNWw/zlCTTM6f5k7QG5bTEFqeC4QBKfeyovHTsg9KlOlEPOk
 RlJPDx7H5NzOnibej3lNSXKLIywo1BS1e9Mbh1rkFAKOo2HTmywibdPBiJhz9UhC7Bw0
 WlW+hTz0vHfL8ImZJKvNLS64o8tpxoC8adCFjB0Fvh5BnYQfqSxCdEyJq4BCPf00oANP
 Fgxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BdodQ8Lx
Subject: Re: [Buildroot] [PATCH] package/python-pytest: bump to version 7.3.2
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



On 22/06/2023 08:14, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pytest/python-pytest.hash | 4 ++--
>   package/python-pytest/python-pytest.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
> index 2ae1e61ed4..c648a85c04 100644
> --- a/package/python-pytest/python-pytest.hash
> +++ b/package/python-pytest/python-pytest.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pytest/json
> -md5  49decbade40109f9c6970df60c22a230  pytest-7.2.0.tar.gz
> -sha256  c4014eb40e10f11f355ad4e3c2fb2c6c6d1919c73f3b5a433de4708202cade59  pytest-7.2.0.tar.gz
> +md5  67e2aa27bb98e5af13b45a1b2e67b144  pytest-7.3.2.tar.gz
> +sha256  ee990a3cc55ba808b80795a79944756f315c67c12b56abd3ac993a7b8c17030b  pytest-7.3.2.tar.gz
>   # Locally computer sha256
>   sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
> diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
> index 1794582dd3..27277163d2 100644
> --- a/package/python-pytest/python-pytest.mk
> +++ b/package/python-pytest/python-pytest.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYTEST_VERSION = 7.2.0
> +PYTHON_PYTEST_VERSION = 7.3.2
>   PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
> -PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/0b/21/055f39bf8861580b43f845f9e8270c7786fe629b2f8562ff09007132e2e7
> +PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/58/2a/07c65fdc40846ecb8a9dcda2c38fcb5a06a3e39d08d4a4960916431951cb
>   PYTHON_PYTEST_SETUP_TYPE = setuptools
>   PYTHON_PYTEST_LICENSE = MIT
>   PYTHON_PYTEST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
