Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71DBC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8353C606C9;
	Thu, 18 Jul 2024 20:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BF3pd72XwSXH; Thu, 18 Jul 2024 20:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7912B60BF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7912B60BF3;
	Thu, 18 Jul 2024 20:32:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 634891BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D5524048B
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpXFgsvxbRKX for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D084E400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D084E400BF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D084E400BF
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:32:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3685afd0c56so141185f8f.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 13:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721334744; x=1721939544;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rz1t7IcEyqHWis8931oDHKARjqvaYXwFaj11DpF9oHc=;
 b=SCovvMbPFlmWh7/E8GPH0Komo+h2R8afW30ZK7O6LAJg0HMs05Ge9331ea/eno3SXg
 X87xuPmueA3pccwO6Wmk/WcjySE/Oz3UBjjayMn+3hkHkBCovXrdIoJJBEIcUzxpchuG
 FtSxPvThhh3Q/aF2h3wxC9k8ADoK2Fr0jBoxt1MQchCewrRVMG4197hvGUOjEeD3PGcj
 5tDW3kxbZc2xmpyY5UeWjQoXyYklkSurkH59nANfWbRyPbTSfImPkR9c1F9+ZqHtBtyj
 cjfczCfFXfKV2nGOtVQGOsJPzdtFoNKyeMf5BYcf+UivF4HWef0lM5Tfm5cEELC2e6KQ
 2cCA==
X-Gm-Message-State: AOJu0YyCG4BfACr0hJgd41+DBnUDLTmK4xdzGD84qyadGF0Cm3muTtf6
 PmVOwyp3bAnMF8B5sKdUH1eScSo7pjmTHWEfrXKGOi7AaiGC9LxdbYkGMZKrdjrJvlYXpsGJPnC
 j
X-Google-Smtp-Source: AGHT+IFcnDyb7hdz57Kr15guqW+BkWH9Vs1IRl7wlvgfoMs49NAzkSvSc0q5kQVWqCW3sRgckX7JqQ==
X-Received: by 2002:a5d:4b0f:0:b0:367:f13a:79f0 with SMTP id
 ffacd0b85a97d-368317c8c2cmr3175938f8f.67.1721334744376; 
 Thu, 18 Jul 2024 13:32:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6906a26sm808625e9.21.2024.07.18.13.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 13:32:23 -0700 (PDT)
Message-ID: <b165fb5e-38f5-4751-9873-765ab3239549@mind.be>
Date: Thu, 18 Jul 2024 22:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Brandon Maier <brandon.maier@collins.com>
References: <20240718-boot-uboot-env-select-v1-1-e6c778e814d8@collins.com>
 <20240718191355.34e1a05e@booty>
Content-Language: en-GB
In-Reply-To: <20240718191355.34e1a05e@booty>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721334744; x=1721939544; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rz1t7IcEyqHWis8931oDHKARjqvaYXwFaj11DpF9oHc=;
 b=PlDapuPXG7fx8q7HFNGNdECjtlcanoEChSPH7vENCtg/IwB4TaulseRQX0wctQknrl
 oikdxnn8iG3ocZ55Y7Cpd90T5DZCYNQ7gPnagvLEQerbfwcWqK6uamBn7YH39pb8QsVz
 uxtE/SYVcJOUUS5WbCM8G4cQFRj/NyHWkbiLFhQVS9cJcXfPFjktIP8OmONeAnx3od7A
 kci1hs9HiVTsNsgCD4+yN2oCKaVGlPvcgCD2SpVialfquYKmfm2/88rubdClHzBM9pnT
 8RbDPBWhD73t1N4i1zstRVv3MYEfLVw+r6tZNHBlKWFmX+pRORG7i9sT3om8mSKkQsmS
 i0eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PlDapuPX
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/07/2024 19:13, Luca Ceresoli wrote:
> Hello Brandon, Arnout,
> 
> On Thu, 18 Jul 2024 15:45:45 +0000
> Brandon Maier <brandon.maier@collins.com> wrote:
> 
>> The following warning occurs from commit "boot/uboot: allow taking the
>> entire default environment from a text file".
>>
>>    boot/uboot/Config.in:141:warning: config symbol
>>    'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
>>    tristate

  Oh right, Kconfig is too stupid for that. You need a helper config but it can 
be blind. Like:

config BR2_TARGET_UBOOT_USE_DEFAULT_ENV_FILE
	bool
	default y
	depends on BR2_TARGET_UBOOT_DEFAULT_ENV_FILE != ""
	select BR2_TARGET_UBOOT_NEEDS_XXD


> Hum, apologies, didn't notice this, at least when working on v2 (see
> below).
> 
>> Add a 'bool' config so we can enable dependencies.
> 
> That's basically what I did in v1 [0], possibly for this same reason,
> but I'm afraid I don't remember exactly.
> 
> Then in his review Arnout suggested to have only a string option, and I
> did not recall any good reason to not do so, and so v2 came without the
> bool.
> 
>> In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
>> therefore we also need to depend on
>> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.

  Oh yes, but that's a simple depends on in the 
BR2_TARGET_UBOOT_DEFAULT_ENV_FILE option.

> 
> Arnout, do you think the issues reported by Brandon can be fixed while
> keeping a single string option?

  Yes I think so. But it needs to be tested so I'd prefer is _someone_ <grin> 
would do that.

  Regards,
  Arnout


> If they can't, I think it's worth resurrecting the help text from the
> two options as I had written them initially in [0]. Otherwise one would
> have a bool without help text, and woudl have to enable it just to make
> the string option (with help text) visible. Kinda chicken-egg.
> 
> [0]
> https://lore.kernel.org/buildroot/20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com/
> 
> Luca
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
