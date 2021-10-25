Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79525C43219
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:22:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13504610F8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13504610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE42B4048C;
	Mon, 25 Oct 2021 19:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfNXJQd9uJZq; Mon, 25 Oct 2021 19:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E674048A;
	Mon, 25 Oct 2021 19:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E38C91BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39BF80F0A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irH8jI_vI0KG for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:22:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 016F880DFC
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:22:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id j10so3850848eds.12
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GWxg22sHFZCb5LspXZI3922/WxOWTKExepQaPSzcwf4=;
 b=YTJrc9V+ObDM1/xO/vHxYmzB7fogEXf9UPXb4oymuLyyMdhEX/VJtfmcI5anuTTFtg
 kSqQqKnXfqEz88qxNPq/KsEQZbvosxzxJlGFVksCyPGQWoGd9uGyD+2+kWcku/Jv0Z5+
 /UJTI6zP1RlOFNGoXLvWAIXLe5dyy2R4HEZspw9orfYA4VFdSpEJuG0ApGD/QdWLbTVi
 8TJzX3mf9pgxApTBjUJcpFcFU7SouvtQHrDqEY4kqHqWXRdKvJXDo4QcC140XZw2oGlP
 /CJU2PxwD9Kk1D3UVgUUbsa/NBoIwJdKPuBJVIt1T/udamwGT3HDr5VaewYwuah7QmXj
 u91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GWxg22sHFZCb5LspXZI3922/WxOWTKExepQaPSzcwf4=;
 b=vkanfgEiD/09PYk8JgvK2RoenTx6Xu1MfDnOyo0TdlBwo7fVKQ3cOlafYbTi7WnuuN
 tkBBv1jkChJPlML6Nc+T0d2RKYL0KLQ8sQB7FnaFvAfXFljqU0KNIixF9iwZd7jwkezz
 qkFE21ht+xAk4aGa/uMcdg7nUdhOHz5KGDHun3YaR4d3LFiXdlUMSyQVuWc+9ZnT2kMS
 WIlY+oLm/2O8WADanmWck3baD+p2hdXalwWLb6LpyJiH/uditK4HYcN4knio99fj+m4g
 W5EAWFvTsaC73m0XiQzysgZxZnBm/7UAY9oFaCHjBLGPdMYZcFBqtfL8gbzdgZ2CJk6Y
 XbYQ==
X-Gm-Message-State: AOAM533bgrKH+U4pK9jtL1lAvpDKVc4uUNRx4QjLBmj1rmZYK/jPDj6X
 jzf/QiuDRBIL2Eday7ny87CBow==
X-Google-Smtp-Source: ABdhPJzXWu5f051N/VFGsW3qU9YzjzxbaSUchk4xcIIkv2Q0I2qlGPdLzgPU3jhWhnFNSDicsXEJhA==
X-Received: by 2002:a17:907:a414:: with SMTP id
 sg20mr3176999ejc.398.1635189770386; 
 Mon, 25 Oct 2021 12:22:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f7sm9436120edl.33.2021.10.25.12.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:22:49 -0700 (PDT)
Message-ID: <0761c73b-151d-ed03-7e82-7242d1cb00b9@mind.be>
Date: Mon, 25 Oct 2021 21:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-11-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014225849.832479-11-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 10/11] package/python-setuptools: bump to
 version 58.2.0 and split python2 version
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2021 00:58, Adam Duskett wrote:
> Python setuptools 44.0 is not compatible with python 3.10. Unfortunately,
> python-setuptools 58.2.0 is not compatible with python2. As Buildroot is not
> ready to end supporting python2, the python-setuptools package must accommodate
> both the old version for python2 and the new version for python3.10.
> 
> Changes include:
>   - Add two new directories: package/python-setuptools/44.0.0 and
>     package/python-setuptools/58.2.0
>   - Add the appropriate patch and hash files to each directory.
>   - Modify python-setuptools.mk to support both setuptools 44.0 and 58.2.0
>     (setuptools 58.2.0 does not have a .zip on pypi anymore, only a tar.gz)
>   - Point the symlinks in package/python3-setuptools to the files in
>     package/python-setuptools/58.2.0/
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   .../{ => 44.0.0}/0001-add-executable.patch    |  0
>   .../{ => 44.0.0}/python-setuptools.hash       |  0
>   .../58.2.0/0001-add-executable.patch          | 72 +++++++++++++++++++
>   .../58.2.0/python-setuptools.hash             |  4 ++
>   .../python-setuptools/python-setuptools.mk    | 13 +++-
>   .../0001-add-executable.patch                 |  2 +-
>   .../python3-setuptools.hash                   |  2 +-
>   .../python3-setuptools/python3-setuptools.mk  | 14 ++--
>   8 files changed, 93 insertions(+), 14 deletions(-)
>   rename package/python-setuptools/{ => 44.0.0}/0001-add-executable.patch (100%)
>   rename package/python-setuptools/{ => 44.0.0}/python-setuptools.hash (100%)
>   create mode 100644 package/python-setuptools/58.2.0/0001-add-executable.patch
>   create mode 100644 package/python-setuptools/58.2.0/python-setuptools.hash
> 
> diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/44.0.0/0001-add-executable.patch
> similarity index 100%
> rename from package/python-setuptools/0001-add-executable.patch
> rename to package/python-setuptools/44.0.0/0001-add-executable.patch
> diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/44.0.0/python-setuptools.hash
> similarity index 100%
> rename from package/python-setuptools/python-setuptools.hash
> rename to package/python-setuptools/44.0.0/python-setuptools.hash
> diff --git a/package/python-setuptools/58.2.0/0001-add-executable.patch b/package/python-setuptools/58.2.0/0001-add-executable.patch
> new file mode 100644
> index 0000000000..23180eb3ec
> --- /dev/null
> +++ b/package/python-setuptools/58.2.0/0001-add-executable.patch
> @@ -0,0 +1,72 @@
> +From 9b3d307f8f6a1af88f3f810f5a6cf0835830e1e8 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Mon, 7 Dec 2015 01:14:33 +0100
> +Subject: [PATCH 1/1] add executable

  Please run check-package.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
