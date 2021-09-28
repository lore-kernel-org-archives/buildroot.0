Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED57C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:47:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0B061374
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA0B061374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 961D740175;
	Tue, 28 Sep 2021 20:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEwWV6nIrbGb; Tue, 28 Sep 2021 20:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA747405F4;
	Tue, 28 Sep 2021 20:47:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBCFC1BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7D360B85
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LOVL4xziskM for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:47:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FE33605EF
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:47:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f1ff:ef77:6fa4:2894])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 56251B004EE;
 Tue, 28 Sep 2021 22:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632862066;
 bh=ppnq0mXM3hXNtIW97AF6rfrTG7+24+M6WJCK+y0QHZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ft2yc3thkFfJdeog8YnIy7lepcKCg2etQgdjboECSfICyFbylh5zk2vWegdjAXoqA
 y23844HnkcYxEikh2ALOUxet+82/QUG8+BPGV/z087aJD0z+aXnZU+/xqJPzIkj5kq
 gzt34siV+jdBx2oP/RPUdoxJcZ90TtnqVIji/Xe8U8//mq5Z4dYuEVvp5wWoOVK+Mq
 5QEJQDwwG/BpDQtWPFDkvjZemGhVvzwb/+Mqkj+LwbM3EBX1T+fX4IJpvboWTYQImM
 sMKA4z+ysz/lvZ5NTg+rfKDgRSukcqib6phOi7LwGe0tOkzJgYUjKGSVJ0hzM+ALkQ
 pJGugSqJnO+HA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Sep 2021 22:47:40 +0200
Date: Tue, 28 Sep 2021 22:47:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Message-ID: <20210928204740.GL1504958@scaer>
References: <20210920152831.2489077-1-martin.elshuber@theobroma-systems.com>
 <20210920152831.2489077-2-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920152831.2489077-2-martin.elshuber@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/2] package/strongswan: add md4 hash
 algorithm option
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Martin, All,

On 2021-09-20 17:28 +0200, Martin Elshuber spake thusly:
> Add the option to enable the md4 hash algorithm and default it to 'no'
> since this is a new option.
> 
> Since md4 is required by EAP-MSCHAPv2 it is selected by
> BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2. See
> https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf for
> further details.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> - change git title
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>  package/strongswan/Config.in     | 4 ++++
>  package/strongswan/strongswan.mk | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 8eae568b6a..21f84ebb71 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -73,6 +73,9 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_20
>  config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
>  	bool "Enable dynamic TNCCS protocol discovery module"
>  
> +config BR2_PACKAGE_STRONGSWAN_MD4
> +	bool "Enable MD4 hash algorithm"
> +
>  config BR2_PACKAGE_STRONGSWAN_EAP
>  	bool "Enable EAP protocols"
>  
> @@ -127,6 +130,7 @@ config BR2_PACKAGE_STRONGSWAN_EAP_GTC
>  config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
>  	bool "Enable EAP-MSCHAPv2"
>  	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_STRONGSWAN_MD4
>  
>  config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
>  	bool "Enable EAP-PEAP"
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 5fb4e6821a..c308d3a4f3 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
>  	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>  	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
>  	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
> +	--enable-md4=$(if $(BR2_PACKAGE_STRONGSWAN_MD4),yes,no) \
>  	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
>  	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
>  	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
> -- 
> 2.30.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
