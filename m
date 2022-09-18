Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E4DC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C616383FB2;
	Sun, 18 Sep 2022 08:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C616383FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2ArLKFexCuV; Sun, 18 Sep 2022 08:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5DB383F96;
	Sun, 18 Sep 2022 08:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5DB383F96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92B021BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 675AE83F96
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 675AE83F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fb0w9_0Pr_up for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E68A83F95
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E68A83F95
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:41:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c11so42550594wrp.11
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 01:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=uEigAG0WA4FrX5/oJOUOqSnVLweW2fNk3fJN5nCar6g=;
 b=wvNIxe+UBm8Xj8WE0+GDFluJaBCCi1Nif3FRPDPai0P8HFHGj0XUu1dIgGM5cWjLtH
 ShkSU3ACXlU94QspESPqKjgN5QoVRb/0lZDrFTIC88SEg0V+AMqcvLE2JUotdEMDTYrB
 mKdcsPzku1JCrbQfoOzwiaUFbjEPJl57lFkjM+d9EcMsNZwav4xzxuhuumY6b39bumCr
 Vdo0EsVWDImqmRJ4Mibd64yGxVPrNZBr1f8CRjt4qyiimZ65CUR6DiyLbuLh/aRLYsyT
 RCDY+Pea1Xg3LSgExTy4sBu3Pf+f5kitd6VAj1ZqSyibHFra6y//IATcts1JYTtnXSw3
 Qs6w==
X-Gm-Message-State: ACrzQf2l9WZoMv/cKDaM8oe3xpiXT6W1Ce++5eQqUiesAdltu4B8Q7+x
 /2BrKE0FSYFSdtfEN5Tw+btpCg==
X-Google-Smtp-Source: AMsMyM64HBbSDMQywciEYCSQEukEjZYAg97+1f/ljzteh4f3o/ZKJGWo5/mceJRzl63tSM/Mk8nlgw==
X-Received: by 2002:a05:6000:1d81:b0:226:fa3a:8721 with SMTP id
 bk1-20020a0560001d8100b00226fa3a8721mr7580228wrb.475.1663490506094; 
 Sun, 18 Sep 2022 01:41:46 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b00228d8420f57sm10102140wrr.95.2022.09.18.01.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 01:41:45 -0700 (PDT)
Message-ID: <6f1c35c9-2e99-99ca-0846-f285d2cd0015@mind.be>
Date: Sun, 18 Sep 2022 10:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <417c53083693347f5c22298c49c8ff9df1f35d0f.1660931225.git.yann.morin.1998@free.fr>
 <55b0aae8-4e00-990b-2f98-abbb4437c29e@mind.be>
 <20220917211029.GA1127102@scaer>
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220917211029.GA1127102@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=uEigAG0WA4FrX5/oJOUOqSnVLweW2fNk3fJN5nCar6g=;
 b=IerPG8IwnAyXG/I/day5CjH6aRRJz8VKU99BcaLDZjMUIL7H/8egrRSmXgqEk6BE8j
 kRhFKJpWsem//YgV7eaIuYMbOr0H1uDP0aq3QsU1ZS6oibD2BXuzJOFde+iYRRDNWwKd
 FylR6+LE1I9jjkJ9Oe3xGZyJP6SrveADgOZlI70hOmkQVILp194yCsnnudLLRQypDAXf
 N+1Eqz1kyKDH0gWDmBsv17a4seSOUnVi2affpk7JVlHGrUSgAOm0oCVtCqY9cbywuaWz
 jRnwUHNI2Si8omLkC/g0/tdp2NpMUAP3cfpQuVbG9nbm2ZZ1Q/cdc8iLjRnsdG90nAp3
 E6AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IerPG8Iw
Subject: Re: [Buildroot] [PATCH 3/4] fs/cpio: accept a list of dracut.conf
 files
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2022 23:10, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2022-09-17 22:17 +0200, Arnout Vandecappelle spake thusly:
>> On 19/08/2022 19:51, Yann E. MORIN wrote:
>>> Allow users to specify more than one dracut config file to cover
>>> tose cases.
> [--SNIP--]
>>   Applied to master, thanks.
> [--SNIP--]
>>> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
>>> index 861e9a929e..94a826f9e4 100644
>>> --- a/fs/cpio/Config.in
>>> +++ b/fs/cpio/Config.in
>>> @@ -29,13 +29,15 @@ endchoice
>>>   if BR2_TARGET_ROOTFS_CPIO_DRACUT
>>> -config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
>>> -	string "dracut configuration file"
>>> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
> 
> When that patch was written, we did not have a release yet with support
> for dracut, so I did not add a legacy for _CPIO_DRACUT_CONF_FILE when I
> made it a plural. But 2022.08 does have dracut, so we now need to handle
> the legacy for BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE (or not make it a
> plural).

  I know that, that's why I first checked if dracut was merged in 2022.08. It 
was merged during the stabilisation period but to next, not to master. So, no 
worries.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>>> +	string "dracut configuration files"
>>>   	default "fs/cpio/dracut.conf"
>>>   	help
>>> -	  Dracut configuration file. It determines which parts of the
>>> -	  rootfs get included in the cpio image. See dracut.conf(5) or
>>> -	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
>>> +	  Space-separated list of Dracut configuration files. They
>>> +	  determine which parts of the rootfs get included in the
>>> +	  cpio image. See:
>>> +	    dracut.conf(5)
>>> +	    https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
>>>   	  The default configuration file is suitable for busybox init.
>>>   	  It doesn't, however, pivot_root into a full rootfs.
>>> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
>>> index fa66b1c710..d671c337df 100644
>>> --- a/fs/cpio/cpio.mk
>>> +++ b/fs/cpio/cpio.mk
>>> @@ -50,9 +50,14 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
>>>   ROOTFS_CPIO_DEPENDENCIES += host-dracut
>>> -ROOTFS_CPIO_DRACUT_CONF_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE))
>>> -ifeq ($(BR_BUILDING):$(ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
>>> -$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
>>> +ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
>>> +ifeq ($(BR_BUILDING),y)
>>> +ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
>>> +$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
>>> +endif
>>> +ifneq ($(words $(ROOTFS_CPIO_DRACUT_CONF_FILES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_CONF_FILES)))))
>>> +$(error No two dracut config files can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
>>> +endif
>>>   endif
>>>   ifeq ($(BR2_LINUX_KERNEL),y)
>>> @@ -63,10 +68,14 @@ ROOTFS_CPIO_OPTS += --no-kernel
>>>   endif
>>>   define ROOTFS_CPIO_CMD
>>> -	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
>>> +	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
>>> +	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
>>> +		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
>>> +	)
>>>   	$(HOST_DIR)/bin/dracut \
>>>   		$(ROOTFS_CPIO_OPTS) \
>>> -		-c $(ROOTFS_CPIO_DRACUT_CONF_FILE) \
>>> +		-c /dev/null \
>>> +		--confdir $(ROOTFS_CPIO_DIR)/confdir \
>>>   		--sysroot $(TARGET_DIR) \
>>>   		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
>>>   		-M \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
