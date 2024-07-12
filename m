Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01B8C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72BAB84614;
	Fri, 12 Jul 2024 22:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioniicQHGb7z; Fri, 12 Jul 2024 22:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C65E845BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C65E845BC;
	Fri, 12 Jul 2024 22:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2519E1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E8B7400DA
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wmG7D9beU_q for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FCB5400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCB5400AC
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FCB5400AC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:03:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so33660231fa.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720821806; x=1721426606;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fxyqiv39fKADkSCiKCPoeDONPMx321o8nLn5mCR35hg=;
 b=M+UX4H0BsqIyuxLgO+aCxmUxJKDmYCretOyiYBhFsDJDrQRkth8Gy92HicLRbA2Fyx
 /bGkM96de2XnmPnPkbxz0k0W6G6tGXfL9tSq7rSpWaoxsl+TB35187zj7nhXp1FOD61R
 4fv27i+4mbssMY4MYNvjwwsdZ3HyXCkTtLG+yOpGiGwtT1CPOt8GbXn8eolPwh/UO6BL
 yq6QGYxZ6n9TBt/3hCTjaE8kUfC6Cc/1n0z+X+t3gPrZwUReWSp+i0nt7zKT9sr3wXDl
 F9kWIXUgKiip2PSf5Px2zO4XWb0nGFI9Q6Th4LrWkY0yJbax0si2up4dpOwLz5BarSS2
 zPyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXukci6bsqx1wzLeRuueJ8Uv13T4L/ZKe0MlGpj9DDGon8kqmQHNVRdYMnuhpW/qCtXS6AGhasTLHYDQk6Y2wNgjxw7eMVfqw==
X-Gm-Message-State: AOJu0Yy7QJZcJaMZMYnggPSFeoJjEMxf01LzwojQ0+Glaq21fRPuv08A
 vpStkox9xwxe1j9/sytYVkH9DRA0kRjnTD1QoK8g99ilEQDErnlgAR96B3XXrmS2/0ZDLliqZ/N
 6M9Q=
X-Google-Smtp-Source: AGHT+IHMyhC/pTYvCE5USf79Uy5ySsRD4ANkOdEct/KngJgId8Ol17e2F5FIbryaS1FE9Kga3PTlkQ==
X-Received: by 2002:a2e:980b:0:b0:2ee:8749:d4a1 with SMTP id
 38308e7fff4ca-2eeb30b9b69mr85674671fa.10.1720821806354; 
 Fri, 12 Jul 2024 15:03:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d73bdsm35252885e9.43.2024.07.12.15.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 15:03:25 -0700 (PDT)
Message-ID: <86ef4f6f-9fb5-40fb-ad76-a474bbd2a586@mind.be>
Date: Sat, 13 Jul 2024 00:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
 <20240207175135.1532037-6-arbab@linux.ibm.com>
Content-Language: en-GB
In-Reply-To: <20240207175135.1532037-6-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720821806; x=1721426606; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fxyqiv39fKADkSCiKCPoeDONPMx321o8nLn5mCR35hg=;
 b=WX317MiuRTgyoKRB3ayrvQlpJ/e0uwC31zuAQauUS4Z/fp2w3E2VgvmJloH+GxcTfF
 oZExqQeMH/C6k6fY1G9QfyOzpw5PD1OwKWD/eBBD+9xaWftQuvsS1H9Ewt0gczJQB0jq
 HBFQCfD6jn7v4ZSpnPrIGmmuyFIcIo2jHXCFzknO6A+3BprwLn3C7tGxl2wU7R7w8hOk
 GRNAOuNXaD/+g3P37jV2t+BqaT9Z2sqOuGQfS9D8UphfbSj4ecRJY0DeoRcYbgEdA7wk
 Lcus0pUNBqqu+wk9cNUprVQQRCleB0HTJMyWlWDik/UHZF4hDSsOkTkub3diXfzhcPyZ
 k/xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WX317Miu
