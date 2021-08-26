Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBA0C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F203E60FC1
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F203E60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64D361487;
	Thu, 26 Aug 2021 22:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdoT-0N9Jpvg; Thu, 26 Aug 2021 22:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC7A61495;
	Thu, 26 Aug 2021 22:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9154E1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0C740765
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gT5E9gQ5CJC for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:01:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37C764071D
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:01:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z10so6844461edb.6
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 15:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EYgCsCt42S3ROr4WHfsb19NgMbA3fs3hJCd3jx6Hz8Y=;
 b=VN6YBw9J4iQPBtQq0gOpo9hYrhiG+Q+ISw9AghlL0N9ICXTs1pwUACCHo1YdKoJ+cx
 NBrR4BfyQIF+J/w3aX2BImk2TQ/nYlss1dvxtTej9Oha+QBCaXMpqZtgywPC5hGeXvsG
 A0i2YU/A8EDsigN4ROWrOZRVH0siGyAC3XzlIt/ylD4xfVCOSXAPIyttCW5bqIE9NU2X
 /O1mmGLMEEwb4baWIXpFHcp8hRsTZZiLEcrmLd7i6KIUj6LUfueitc0baNwbeyeMqTYG
 nFD1JTCXhrss5rBQU/09AdN3Dh2TzI4pp6OPeqzKxftOZvO0GVm25XH5qmLvQxQ8UKzN
 w4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EYgCsCt42S3ROr4WHfsb19NgMbA3fs3hJCd3jx6Hz8Y=;
 b=iGsga82gScRnoSYa2RWNFX+6u6toXNsGVNpJz5FBRhchYwGhoNi1vvOd7cpmOdWFRg
 IT5vURGhSyk0gae5ItjsY6CSf0YFWeDN0pBMl/90nN1ZAI2AKegvDc1pQ9CsQZimpWz1
 H9u3y6gSaL5Itla6exSTNJvoUF+pjA5T2qApMSET+JRLk6vafpyPU9JWv62q1Ia+mJyQ
 deS3DYM6LqVbssJpsMprnKzBv9eYjeFwjeX0cdE8nd0hXO/retNPHhPiQILlv4uuvYUW
 RxUZMdKGFHki0+uLNllVWl68uN12LvC1pOTgkafQASYFI11oZVohjY7TRhsdlNHSviCW
 1Q2g==
X-Gm-Message-State: AOAM533/WhDrAVfqdZUtmTd70GTFPpZ9wslfGuPbUNgzC//rv04ofZHD
 ijErj2iif7gE/P7HN9S+Yw3RTurJNsphNw==
X-Google-Smtp-Source: ABdhPJzKsPYCzNdC83rVWwPZTJy+SXUPrb5eceMfqE9WbntPFOR1AdXYGvTUc2+cUnwvgPIpit5RVg==
X-Received: by 2002:a05:6402:1779:: with SMTP id
 da25mr6591395edb.200.1630015267464; 
 Thu, 26 Aug 2021 15:01:07 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p5sm1910611ejl.73.2021.08.26.15.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 15:01:07 -0700 (PDT)
To: Sam Voss <sam.voss@collins.com>, buildroot@buildroot.org
References: <20210826210241.56201-1-sam.voss@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <942093f8-fbc2-8278-7913-e1644ecde8f0@mind.be>
Date: Fri, 27 Aug 2021 00:01:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826210241.56201-1-sam.voss@collins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: add systemd service
 for telnetd
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 26/08/2021 23:02, Sam Voss via buildroot wrote:
> Signed-off-by: Sam Voss <sam.voss@collins.com>
> ---
>  package/busybox/busybox.mk      |  7 +++++++
>  package/busybox/telnetd.service | 11 +++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/busybox/telnetd.service
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index cfc06b0d78..fb427faf1c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -378,6 +378,13 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
>  endef
>  
> +define BUSYBOX_INSTALL_INIT_SYSTEMD
> +	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y $(@D)/.config; then \
> +		$(INSTALL) -D -m 0644 package/busybox/telnetd.service \
> +			$(TARGET_DIR)/usr/lib/systemd/system/telnetd.service ; \
> +	fi
> +endef
> +
>  # Install the sysvinit scripts, for the moment, but not those that already
>  # have a corresponding one in openrc.
>  define BUSYBOX_INSTALL_INIT_OPENRC
> diff --git a/package/busybox/telnetd.service b/package/busybox/telnetd.service
> new file mode 100644
> index 0000000000..3c1fa457b1
> --- /dev/null
> +++ b/package/busybox/telnetd.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=Telnetd Service
> +After=network.target
> +
> +[Service]
> +# busybox telnet doesn't support pidfile, so run in foreground

 AFAIU Type=simple is anyway the preferred type for services without specific
systemd support, so I don't think this comment is very useful...

 Regardless:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +Type=simple
> +ExecStart=/usr/sbin/telnetd -F
> +
> +[Install]
> +WantedBy=multi-user.target
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
