Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6616C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5166E4029D;
	Mon, 15 Aug 2022 14:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5166E4029D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYaPo9nkOhpm; Mon, 15 Aug 2022 14:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DA640195;
	Mon, 15 Aug 2022 14:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DA640195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAB271BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C61A983EC7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61A983EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4_EtfGHVRlE for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008A183F19
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 008A183F19
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:49:07 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f22so9853170edc.7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 07:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=a/1gxpxqIHfeycz5OYRzetBawZdStQvA2LM07NLqSAI=;
 b=LO0iHamNlAJInbqhxYsJTo4rJGXKsoXZXqFI8odRrRVWvN/W8g/0nQSuvJV/ej/U1C
 T8Swn9UjXktY3uq9OlpsoiMSGxJgHrP+I6FECmD5Hw+JnBEU9tMjVx01FNeGYopronSQ
 mcxRV84in9l5aE9l4aTh0xuG/sYdV1UBJ/8581JtPkN2mtaQRyRpAxKXKdCTp1Sfutf0
 t62dDWrkfmu6Y2bVBn10yZCaKv/mrHEUdu56xEmXZUZuNtcBWbTUBtbj6c98t1omP7Eb
 nsIxHLhY7ZIhu8qD4vztUA98HNbEW+x0gyUYNXfo+vGY2/eX4KO3oZukJD26BS/5cdWX
 /N8A==
X-Gm-Message-State: ACgBeo1MUL0Eh3tssc8iYPB8p4PI9UXiS7M79WwNTU6Hj5vYIYb90zxa
 USRw8idwpEBm+8+K2G4J5BTIY+HpWYQB/r57
X-Google-Smtp-Source: AA6agR6TJDdb2cASV6IWo91ti8jkMXCz0ScEdPCowwYe+RdN3Txyfj8PBVdz3VaPABcePU4TU01Eew==
X-Received: by 2002:aa7:c30c:0:b0:440:a189:541d with SMTP id
 l12-20020aa7c30c000000b00440a189541dmr14866300edq.64.1660574945855; 
 Mon, 15 Aug 2022 07:49:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b007341663d7ddsm4108910ejc.96.2022.08.15.07.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 07:49:05 -0700 (PDT)
Message-ID: <48258ca5-db71-3af9-a357-15f6b0130652@mind.be>
Date: Mon, 15 Aug 2022 16:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-34-ricardo.martincoski@gmail.com>
 <20220815113330.5383950c@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220815113330.5383950c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=a/1gxpxqIHfeycz5OYRzetBawZdStQvA2LM07NLqSAI=;
 b=Fp81htErsQ4fwBNTSLAc0T8grsrnwjAL3RFybncrco98aqzaZ0R6aP+4bK+hcUN1kh
 xqWlwgdY+PObKPpffj09GUZgS9eGCGWFPR5Dv2GWGXgh39x9+S7o7boT9vpmNFmymmRi
 pvBYn2lYlIUNN8xy8yMVeAB42h6rzPdg4QVYVUD40Q07IGjOPrpm9YVYIOGdtsQEQomK
 M8AE1BzTZgv5ruQVCPT/3WFR7BvtbkcrgZoYwAjy6K+GBHpXpRl4FicuK5SMRLEkjUtu
 iCLJRFkM4/5v+Zd9OQKzxSosXhaXzqXXCzCDPbQPPBX37gu/7O/i37DN0C5Sy8SXUqk1
 FX0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fp81htEr
Subject: Re: [Buildroot] [PATCH 33/33] utils/check-symbols: new script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/08/2022 11:33, Thomas Petazzoni via buildroot wrote:
> Hello Ricardo,
> 
> On Sun, 14 Aug 2022 20:38:45 -0300
> Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> 
>> This is just a WIP!
>> - it is ugly
>> - it was not designed for performance (speed, RAM usage, ...)
>> - it is poorly covered by unit tests
>> - it has no help/usage
>> - it has no debug options
>> - it uses a hand-made database
>> - it has a long list of false positives, ignored in the DB class
>> - it does not support yet:
>>    - rootfs
>>    - virtual packages
>>    - barebox
>>    - linux extensions
>>
>> ... but it gets some initial results
>>
>> Someone willing to adopt this patch?
> 
> Does this imply that you are not interested/willing to push this
> further up to a point where it can be merged?
> 
>> I don't know what to do with this symbol:
>> package/fwts/Config.in:config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
>> package/fwts/fwts.mk:ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
>> maybe one of below?
>> 1) make the script to accept 'ifdef' as a valid usage for a menuconfig symbol
>> 2) rework the package to use 'ifeq' like the other ones.
> 
> I would say convert to ifeq. However, there is something a bit
> "special" done here:
> 
> ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
> FWTS_MODULE_SUBDIRS = efi_runtime
> $(eval $(kernel-module))
> endif
> 
> i.e the eval kernel-module is done within the condition. Is this the
> reason for using ifdef instead of ifeq? I don't really see why, but
> maybe I'm missing some aspect of GNU make sorcery. Which is why is in
> Cc of this e-mail :-)

  I don't know if I'm the missing name in the "why ... is in Cc", but I'll reply 
anyway :-)

  The difference between ifeq and ifdef is that ifdef doesn't expand 
recursively. So if we would have:

BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE = $(if ....)
ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
...
endif

then it would always be included, even if the $(if ...) expands to nothing.

However, that is not at all the case here, so the ifdef can safely be replaced 
with ifeq.

  In fact, even most of the ifdefs in the infra can replaced with ifeq. But that 
would require just a little bit more thinking to be sure of it...

  Oh and there's another one in pugixml.mk.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
