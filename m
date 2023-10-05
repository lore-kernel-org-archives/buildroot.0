Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E9E9370C
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67AA1428BA;
	Thu,  5 Oct 2023 20:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AA1428BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyaJ5w4rgCkl; Thu,  5 Oct 2023 20:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34738428BC;
	Thu,  5 Oct 2023 20:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34738428BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E42E1BF2B6
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 20:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 378C281ED3
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 20:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378C281ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiWpsZmYvwwO for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 20:07:06 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B750A81EC9
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 20:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B750A81EC9
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so5470171a12.1
 for <buildroot@buildroot.org>; Thu, 05 Oct 2023 13:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696536424; x=1697141224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5SmdelAGmvVMuyGpI9oHf/KfBMhCr0YbMzDxWUcyb3s=;
 b=hQn125lqVgcqHbh4B3Ls/v//8HvhjfGUp657JSQuWTTOwF+/Hz+kjQyxSXXhGvOqJ2
 XjMTaxpHVGzw9II5fV1WRMPRXCITKKsxNUyN0kAQTI5FBfaysXrO9KJgEDsGuIO1wjzB
 SIO680wn9ONnwGQlaCaMP9gGicO8uDd+0mc8JNPwNqc0j4+Q+z4crIpZT4ZVaaTVJH7E
 3QQmsSJLCBEWdhzDwBIOcsArIigLzrbCDMo+agu5UaMJ+WfqKZNtc1EJx4ICHXG+MBMI
 sjWcuP6johRF4Wxx9pQO2TXiBlMPFuOOYhnMnTnSHzUHt8OGBjIB8eaBMFmDabxmHThq
 Gz+g==
X-Gm-Message-State: AOJu0YxXN21jlC275TOc/2JjeI6n1sBOyHUPxWkpursBZtyC0JbQHpSn
 0/UyL1Ibp4IBzatwlPKLI1clNA==
X-Google-Smtp-Source: AGHT+IHzGt8mVQ00Y7xEm1YoxNKyw7E5DNrVbGATfhaPMw7gC56942AlSJD5OjCSZzbI3gpTqDDEUA==
X-Received: by 2002:a05:6402:3584:b0:52b:db44:79e3 with SMTP id
 y4-20020a056402358400b0052bdb4479e3mr2204124edc.4.1696536423785; 
 Thu, 05 Oct 2023 13:07:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05640204d100b00533dd4d2947sm1539152edw.74.2023.10.05.13.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 13:07:03 -0700 (PDT)
Message-ID: <f958dc30-66b2-c698-b158-5792639094d9@mind.be>
Date: Thu, 5 Oct 2023 22:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Knight <james.d.knight@live.com>
References: <20230505043002.1956-1-james.d.knight@live.com>
 <SN4P221MB06825C5F564A59CA4DE16C09A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <20231001160559.GM2579@scaer>
In-Reply-To: <20231001160559.GM2579@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696536424; x=1697141224; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5SmdelAGmvVMuyGpI9oHf/KfBMhCr0YbMzDxWUcyb3s=;
 b=BtLhSOVW8BAdf6eL7vB2GXDPJF5fMB4tF+U/9h8xg/pqXlAZdaVLNF34G9Ed+DQdx+
 h3LNiz52HQR6aobpjYv2QMwto0cvILu93TEdRvWUvTdDMfHpQjQN9aQX8I+oMN+7EVf6
 s1JeJWDqRj7xJl+jA/1q2wpJGUehaxyBBXAWOJi/HpIBH/QNRop6cjPYCWXHBxy3lN70
 pTQ4/i03uNIskocbhI5PMyUyF5B8FIXaFkKULXiI0DEwfWawV42zVqXvmlvGZXlU0cpk
 /LOE0JVA2fyK2huqUXRvtSEkSL5TLXWnEsPAKrvbRUTvFrYVqTc9fdISkAWBUALWWhEs
 MB5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BtLhSOVW
Subject: Re: [Buildroot] [PATCH 2/2] package/skeleton-init-systemd: flexible
 reinstalls
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



On 01/10/2023 18:05, Yann E. MORIN wrote:
> James, All,
> 
> On 2023-05-05 00:30 -0400, James Knight spake thusly:
>> The following commit tweaks the `skeleton-init-systemd` package to
>> gracefully handle if a user invokes a reinstall for the package (e.g.
>> when performing development tweaks to the initial skeleton).
>>
>> Signed-off-by: James Knight <james.d.knight@live.com>
>> ---
>> Only a suggestion; feel free to drop.
> 
> I've spent a bit of time on this, and was about to apply...
> 
> However, there are a few "issues" I noticed with it, mostly that
> /etc/fstab should not be used with systemd, but mount units should be

  Really? The mount unit man page [1] says:

"In general, configuring mount points through /etc/fstab is the preferred 
approach to manage mounts for humans. For tooling, writing mount units should be 
preferred over editing /etc/fstab."

I'm not sure if the skeleton counts as tooling or as a human. Hm, probably 
tooling, indeed.


> used, and so /etc/fstab should only contain this one line, so it does

  Well, no, if we say that the skeleton is tooling, it shouldn't contain that 
line at all; instead, there should be a mount unit to remount rw (and no mount 
unit at all for ro).

> not make much sense to have it "reinstallable".
[snip]
>> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
>> index 4076821c0c0429cf90681f4b16be114c44bde282..18ae91f2eea30277805ee82791c62d53f24dca1e 100644
>> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
>> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
>> @@ -18,13 +18,23 @@ SKELETON_INIT_SYSTEMD_PROVIDES = skeleton
>>   ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
>>   
>>   define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
>> -	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab

  The original here _was_ already "reinstallable" because it just overwrites 
fstab. If there is any other package that writes fstab, it's wrong anyway. 
Unless it's done in the overlay or post-build-script, but the overlay/script 
anyway still gets applied after rebuild.

>> +	if ! grep -q "/dev/root" $(TARGET_DIR)/etc/fstab; then \
>> +		echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab; \
>> +	else \
>> +		sed -i "s|/dev/root.*|/dev/root / auto rw 0 1|g" \
>> +			$(TARGET_DIR)/etc/fstab; \
>> +	fi
>>   endef
>>   
>>   else
>>   
>>   define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
>> -	echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab
>> +	if ! grep -q "/dev/root" $(TARGET_DIR)/etc/fstab; then \
>> +		echo "/dev/root / auto ro 0 1" >$(TARGET_DIR)/etc/fstab; \
>> +	else \
>> +		sed -i "s|/dev/root.*|/dev/root / auto ro 0 1|g" \
>> +			$(TARGET_DIR)/etc/fstab; \
>> +	fi
>>   endef
>>   
>>   # On a R/O rootfs, /var is a tmpfs filesystem. So, at build time, we
>> @@ -78,9 +88,9 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>>   	mkdir -p $(TARGET_DIR)/home
>>   	mkdir -p $(TARGET_DIR)/srv
>>   	mkdir -p $(TARGET_DIR)/var
>> -	ln -s ../run $(TARGET_DIR)/var/run
>> +	ln -sf ../run $(TARGET_DIR)/var/run

  IMHO this part is simply a good idea.

  Regards,
  Arnout

[1] https://www.freedesktop.org/software/systemd/man/systemd.mount.html



>>   	# prevent install scripts to create var/lock as directory
>> -	ln -s ../run/lock $(TARGET_DIR)/var/lock
>> +	ln -sf ../run/lock $(TARGET_DIR)/var/lock
>>   	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>>   	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>>   endef
>> -- 
>> 2.40.1.windows.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
