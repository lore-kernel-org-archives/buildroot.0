Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C14CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63576608B7;
	Sun, 17 Sep 2023 18:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63576608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzRvBnmquMX7; Sun, 17 Sep 2023 18:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD1F60E5F;
	Sun, 17 Sep 2023 18:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD1F60E5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0AFD1BF20B
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9A3081F06
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A3081F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Dcq5QX950pj for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 18:59:04 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ED8B81F00
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 18:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED8B81F00
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-321530de76eso108937f8f.0
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694977142; x=1695581942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hSMPU4LSGUkhdOxC8bvQ8Pj1hRDhIxoKA1Gx9KsnJEk=;
 b=nbgVGz9EHOZ9MB1NAzH1yx61DUxZqhL+Ip0jSsSnAl8nM4nC9zURvUWEz7wlPedkor
 2kXWXpT7fbxNrcck2f/yOY0D7KCI2fzpEh9jfKhIyad3Fs38l6OAPhrX1TpRi7QFUfXh
 Y8CPwzBR+e1YY584VYZ3BKel7tvs3xAU9A0ccya09/97BP+C8JxkAhluVuNKXZ6bwDuE
 76O41iBSg4tXzQX6m3aEv/f/7DK5uAfSQB56b00YLld3iH1tcaOhGkzEOQ/V0amzl3L4
 XtZ4vMn4rMDU7eLS1gbt3F1cvt3vnslmVLjpG14oeCy+F3IAkdQU/33+g4tXg45+IJwR
 pjJA==
X-Gm-Message-State: AOJu0YwZfVW3ZI1hcIgkyZ5YYhYkJnXCmaTh5hza7pKkU9Rxr4KfknMV
 MKvQLeAFXxhg5EnANTCPYrz9qgydvCkbqf4IH2Y=
X-Google-Smtp-Source: AGHT+IGVSXRZdUUKzWxYD2+4qnA3pfW/6b5tSIBL2Z+nIk7SIm97OcC97+YegJEv694VNE368wJKhw==
X-Received: by 2002:adf:d20a:0:b0:320:896:5ea8 with SMTP id
 j10-20020adfd20a000000b0032008965ea8mr2766245wrh.19.1694977142320; 
 Sun, 17 Sep 2023 11:59:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 mc17-20020a170906eb5100b009786c8249d6sm5431671ejb.175.2023.09.17.11.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 11:59:01 -0700 (PDT)
Message-ID: <7a4a1ab2-da6c-24aa-0106-3e427627a8a7@mind.be>
Date: Sun, 17 Sep 2023 20:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-5-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-5-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694977142; x=1695581942; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hSMPU4LSGUkhdOxC8bvQ8Pj1hRDhIxoKA1Gx9KsnJEk=;
 b=e15cP33X43RqmS9Su7PebSDZ8MnV2L+EzHSvr9goVi+ngkrfrlaOl4RgHsDt1Cz4LT
 kA7NGo62VkV+HCPxA1uk+tHygffHCBoGhzeq9wBQtB3iHxm1eldDjx0omHNXHPRDA7ls
 vnem7AyanrQwL5hNhExhDNtoZbCVuWWyAQPu/h+R/FLqD1xVshOISqYRNM1J1UBcac+P
 hBX6i9pAANjREQT+kvyMoWCnmOScUF8HeCFh7ZYSUTAhKzCzJ/Mdr3YrrCEkf4h4jyCD
 LMYPW5W61fK1D8qgFtCbvam1ZnrITBgYCiHSP74nS0dmdb7NcpPxTK+tRentIEnzZUrT
 mlSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e15cP33X
Subject: Re: [Buildroot] [PATCH v2 4/5] package/petitboot: enable discovery
 of software RAID devices
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
> Petitboot can support filesystems on software RAID arrays. If mdadm is
> selected, install the associated udev rules to assemble the device.

  Wow, this looks again like something very specific and way outside what we 
