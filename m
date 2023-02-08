Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E641FC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A1B84087E;
	Wed,  8 Feb 2023 14:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1B84087E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDvtm0NohjKx; Wed,  8 Feb 2023 14:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F35B40875;
	Wed,  8 Feb 2023 14:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F35B40875
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF25C1BF2C7
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C914181BF4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C914181BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxir7GaicpbG for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:29:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E813B8144C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E813B8144C
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:29:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o18so16954719wrj.3
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83SvSE/n/jnHa2FSHeJW2jCAxW3eJXP6NOFsBnVv8V4=;
 b=eUFS5YtQoIyTWUHgevrxODPKD5sUKmup8wFxcrjQW5CaqN3RAqEfxgzPbjHdY9wbC8
 ROL0ViOWREoC5r1zzTn3qkdfbxXSATm8w4WfBp2HYhs/VDPAeDtYQPjmBgrQCfouVJV4
 OUnWJuF4ZLdQRFcIIZZSVzSuioUoSAqW7K84+1Hn5vvPG1HN+5F6mfn7GTDekHBai03q
 ZKCSwr6nvVPC/O73m/Rc0sCA+tMyznRUz+R5yE8OalBgGai+57ciojWo+qEu9ECeMCI3
 73fTvBlLS+RWSr/nUb9SBs3VgXIdZB3wxnnMHXkN7clxMwnPNbY7+a/2xJREqRNgL2t/
 5T7A==
X-Gm-Message-State: AO0yUKU0waIpqZb7Q3ohHg0GEdDQ86hFOfhe+pTZKbobfFWKCaL6Q0pG
 3HchdM8xFhSfQHzIFxtcFmfhOg==
X-Google-Smtp-Source: AK7set88WMHEapGP/isNXva7UgvewJsodvZFE5HaEpXsBSXCYexDGz9GRlUzFfxD+G6I+w3p3Ci4lg==
X-Received: by 2002:a05:6000:50a:b0:2c3:f4fe:c77f with SMTP id
 a10-20020a056000050a00b002c3f4fec77fmr6841462wrf.57.1675866576641; 
 Wed, 08 Feb 2023 06:29:36 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 f17-20020adffcd1000000b002c3f0ea831dsm4857308wrs.15.2023.02.08.06.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:29:36 -0800 (PST)
Message-ID: <3b1ff0f1-076f-5f6f-1c2b-ac4bdf9951c7@mind.be>
Date: Wed, 8 Feb 2023 15:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-9-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220731193521.1217825-9-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=83SvSE/n/jnHa2FSHeJW2jCAxW3eJXP6NOFsBnVv8V4=;
 b=B45bGGoyxNyeG4Lkf0stJInZLuvrwZEk2l/i8QdlQlnjiVzRmkIS852eRwc7rQiCfB
 FwSTp2P2kspp5zSMX0Ep2ByxxvP45gvVswYKANEnAZbX3EGMU78+CgRgNjjj8R+cmMVR
 E56Weg6noIj/chWiI1U0odbPBoBU/O6tmXhPnH58l66vbd7Xbi+YWZW5RIFn3HXDtXgU
 eIlBqfWSH8VraS4B2DoPZPFph/K9Mwr31QlIQ5uMfjhnSi9WiLBRFMf3L+semvQLVS71
 aNIF7RFBsa7hTpPBmH7f3zIHu1DPmYwM8GflQ7JYfu+KyQR8pfxYvX2/4tynm9IHUWWW
 yxwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B45bGGoy
Subject: Re: [Buildroot] [PATCH v2 08/14] utils/check-package: check files
 in utils/
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



On 31/07/2022 21:35, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>    - none
> 
> NOTE to the maintainer applying this patch: please re-generate the list
> of ignored warnings while applying:
> $ utils/docker-run make .checkpackageignore

  Instead, I pushed 4 other commits that fix the shellcheck issues.

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore | 4 ++++
>   utils/check-package | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index a527254464..615fe22e52 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -203,3 +203,7 @@ package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
>   package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
>   package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
>   package/xl2tp/xl2tpd TrailingSpace
> +utils/brmake Shellcheck
> +utils/config Shellcheck
> +utils/docker-run Shellcheck
> +utils/test-pkg Shellcheck
> diff --git a/utils/check-package b/utils/check-package
> index 732f1cf112..094b7b9c07 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -107,6 +107,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
>       r"package/",
>       r"system/",
>       r"toolchain/",
> +    r"utils/",
>       ]))
>   DO_NOT_CHECK_INTREE = re.compile(r"|".join([
>       r"boot/barebox/barebox\.mk$",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
