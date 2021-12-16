Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E60560807;
	Thu, 16 Dec 2021 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBjBHguAINrk; Thu, 16 Dec 2021 20:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D21660EB9;
	Thu, 16 Dec 2021 20:49:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6E71BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1869240298
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MR8QJRpT06DE for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:49:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D05640198
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:49:47 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o20so39464eds.10
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1GV+i89Lcvj+LX1B7Z6n1v+x5o5apaXF3q7FMw9VGAs=;
 b=BS7aEzmP9yvrin03gY28G6Op25zQFRWMbJiOpHUzNr3C1xdj2mKM9aVPMVC1oQebox
 KknB5RrzqaP5Q/ogrHDE82ODQh66EufhnZaUGAlAq5xk+gfCJlk/D42SyNdezoyCECnc
 PB0oRMDV9xHo9AtXVn65M3ecc55Nh1uIAMx+VxHE92LExhck7VFgofOuk7HMbYjZpb3d
 9uzeaif6qjI/xt+MKMxnVL0npKarUUqR9lY1FhSemRr8IjR5+4KlEgNDjpetxsMOlCtg
 lOgYTtpIUL9JmIRyUR4g4KtuZn4ElGvd/9wWkGs27YR1CtPSIDuwSPYPrAOH0F24arcc
 LUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1GV+i89Lcvj+LX1B7Z6n1v+x5o5apaXF3q7FMw9VGAs=;
 b=Z0qTTv177gyuouRD9q3oVdoIC3Bdn4fAO7gm/CJhB6NCLSrtDXXncnEWH4P2XskJCB
 eE7UXb7sXKIW25ZMi9ji4Ka1sC25UTXI0eaEFN/RjIWa/kt7xuJa6oO287RZfidb7nFh
 1bIXof2Ac5gFwoXSf3LiqimQQ/ZcsI39OWKhZGPRegqdsvGUJZC2u8ZP/lKAjBLvD7JU
 cAUpQjb3yJWJ+KFrhh+jWZZfQAZId8jVdCtq39kaeO1geOfbhY0rBIdAb+nsvxQnNjAO
 /trneLCsZlgqJO1elmgg3NJMhfkp5pFwAiw5npW/KwECBUZmvHiuYJVfi4Aweyh8gueW
 W4cA==
X-Gm-Message-State: AOAM533nw74841OBDf3GCzYztlqbnlsFCzpbTOVMkxVwxgacA1FAD6wz
 /dwmrVQSIaWDMWBwJjVdrqiAlEQi4I+qIg==
X-Google-Smtp-Source: ABdhPJxsA1Ghl1erUnjO9HLTBWOdbBhZbY0/v09ANULWPec9DO4VFs4C8XCfLoC+/VwnA0fVP4Pa1g==
X-Received: by 2002:a17:907:9801:: with SMTP id
 ji1mr1038442ejc.267.1639687785863; 
 Thu, 16 Dec 2021 12:49:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qw27sm2207316ejc.101.2021.12.16.12.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:49:45 -0800 (PST)
Message-ID: <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
Date: Thu, 16 Dec 2021 21:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215180021.274991-3-thierry.bultel@linatsea.fr>
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 19:00, Thierry Bultel wrote:
> Adds an option to build an initramfs image,
> using the dracut host tool.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
>   fs/Config.in        |  1 +
>   fs/dracut/Config.in | 13 +++++++++++
>   fs/dracut/dracut.mk | 55 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 69 insertions(+)
>   create mode 100644 fs/dracut/Config.in
>   create mode 100644 fs/dracut/dracut.mk
> 
> diff --git a/fs/Config.in b/fs/Config.in
> index eee5e26bb2..3938f3b9a7 100644
> --- a/fs/Config.in
> +++ b/fs/Config.in
> @@ -5,6 +5,7 @@ source "fs/btrfs/Config.in"
>   source "fs/cloop/Config.in"
>   source "fs/cpio/Config.in"
>   source "fs/cramfs/Config.in"
> +source "fs/dracut/Config.in"
>   source "fs/erofs/Config.in"
>   source "fs/ext2/Config.in"
>   source "fs/f2fs/Config.in"
> diff --git a/fs/dracut/Config.in b/fs/dracut/Config.in
> new file mode 100644
> index 0000000000..ee4220def8
> --- /dev/null
> +++ b/fs/dracut/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_TARGET_ROOTFS_DRACUT
> +	bool "Invoke dracut to make an initramfs"
> +	default n

  Don't add "default n", it's the default :-)

