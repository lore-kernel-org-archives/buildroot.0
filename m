Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AC9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 21:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3CEC40981;
	Fri, 19 Nov 2021 21:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7RggD_vCki8; Fri, 19 Nov 2021 21:52:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD8B403A5;
	Fri, 19 Nov 2021 21:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C038D1BF3F2
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD5FD402BD
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 21:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrTRiW_pM6aT for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 21:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE24540215
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 21:52:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r8so20352786wra.7
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZWpcTzQJHP2icEcEMMa3qKLLNf+Uv24GBvK9dfDKJps=;
 b=I4GnJ7M5ukMVzhNjMTzdj0uY4wkq3OVx7dAyNqtYfjr+QOIPCZsqImHAmYOhUWUlKy
 FEjc/9DAnm0lIWQB3GgEHuWq69cKNKnPDvPsGC0SnJ38bc3Sp7acrecQfAfMXGlCDDar
 4CaZZx9kcaZX7zh5vPANRWsqobPhaAp7fELrEfLgV09txpr/L4B0wV8mqTybAjLLi8eH
 qfFAYnP4V0Zco1L8Z2wcTbzRuvyNfjV3FrwcD6wKRoyjJzY/C6jrgXmszAVGB+cWroce
 iomdQwuLC90INhOMk5fGKAC+3eBr8vHhNiECGQ3ojIPOT8A+T56SkXWkeyg9abgmFVQp
 wgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=ZWpcTzQJHP2icEcEMMa3qKLLNf+Uv24GBvK9dfDKJps=;
 b=GIVJHl0TUID5XeS6sqIyxv1HCYO3QwjXhbMRcjfqVMH3EC0YO6VfgAAgypSwzyV/8j
 BPWHQlpuA0kEsImNleEybuFkdwmkMoUfGeJtI29lDJXO42sO0zqoGVBOGA9zbdeKZ+e0
 BtZ8GRG3mur3J92EPiQXgCB8rTfBwh4Sym2krn10x7wkSamK5Z+DOEQrYtTkh1++9BN0
 EPWUpwv4wURSXwowHGKN57/G3+krMCDBRGflSjzWmLehPbuywV+lXlXuW8uIVGmXbFUr
 p7W8DNrte9VjcncHWB2PIQibX6Q0IY2Ue2WRYXxfN0twtsS95WoBKHHTgWhn/4LNutxL
 WmcA==
X-Gm-Message-State: AOAM533+K6vMYFqWiJ8td4x2uDqmniq+tUw5WsVtZd/yF0ptIEIrD9X8
 L4ErHuK+y959fMafScIPIgM=
X-Google-Smtp-Source: ABdhPJx8KYcESYqYgqfC6fKI8etaIbk6B/rlLRSQxa/nkliZbk2/fvdNspqOLZdXool+vyXuQwpxag==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr11813029wro.395.1637358775142; 
 Fri, 19 Nov 2021 13:52:55 -0800 (PST)
Received: from pevik ([93.99.78.116])
 by smtp.gmail.com with ESMTPSA id h2sm896671wrz.23.2021.11.19.13.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 13:52:54 -0800 (PST)
Date: Fri, 19 Nov 2021 22:52:51 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YZgcsyig3To4ucTQ@pevik>
References: <20211119164926.2410106-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119164926.2410106-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: set CONFIG_NFSD
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14346

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nfs-utils/nfs-utils.mk | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 763dd57ace..07b44b5a93 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -90,6 +90,10 @@ NFS_UTILS_CONF_OPTS += --without-systemd
>  endif

>  ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
> +define NFS_UTILS_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD)
> +endef

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks a lot!

Kind regards,
Petr

> +
>  define NFS_UTILS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
>  		$(TARGET_DIR)/etc/init.d/S60nfs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
