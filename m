Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44613C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:47:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D90060EC0
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D90060EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC01E614A2;
	Sat, 18 Sep 2021 10:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0FWti3qRcuL; Sat, 18 Sep 2021 10:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071EF60779;
	Sat, 18 Sep 2021 10:47:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B65B1BF48B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 186BD425CD
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAuVrdAZJRqi for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 10:47:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E133E425CF
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 10:47:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9B5E1B004EC;
 Sat, 18 Sep 2021 12:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631962068;
 bh=LKhkIwVNIZEci/ebAKsSgRmA6GG7ek6gy4ItMEduUfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fQqB30KZvgUjvXGh5m/d++4fC2M8jkUCpVHxWoSsBaIp54Nt5QmX+Q8BCFykg4rLG
 Wb+UOgA5x0erXfAzu1gMNmexgvqAcjWGz4t1essnLB/bfVzHHBsi+BCwZU56O10/Jj
 JZmCmOSF7h0ehrrEie9rL8Ij8CHuRmRKB5WGIOKztzufe8wHqfftZNmUcqBfBpL7sZ
 YGlnIlSgBiGo9TG44uW0xMkGrgoiPmvIzDDgLNNSL+z6x6FpxQtYUvhJ02PZjutPep
 ABXQOuCyCMbi9fFVA9NbgIAxKx3SRpaoYsgi8hfqJ6+PHPH8NyjxKwc9S/rSyoowhj
 kspNa22+zqDYg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 12:47:41 +0200
Date: Sat, 18 Sep 2021 12:47:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210918104741.GK1053080@scaer>
References: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915205640.1411368-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/libvirt: disable docs and tests
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-15 22:56 +0200, Fabrice Fontaine spake thusly:
> Disable docs and tests which are enabled since the addition of the
> package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of three patches Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvirt/libvirt.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
> index 847c35e06e..396dd61577 100644
> --- a/package/libvirt/libvirt.mk
> +++ b/package/libvirt/libvirt.mk
> @@ -33,6 +33,7 @@ LIBVIRT_CONF_ENV += \
>  LIBVIRT_CONF_OPTS = \
>  	-Drpath=disabled \
>  	-Dapparmor=disabled \
> +	-Ddocs=disabled \
>  	-Ddriver_bhyve=disabled \
>  	-Ddriver_esx=disabled \
>  	-Ddriver_hyperv=disabled \
> @@ -41,10 +42,12 @@ LIBVIRT_CONF_OPTS = \
>  	-Ddriver_openvz=disabled \
>  	-Ddriver_remote=enabled \
>  	-Ddriver_secrets=enabled \
> +	-Ddriver_test=disabled \
>  	-Ddriver_vbox=disabled \
>  	-Ddriver_vmware=disabled \
>  	-Ddriver_vz=disabled \
>  	-Ddtrace=disabled \
> +	-Dexpensive_tests=disabled \
>  	-Dfirewalld=disabled \
>  	-Dfirewalld_zone=disabled \
>  	-Dglusterfs=disabled \
> @@ -64,6 +67,7 @@ LIBVIRT_CONF_OPTS = \
>  	-Dstorage_mpath=disabled \
>  	-Dsysctl_config=enabled \
>  	-Dtest_coverage=false \
> +	-Dtests=disabled \
>  	-Dudev=enabled \
>  	-Dwireshark_dissector=disabled
>  
> -- 
> 2.33.0
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
