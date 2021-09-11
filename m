Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7248C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F74F611F0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F74F611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 042BE61BDC;
	Sat, 11 Sep 2021 16:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LD_mbbjHnP3c; Sat, 11 Sep 2021 16:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B3161BD4;
	Sat, 11 Sep 2021 16:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66E7C1BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6397D83145
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp0CYOZ9-Yfi for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:37:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2BA283139
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:37:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9704DB0055E;
 Sat, 11 Sep 2021 18:37:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631378229;
 bh=1uJUo0lgT90PA+GlBd7J5je3ef6LPL+78qOLOX6OFYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ottHI8nj4au62OZawI3n53leUb3ggUq0ahajkvtg+AJdsN5i1z1kSD7emps6ZeOoT
 +0sr834UCuCT+uEVxL9DAz4WAB4njKCpz9G+lUGcKZnD1Mn7LYbuDMhy+MbBCEJLDV
 bMqVwk+H86UJZRSoOU3rG9HjfoSjjqzpN5qWTc6SZ3EgF7t11s3JyD3vKAi657egvo
 9D+nE0ZSbquqK3DYm6FjCOadgvf511c60CruWT1OPLkvfkPYT4n0t3oj0HmYYUgS+K
 sniboa4Qt5QzeUB4jMKtqI0x+x7qOikBCMOjEJ4jKxhsp8VYJ2GZNMBPUJENiD5mzH
 anNhbYFP4S9ng==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 18:37:00 +0200
Date: Sat, 11 Sep 2021 18:37:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210911163700.GS1053080@scaer>
References: <20210911151031.41146-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911151031.41146-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: add option to enable
 USB install
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

James, All,

On 2021-09-11 09:10 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swupdate/Config.in          | 7 +++++++
>  package/swupdate/swupdate-usb.rules | 2 ++
>  package/swupdate/swupdate.mk        | 3 +++
>  3 files changed, 12 insertions(+)
>  create mode 100644 package/swupdate/swupdate-usb.rules
> 
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index 6b832cfcbf..54a99b73d5 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -60,6 +60,13 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
>  	  I you wish to use your own modified swupdate configuration
>  	  file specify the config file location with this option.
>  
> +config BR2_PACKAGE_SWUPDATE_USB
> +	bool "swupdate usb"
> +	default y

Options should not default to 'y', unless there is a good reason for
that, in which case it should be dully explained in the commit log.

> +	depends on BR2_PACKAGE_SYSTEMD
> +	help
> +	  Enable update from USB disk.
> +
>  config BR2_PACKAGE_SWUPDATE_WEBSERVER
>  	bool "swupdate webserver"
>  	default y
> diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
> new file mode 100644
> index 0000000000..b4efd0b733
> --- /dev/null
> +++ b/package/swupdate/swupdate-usb.rules
> @@ -0,0 +1,2 @@
> +ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
> +

Spurious trailing empty line.

Also, I concur with Arnout: this is a bit dangerous, and users must be
made aware, in one form or another, that they should really setup a PKI
to sign their swu, or anyone with physical access to the device will be
able to update to arbitrary firmwares.

Regards,
Yann E. MORIN.

> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index c49af7ebf7..c06106e2ee 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -252,6 +252,9 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
>  	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
> +	$(if $(BR2_PACKAGE_SWUPDATE_USB), \
> +		$(INSTALL) -D -m 644 package/swupdate/swupdate-usb.rules \

I know this is not enforced everywhere, and that the CWD at runtime is
always the top-level of the buildroot tree, but I'd really like that we
refer to the package directory using the appropriate variable, rather
than hard-coding it, like $(SWUPDATE_PKGDIR):

    $(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb.rules ...

Regards,
Yann E. MORIN.

> +			$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules)
>  	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
>  	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
