Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1617BECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A8C41A39;
	Sat, 17 Sep 2022 20:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A8C41A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Qb5gL-YHGyi; Sat, 17 Sep 2022 20:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 218FB41A42;
	Sat, 17 Sep 2022 20:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218FB41A42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1311BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B0D41A42
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B0D41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dq9pVLrEVAjT for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87A541A39
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87A541A39
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:17:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t14so41223908wrx.8
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RH/jrDQ0ItFHtnwJv0a7F26zjfiVw0A+9j+8tUTQnPA=;
 b=h2f3P+p+zia9Nin1/6alpF9ij+C24Xcs9eGYNfioV1fZ+VQhd8vioeTU8oimI3K1S5
 nRrBx5IbWE6PC4+h2H717ixWPQAgBeEyhDOUuFtRtoGk/9MM9T6zj+Wh9RWF1snUvQuJ
 nCTfvmoZnHubgRSCXvC/YUJO2aHAJjjKehPmDXiZb+7FBbqwoGc5t7fqYTFAg268QISd
 sDJEDRKF0jwZEEfNBIXnsOZTGOQRBvq+iXMQBctOIK/hF5XaiAXrYzRaPRaCUyzWpFeu
 2JHvQeMsy1yzXuU+d7CgcD6FoHrzA9dYEL6MT466p8xhK7QCZyNVvrTIn61HdYmw6ae3
 45Vw==
X-Gm-Message-State: ACrzQf2tlwTpKx+xJ+mVitRJKAA9oCXGmTaYkv38g5xnilUhzwchuofH
 HkmPa2M/YyhOotsPc/STITRibw==
X-Google-Smtp-Source: AMsMyM4mamyoi046+s20KgXpDxkr6aQ2JXkGeXUzROuirFHQ4E2EmXH19eWm6QTvJs+FwcvFS64x6A==
X-Received: by 2002:a05:6000:184d:b0:22a:7428:3ae8 with SMTP id
 c13-20020a056000184d00b0022a74283ae8mr6161830wri.441.1663445858799; 
 Sat, 17 Sep 2022 13:17:38 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 z9-20020adfd0c9000000b0022a839d053csm8471451wrh.98.2022.09.17.13.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:17:38 -0700 (PDT)
Message-ID: <55b0aae8-4e00-990b-2f98-abbb4437c29e@mind.be>
Date: Sat, 17 Sep 2022 22:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <417c53083693347f5c22298c49c8ff9df1f35d0f.1660931225.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <417c53083693347f5c22298c49c8ff9df1f35d0f.1660931225.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RH/jrDQ0ItFHtnwJv0a7F26zjfiVw0A+9j+8tUTQnPA=;
 b=iArpOd3XPomXnjgr/OLLO/jZu4N6SCwLmhqquzAJqZ63lizYq7JwOcOW21KyWgjBAj
 k5duGEcmuqN2+njGbBW7cOqxWbmk0ny0GbsBJBbVy3jzQY5kdb8vqRqFmMfh7Ydo/2Is
 HIphNvmDRYzIstCfyuUCB0kC6TtycR2ixvZBnlgThTYVUepb44htxOVtJL1DiskVXFzR
 awKMzycGXaOQ3507L212RFSJCGSpN/1RYyw8TUpc3unfnr+8uHC7ofy0I6ZIhab9k8+M
 s2H3e6GC64eCftxDytq+3Yyyn7QUj/umpqLq4ZCzH99eDnUJw/AKXeWC9epr+pqESC1Q
 nG+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iArpOd3X
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
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2022 19:51, Yann E. MORIN wrote:
> It is not unusual that projects can target multiple boards, and in
> such cases, a lot is shared between boards and only the low-level
> stuff differ.
> 
> Allow users to specify more than one dracut config file to cover
> tose cases.
> 
> dracut does not accept more than one config file with the -c option,
> but it can load more than one from a directory with --confdir. So,
> we copy all the config files to a temporary directory and se that as
> --confdir. However, we can't drop passing -c, or dracut would read
> the system-wide /etc/dracut.conf (not sure if ${prefix} is even used),
> which we do not want. So, we use an empty file as -c; /dev/null comes
> in handy as an empty file.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
> Cc: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   fs/cpio/Config.in | 12 +++++++-----
>   fs/cpio/cpio.mk   | 19 ++++++++++++++-----
>   2 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> index 861e9a929e..94a826f9e4 100644
> --- a/fs/cpio/Config.in
> +++ b/fs/cpio/Config.in
> @@ -29,13 +29,15 @@ endchoice
>   
>   if BR2_TARGET_ROOTFS_CPIO_DRACUT
>   
> -config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
> -	string "dracut configuration file"
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES
> +	string "dracut configuration files"
>   	default "fs/cpio/dracut.conf"
>   	help
> -	  Dracut configuration file. It determines which parts of the
> -	  rootfs get included in the cpio image. See dracut.conf(5) or
> -	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
> +	  Space-separated list of Dracut configuration files. They
> +	  determine which parts of the rootfs get included in the
> +	  cpio image. See:
> +	    dracut.conf(5)
> +	    https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
>   
>   	  The default configuration file is suitable for busybox init.
>   	  It doesn't, however, pivot_root into a full rootfs.
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index fa66b1c710..d671c337df 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -50,9 +50,14 @@ else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
>   
>   ROOTFS_CPIO_DEPENDENCIES += host-dracut
>   
> -ROOTFS_CPIO_DRACUT_CONF_FILE = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE))
> -ifeq ($(BR_BUILDING):$(ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
> -$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
> +ROOTFS_CPIO_DRACUT_CONF_FILES = $(call qstrip,$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES))
> +ifeq ($(BR_BUILDING),y)
> +ifeq ($(ROOTFS_CPIO_DRACUT_CONF_FILES),)
> +$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
> +endif
> +ifneq ($(words $(ROOTFS_CPIO_DRACUT_CONF_FILES)),$(words $(sort $(notdir $(ROOTFS_CPIO_DRACUT_CONF_FILES)))))
> +$(error No two dracut config files can have the same basename, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES setting)
> +endif
>   endif
>   
>   ifeq ($(BR2_LINUX_KERNEL),y)
> @@ -63,10 +68,14 @@ ROOTFS_CPIO_OPTS += --no-kernel
>   endif
>   
>   define ROOTFS_CPIO_CMD
> -	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
> +	mkdir -p $(ROOTFS_CPIO_DIR)/tmp $(ROOTFS_CPIO_DIR)/confdir
> +	$(foreach cfg,$(ROOTFS_CPIO_DRACUT_CONF_FILES), \
> +		cp $(cfg) $(ROOTFS_CPIO_DIR)/confdir/$(notdir $(cfg))
> +	)
>   	$(HOST_DIR)/bin/dracut \
>   		$(ROOTFS_CPIO_OPTS) \
> -		-c $(ROOTFS_CPIO_DRACUT_CONF_FILE) \
> +		-c /dev/null \
> +		--confdir $(ROOTFS_CPIO_DIR)/confdir \
>   		--sysroot $(TARGET_DIR) \
>   		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
>   		-M \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
