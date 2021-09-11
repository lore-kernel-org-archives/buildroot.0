Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D14DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23B30611CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23B30611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8F5E40477;
	Sat, 11 Sep 2021 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVjlYgmlXrMp; Sat, 11 Sep 2021 14:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8F2040227;
	Sat, 11 Sep 2021 14:18:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC031BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67D8540227
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kHpgmIwwxDv for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:18:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71CC4400EB
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:18:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id e21so10361456ejz.12
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q/sHh3ydOj9l+nnSc8zQJrfBhoYY/m31bXdNl28zWiM=;
 b=Waxn9N9aI5ILvCuYOG5j1XzTFubqON1XzK17DTsOvVOxdBAsZX1mh/pzSiJVKgRRH3
 ewp05tggCdEhfM5E3K24BY06o/t3QXu18Vl8iRC8quuYlWI1p+qUUKlmAhxDZkaGKzLC
 zjmRaZONY2gZ6aZMIzE935SCNUX4YHrBFfgqPP0j43v2X/DxLi/ymY8LrNs+UXXUrMvy
 uDS3MU0bfRFHOFzh42yvEdcX5myLiYQtRO5wVdRpf8hq0KXsG5xToRI1DOpznUOhjpAm
 LEJno1H7YJMxgnB75vjVa4lL8+OIPc1TiYevC5i3t3FGIcwoODAk94hOza1lTPiiEdks
 9ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=q/sHh3ydOj9l+nnSc8zQJrfBhoYY/m31bXdNl28zWiM=;
 b=WayNHZLlh3vN8dVwrTAS8EC2cH222rgQ1sqU32seB/cMNEShYKvzXE/ZNeMH+TFtB/
 ccViosYtXx7pebZs2gSczo2zaIjeGHqOloBJ0BxBMSlyJl5pFqq5pZPIx1X43sC2DgLJ
 RKXqnJWIlMcRd6tSe1VjwIxViuI5ALH6I+MXIucO81m8XBijxTvLDNL3uTufo16ZpLtE
 qCzlru75MEHwgih/iIJdTbkr0w3YQ2OmZ16a+Vsm2T/+RlF/YU3MyHQj/DidNE35Efuo
 egavnO8U430HY0U7j2HAk0voBRm7goUNFl+TGqHUvq7cFJR7n5VCL0H7n/N0S49eEcOr
 ekng==
X-Gm-Message-State: AOAM530qSlNX0Wb1jNnnUXvOXCsob6gfjqoM97xzHogIPXuTWK7zpDBB
 jxeBieKli70QYSEQKVKJRUxEZmQW0zfqYQ==
X-Google-Smtp-Source: ABdhPJzvjntVDc9UtUreOqQos8WHCN2VaG6FX3z+UGJ9U3N6V9ZV0WT9Y/SRB083TPQrCXtg4VD7Vw==
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr3123375ejf.117.1631369905737; 
 Sat, 11 Sep 2021 07:18:25 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m22sm888526edq.71.2021.09.11.07.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:18:25 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905192548.1378588-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <e6af9caa-1b17-c2e6-b27c-ad2269dc6422@mind.be>
Date: Sat, 11 Sep 2021 16:18:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905192548.1378588-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/libiio=3A_fix_C=23?=
 =?utf-8?q?=C2=A0build?=
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 21:25, Fabrice Fontaine wrote:
> C# build is broken since bump to version 0.23 in commit
> 50b6d7d69f880e940d7c281c493a6a6694d6ebe3:
> 
> /tmp/instance-0/output-1/build/libiio-0.23/bindings/csharp/Device.cs(211,32): error CS0106: The modifier `readonly' is not valid for this item
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a26cce9760c75c44ebdcf21dfb4a69aad5702de4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...rs-setters-cannot-be-marked-readonly.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
> 
> diff --git a/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
> new file mode 100644
> index 0000000000..a665d48363
> --- /dev/null
> +++ b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
> @@ -0,0 +1,32 @@
> +From 85bf9cd32138539252ed01c355cf766612cf47c9 Mon Sep 17 00:00:00 2001
> +From: Paul Cercueil <paul@crapouillou.net>
> +Date: Thu, 2 Sep 2021 11:04:21 +0100
> +Subject: [PATCH] C#: public fields with getters/setters cannot be marked
> + readonly
> +
> +MSVC would fail with the following error:
> +error CS0106: The modifier 'readonly' is not valid for this item
> +
> +Reported-by: Raluca Chis <raluca.chis@analog.com>
> +Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> +
> +[Retrieved from:
> +https://github.com/analogdevicesinc/libiio/commit/85bf9cd32138539252ed01c355cf766612cf47c9]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + bindings/csharp/Device.cs | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bindings/csharp/Device.cs b/bindings/csharp/Device.cs
> +index 96214243f..6c8c8f4f3 100644
> +--- a/bindings/csharp/Device.cs
> ++++ b/bindings/csharp/Device.cs
> +@@ -208,7 +208,7 @@ public override void write(string str)
> +         public readonly string name;
> + 
> +         /// <summary>The label of this device.</summary>
> +-        public readonly string label { get; private set; }
> ++        public string label { get; private set; }
> + 
> +         /// <summary>A <c>list</c> of all the attributes that this device has.</summary>
> +         public readonly List<Attr> attrs;
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
