Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6030C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A25860A72;
	Thu, 28 Jul 2022 19:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A25860A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmUx7q42cQjk; Thu, 28 Jul 2022 19:09:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AE8660A80;
	Thu, 28 Jul 2022 19:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AE8660A80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1431BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1380383054
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1380383054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DWI83OqReLW for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:09:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A9883051
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A9883051
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:09:42 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w5so3301465edd.13
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kq4U2ISJqku+jzEROPBR33f6KesRJUamfDpfgrImIZY=;
 b=3LaIrTY1n0NSJUrOH+0ZpL/kqKztgbK64Kmk47iKWaulEhMLA1EPoHGTMa6hAle1f9
 tMRAZECSU3+qb+bpvv0r6MaHji+ZPUpUGt5xjZTpaFoyT5UTO+95pqLWqY3nlQtd0eur
 RUAh5mfPFEVKnAOM6qU1uC547MrGmFlmKrhHyQyIshKiEa0n10dqE4MfjHzWRMJ2YqMM
 7+5n6B+I5pckiCKLmH+ITj5RIwilP3prqmfdLB2nOeWIctq7sANHJCh7EBw/XgDni/RT
 xzvEwByn7YOYhLtBa+3w76bXuu/PNiDCSAoQWGpbfMuyiS/6ufeUMud68GkOdsQiIgTC
 Ml/A==
X-Gm-Message-State: AJIora8XhzgeN97Qrty1juxwi9/J8sxUozaoj51d5TK1id+HiIIjBaJ8
 o1eUKwewNE27OSbe5WgulN2hVcj/ugq08RGN
X-Google-Smtp-Source: AGRyM1sEIe07o1cKxPQ8xLxffW8aP2H8GTPOakZMWW6kyZDpqvUMHs8eIrYkHJWDU8SEsxuTE5XKig==
X-Received: by 2002:a05:6402:27cf:b0:43a:de0b:9a82 with SMTP id
 c15-20020a05640227cf00b0043ade0b9a82mr348962ede.427.1659035380501; 
 Thu, 28 Jul 2022 12:09:40 -0700 (PDT)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 t11-20020a056402240b00b0043bd2a79311sm1183388eda.37.2022.07.28.12.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 12:09:40 -0700 (PDT)
Message-ID: <ee71cbb7-223d-2803-fbe6-7efd9750a043@mind.be>
Date: Thu, 28 Jul 2022 21:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220222102211.74573-1-nolange79@gmail.com>
 <20220222102211.74573-4-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222102211.74573-4-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kq4U2ISJqku+jzEROPBR33f6KesRJUamfDpfgrImIZY=;
 b=dsUucATN8V4o+HJ/AYNTAV+fOods3IKzklgYcdHpEe7/jkkckBP0Fd+BfuUEDpge15
 7++Bs7jBc81yJnjm+XogifbJl7ljnN/URanEkkxbh6xmVdp8LEM45Xcai30zeyL4aaEZ
 7oge2o1gjDgdH717whznMFY3V6ac6RKXuDBRq9wjZo8V2mXCKqqm2UOOk3oZusb35cqT
 CvinCGbBLHytcuK1n9gv5RAbjKlQgOud1UOy8wbZ8aM/Rm25K+lk0v+Q34lQrKN/+OcO
 qrbyJg+yyLuMaN+dPaB/YTFpvT0Olf2j/+i7vqiCUQ/WdLsGIqWr3WDx0KFAxcQcWPwq
 4+PQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dsUucATN
Subject: Re: [Buildroot] [PATCH v3 3/7] package/systemd: use current tool
 for generating HWDB
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 11:22, Norbert Lange wrote:
> udevadm has been deprecated for a while (for building the DB),
> systemd-hwdb should be used in its place.
> 
> this tool further has a switch to generate the database in
> /usr which is a better place for a one-time created file
> than the default /etc/udev.

  This is one thing.

> 
> The HWDB source files have drop-in directories, which means
> even if disabled in this package, other packages or users
> could drop in stuff. So always delete those

  And this is something else. So I split the patch in two.

  It also lead us to observe that:

- there's some leftover code in eudev.mk that can be removed;
- we should do the same in eudev (i.e. also delete /usr/lib/udev/hwdb.d) - or 
rather, we should do the same regardless of the device manager used.

  I'm going to send separate patches for those. Especially the second I'm not 
100% sure of, but it seems weird to not delete them if there's no hwdb.


  Regards,
  Arnout


> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> 
> ---
> v1 -> v2
> -   fix removal of service
> v2 -> v3
> -   see https://lists.buildroot.org/pipermail/buildroot/2020-July/286310.html
> -   use systemd-hwdb with --strict option
> -   split removal of service in separate patch
> -   improve commit message
> -   always delete de HWDB source directories
> ---
>   package/systemd/systemd.mk | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b07fac27d4..d2c28b5b60 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -307,13 +307,9 @@ endif
>   ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
>   SYSTEMD_CONF_OPTS += -Dhwdb=true
>   define SYSTEMD_BUILD_HWDB
> -	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
> +	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --strict --usr
>   endef
>   SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
> -define SYSTEMD_RM_HWDB_SRV
> -	rm -rf $(TARGET_DIR)/$(HOST_EUDEV_SYSCONFDIR)/udev/hwdb.d/
> -endef
> -SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_SRV
>   else
>   SYSTEMD_CONF_OPTS += -Dhwdb=false
>   endif
> @@ -725,6 +721,11 @@ endef
>   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
>   endif
>   
> +define SYSTEMD_RM_HWDB_DATA
> +	rm -rf $(TARGET_DIR)/usr/lib/udev/hwdb.d/ $(TARGET_DIR)/etc/udev/hwdb.d/
> +endef
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_HWDB_DATA
> +
>   define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
>   	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \
>   		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
> @@ -814,7 +815,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	-Dsysusers=false \
>   	-Dtmpfiles=true \
>   	-Dimportd=false \
> -	-Dhwdb=false \
> +	-Dhwdb=true \
>   	-Drfkill=false \
>   	-Dman=false \
>   	-Dhtml=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
