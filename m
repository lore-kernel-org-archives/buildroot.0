Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C862C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2DD4021C;
	Sat,  4 Nov 2023 18:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2DD4021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqYvX0EPfTNZ; Sat,  4 Nov 2023 18:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E624029F;
	Sat,  4 Nov 2023 18:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E624029F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 795091BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FAE54034C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FAE54034C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86_puJBmhph5 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:14:54 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30AFC40293
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30AFC40293
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9d8d3b65a67so454618466b.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 11:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699121692; x=1699726492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bK9/gdZKc3MDp1in2njV2WIzY/vO+5VBnkkxdriNAvs=;
 b=d6gtre+8e/r9IDQIYbkxNlAD9nEVQOxMH9nfkDM+EakPBTWvhlqpAmMzhdvJ5MsiMw
 gU56tq8HcuiiFftOp8tpPx/nF9qgp/QKQ5Gl97HUuQukGn2vw0YsN0N0S3JKa32ockbi
 Vu2WBR41uKpAKeKVjRqlani6EFQOjRBv20IjKD7PTPwuGXr8WSgs4c6fxvMtouPMgvBS
 4a5mQYTh2WxSYF68MWqSejws6vzCXoeS+rT/xu2VHooWpz0g1wHnu0DTFJoNcGFY6Hm0
 rM0cOaCoSMt1UvNL8Qg3dRoVuIMQF6suOAfseyj8NKE2SkH6vs3zPZWDy23MU0Bxh1BS
 QMjg==
X-Gm-Message-State: AOJu0YxfSq46bohzvrmYiSC4NCf6VDHrL5MSnVVUHDpn/VcEa2HZdoKW
 us9xYAY1CT5CtDky8hDbrE1ZdGNrOr+VxbKjleg=
X-Google-Smtp-Source: AGHT+IFqu7Q2my/sdyw37wEAgdv2g2nESvRT5D1tsq9JZ2oOLJumLcoz3tB+a+CamRmLlCW1kppplw==
X-Received: by 2002:a17:906:c14b:b0:9ad:a59f:331a with SMTP id
 dp11-20020a170906c14b00b009ada59f331amr9545296ejc.57.1699121692154; 
 Sat, 04 Nov 2023 11:14:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 re2-20020a170906d8c200b009c3827134e5sm2173432ejb.117.2023.11.04.11.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 11:14:51 -0700 (PDT)
Message-ID: <5e807fd7-9619-4bf2-898c-6785668081fc@mind.be>
Date: Sat, 4 Nov 2023 19:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-19-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-19-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699121692; x=1699726492; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bK9/gdZKc3MDp1in2njV2WIzY/vO+5VBnkkxdriNAvs=;
 b=BM3pWfCZeoxNYtMkB5T9EZNIWy3z+F9xvfJfwpY1qRJDpNd3I0SUXXglf/KccqaKx0
 bacIA9/0di/tbfQ8NO74futvQl9mL7y9UcEKQu4seABlmwKWUPeBzu6O2Khsqwccn738
 WkAL9C0Mr/Z5/30QHLqEwLDYH7Hzc3bzZasjCcQ0IA/9DWz0xgo0pvIjlfVpqe62zT96
 rW/17R4fsR+Px2pwsd4IA6DngXdOAoYwwK4ePlalTwHZJTx+c2efq7u5kQH9zE0K2HJE
 1yxfgXGwZvPHvW6J8xn79THy8foe+6A/vR0nLjW6LvUFvQChlGh72D5Pgm5yWXsaHaWx
 mdMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BM3pWfCZ
Subject: Re: [Buildroot] [PATCH 18/30] package/python-iptables: bump version
 to 1.0.1
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2023 11:26, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-iptables/python-iptables.hash | 4 ++--
>   package/python-iptables/python-iptables.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
> index ee5f765fba..1b7c9e9324 100644
> --- a/package/python-iptables/python-iptables.hash
> +++ b/package/python-iptables/python-iptables.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/python-iptables/json
> -md5  3fb27da1107bdb62196850fa70e8b0d4  python-iptables-1.0.0.tar.gz
> -sha256  480470adb5f29bf84269b4e53dbad9623af91c79aa666cc0274dec199a555bc5  python-iptables-1.0.0.tar.gz
> +md5  bd6950c1ed9c6b48b7d552ff8e6766c5  python-iptables-1.0.1.tar.gz
> +sha256  1989f2b48598392c3574052a95f456985cb06fb4287b61bf8794e93ebc37eddb  python-iptables-1.0.1.tar.gz
>   
>   # Locally calculated
>   sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
> diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
> index 9cb4285ec3..d01545d8b2 100644
> --- a/package/python-iptables/python-iptables.mk
> +++ b/package/python-iptables/python-iptables.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_IPTABLES_VERSION = 1.0.0
> -PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/ca/6e/cba9c6f4b5a1963b7f5b015f5ed5e2eec7a94ac460570e3474177c4004d6
> +PYTHON_IPTABLES_VERSION = 1.0.1
> +PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/35/e4/33e639b9e153c2d798d73342a96715a4edca6f46431d763b275a34b3aeca
>   PYTHON_IPTABLES_SETUP_TYPE = setuptools
>   PYTHON_IPTABLES_LICENSE = Apache-2.0
>   PYTHON_IPTABLES_LICENSE_FILES = NOTICE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
