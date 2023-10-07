Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C72AE95A6A
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 20:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31EDB41769;
	Sat,  7 Oct 2023 20:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31EDB41769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cf4XXhIfqk4k; Sat,  7 Oct 2023 20:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1DE341772;
	Sat,  7 Oct 2023 20:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1DE341772
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC911BF3BD
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7342441772
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 20:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7342441772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_Ds-I0voFJK for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 20:41:37 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1774D41769
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 20:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1774D41769
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so5961765a12.1
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 13:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696711295; x=1697316095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XkeAyNVJqDvpL+beKPERexvxqxvxp2BP5tUTJPQ7EHQ=;
 b=vBkHSa+V1Yw8sBaL8h5pOkiRFmOMCy1tzG/t0TDD2CXQeH8yZDL3wLw6NW0NsSQXVJ
 sVrdbFA4k8qSC9ZPZZ0eGB74T23DDcD4hkY+GfyStAKIrU5Z46bzINsaZt38z9p1YViN
 0dcZKbwsY7HA7MvBcazA+i8qRuojf+0a4jDn5F+Ohm4t6QAGfgi2T47caC2Vmz8WJ2FG
 8Eyw1j7jqxjthe0w0xCjeBM4zo1185rC9GEnh8eDyPL+Ar0R8EjOtW6DhKuuAHpUPIPz
 IkoB8LF5Yi/fC3f7z3dCFDSuWEFq2rEgwVu/RmG51XV7aAQ3j8wNhxzajQHcaycJbPoJ
 jnlw==
X-Gm-Message-State: AOJu0YzVnN+YETATvUMcnIJ+gr+YOwD8tUSfJlPvmVrOucwD+pdx4YVY
 ShGOHTTXsJxx0Ec/DoAq8Dkoo0Vnyc+2j6XoYj0=
X-Google-Smtp-Source: AGHT+IHVwujV//uk9xu0ufFB09XLtIKSoBWy32mvxvo0r4s+AadLhWhpZRXnTupfPdx5shtu8epLHA==
X-Received: by 2002:a50:ee91:0:b0:51e:53eb:88a3 with SMTP id
 f17-20020a50ee91000000b0051e53eb88a3mr9624914edr.25.1696711294974; 
 Sat, 07 Oct 2023 13:41:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a056402039a00b00538538f1fcesm4230587edv.47.2023.10.07.13.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Oct 2023 13:41:34 -0700 (PDT)
Message-ID: <013b2509-3af4-6130-6327-e4c52efaaa69@mind.be>
Date: Sat, 7 Oct 2023 22:41:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: buildroot@buildroot.org
References: <20231007203633.2415431-1-arnout@mind.be>
 <20231007203633.2415431-2-arnout@mind.be>
In-Reply-To: <20231007203633.2415431-2-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696711295; x=1697316095; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XkeAyNVJqDvpL+beKPERexvxqxvxp2BP5tUTJPQ7EHQ=;
 b=H8akPjk7bQn2lxmI4PEIg2X8NLxmGSuRtlh8YpOQTt6bDbUx4XNnRDu+wm4oR0W+P+
 nUJ3Ozankvp6pJGFD8TOg+rR6+LXhav8Avb/VXnPN+xEFs5j5fQLQ0HU7vIgfR1aeu02
 HEOO8MAma7ZW/b9QrYqAMo5QbbrovI3a0d66OARe8JXWlxNuDkGAB2YcpeLIY8ugPCHF
 COT/+FBWhqTw0EICVZso2FnRJqphemQ/rSmwqQKLZHlLXAkV8ioH6WmLRVE06aKeJRIJ
 HLmojaTfdjdbcAqzjIgiRpf2yntm266Y4F7FZT8AbDr0OUq2gSDK7k3cVxgv0EOb+jcx
 /G3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H8akPjk7
Subject: Re: [Buildroot] [PATCH 2/2] package/initscripts: add service to
 load kernel modules at boot
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2023 22:36, Arnout Vandecappelle wrote:
> From: Angelo Compagnucci <angelo@amarulasolutions.com>
> 
> In cases where no hotplug is available (by choice or by the lack of a
> proper hotplug method for a device), this service can be used to load
> kernel module drivers by reading the /etc/modules-load.d/*.conf files.
> The modules files matches the one used by systemd, which in turn has
> a builtin mechanism to load a module at boot, therefore making systemv
> init on par with systemd features.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [Arnout:
>   - add exception for missing DAEMON variable;
>   - fix shellcheck warnings
> ]
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---

  I forgot the patch history.

v2:
* Moved script to initscripts (Arnout)
* Moved script to S11modules, after S10[mu]dev (Andreas)
* Use /etc/modules-load.d/ to share the same setup with systemd (me)
v4:
* Select only .conf file (Peter)
* Better ouput: printing module name only when loaded successfully,
   print a FAIL when at least one module fails (Peter)
v5 (Arnout):
* Fix shellcheck warnings
* Add exception for missing DAEMON variable

  Regards,
  Arnout

>   package/initscripts/init.d/S11modules | 62 +++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 package/initscripts/init.d/S11modules
> 
> diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
> new file mode 100644
> index 0000000000..ab9b93dae3
> --- /dev/null
> +++ b/package/initscripts/init.d/S11modules
> @@ -0,0 +1,62 @@
> +#!/bin/sh
> +
> +MODULES_DIR="/etc/modules-load.d/"
> +
> +[ -z "$(ls -A ${MODULES_DIR} 2> /dev/null)" ] && exit 0
> +
> +load_unload() {
> +	for module_file in "${MODULES_DIR}"/*.conf; do
> +		while read -r module args; do
> +
> +			case "$module" in
> +				""|"#"*) continue ;;
> +			esac
> +
> +			if [ "$1" = "load" ]; then
> +				# shellcheck disable=SC2086  # We need word splitting for args
> +				modprobe -q "${module}" ${args} >/dev/null && \
> +					printf '%s ' "$module" || RET='FAIL'
> +			else
> +				rmmod "${module}" >/dev/null
> +			fi
> +
> +		done < "${module_file}"
> +	done
> +
> +	RET='OK'
> +}
> +
> +start() {
> +	printf 'Starting modules: '
> +
> +	load_unload load
> +
> +	echo $RET
> +}
> +
> +stop() {
> +	printf 'Stopping modules: '
> +
> +	load_unload unload
> +
> +	echo $RET
> +}
> +
> +restart() {
> +	stop
> +	sleep 1
> +	start
> +}
> +
> +case "$1" in
> +	start|stop|restart)
> +		"$1";;
> +	reload)
> +		# Restart, since there is no true "reload" feature.
> +		restart;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +esac
> +
> +# check-package Ignore missing DAEMON Variables
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
