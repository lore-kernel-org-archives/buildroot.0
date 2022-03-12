Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAE2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1194640488;
	Sat, 12 Mar 2022 16:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSpQ9EV5WnIE; Sat, 12 Mar 2022 16:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D97FE403AA;
	Sat, 12 Mar 2022 16:58:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB4691BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C97403AA
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cq6dkBPlgEo3 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:58:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74FF74023D
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:58:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qx21so25305619ejb.13
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gGn83QJvAGf1V2Q9RqigRtIwX3aqnzdopOMZwmSe3KU=;
 b=UwQ5Hp5KOxJ+Wq+NIkNzd4jCcwk95AM4Nx8W/RMNbwevIlrKZxL8Lb3rKT0A4mIiok
 eUNAd4WENSTmzbObYqitF7hKqgj/QKUwiemgdoT6sA/1H9IK1fumgvNDt+K+GtmKQZJu
 WBx+/+6EJrD+ESX3HPY89NQHdNICw4jt3bp0WB46jCWybhvpEtkej974FbnFGP4P1gPd
 ZgiE8Kg0ymBE92FE6cqm1Nvc32wnyaVl+kFkuaOnDJ6Xs1MevF8OZ2TUNB1nbDVRzf+I
 Cvi/zJKi11lghag669ririlbFwhdBgy90iHNDn3agwg/LVawv4ngqdMJ5erqPI4OWzf9
 kRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gGn83QJvAGf1V2Q9RqigRtIwX3aqnzdopOMZwmSe3KU=;
 b=Z3YZ0i+jJJhipRxf8OJL/RaaNVOJsbDIrnRoA+bSp4GBTGzZxGY/3TsSMc/DL7fT/E
 UoiK5Vk3Sr1d2Ku9cWpX9witQnrYVMrE6Ofdczg2kMKfwof84Kco3KIZ5fXOOsGbaUrj
 CxNQunSRK3FSSE705Sx50j5fXoG/CwyFmDk2D+iQQNSj6NavQ5UA1F9n7NJo+1dyM/NR
 T5AwA0SmR5N3sB+DTR7/SWvQISnYitp3otL4T9t39a8fx61lfWkznINnLAcIWZK6Hp3q
 OH1fnYubN6+UhfNMFGlZq6jMUSH3mtSx9RrT39VjldyVX3Bcn32iy10eYVQYDrSD9Bep
 LH9A==
X-Gm-Message-State: AOAM533HMbU9yxAfBmkhf9btX5dz/s30sBcYO5K/TciHJJ7MJOm0LNIZ
 mMnWi3EtDQWmHUKrJgkXHxBqHA==
X-Google-Smtp-Source: ABdhPJxZVc/DvPGV8MrrEGyTNROKU1J6X0ei1KMi8TEIxYKEh9wZ78wMPsNWDJaLwubpHuO61dDs9A==
X-Received: by 2002:a17:907:94ca:b0:6da:e637:fa42 with SMTP id
 dn10-20020a17090794ca00b006dae637fa42mr12712031ejc.347.1647104306721; 
 Sat, 12 Mar 2022 08:58:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 sb31-20020a1709076d9f00b006ceb969822esm4552661ejc.76.2022.03.12.08.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:58:26 -0800 (PST)
Message-ID: <efd84e32-07b3-58c0-07fd-a96eb4b9057b@mind.be>
Date: Sat, 12 Mar 2022 17:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220218105924.738666-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218105924.738666-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.12
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 11:59, Fabrice Fontaine wrote:
> https://discuss.linuxcontainers.org/t/lxc-4-0-12-has-been-released
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lxc/lxc.hash | 2 +-
>   package/lxc/lxc.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
> index 2b58df2f1d..d460bc6a01 100644
> --- a/package/lxc/lxc.hash
> +++ b/package/lxc/lxc.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  afa481e17ca9a9cf9fd3d2d7a04e42a8f6bfe60b323909326c968e852cd9f02c  lxc-4.0.11.tar.gz
> +sha256  db242f8366fc63e8c7588bb2017b354173cf3c4b20abc18780debdc48b14d3ef  lxc-4.0.12.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> index 08f64bcec7..9311dc8775 100644
> --- a/package/lxc/lxc.mk
> +++ b/package/lxc/lxc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LXC_VERSION = 4.0.11
> +LXC_VERSION = 4.0.12
>   LXC_SITE = https://linuxcontainers.org/downloads/lxc
>   LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
>   LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
