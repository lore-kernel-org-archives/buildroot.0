Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320FAECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D22E640198;
	Sat, 17 Sep 2022 20:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22E640198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyjFr6X4DbOP; Sat, 17 Sep 2022 20:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 028314011F;
	Sat, 17 Sep 2022 20:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 028314011F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 572611BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F9BC4016B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F9BC4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dF_HpjCnAsPf for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4AA340119
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4AA340119
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:05:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 v185-20020a1cacc2000000b003b42e4f278cso1953191wme.5
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Cf9Fu2hqFkq7qyJD/tpPTcrRF/ZMzpjWCgtRF9ODYiU=;
 b=MQi9qZQV9HJXgcXbXyZLUNLIDntHD24Q2BtYxVMxu0oNkAMbZ7i9YfG0nETmk6aaki
 oLd/eBqQqNy+Z9cmyfghCinjt4+W7zvfiD5547ZIqoRyEOYGwUnjoWrvbXeWpLYaKVln
 zKsssT7bLvHiF2GmQ2LvdX6VKHUQLKsBRpNVxlvs4nOply19WG7r53DXFwUT6BA8JZx5
 yv0Hc0myQUANkt9gsiOhJefPygE0UmOhCR4JoVdBMkTTbKJkBIzB+g86eD9u0ilpRKdC
 0HwQ5V4DaC7/Ktl6luYerKFA6GvCqcMDg96l2P6Zs7Q28K3phXsEgyevnAqkikffW83R
 T7fA==
X-Gm-Message-State: ACgBeo3DESs7UmQKDWAapz7atTp8FGeTVMOeB4nWu+cZKY/Z6+FwkqDb
 Xx7SoQodNNzMlM//Goj3TX65OQ==
X-Google-Smtp-Source: AA6agR7lc3SJBjsgzFSiM5GyGY5xULkbzACqjrQizZgwVg+6sSm1C+uWWYTe5OhSECndayVnohqF/w==
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id
 f22-20020a7bc8d6000000b003b4868bafc3mr13887987wml.66.1663445139818; 
 Sat, 17 Sep 2022 13:05:39 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adff2cd000000b00228dcf471e8sm8924208wrp.56.2022.09.17.13.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:05:39 -0700 (PDT)
Message-ID: <5762dfb5-832f-a075-3be9-7d32cb82b661@mind.be>
Date: Sat, 17 Sep 2022 22:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Zvi Vered <veredz72@gmail.com>, buildroot@buildroot.org
References: <CABRndgyUttoHU1dUOacMsbKFWTBvUn+Fr99WmQ57EC0CoX4JCA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CABRndgyUttoHU1dUOacMsbKFWTBvUn+Fr99WmQ57EC0CoX4JCA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Cf9Fu2hqFkq7qyJD/tpPTcrRF/ZMzpjWCgtRF9ODYiU=;
 b=h46jmwiFh8pZSTIE7DC5DJT0mn1Bm6A+blQ1U8XznovhL8XZt21UkU0Lq82IA66Ssy
 QgzyAUvIflCAgXVmRUkijLedB+LaZ6ZTTf/3fz0Lfo/ruDPD1fZoH14xe1b7mTgu9Qr2
 xgODh4byLKRpve1zq2A90EanNzdDso5DfVSr8BD2khoDBGhDQ06Jxv6aDCpcZtdWk3qJ
 uBisZQzYRy+ct5KvB5uxZHhWgad9iQWSE1LYgruANv+3oSCRumfdYFcv0Ioh0YY5zHDk
 EeOqUvHhW8Juz3LKImaG9FtA+DoZnru9vuQShp/dNwdnjscQ6zhBS77IUIkjV2tFBtNm
 DwSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h46jmwiF
Subject: Re: [Buildroot] 2022.02.1: read-only file system
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



On 11/09/2022 19:58, Zvi Vered wrote:
> Hello,
> 
> I'm using buildroot 2022.02.1 under x86 embedded SBC.
> The root file system is located on the on-board disk.
> The boot argument contains 'ro' (checked with /proc/cmdline after login) but the 
> disk is not read-only.

  There is a buildroot config option BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW which 
defaults to enabled. It will remount the rootfs to read-write as part of 
processing /etc/fstab. So you should probably turn that option off. Note that if 
you use systemd, you'll need to do a clean rebuild before the option is taken 
into account.


> When I used the same boot args with busybox, it worked fine.
> Of course with busybox I had to tailor all other mandatory files and directories.
> 
> I need read-only rootfs to defend this embedded system in case of power-down / 
> cold reset.

  Perhaps you're better off then to use an actual readonly filesystem, like 
erofs or squashfs? You have to make sure the corresponding kernel options are 
enabled, of course.

  Regards,
  Arnout

> 
> Beyond the default configuration, the rootfs also contains ntp client, httpd, 
> pci tools.
> 
> Thank you,
> Zvika
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
