Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DB9C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C68A60F58
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C68A60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E7360633;
	Fri, 27 Aug 2021 21:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHwl-P6m-K0F; Fri, 27 Aug 2021 21:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D31615FE;
	Fri, 27 Aug 2021 21:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F70D1BF384
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D90B402A0
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HKyeEbOTNZav for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:28:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 640C340291
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:28:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CB752B0051E;
 Fri, 27 Aug 2021 23:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630099714;
 bh=rpyWPQTPgq+xBJ+AYdochfE9XKiKUCoC5oIbkJQhsvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kk2i7ACxQw2eiKyaeqzsqwGj0Pc2ZmYhMj3tYve98V71HF4gBnZAMfVIZ6u240HTL
 J2UuoskqpyUoK0+JBvrDrALKyMiWZc9axJpw0Qi9UB0eyzrx4Ui1LsdTbujpQsBaeA
 we19RAvyZPfxoLCbMBrIVt5iI4y39jgVIrNWWNNT45kuK0NtrUM1MeBR0Hc7hYPT/B
 PQvHVJMqjTYn/WXjrNv45uqkFf0yV70+xYYIpxWbUuGWKZijvMZ02hjN9jgZSu3yfV
 tMH4xaotKjtPLXNbYiURuqfQx3ncsUSukGDLYrqIFRu2MHFes5S1Znp7FpEfEBcksz
 2jrc3agj2RDNA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 27 Aug 2021 23:28:29 +0200
Date: Fri, 27 Aug 2021 23:28:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sam Voss <sam.voss@collins.com>
Message-ID: <20210827212829.GG2661@scaer>
References: <20210826210241.56201-1-sam.voss@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826210241.56201-1-sam.voss@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sam, All,

On 2021-08-26 16:02 -0500, Sam Voss via buildroot spake thusly:
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

I've changed that to be handled in a fashion similar to the two other
init systems:

  - added a macro right after BUSYBOX_INSTALL_TELNET_SCRIPT, and
    similarly named BUSYBOX_INSTALL_TELNET_SERVICE

  - use thatr macro in the newly introduced BUSYBOX_INSTALL_INIT_SYSTEMD

  - move BUSYBOX_INSTALL_INIT_SYSTEMD alphabetically in-between openrc
    and sysv.

Applied to next, thanks.

Regards,
Yann E. MORIN.

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
> +Type=simple
> +ExecStart=/usr/sbin/telnetd -F
> +
> +[Install]
> +WantedBy=multi-user.target
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
