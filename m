Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D282BC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F0181D16;
	Mon, 25 Jul 2022 20:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F0181D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_Vm3hLmsOgI; Mon, 25 Jul 2022 20:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E4681453;
	Mon, 25 Jul 2022 20:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E4681453
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08A961BF32A
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66A14091E
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 20:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66A14091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tISchUzxJOMq for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 20:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D299E40176
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D299E40176
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 20:53:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q18so7197149wrx.8
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 13:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U1J0RRUuDZKXS1B07sPla3ug+7AbR43iLs9X92+Udmw=;
 b=mryAhTQjayR/BnwIPeetU7LioEqZ5gyqKUHfv0JNlBo46h9WR3PesEzQQwKpr44xun
 WZ2puQReO2L0n+e38gUSdrtO633N26xO1ogsU0Bz1tYOYZyIShgzTqgImJy7pfqBOV4C
 gSUqA0lXYUFekWoagpgk5WmbRFSkRaBYWzH7rUkodHfPkynMi/yQmCv+qdvf4uxX6Bsn
 LoIHAd/8xY93lscCdY6FcHTHJuuCeT6iiJnQmE4iBvoGCcN1POLdl3IGd48wiUvFJpfX
 TcYWGDc2aQ/fosTQ+IfNjgrSdSQiUwiJ9laafPIdOEPxOPOSaPuFrqe+SHrXj/e8W0EE
 3/nA==
X-Gm-Message-State: AJIora9s8TxU5SyQZJz9oTD3bRoVcYTOBNTaoA81IB5I8ysF8PBLj05P
 5QAyobxHeeTXsNExnKiQ2vOgcexvxJ+eFg==
X-Google-Smtp-Source: AGRyM1tP5RXZOkQL0IMvegQ24G5Hmzv0BppUeze7/+kZV5V7tZL4of4UeRUU8jDFDkMyP0P1IHdlfA==
X-Received: by 2002:a5d:4308:0:b0:21e:4855:f369 with SMTP id
 h8-20020a5d4308000000b0021e4855f369mr8663756wrq.706.1658782402801; 
 Mon, 25 Jul 2022 13:53:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003a2e5f536b3sm20236489wms.24.2022.07.25.13.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 13:53:22 -0700 (PDT)
Message-ID: <a599ff93-5a9c-fed6-df74-85d185a66d44@mind.be>
Date: Mon, 25 Jul 2022 22:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220724235138.678079-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724235138.678079-1-christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=U1J0RRUuDZKXS1B07sPla3ug+7AbR43iLs9X92+Udmw=;
 b=NuboTylRAaiwa8Ys/CvjkBDuzLV8R2bLh/tcwthRBG1VMP7t+Jm/9/UyIvE3LQgp4j
 s4AgHqPnHF3EWo1EnFMPl0PnLDoyki51dJ1dcLmGGt8dSzSHgrFVzRlddUU90Ypzmpy7
 S1ALaDg9V6qB9a9LEr5dTAt0kDzy6wwyyiBzIt7WvTqeicu26Gy9XF9R4zZuKgsaNcRj
 EYwy2JsBiqDOkKvjUqE7d/mun3MHI+xnzzq0u8/bdClbvutEpZ4P+nidse66noZihjXu
 m7ZE8RDY0xC3+CKT+0y/NbHkYWwpQYYRbyLKV4IWsGrbU6Naq3kW92qPTebj7ivzGdOk
 rOiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NuboTylR
Subject: Re: [Buildroot] [PATCH 1/1] package/beaglev-ddrinit: update to
 latest 8d6318
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 01:51, Christian Stewart via buildroot wrote:
> Update to latest "master" version:
> 
> 8d6318acfe71e790c983b34448c9abfcfcec3ed8
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   boot/beaglev-ddrinit/beaglev-ddrinit.hash | 2 +-
>   boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
> index 2aaab53a3b..d4235904d1 100644
> --- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
> +++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  2d491f64bd77de9dfd4b8ae6c00e83670e80c205cc20917fefa6194b1dc1fe4e  beaglev-ddrinit-c0839f25246d9e308c23498d344ca13d8a7ad6ed.tar.gz
> +sha256  08a49355f89fc2cb4f5101183339c9c6f86b722545d0abbc319aab26a511dad7  beaglev-ddrinit-8d6318acfe71e790c983b34448c9abfcfcec3ed8.tar.gz
>   sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
> diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
> index 76406ed4c5..d9707de610 100644
> --- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
> +++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Commit on the 'starfive' branch
> -BEAGLEV_DDRINIT_VERSION = c0839f25246d9e308c23498d344ca13d8a7ad6ed
> +BEAGLEV_DDRINIT_VERSION = 8d6318acfe71e790c983b34448c9abfcfcec3ed8
>   BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
>   BEAGLEV_DDRINIT_INSTALL_TARGET = NO
>   BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
> @@ -15,7 +15,7 @@ BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
>   
>   define BEAGLEV_DDRINIT_BUILD_CMDS
>   	$(MAKE) -C $(@D)/build \
> -		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
> +		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
>   		SUFFIX=buildroot \
>   		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