Subject: Re: [Buildroot] [PATCH v5 5/5] package/petitboot: run UI as
 non-root user
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
> Though the petitboot UI is a user application, it is currently being
> run by root only because we use getty to display it on the console.
> 
> Create an unprivileged user to run the UI instead. The unix socket the
> pb-discover daemon sets up is accessible to "petitgroup", so that should
> be the gid, with arbitrary uid "petituser" to match.
> 
> This is currently the chain of processes leading to the UI:
> 
> 1. /etc/init.d/pb-console start console
> 2. /usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 console linux
> 3. /sbin/getty -l/usr/libexec/petitboot/pb-console -n -i 0 console linux
> 4. /usr/libexec/petitboot/pb-console
> 5. /usr/sbin/petitboot-nc
> 
> Instead of (3) running the pb-console helper directly with "getty -l",
> we can use "agetty -a" to autologin petituser, and run pb-console via
> petituser's login shell:
> 
> 1. /etc/init.d/pb-console start console
> 2. /usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i console linux
> 3. /sbin/agetty -a petituser -n -i console linux
> 4. /home/petituser/.profile
> 5. /usr/libexec/petitboot/pb-console
> 6. /usr/sbin/petiboot-nc
> 
> Here, everything from (4) down is running as petituser. In (4), use
> $PPID to determine if we're logging in via getty, so that logging in by
> other means will give a normal shell.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>   package/petitboot/Config.in      | 1 +
>   package/petitboot/S15pb-discover | 4 +++-
>   package/petitboot/pb-console     | 6 ++++--
>   package/petitboot/petitboot.mk   | 6 ++++++
>   package/petitboot/shell_profile  | 3 +++
>   5 files changed, 17 insertions(+), 3 deletions(-)
>   create mode 100644 package/petitboot/shell_profile
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index 4f3b1c1ea4d1..e561547c10c8 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_PETITBOOT
>   	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
>   	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
>   	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> +	select BR2_PACKAGE_UTIL_LINUX_AGETTY

  Although util-linux is selected indirectly through other dependencies (e.g. 
eudev/systemd), it's better to do it explicitly.

  Applied to master with that changed, thanks.

  Regards,
  Arnout

>   	help
>   	  Petitboot is a small kexec-based bootloader
>   
> diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
> index 71ab62d99859..9e8f6c87f8bb 100644
> --- a/package/petitboot/S15pb-discover
> +++ b/package/petitboot/S15pb-discover
> @@ -12,7 +12,9 @@ fi
>   
>   start() {
>   	printf 'Starting %s: ' "$DAEMON"
> -	mkdir -p /var/log/petitboot
> +	# shellcheck disable=SC2174 # only apply -m to deepest dir
> +	mkdir -p -m 0775 /var/log/petitboot
> +	chown petituser:petitgroup /var/log/petitboot
>   
>   	# shellcheck disable=SC2086 # we need the word splitting
>   	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
> index 407ff3b30232..8b23b2233dee 100644
> --- a/package/petitboot/pb-console
> +++ b/package/petitboot/pb-console
> @@ -3,14 +3,16 @@
>   DAEMON="pb-console"
>   
>   PB_CONSOLE_PORT=${2:-"console"}
> -PB_CONSOLE_ARGS="--getty --detach -- -n -i 0 $PB_CONSOLE_PORT linux"
> +PB_CONSOLE_ARGS="--getty=/sbin/agetty --detach -- -a petituser -n -i $PB_CONSOLE_PORT linux"
>   
>   # shellcheck source=/dev/null
>   [ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
>   
>   start() {
>   	printf 'Starting %s on %s: ' "$DAEMON" "$PB_CONSOLE_PORT"
> -	mkdir -p /var/log/petitboot
> +	# shellcheck disable=SC2174 # only apply -m to deepest dir
> +	mkdir -p -m 0775 /var/log/petitboot
> +	chown petituser:petitgroup /var/log/petitboot
>   
>   	# shellcheck disable=SC2086 # we need the word splitting
>   	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index e2f762842534..8e02118f25f1 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -84,6 +84,8 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/etc/init.d/pb-console
>   	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
>   		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
> +		$(TARGET_DIR)/home/petituser/.profile
>   
>   	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
>   	for port in $(PETITBOOT_GETTY_PORT); do \
> @@ -97,4 +99,8 @@ endef
>   
>   PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
>   
> +define PETITBOOT_USERS
> +	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user
> +endef
> +
>   $(eval $(autotools-package))
> diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
> new file mode 100644
> index 000000000000..a958ca4402f2
> --- /dev/null
> +++ b/package/petitboot/shell_profile
> @@ -0,0 +1,3 @@
> +if [ "$PPID" = "1" ]; then
> +	exec /usr/libexec/petitboot/pb-console
> +fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
