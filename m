Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59490C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:33:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E2A6109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12E2A6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DC9414CE;
	Sat, 11 Sep 2021 14:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-F8LftBVOet; Sat, 11 Sep 2021 14:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C0541482;
	Sat, 11 Sep 2021 14:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 544281BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F39A40227
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfSrkwWMkR7h for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:33:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E522400E8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:33:07 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id q3so6947389edt.5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aHQWHHWnM8kdNKfTQhgs3WXjmyTUfWx2axQkDCGCT1g=;
 b=f2XiCUPeS/9rkDLRuz7W16J7kuJl2efjgLq+GPjDqaaVTYe1NRYu/fqtnRKXR6uaVk
 IDYKKob1HVQ8kTDV94JjTaSQcfH0pMr1AKtVHB95V0C9Lf2ULigilPEhGXS/pFAesenW
 /s8zsVovL7ZGD5VtZGtE+hRf+M6vgUuh4izO6S2kHhrwh0AMhZa+b9h+izcboamKyw5b
 VbbPQkamcDzG1fcdcgjaooHC97oEOUtb4qL4EjLtmFXH+QENSbK52XKUfb3j1RvuLhBV
 Z78MB98M93Ft3T9QnjmkYbSDkPQjccezXbyN6gip/MNu2tt9Ok7/PDm4xKD/+7/SJIf9
 t6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aHQWHHWnM8kdNKfTQhgs3WXjmyTUfWx2axQkDCGCT1g=;
 b=VybzCdDr/w6+baL5S9RxcwUpcSETkir8ctOOB01wVqUyjXAVJs7pBDSjohT9Fkb4vA
 nA+PDnK3Crni+Mk+sW197c14ys/MRQy8FLNjxXuaLL+ggTMGiwZrcU7pTSSQf0n09xoe
 VOamJ0JNKL5s+QU9eQlnqW4kexdcb20oYhVGcVvYx/KWkEr+UsIyYF/pz2OqYEEP8Yvm
 hK1xgGOyoqpqx+MOm/8f6xKzw8v0J4QrA9BMbFOn1B2uNUlqHgJBdHBHO+hZ1aOloEcm
 1zmSs4T58+ycXKqhbL2pDaPWgUMvqWzBPn5R0U5lMGGMKiRzXHjCF5GgCrdoQiELdDg6
 J5ww==
X-Gm-Message-State: AOAM532swkcwsGNAziQMAnZQs2CLn3ZgnF9r5Dab4IYlrK1cRIFlNkM+
 RknMvHpI7hACde9POvgoH4bcRPuEKO3N1Q==
X-Google-Smtp-Source: ABdhPJzVv/T+vNr5sZ0w01k4QpxghrVOOk3gRDfy5u/JM2YRnAUAzdISyP87uUe6nmPaF8IqwPEvIw==
X-Received: by 2002:a05:6402:3584:: with SMTP id
 y4mr3522934edc.183.1631370785420; 
 Sat, 11 Sep 2021 07:33:05 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a15sm1056709edr.2.2021.09.11.07.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:33:04 -0700 (PDT)
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20210830153056.3176678-1-troglobit@gmail.com>
 <20210830153056.3176678-3-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a275f09f-0ece-a6f9-f440-8d8659a3b5dd@mind.be>
Date: Sat, 11 Sep 2021 16:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830153056.3176678-3-troglobit@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 2/3] package/smcroute: add sysv init
 script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 30/08/2021 17:30, Joachim Wiberg wrote:
> Same start order as mrouted, start after networking is up.
> 
> Custom command line options, like startup delay, or disable multicast
> routing by default, can be added to the optional /etc/default/smcroute
> env. file.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/smcroute/S41smcroute | 48 ++++++++++++++++++++++++++++++++++++
>  package/smcroute/smcroute.mk |  5 ++++
>  2 files changed, 53 insertions(+)
>  create mode 100755 package/smcroute/S41smcroute
> 
> diff --git a/package/smcroute/S41smcroute b/package/smcroute/S41smcroute
> new file mode 100755
> index 0000000000..bdc0f87645
> --- /dev/null
> +++ b/package/smcroute/S41smcroute
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +
> +NAME="smcroute"
> +DAEMON="smcrouted"
> +PIDFILE="/var/run/$NAME.pid"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
> +
> +cmd()

 This is not how we usually write our start scripts, but I like it!

> +{
> +    start-stop-daemon -q -p "$PIDFILE" "$@"

 Can't you pass the -x here as well (which makes sure that you actually kill the
intended daemon in stop() and not some other random process that happens to have
the same PID)?

 Anyway, I applied as is.

 Regards,
 Arnout


> +    status=$?
> +    if [ $status -eq 0 ]; then
> +	echo "OK"
> +    else
> +	echo "FAIL"
> +    fi
> +    return $status
> +}
> +
> +case "$1" in
> +    start)
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	cmd -S -x "/usr/sbin/$DAEMON" -- $SMCROUTED_ARGS
> +	;;
> +
> +    stop)
> +	printf 'Stopping %s: ' "$DAEMON"
> +	cmd -K
> +	;;
> +
> +    restart)
> +	$0 stop
> +	sleep 1
> +	$0 start
> +	;;
> +
> +    reload)
> +	printf 'Reloading %s: ' "$DAEMON"
> +	cmd -K -s HUP
> +	;;
> +
> +    *)
> +	echo "Usage: $0 {start|stop|restart|reload}"
> +	exit 1
> +esac
> diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
> index e4ee81db6f..9cce0acbbc 100644
> --- a/package/smcroute/smcroute.mk
> +++ b/package/smcroute/smcroute.mk
> @@ -19,4 +19,9 @@ else
>  SMCROUTE_CONF_OPTS += --without-libcap
>  endif
>  
> +define SMCROUTE_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 -D package/smcroute/S41smcroute \
> +		$(TARGET_DIR)/etc/init.d/S41smcroute
> +endef
> +
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
