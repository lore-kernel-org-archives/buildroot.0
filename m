Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A5CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 021A960E8D;
	Sun, 17 Sep 2023 19:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 021A960E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yt3CDv3gcj0u; Sun, 17 Sep 2023 19:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F7E60AAD;
	Sun, 17 Sep 2023 19:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F7E60AAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B989A1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DD86410DC
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD86410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvF_mYcaAtMX for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:01:47 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59755410D5
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59755410D5
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50300e9e75bso2000406e87.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694977305; x=1695582105;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXqrL9AbhCdJxylmB76ExbtgvZUXbXqKCr8slLpuoKE=;
 b=jnUThwY03sA+oLtQHcbr1gSHFc0io0T8iDAG8/x8jUGPQXWjhSZPQwrgG/ZSI5z+cM
 nnMtp+kk7afUiC+HGOx9R/K/Ftd0Hkz2iGR2FYA+UdqiCxFPN1QZ80OWVE2i4kHPqHU3
 +uiIS7eaVIYlHEr0EzQtnzoTq0Y1MQwyiT5jnuQXueS8vTcjrizZJUQp2hLW6UMpOBNm
 N7N4fZvL3584XKkz+UX4/Jc0N/UU2BCGfeqgo/QVeltWQeloWwedaBPfD2g+smSty5Lt
 5ApgGclpHRQ8O/2hJUHHDiIz2NvGhBpBgZCSnV50WV36ku2QBPvq2N+Br3vSGIZwbrG0
 q5aQ==
X-Gm-Message-State: AOJu0YxJsVxFQHQBaxCy8uradnpIp949BNtZgnsZirMIHDpbEiFEL41e
 lpIvDqYdxOC3sNKyzcYBEoMX1A==
X-Google-Smtp-Source: AGHT+IH3muiValhmjpoopntXu+rFJv6F1PEXblL2I7DXMteXzwImFX5BV5hg9ZV8kCEmN6et3HoGVA==
X-Received: by 2002:a05:6512:2fc:b0:4f8:77db:1d9e with SMTP id
 m28-20020a05651202fc00b004f877db1d9emr5416953lfq.12.1694977304889; 
 Sun, 17 Sep 2023 12:01:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a056402019200b00527e7087d5dsm4962547edv.15.2023.09.17.12.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 12:01:43 -0700 (PDT)
Message-ID: <65559c37-a6d0-9018-0518-53b5a40883b9@mind.be>
Date: Sun, 17 Sep 2023 21:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-6-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-6-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694977305; x=1695582105; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fXqrL9AbhCdJxylmB76ExbtgvZUXbXqKCr8slLpuoKE=;
 b=InFw55/a8dmW9yFVJIq5260fgalMPYr+41Oo04fkCcCJ5eujfaHa0TIIDWJg8OC9ay
 eU0oU7qYq0xwJqGJmLv1mVOu1zHxqr2GVZVa1CMIuTRXIwOTMbuTIhT+7iQUfpeGz3nF
 mpLqYzycCFUCtTmczKBnXZw/pIVtg5uhn01gfBXv2Z543vdfDCgBqbYTT7IFJI5b5Kpu
 /6Mn63gWdcxasM12LAoweMnxo5cro2IebJ+kReanGjsfmo76AalRnA3FGk+ebZDs4yOM
 /+dqkJB9I8au5ncaEsjuUN+yAxfahK9D+tmEoFCTzvecZAXUc5oXa1FJkvoVPCDEA6Ie
 dZBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=InFw55/a
Subject: Re: [Buildroot] [PATCH v2 5/5] package/petitboot: enable discovery
 of SCSI devices
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/09/2023 17:58, Reza Arbab wrote:
> It's likely that the "sg" kernel driver needed to scan SCSI devices is a
> module. Install a udev rule to load it automatically when devices are
> present.

  This is completely independent of petitboot. If the system is likely to have 
SCSI devices and scsi generic is built as a module, it's up to the user to make 
sure that module is loaded.

  Regards,
  Arnout

> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   package/petitboot/66-add-sg-module.rules | 2 ++
>   package/petitboot/petitboot.mk           | 2 ++
>   2 files changed, 4 insertions(+)
>   create mode 100644 package/petitboot/66-add-sg-module.rules
> 
> diff --git a/package/petitboot/66-add-sg-module.rules b/package/petitboot/66-add-sg-module.rules
> new file mode 100644
> index 000000000000..ae18d28c570e
> --- /dev/null
> +++ b/package/petitboot/66-add-sg-module.rules
> @@ -0,0 +1,2 @@
> +# load modules to scsi disks, if they aren't in kernel
> +SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST!="[module/sg]", RUN+="/sbin/modprobe sg"
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 596e801b781c..590b58e9c71a 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -63,6 +63,8 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
>   	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
>   		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/66-add-sg-module.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/66-add-sg-module.rules
>   	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>   		$(TARGET_DIR)/etc/init.d/S15pb-discover
>   	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
