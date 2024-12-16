Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10830E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 20:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89A840B53;
	Mon, 16 Dec 2024 20:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fzQpLl-QLwJ; Mon, 16 Dec 2024 20:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7416F409FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7416F409FD;
	Mon, 16 Dec 2024 20:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2CAC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7E2160F3B
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUeI2KJZkIwU for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 20:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86ABF60901
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86ABF60901
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86ABF60901
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 20:54:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so3018016f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734382495; x=1734987295;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cGALh/IiHbR9vx8s80priIuYC3OyRa+87DpODPFpKIg=;
 b=tdELB4MefiOrETsYQhh69kSSBH1FCLy3cISCi0lFO2JovawTUC61uVPpVUeF0xpV5N
 9FcrvH3ymr2Ct+ofm3t5ShgVIU9cyyWdnrmkpokpGqx17Pvi9LNzWkAI4ILEGO/hl2z/
 IdJGD3pdN3sKt8laplR0qa31aYOImz3tAySf6CVlNn3geeaDRI0gJtMTiJ7auCJ8hWBT
 ElxVgDEBp7iN/rfHqm/AzQSw99CR7GrM/wNj/38F68pS5DwDxyskW3d+PtC+4FLp60Lc
 dxwTS3kFac3yzwdD1HSlPjAPbeQ7hH6zvzuI2/cwZihCwiPws30TWDCu7iJhY6WKF+cd
 Uo2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuwhUmFSWQEmlbUx4cRPylsGvCKQpAOh39NaPrm4WX9LjQOtR4Czh6xXNQ1J20HoHuRB1eiHKmWnc=@buildroot.org
X-Gm-Message-State: AOJu0Yys0rwVVMoCN3wGMyApOLwqbTxHYShfH9YAqFhYdiib7DJ1HAUn
 /PsGZdXb66Ye5KPlxct3u7FZSvCEDDaWz9xAu/5NAWbm8xG9+z8bhxEJ6/jxEj4=
X-Gm-Gg: ASbGnctQYGuq4PNKvUdkOjfsdC5vVsgckPP9dc1INSSpO/7Hh3bGBXvcoIuOja1oNc3
 lfiXuhDBxnXieM/RhifejcJibOphVsCYuCv9qOJTav/haPmQJv4gPxR26wm6n5ajn3tu+IEIeSz
 HRoyAOQwNuqwIFeG1jg5Km8BPIHfwb0eko6HXytyUijgK5pOKCET6FCUe25w0GV/u+QXXmZay0m
 o97vS2i1mfKEb4o0BGpjXdqyGGXn4ulHdLGQE9JxpGAMWBvZ8gOZ8YWEdJMY7fO+Rey9M9b9LAp
 ma0nDxip1Zi57Q4Z/locgrALbPdWZ02wK3L45S/E+Oc3Ab0rE8tlRCfBffrrgF0s938Q2KaQqEL
 rUnhz5GtExes=
X-Google-Smtp-Source: AGHT+IH2UHTA4khR+QzKL6ast5zy8GSnOPUaH+Tziqy8j3bzHhXs7ZTaZAyILba4YIWIT5woOXzgcw==
X-Received: by 2002:a05:6000:2a4:b0:386:3752:b28c with SMTP id
 ffacd0b85a97d-3888e0ac400mr12687602f8f.41.1734382495128; 
 Mon, 16 Dec 2024 12:54:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a628sm9312752f8f.47.2024.12.16.12.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 12:54:54 -0800 (PST)
Message-ID: <616c0945-34d1-484b-814d-f1199b83377c@mind.be>
Date: Mon, 16 Dec 2024 21:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Michael Walle <mwalle@kernel.org>
References: <cc0e87ea-5830-4b14-86eb-b021bc5b254a@grenoble.cnrs.fr>
Content-Language: en-GB
In-Reply-To: <cc0e87ea-5830-4b14-86eb-b021bc5b254a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1734382495; x=1734987295; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cGALh/IiHbR9vx8s80priIuYC3OyRa+87DpODPFpKIg=;
 b=VORE6svOmc95dEwhD32JPNcFDK5c3pka7yJo96DUDdk02f7OUk/TqY3c7iXz1FKvhe
 j1WezIDbxYSqlViC/xehqOh/hvPEHdmngJDZE1wL+yeBPH7YXUsCJrlB2NyfVztl2oBO
 V+lSM8zprpHQuSPfcFUP07Lm81EiE6pYbaiJKReCGY2niUQTCcL9lyFWcY+J2cuD+0UQ
 WiJAAAew0mhawNLsG9dDH28MvUXbzN24DGDUCd2Ebptor6E1MONmcbz98O9PbwLO4QTw
 mjk2VlUtR4M2NSmKwK853yezQu/iSM/DxKqkfqQYQnvAHgUTB5H0JzZs2KjKJwxOdzo+
 ibmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VORE6svO
Subject: Re: [Buildroot] [PATCH 1/1] linux: make out-of-tree DTS work with
 newest kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Edgar,

On 16/12/2024 17:37, Edgar Bonet wrote:
> Since Linux 6.12 (commit e7e2941300d2, "kbuild: split device tree build
> rules into scripts/Makefile.dtbs"), the kernel build process does not
> build the DTBs from the source files listed in
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.[1] This is because it expects all the
> DTS files to live in vendor-specific subdirectories of
> arch/$ARCH/boot/dts/ , whereas Buildroot drops them in the top dts
> directory.
> 
> Fulfilling this kernel expectation would require a new configuration
> parameter for the name of the appropriate vendor subdirectory. It would
> also require changing the relative paths to included .dtsi files.
> 
> Let's add instead a rule to the top dts/Makefile for each DTB we want to
> build. This avoids breaking user's out-of-tree configurations.

  Is this going to work for kernels < 6.12 as well? 3.0 is the oldest one we 
(more or less) support (and it has dts already for powerpc).

> [1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
> 
> Reported-by: Chris Packham <judge.packham@gmail.com>
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>   linux/linux.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 1d3d8fffa6..35f358c56f 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -517,6 +517,7 @@ define LINUX_BUILD_CMDS
>   	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
>   	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
>   		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
> +		echo "dtb-y += $(notdir $(dts:%.dts=%.dtb))" >> $(LINUX_ARCH_PATH)/boot/dts/Makefile

  This is going to continue adding that line when we rebuild. I think the best 
solution is to do it in a POST_PATCH_HOOK - and since we also want to do it in 
the OVERRIDE_SRCDIR case, the same code should be included as a POST_RSYNC_HOOK 
as well.

  That also conveniently makes it easy to add a comment explaining why we do 
this (cfr. "dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 
3.8-rc1" comments).

  Also, we don't use the $(foo:%.x=%.y) construct, instead we use construct 
$(patsubst %.dts,%.dtb,$(dts))

  Regards,
  Arnout
>   	)
>   	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
>   	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