normally do in Buildroot. If it's appropriate to do this, I think it makes a lot 
more sense to have this as part of petitboot itself.

  So I suggest to send these udev rules to petitboot upstream instead, and 
install them as part of the package installation.

  Regards,
  Arnout

> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   package/petitboot/63-md-raid-arrays.rules | 41 ++++++++++++++
>   package/petitboot/65-md-incremental.rules | 69 +++++++++++++++++++++++
>   package/petitboot/petitboot.mk            | 10 ++++
>   3 files changed, 120 insertions(+)
>   create mode 100644 package/petitboot/63-md-raid-arrays.rules
>   create mode 100644 package/petitboot/65-md-incremental.rules
> 
> diff --git a/package/petitboot/63-md-raid-arrays.rules b/package/petitboot/63-md-raid-arrays.rules
> new file mode 100644
> index 000000000000..92aec36e69d4
> --- /dev/null
> +++ b/package/petitboot/63-md-raid-arrays.rules
> @@ -0,0 +1,41 @@
> +# do not edit this file, it will be overwritten on update
> +
> +SUBSYSTEM!="block", GOTO="md_end"
> +
> +# handle md arrays
> +ACTION!="add|change", GOTO="md_end"
> +KERNEL!="md*", GOTO="md_end"
> +
> +# partitions have no md/{array_state,metadata_version}, but should not
> +# for that reason be ignored.
> +ENV{DEVTYPE}=="partition", GOTO="md_ignore_state"
> +
> +# container devices have a metadata version of e.g. 'external:ddf' and
> +# never leave state 'inactive'
> +ATTR{md/metadata_version}=="external:[A-Za-z]*", ATTR{md/array_state}=="inactive", GOTO="md_ignore_state"
> +TEST!="md/array_state", ENV{SYSTEMD_READY}="0", GOTO="md_end"
> +ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0", GOTO="md_end"
> +LABEL="md_ignore_state"
> +
> +IMPORT{program}="/sbin/mdadm --detail --export $devnode"
> +ENV{DEVTYPE}=="disk", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}", OPTIONS+="string_escape=replace"
> +ENV{DEVTYPE}=="disk", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}"
> +ENV{DEVTYPE}=="disk", ENV{MD_DEVNAME}=="?*", SYMLINK+="md/$env{MD_DEVNAME}"
> +ENV{DEVTYPE}=="partition", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}-part%n", OPTIONS+="string_escape=replace"
> +ENV{DEVTYPE}=="partition", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}-part%n"
> +ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[^0-9]", SYMLINK+="md/$env{MD_DEVNAME}%n"
> +ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[0-9]", SYMLINK+="md/$env{MD_DEVNAME}p%n"
> +
> +IMPORT{builtin}="blkid"
> +OPTIONS+="link_priority=100"
> +OPTIONS+="watch"
> +ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{ID_FS_UUID_ENC}=="?*", SYMLINK+="disk/by-uuid/$env{ID_FS_UUID_ENC}"
> +ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
> +
> +ENV{MD_LEVEL}=="raid[1-9]*", ENV{SYSTEMD_WANTS}+="mdmonitor.service"
> +
> +# Tell systemd to run mdmon for our container, if we need it.
> +ENV{MD_LEVEL}=="raid[1-9]*", ENV{MD_CONTAINER}=="?*", PROGRAM="/usr/bin/readlink $env{MD_CONTAINER}", ENV{MD_MON_THIS}="%c"
> +ENV{MD_MON_THIS}=="?*", PROGRAM="/usr/bin/basename $env{MD_MON_THIS}", ENV{SYSTEMD_WANTS}+="mdmon@%c.service"
> +
> +LABEL="md_end"
> diff --git a/package/petitboot/65-md-incremental.rules b/package/petitboot/65-md-incremental.rules
> new file mode 100644
> index 000000000000..153d12fe6f7e
> --- /dev/null
> +++ b/package/petitboot/65-md-incremental.rules
> @@ -0,0 +1,69 @@
> +# This file causes block devices with Linux RAID (mdadm) signatures to
> +# automatically cause mdadm to be run.
> +# See udev(8) for syntax
> +
> +# Don't process any events if anaconda is running as anaconda brings up
> +# raid devices manually
> +ENV{ANACONDA}=="?*", GOTO="md_end"
> +
> +# Also don't process disks that are slated to be a multipath device
> +ENV{DM_MULTIPATH_DEVICE_PATH}=="?*", GOTO="md_end"
> +
> +# We process add events on block devices (since they are ready as soon as
> +# they are added to the system), but we must process change events as well
> +# on any dm devices (like LUKS partitions or LVM logical volumes) and on
> +# md devices because both of these first get added, then get brought live
> +# and trigger a change event.  The reason we don't process change events
> +# on bare hard disks is because if you stop all arrays on a disk, then
> +# run fdisk on the disk to change the partitions, when fdisk exits it
> +# triggers a change event, and we want to wait until all the fdisks on
> +# all member disks are done before we do anything.  Unfortunately, we have
> +# no way of knowing that, so we just have to let those arrays be brought
> +# up manually after fdisk has been run on all of the disks.
> +
> +# First, process all add events (md and dm devices will not really do
> +# anything here, just regular disks, and this also won't get any imsm
> +# array members either)
> +SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}=="linux_raid_member", \
> +	RUN+="/sbin/mdadm -I --export $env{DEVNAME}"
> +
> +# Next, check to make sure the BIOS raid stuff wasn't turned off via cmdline
> +IMPORT{cmdline}="noiswmd"
> +IMPORT{cmdline}="nodmraid"
> +ENV{noiswmd}=="?*", GOTO="md_imsm_inc_end"
> +ENV{nodmraid}=="?*", GOTO="md_imsm_inc_end"
> +SUBSYSTEM=="block", ACTION=="add", ENV{ID_FS_TYPE}=="isw_raid_member", \
> +	RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +LABEL="md_imsm_inc_end"
> +
> +SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}=="?*", \
> +	RUN+="/sbin/mdadm -If $name --path $env{ID_PATH}"
> +SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}!="?*", \
> +	RUN+="/sbin/mdadm -If $name"
> +
> +# Next make sure that this isn't a dm device we should skip for some reason
> +ENV{DM_UDEV_RULES_VSN}!="?*", GOTO="dm_change_end"
> +ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="dm_change_end"
> +ENV{DM_SUSPENDED}=="1", GOTO="dm_change_end"
> +KERNEL=="dm-*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
> +	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +LABEL="dm_change_end"
> +
> +# Finally catch any nested md raid arrays.  If we brought up an md raid
> +# array that's part of another md raid array, it won't be ready to be used
> +# until the change event that occurs when it becomes live
> +KERNEL=="md*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
> +	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +
> +# In case the initramfs only started some of the arrays in our container,
> +# run incremental assembly on the container itself.  Note: we ran mdadm
> +# on the container in 64-md-raid.rules, and that's how the MD_LEVEL
> +# environment variable is already set.  If that disappears from the other
> +# file, we will need to add this line into the middle of the next rule:
> +#	IMPORT{program}="/sbin/mdadm -D --export $tempnode", \
> +
> +SUBSYSTEM=="block", ACTION=="add|change", KERNEL=="md*", \
> +	ENV{MD_LEVEL}=="container", RUN+="/sbin/mdadm -I $env{DEVNAME}"
> +
> +
> +LABEL="md_end"
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 9326738aa038..596e801b781c 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -46,6 +46,16 @@ else
>   PETITBOOT_CONF_OPTS += --without-fdt
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MDADM),y)
> +define PETITBOOT_POST_INSTALL_MDADM
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/63-md-raid-arrays.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/63-md-raid-arrays.rules
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/65-md-incremental.rules \
> +		$(TARGET_DIR)/etc/udev/rules.d/65-md-incremental.rules
> +endef
> +PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_MDADM
> +endif
> +
>   define PETITBOOT_POST_INSTALL
>   	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
>   		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
