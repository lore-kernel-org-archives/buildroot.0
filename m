Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A4EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4D1606C8;
	Sun,  5 Dec 2021 10:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UH0ECHS6Hud; Sun,  5 Dec 2021 10:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F9660686;
	Sun,  5 Dec 2021 10:09:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2AFE1BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A309082A26
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9RBPeKjKWuxC for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:09:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 846D582A17
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:09:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3ED9AE0003;
 Sun,  5 Dec 2021 10:09:15 +0000 (UTC)
Date: Sun, 5 Dec 2021 11:09:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211205110914.2dbbf237@windsurf>
In-Reply-To: <20211205005412.2888068-7-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
 <20211205005412.2888068-7-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 7/7] package/network-manager: add
 optional systemd support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat,  4 Dec 2021 17:54:12 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/network-manager/network-manager.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 14bf0d4dd1..7a268d72c8 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -112,6 +112,21 @@ else
>  NETWORK_MANAGER_CONF_OPTS += --enable-polkit=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +NETWORK_MANAGER_DEPENDENCIES += systemd
> +NETWORK_MANAGER_CONF_OPTS += \
> +	--with-systemd-journal=yes \

=yes not needed

> +	--with-config-logging-backend-default=journal \
> +	--with-session-tracking=systemd \
> +	--with-suspend-resume=systemd
> +else
> +NETWORK_MANAGER_CONF_OPTS += \
> +	--with-systemd-journal=no \

--without-systemd-journal

> +	--with-config-logging-backend-default=syslog \
> +	--with-session-tracking=no \

--without-session-tracking

> +	--with-suspend-resume=upower

Are you sure about this? We don't forcefully enable upower when systemd
is disabled, so is this working?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
