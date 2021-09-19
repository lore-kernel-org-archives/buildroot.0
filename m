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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76305C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:36:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C27A60FF2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C27A60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00606400D1;
	Sun, 19 Sep 2021 07:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODDien3pXKtx; Sun, 19 Sep 2021 07:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 096754018C;
	Sun, 19 Sep 2021 07:36:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8E61BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EB3683837
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pxtCVXiVJ_u4 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AA368381F
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:36:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4DC672003C3;
 Sun, 19 Sep 2021 09:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632036970;
 bh=jab18vAywXL95VsbYqpYk6aobmY5+lNYsoVvUE+Qz58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4IUz9COFgU+DTE/gqNPtPuNqob8Qf5vfXGG7D4xFioUIciVrggC4Vv/qPxCe2EcT
 91ENou/vIgyNLGb63OoVS82tge8vfR+EAnlrulNQNvTFWy02e3Bhru9Bj1MEMkzaJb
 FJRhNfceeS3LGSipumFtXyQVImXC9xyjMcsAAyac7tyIvXf7OkndDgkRyGB2tT0hrK
 OVDB+nfnz5ArzDbrF9kwpgO0+NfhQvjhPPmykzZz5hiCLFM9qeK1NGIUPa+RBLlK8Y
 VhXummaUE8gv8vnLkQWvon1ZsqSyX+WyyR2+XRtwlHTLNksyxLDH1l+H/Vu+NiTsIj
 HSLRPonVrqbAQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 09:36:04 +0200
Date: Sun, 19 Sep 2021 09:36:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210919073604.GH1053080@scaer>
References: <20210911165019.1364188-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911165019.1364188-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: use
 $(SWUPDATE_PKGDIR) for pkgdir path
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

On 2021-09-11 10:50 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/swupdate/swupdate.mk | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index c49af7ebf7..e191ab384a 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -238,30 +238,30 @@ endif
>  define SWUPDATE_INSTALL_COMMON
>  	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
>  		$(TARGET_DIR)/usr/lib/swupdate/conf.d
> -	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
> +	$(INSTALL) -D -m 755 $(SWUPDATE_PKGDIR)/swupdate.sh \
>  		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
>  	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
> -		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
> +		$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/10-mongoose-args \
>  			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
>  endef
>  define SWUPDATE_INSTALL_INIT_SYSTEMD
>  	$(SWUPDATE_INSTALL_COMMON)
> -	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
> +	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
> -	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
> +	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate.socket \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
> -	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
> +	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb@.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
> -	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
> +	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-progress.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
> -	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
> +	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/tmpfiles-swupdate.conf \
>  		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
>  endef
>  define SWUPDATE_INSTALL_INIT_SYSV
>  	$(SWUPDATE_INSTALL_COMMON)
> -	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
> +	$(INSTALL) -D -m 755 $(SWUPDATE_PKGDIR)/S80swupdate \
>  		$(TARGET_DIR)/etc/init.d/S80swupdate
> -	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
> +	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/90-start-progress \
>  		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
>  endef
>  
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
