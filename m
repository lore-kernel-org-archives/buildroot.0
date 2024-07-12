Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA48BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF1783F70;
	Fri, 12 Jul 2024 22:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2IwyMzK22Iw; Fri, 12 Jul 2024 22:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88C7B83F77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88C7B83F77;
	Fri, 12 Jul 2024 22:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB15B1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B410E83F77
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DY0shKiZGo7w for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B29D083F70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29D083F70
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B29D083F70
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:02:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso16611775e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720821725; x=1721426525;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ETDZzh+Xx970Kiy08q5suKkPgAGR7e6DHRGxFg0pGRU=;
 b=lqLT81bf+9GUGYFuaLsMWcVihSuyLFRh2B8X+QtXPQqBJrWcueli+eeAQPTYXasUa9
 w/2iWJft+HgJwLJsfa0WWs7kmxRvBWtDxSudAQLvqaCAXXGyQNtPpxCZvpDrXgzwfEy6
 J7MLuqZQDYg4VL4aMtnd1bxN64PmhWSjJVvYuQwQ+/ZIeS5ePuqPcr1HKrMIp8QP4/uQ
 R4/pMae5bBtkKm9WQLsrXNaqZVm0bN8kmdWzNBuSad9T8nkSAEajCcgwuB9riNPC69MA
 BU3yyuThUrgBkgj2nC+3Y3G0SUMYKNv6AVk20qHGIfYzDrAFd58iNkAoZ8xV9ygbEcRt
 RtEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrcQ+7MBbIDnqhRUHfClFQefKFDXBy7n1RPDqrRvpmy4ZKMaPr2AvDyPxwE2k+zAx4WsX7ThCFVn4iwsAdshPscjBEv947NA==
X-Gm-Message-State: AOJu0YxL7MYYYi0GvXfp6OuHGKARoE3JmoekVVAuPJ/DKCAcBWft1KPK
 F/ag/iEELeHAmxGDD1c7Nil5xUwbwB3WbLhg6f/5GazeX5mVPvCZppAKousYzqk=
X-Google-Smtp-Source: AGHT+IG/zIKJnrr6CDY27+yQhx70v7zVWfzU82Py+4QI9UmDzISWsM7X5ASbXS/sq7PnFDivE4agog==
X-Received: by 2002:a05:600c:684:b0:426:6822:855 with SMTP id
 5b1f17b1804b1-426708fa827mr84195515e9.36.1720821725320; 
 Fri, 12 Jul 2024 15:02:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276c52sm34986325e9.22.2024.07.12.15.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:02:04 -0700 (PDT)
Message-ID: <a4d86acb-424f-4a74-a03b-7461299d1a3f@mind.be>
Date: Sat, 13 Jul 2024 00:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
 <20240207175135.1532037-4-arbab@linux.ibm.com>
Content-Language: en-GB
In-Reply-To: <20240207175135.1532037-4-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720821725; x=1721426525; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ETDZzh+Xx970Kiy08q5suKkPgAGR7e6DHRGxFg0pGRU=;
 b=MJEMEreyQOsSoJDbowz1LbBgv/R8B12+ebBYC7tcjGjpkkHUasOviQexwQFP+AEE/r
 NnHK/7P7arGyuu6nLYgSVdPMhmKLyDA2O/gkd33p1gy3t2T3gz2bdSwwSE/ygrpvQ+Cd
 zV4LzpMVN1VWSdSiG5UafVhkwx5z3baxmuQPmsHk2s9d38N7Rmm/GvxxDtK0NkQQ54UO
 ao7nkwDNUSo2j5zXY89hqIsDDX+S7SrJvQXR7UbWRYFbvj4XJqxIYhaEtvTMGMt0BsYK
 xmBldoHpkzkHRcr3040Lmq4GLpWT8s93ju39wOk/fvsvznaG0i4Zp6gHRWBGgIVrOxwM
 nrog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MJEMErey
