Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00144C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2630849A4;
	Sat, 23 Jul 2022 12:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2630849A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYVjetmi3gLe; Sat, 23 Jul 2022 12:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C003E84994;
	Sat, 23 Jul 2022 12:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C003E84994
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E075B1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DD160FE0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9DD160FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74PiV65_quXO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:42:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3C060FDD
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED3C060FDD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:42:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l15so5750495wro.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X9SRY7VNwn4PooSWvCKAyFmLB6WU2cEI9NFaS9Qos3Y=;
 b=l27FAlxuir2x1+8fuz85km4ynUsGL0sqsd6fVFECOOapeMVIFX5yxl37gTIfzEJ/Jo
 i909WALdlfzKeGDMXi68kqjwt106kkjmuIeJE6r+SV+5hKgNNKxkZ/vGEx+NroBLN+3I
 pPC9qOuzqUesiyBva0Ddcrlz1kM30lrW1F3U9SgjjNw5LSzKk6O1jgNxBKUZtd5SbvlW
 f/Vr9QgCxFJFVZ8Vy6tm+P5dTcFIpm9daM9wuTQOj9mpz1G6aTqTJKFxO3u4xdzLWQiu
 CTEZeAGJF821KU+yy3WEPBvAxjmnZLK8A11MhDwpYE+WzXeGxVm9llgvz36F8V4VztLp
 9pCw==
X-Gm-Message-State: AJIora+HXjA2lEnKhFwVjt5P5mpIQ8L0n/z3+rypfw6jQHzdZ1Pkrq0j
 AHQUHnBZSAJKrovoC0vSnvUMRw==
X-Google-Smtp-Source: AGRyM1vzee0MMF/LtLCXC440rvxy3CIoNS8vidgWtyL+DlUoFPnVPU3YTlefebcI+leJ8wXac/kwpw==
X-Received: by 2002:adf:eb8f:0:b0:21e:3b49:5b8e with SMTP id
 t15-20020adfeb8f000000b0021e3b495b8emr2748231wrn.258.1658580152110; 
 Sat, 23 Jul 2022 05:42:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5d498b000000b0021e42e7c7dbsm7075801wrq.83.2022.07.23.05.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:42:31 -0700 (PDT)
Message-ID: <2569cf83-d180-41ea-ad10-d053528d462d@mind.be>
Date: Sat, 23 Jul 2022 14:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Michael Zimmermann <sigmaepsilon92@gmail.com>, buildroot@buildroot.org
References: <20220720152440.1568667-1-sigmaepsilon92@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220720152440.1568667-1-sigmaepsilon92@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=X9SRY7VNwn4PooSWvCKAyFmLB6WU2cEI9NFaS9Qos3Y=;
 b=fZjDyybBkDjVHrRLJ6TQgD9oOabeflW967DlYOTOSiFLmiNTxdG39tg1O+9y/cAxD2
 dP/k6O2r39sLpIoKiuDvMLNZRkENRhorgIBeDg77RrCs3+RG5r8eqBJCBEmJjKcadDxp
 Arx+empUOxBhMYUeecAtCvnDKsQ/gfDU1nMdOdW8Sowus3BBxvAast3zVcoZ6gbzoIBU
 CmQ0+ddQ7bDakU85QFIFmxJh7JxWi9OxKkQGaUZYTi5Z7ehbVmJ1BLlPqIqtQgWKobrX
 DUTfJDQWpTdAlLkbw7FcBxwhs8nWiDiQnwYX84eq6ksr3zJP5rwTukjG7RoezM/UtSNY
 PzNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fZjDyybB
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: fix cross-compilation
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
Cc: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 17:24, Michael Zimmermann wrote:
> Currently, the kernel module gets built using the host-compiler(from the
> user distro, not from buildroot). 

  That shouldn't happen. The kernel-module infrastructure passes 
LINUX_MAKE_FLAGS in the environment already. And if the module were built during 
the userspace build stage, that one already has the cross-compiler as well 
through the autotools infrastructure.

  Can you give a bit more detail about the config where you get the issue, and 
how exactly it fails?

  Regards,
  Arnout

> That might work when target and host
> arch are the same but during cross compilation that results in the
> message `Unable to build an empty module.` because tests for compiling
> modules fail due to missing headers.
> 
> Signed-off-by: Michael Zimmermann <sigmaepsilon92@gmail.com>
> ---
>   package/zfs/zfs.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> index 07ce3295ec..30f966bdeb 100644
> --- a/package/zfs/zfs.mk
> +++ b/package/zfs/zfs.mk
> @@ -57,6 +57,9 @@ else
>   ZFS_CONF_OPTS += --disable-pam
>   endif
>   
> +ZFS_CONF_ENV += $(LINUX_MAKE_FLAGS)
> +ZFS_MAKE_ENV += $(LINUX_MAKE_FLAGS)
> +
>   # ZFS userland tools are unfunctional without the Linux kernel modules.
>   ZFS_MODULE_SUBDIRS = \
>   	module/avl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