> +	select BR2_PACKAGE_HOST_DRACUT
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	help
> +	  Builds an additional initramfs using dracut. This can be useful to create a recovery system, for instance.
> +	
> +if BR2_TARGET_ROOTFS_DRACUT
> +config BR2_TARGET_ROOTFS_DRACUT_CONF_FILE
> +	string "configuration file"

  Is there a possibility for a default configuration file?

> +endif
> +
> diff --git a/fs/dracut/dracut.mk b/fs/dracut/dracut.mk
> new file mode 100644
> index 0000000000..9c91150e82
> --- /dev/null
> +++ b/fs/dracut/dracut.mk
> @@ -0,0 +1,55 @@
> +################################################################################
> +#
> +# dracut to archive target filesystem
> +#
> +################################################################################
> +
> +ROOTFS_DRACUT_DEPENDENCIES = host-dracut host-uboot-tools
> +
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> +
> +define ROOTFS_DRACUT_ADD_INIT
> +	if [ ! -e $(TARGET_DIR)/init ]; then \
> +		ln -sf sbin/init $(TARGET_DIR)/init; \
> +	fi
> +endef
> +
> +else
> +
> +# devtmpfs does not get automounted when initramfs is used.
> +# Add a pre-init script to mount it before running init
> +# We must have /dev/console very early, even before /init runs,
> +# for stdin/stdout/stderr
> +define ROOTFS_DRACUT_ADD_INIT
> +	if [ ! -e $(TARGET_DIR)/init ]; then \
> +		$(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
> +	fi
> +	mkdir -p $(TARGET_DIR)/dev
> +	mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1
> +endef
> +
> +endif # BR2_ROOTFS_DEVICE_CREATION_STATIC

  The above is the same logic as in cpio.mk. It would be better if we could 
refactor that to a common place.

> +
> +ROOTFS_DRACUT_PRE_GEN_HOOKS += ROOTFS_DRACUT_ADD_INIT
> +
> +define ROOTFS_DRACUT_CMD
> +
> +	mkdir -p $(@D)/tmp
> +	rm -rf $(@D)/tmp/*
> +
> +	DRACUT_LDD=$(TARGET_CROSS)ldd \
> +	DRACUT_INSTALL="$(HOST_DIR)/lib/dracut/dracut-install"\
> +	dracutbasedir=$(HOST_DIR)/usr/lib/dracut \

  It would be nice if all of the above could be patches into host-dracut, so 
when called from a post-image script, it's not needed to pass all of that in.

  You should also check then if it gets properly updated by 
support/misc/relocate-sdk.sh (I think yes).


> +	dracutsysrootdir=$(TARGET_DIR) \
> +	$(HOST_DIR)/bin/dracut \
> +	--kver $(BR2_LINUX_KERNEL_VERSION).0 \

  This should be indented with a second tab.

  Also, you can't use BR2_LINUX_KERNEL_VERSION because that's only available if 
BR2_LINUX_KERNEL=y. So either you have to depend on that, or you need to add an 
option to Config.in to be able to set it. Also, you should probably use 
LINUX_VERSION_PROBED instead (at least if you need an actual kernel version, and 
not some commit hash or something). Also, what is the .0 appended to it?


> +	-c $(BR2_TARGET_ROOTFS_DRACUT_CONF_FILE) \

  We normally have a check in the makefile to exit immediately if the option is 
not set. See for example in linux-backports. Note that it needs to be in a 
BR_BUILDING condition.


  Regards,
  Arnout

> +	--tmpdir $(@D)/tmp \
> +	-M \
> +	--force \
> +	--keep \
> +	$@
> +
> +endef
> +
> +$(eval $(rootfs))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