Subject: Re: [Buildroot] [PATCH v5 3/5] package/petitboot: fix shutdown
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
Cc: Joel Stanley <joel@jms.id.au>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2024 18:51, Reza Arbab wrote:
> It's good practice to unmount filesystems and gracefully terminate
> running services before running "kexec -e". So when a boot option has
> been chosen from the petitboot menu, poke init to shut the system down
> and kexec the new kernel.
> 
> One benefit to us in particular is that when pb-console is killed, it
> notifies the user that we're booting:
> 
>    trap 'reset; echo "SIGTERM received, booting..."; sleep 2' SIGTERM
> 
> This terminal reset is also useful, exiting the ncurses visual mode so
> subsequent boot output is raw rather than being confined to the window
> set up for the petitboot menu.
> 
> Currently we assume busybox init, but do not add an accompanying entry
> in the inittab to run kexec, so things aren't working. Fix this and
> accomodate the other buildroot init systems as well.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

  Applied to master, thanks. I still modified it pretty heavily though, see 
below. You may want to re-test it on your side as well.

> ---
>   package/petitboot/kexec-restart | 26 ++++++++++++++++++++++++++
>   package/petitboot/petitboot.mk  | 20 +++++++++++++++++---
>   2 files changed, 43 insertions(+), 3 deletions(-)
>   create mode 100644 package/petitboot/kexec-restart
> 
> diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
> new file mode 100644
> index 000000000000..14e6899f70bb
> --- /dev/null
> +++ b/package/petitboot/kexec-restart
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +
> +case "$(/usr/bin/readlink -f /proc/1/exe)" in
> +	/bin/busybox)
> +		# inittab "restart" runlevel entry runs kexec
> +		/bin/kill -QUIT 1
> +		;;
> +	/sbin/init)
> +		# inittab runlevel 6 entry runs kexec
> +		/sbin/shutdown -r now
> +		;;
> +	/sbin/openrc-init)
> +		/sbin/openrc-shutdown --kexec now
> +		;;
> +	/usr/lib/systemd/systemd)
> +		/usr/bin/systemctl kexec
> +		;;
> +	*)
> +		/usr/sbin/kexec -f -e
> +		;;

  Rather than dynamically discovering the init system, I elected to do it 
statically based on the config, and sed-ing the appropriate command into a 
skeleton script.

> +esac
> +
> +while :
> +do
> +	sleep 1
> +done
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 4c8bc35adb38..291083269ae9 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -29,7 +29,7 @@ PETITBOOT_CONF_OPTS = \
>   	--without-twin-x11 \
>   	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
>   	HOST_PROG_KEXEC=/usr/sbin/kexec \
> -	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
> +	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart

  I kept this in /usr/libexec/petitboot.

>   
>   # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
>   # package.
> @@ -54,17 +54,31 @@ else
>   PETITBOOT_CONF_OPTS += --without-fdt
>   endif
>   
> +ifeq ($(BR2_INIT_BUSYBOX),y)
> +define PETITBOOT_BUSYBOX_INITTAB
> +	grep -q kexec $(TARGET_DIR)/etc/inittab || \
> +		printf "\nnull::restart:/usr/sbin/kexec -f -e\n" >> $(TARGET_DIR)/etc/inittab
> +endef
> +PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_BUSYBOX_INITTAB
> +else ifeq ($(BR2_INIT_SYSV),y)
> +define PETITBOOT_SYSV_INITTAB
> +	grep -q kexec $(TARGET_DIR)/etc/inittab || \
> +		$(SED) 's~^reb0:.*~reb0:6:wait:/usr/sbin/kexec -f -e~' $(TARGET_DIR)/etc/inittab
> +endef
> +PETITBOOT_TARGET_FINALIZE_HOOKS += PETITBOOT_SYSV_INITTAB
> +endif
> +
>   PETITBOOT_GETTY_PORT = $(patsubst %,'%',$(call qstrip,$(BR2_PACKAGE_PETITBOOT_GETTY_PORT)))
>   
>   define PETITBOOT_POST_INSTALL
> -	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
> -		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot

  I kept the installation of kexec-restart in this location instead of at the 
end, that makes the diff more reasonable and I couldn't discern any particular 
reasoning behind the ordering.

  Regards,
  Arnout

>   	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
>   		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
>   	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
>   		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
>   	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
>   		$(TARGET_DIR)/etc/init.d/S15pb-discover
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
> +		$(TARGET_DIR)/usr/sbin/kexec-restart
>   	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
>   		$(TARGET_DIR)/etc/init.d/pb-console
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
