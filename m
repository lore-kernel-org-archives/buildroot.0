Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25016C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D040981BC0;
	Sun,  5 Nov 2023 18:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D040981BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Ba9leRkJRlu; Sun,  5 Nov 2023 18:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D453C81BC5;
	Sun,  5 Nov 2023 18:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D453C81BC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1469B1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D915E61021
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D915E61021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNX9rV3QK7jc for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:26:21 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F18961010
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F18961010
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9dbb3e0ff65so496451166b.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 10:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699208779; x=1699813579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jduY8/CWmJyJE2o2B+c7HGKZVKwADFta2RQha2KzoFg=;
 b=rLvk5o6G+I7j07BvdGwbk/s3LdyV1lhy4Qk1XkPNuopg0TjLCArDdAux8aQEWUBL6B
 LStn8pyuLoVhj+KwZCz9CHlEfr3SHXzTOuk1JqRkckuaOFm7vXraCNXyTLBvKZ/PhnbU
 zTZ951SxI+DEBp0eRdPaqQ1zatot7hV9KyCKyDK0eVrD5im60WuZxgq4A35pKWpIpEZW
 KRImvWx1ZJQVC30mcloOGVUiqHLhUNH+lvZ0ZbNKnrRkbnNE47Luzdd3Pj7xsOu3cUZ4
 MQjiRmFQToWHlzLC1TuMqLjP3oc2q8+R9/anL+OfBDvYeg72U1wJMDnxSyMqVBWVhPq+
 Jc2A==
X-Gm-Message-State: AOJu0YyG3DrxIUvr4TKwLR/KeQfWx8phjATzzvlAoSZYGZzIkwvaXPeU
 vYR4HaNsAFxLBlRFJ4ahcE2OE+vx2xI9ZpqFFz0=
X-Google-Smtp-Source: AGHT+IHtjU397nvh5Ovq43Ed2BRLvTvFLne3FB3gYoKF4S1ue8/iPry2X1dxBthEan0Yb+2pY8y0Pg==
X-Received: by 2002:a17:907:1c1a:b0:9ba:33ef:fe4c with SMTP id
 nc26-20020a1709071c1a00b009ba33effe4cmr12186508ejc.64.1699208779222; 
 Sun, 05 Nov 2023 10:26:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 kj26-20020a170907765a00b00988f168811bsm3258178ejc.135.2023.11.05.10.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 10:26:18 -0800 (PST)
Message-ID: <342a893c-af90-4602-b73b-1afd37b34acb@mind.be>
Date: Sun, 5 Nov 2023 19:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-8-arbab@linux.ibm.com>
In-Reply-To: <20231009151729.2223963-8-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699208779; x=1699813579; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jduY8/CWmJyJE2o2B+c7HGKZVKwADFta2RQha2KzoFg=;
 b=HZB4BZZg9eTHO7/6xbCds/aNKG7BKAYPbmK2ecGe+ptBMYrnO//zUQV7GLP2jB36Jo
 D9/yWllqSUtDYpx2MPbDEXs5ldyaXWEt6OUjgOnVYxBnb21Iba5YESaGTYTSwiXZ6SW2
 OGb5ttha5scUJUr5SQ1Sg3+7i9HlD+L4qzYs16Ro/N0ltg5RPKeU1qy9hzzuMNlBE5Np
 aqTPxH39spo/mxwk5HsuHyKp4hqLfXKYiStm1oGi6OxLso+QpB5IySS+Bgk23ll8Iaw3
 UBoSWGCGU+3tA4nPzuq/VU3RmlKlicQWuF1u7Ato3XZUF4okiA/jprBWevezLcRSFG1i
 F1FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HZB4BZZg
Subject: Re: [Buildroot] [PATCH v3 7/8] package/petitboot: enable user
 separation
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



On 09/10/2023 17:17, Reza Arbab wrote:
> Run the petitboot UI as an unprivileged user. This requires using the
> agetty package instead of the busybox getty utility, running the initial
> pb-console helper at user login rather than directly.

  That sounds counterproductive though? It means you have to log in before the 
boot menu is displayed? Or perhaps I misunderstand the statement here.

  It's also not clear why it would need agetty instead of busybox getty.

  This doesn't sound like something that should be done by default.


> If sudo is installed, with a sudoers policy allowing petituser to
> perform sudo with no password (or a blank password), the "drop to shell"
> feature of petitboot will automatically become a root shell.

  It seems to me that the logical thing to do would be to drop into an actual 
