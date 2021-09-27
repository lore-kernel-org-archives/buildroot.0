Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90147C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 17:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E624560E54
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 17:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E624560E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F945406BD;
	Mon, 27 Sep 2021 17:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9vlylcxLvNg; Mon, 27 Sep 2021 17:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B314053F;
	Mon, 27 Sep 2021 17:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0224D1BF5F6
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 17:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E538A4053F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 17:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwzIOSyVI_Mj for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 17:22:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADB50404E9
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 17:22:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:fc12:1c1d:1db6:86f9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 85FABB00563;
 Mon, 27 Sep 2021 19:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632763324;
 bh=ozbg7Hztf+KNomMqFTUfIBkVFvvDs29RVYwNbkQrsWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=idj8YHL/ZeQVe4WUnI0BBqQLNgfxVhqcOzImueVLyi2K6aUgLgsA3GSEpKeTye55Z
 WNevMDO2JQGGOsNJO140wnzTMOIwFUDjIds3UZXmciJmFtrYc2Z77PzILFjtc5Ypem
 YeqDdxHxMpdPsYyfjB2/YX/i9THuP/r6RnJfm8SLwo7zfjHKI5z+HVWudOQ/9HqpEi
 okOQ/Ijc1/CVeCQAi/RiO2jyVXStvxAXnVRf/4jCmU281sU7t0vCb4O/NnxkA4HGjY
 sqALBtjW++O44xmDp74hAhUb+nmBH9ADJ0FK278V7CLIoRjtWlMg3sHgFBq+XUbg6r
 VK8RuHNd5mFsw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Sep 2021 19:21:55 +0200
Date: Mon, 27 Sep 2021 19:21:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210927172155.GA1504958@scaer>
References: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
 <20210920152831.2489077-1-martin.elshuber@theobroma-systems.com>
 <0b09997d-7df9-2385-aede-f6620d8d3292@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b09997d-7df9-2385-aede-f6620d8d3292@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/2] package/strongswan: Add options to
 select EAP plugins
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
Cc: buildroot@buildroot.org,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Martin Elshuber <martin.elshuber@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Martin, All,

On 2021-09-27 18:56 +0200, Arnout Vandecappelle spake thusly:
> On 20/09/2021 17:28, Martin Elshuber wrote:
> >Add options to chose EAP plugins.
> >
> >Since the only plugin requiring libgmp is
> >BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2, the selection of BR2_PACKAGE_GMP
> >is moved down accordingly.
> >
> >Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> >
> >---
> >Changes v1 -> v2:
> >   - use conditional defaults and mark as legacy
> >   - drop 'ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)'
> >   - fix title for BR2_PACKAGE_STRONGSWAN_EAP_DYNAMIC
> >
> >Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> >---
> >  package/strongswan/Config.in     | 89 +++++++++++++++++++++++++-------
> >  package/strongswan/strongswan.mk | 40 +++++++-------
> >  2 files changed, 87 insertions(+), 42 deletions(-)
> >
> >diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> >index 368cd1ecc0..8eae568b6a 100644
> >--- a/package/strongswan/Config.in
> >+++ b/package/strongswan/Config.in
> >@@ -75,34 +75,83 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
> >  config BR2_PACKAGE_STRONGSWAN_EAP
> >  	bool "Enable EAP protocols"
> >-	select BR2_PACKAGE_GMP
> >-	help
> >-	  Enable various EAP protocols:
> >-	    - mschapv2
> >-	    - tls
> >-	    - ttls
> >-	    - peap
> >-	    - sim
> >-	    - sim-file
> >-	    - aka
> >-	    - aka-3gpp2
> >-	    - simaka-sql
> >-	    - simaka-pseudonym
> >-	    - simaka-reauth
> >-	    - identity
> >-	    - md5
> >-	    - gtc
> >-	    - tnc
> >-	    - dynamic
> >-	    - radius
> >  if BR2_PACKAGE_STRONGSWAN_EAP
> >+config BR2_PACKAGE_STRONGSWAN_EAP_SIM
> >+	bool "Enable EAP-SIM"
> >+	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> 
>  This is already inside if BR2_PACKAGE_STRONGSWAN_EAP, so the condition on
> the default is meaningless. Yann said something about this legacy stuff
> which I don't quite follow, since the BR2_PACKAGE_STRONGSWAN_EAP is not
> legacy. Yann, did you mean that BR2_PACKAGE_STRONGSWAN_EAP should be removed
> (i.e. moved to Config.in.legacy), or was it a mistake?

Yes, BR2_PACKAGE_STRONGSWAN_EAP should be moved to legacy, i.e. to
Config.in.legacy. Sorry, I was not so clear in my previous review...

My understanding is that, with this change, BR2_PACKAGE_STRONGSWAN_EAP
by itself will no longer enable/disable anything; only the new
sub-options will.

As such, BR2_PACKAGE_STRONGSWAN_EAP serves no other purpose that to
hide/show a bunch of options; this is superfluous. Hence, my suggestion
to move it to legacy.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> [snip]

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
