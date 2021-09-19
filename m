Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BF6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:32:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E7C611C3
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3E7C611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D4884011;
	Sun, 19 Sep 2021 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRUsTy4EtNlc; Sun, 19 Sep 2021 09:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BC08270B;
	Sun, 19 Sep 2021 09:32:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42FB71BF5E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ADE7404BB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTGY2UIC2OVS for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:32:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF4D140445
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:32:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 78C7D2003E3;
 Sun, 19 Sep 2021 11:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632043939;
 bh=3/3Qfdpe4Yuwnvl5qUbvQfhGdk2K9PAkFUjoqjkV/2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JNrYra9QaKVo0eNu9kpqRkxw3XA6Xmn6XPAtN/EL0//M75f4IxJXJAiw71O8AWiJm
 hy8JzxUicxHHZBLSfhmZOory9vSsIq+u1vHS+mGWQVPEKWqvSHbswZMTmAHkhGRN8n
 W9pIVG49PuxTWfv9Jsigwt72JNegb9dnyda5Hx6OSzsh8GHFBM0R9xvSZ4Ayiry1nR
 l3SdVMtzYSGypINmnNyNbR2keiNvWtwMF5/D0obgLQuFYrsk5ALlr1pWaxntU1RLGL
 YrbErkXQD4jh0IkbghJY2dLAEvheNRuDuOqhklWurDqFyGJWDj8upWzEcQ+xJ302KB
 3nYtOMFjUwK9g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 11:32:12 +0200
Date: Sun, 19 Sep 2021 11:32:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210919093212.GN1053080@scaer>
References: <20210919080902.2475463-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919080902.2475463-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/swupdate: add option to
 enable USB install
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

On 2021-09-19 02:09 -0600, James Hilliard spake thusly:
> This is enabled by default for consistency with meta-swupdate
> behavior.

So, this is a new feature that was not implicitly provided by previous
Buildroot versions, so there is no need for a backward compatibility,
so there is no need for a default y in Buildroot. I've dropped it.

Also, I've added a comment about the dependency to systemd.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add note in commit on why this is enabled by default
>   - fix whitespace in udev rule
> ---
>  package/swupdate/Config.in          | 7 +++++++
>  package/swupdate/swupdate-usb.rules | 1 +
>  package/swupdate/swupdate.mk        | 3 +++
>  3 files changed, 11 insertions(+)
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
> +	depends on BR2_PACKAGE_SYSTEMD
> +	help
> +	  Enable update from USB disk.
> +
>  config BR2_PACKAGE_SWUPDATE_WEBSERVER
>  	bool "swupdate webserver"
>  	default y
> diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
> new file mode 100644
> index 0000000000..72e003d74d
> --- /dev/null
> +++ b/package/swupdate/swupdate-usb.rules
> @@ -0,0 +1 @@
> +ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index e191ab384a..5ed2ca55d2 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -252,6 +252,9 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
>  	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb@.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
> +	$(if $(BR2_PACKAGE_SWUPDATE_USB), \
> +		$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb.rules \
> +			$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules)
>  	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-progress.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
>  	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/tmpfiles-swupdate.conf \
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