getty, which asks for a login and password.

> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>   package/petitboot/Config.in      |  1 +
>   package/petitboot/S15pb-discover |  4 +++-
>   package/petitboot/pb-console     |  6 ++++--
>   package/petitboot/petitboot.mk   | 12 ++++++++++++
>   package/petitboot/shell_config   | 24 ++++++++++++++++++++++++
>   package/petitboot/shell_profile  |  2 ++
>   6 files changed, 46 insertions(+), 3 deletions(-)
>   create mode 100644 package/petitboot/shell_config
>   create mode 100644 package/petitboot/shell_profile
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index 5f1d91e77ecb..0f965e71e628 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_PETITBOOT
>   	select BR2_PACKAGE_KEXEC_LITE if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
>   	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
>   	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> +	select BR2_PACKAGE_UTIL_LINUX_AGETTY
>   	help
>   	  Petitboot is a small kexec-based bootloader
>   
> diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
> index 71ab62d99859..a37e33521f1a 100644
> --- a/package/petitboot/S15pb-discover
> +++ b/package/petitboot/S15pb-discover
> @@ -12,7 +12,9 @@ fi
>   
>   start() {
>   	printf 'Starting %s: ' "$DAEMON"
> -	mkdir -p /var/log/petitboot
> +	# shellcheck disable=SC2174 # only apply -m to deepest dir
> +	mkdir -p -m 0775 /var/log/petitboot
> +	chown root:petitgroup /var/log/petitboot

  Why is it owned by root and not petituser?

>   
>   	# shellcheck disable=SC2086 # we need the word splitting
>   	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
> index 407ff3b30232..eea40163d02f 100644
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
> +	chown root:petitgroup /var/log/petitboot
>   
>   	# shellcheck disable=SC2086 # we need the word splitting
>   	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index ff87f3498734..5b517eb3b1a6 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -71,6 +71,10 @@ define PETITBOOT_POST_INSTALL
>   		$(TARGET_DIR)/usr/sbin/kexec-restart
>   	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
>   		$(TARGET_DIR)/etc/init.d/pb-console
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_config \
> +		$(TARGET_DIR)/home/petituser/.shrc
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
> +		$(TARGET_DIR)/home/petituser/.profile
>   
>   	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
>   	(for port in $(PETITBOOT_GETTY_PORT); do \
> @@ -84,4 +88,12 @@ endef
>   
>   PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
>   
> +define PETITBOOT_USERS
> +	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user

  Are petitgroup and petituser standard names? If not, we normally use the 
package name as username and group name, i.e.

	petitboot -1 petitboot -1 ...


  Also, does this user really need a home directory and a shell? It really 
should be a system user, no? It's only when it falls into the shell that you 
need an actual shell...

> +endef
> +
> +define PETITBOOT_PERMISSIONS
> +	/var/petitboot d 775 root petitgroup - - - - -

  What is /var/petitboot used for?

> +endef
> +
>   $(eval $(autotools-package))
> diff --git a/package/petitboot/shell_config b/package/petitboot/shell_config
> new file mode 100644
> index 000000000000..b10b95baae6c
> --- /dev/null
> +++ b/package/petitboot/shell_config
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +try_sudo() {
> +	[ -x "$(command -v sudo)" ] || return
> +	sudo -K
> +	echo | sudo -S /bin/true >/dev/null 2>&1 || return
> +
> +	echo "No password required, running as root."
> +	sudo -i
> +	sudo -K
> +	exit
> +}
> +
> +reset
> +
> +echo "Exiting petitboot. Type 'exit' to return."
> +echo "You may run 'pb-sos' to gather diagnostic data."
> +
> +if [ "$(id -u)" != "0" ]; then
> +	try_sudo
> +	export PS1='$ '
> +else
> +	export PS1='# '
> +fi
> diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
> new file mode 100644
> index 000000000000..1ca5e6364dba
> --- /dev/null
> +++ b/package/petitboot/shell_profile
> @@ -0,0 +1,2 @@
> +export ENV="/home/petituser/.shrc"

  This needs a bit more explanation. Is ENV something that is used by 
pb-console? How is it evaluated?

  Marked as Changes Requested.

  Regards,
  Arnout

> +exec /usr/libexec/petitboot/pb-console
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
