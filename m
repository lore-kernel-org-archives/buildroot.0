Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2D2405E3;
	Wed, 27 Apr 2022 19:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIHYqecgIahU; Wed, 27 Apr 2022 19:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56FDD405CE;
	Wed, 27 Apr 2022 19:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F67C1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F197D82D14
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiajFFHT3trH for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:36:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1521382CDE
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:36:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so5367018ejj.10
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QN2PutRCwy2+CR7llI8biIiaLs72jZuqWpSgwQ2OBUs=;
 b=g5idz/aP4boNjHOL+XLxS2me7G6cpq1788I88vCPrBtrduYBxlMyVJzHSjxa493o7/
 LSuPk0LvOufgAOl4odEIzU6YslleKwKP03XfpzNkn0BKIaj2fBYYKOZc06TB7gAEvJ44
 l2KgVCwZFGBbeMNReKw2Q9ZOIcWWIq34b/u4SCkpIl+u+qCsDKSwPJJkpCjdq799vpHA
 Qmu9gvOg1BaWxVvr2yR5sKBX9DerJs4wjm1rdGjyl9ZG1aXpO8wS7Q6UNPhF6QWY+QDt
 gHkEHXIy46adGSX2vUN1Qb/W7om3R8YgK/FN0CAHEdFoNbuPeJxg0I3RU1Wn3POcjr6b
 fQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QN2PutRCwy2+CR7llI8biIiaLs72jZuqWpSgwQ2OBUs=;
 b=if8b4Vt8EspXq9umIiIXjBy3N4PgQUgGtXLD14yJzpz8e8jnFqjd8RCRlI3cswkpJu
 OMRt8iaA9Z2DsXYQ9qBocRsPlWqss7uMi+6fDIlGgXEemNHsaEp8Owy0cYTtYGn/YIMy
 KguYSM8yIVmD69pHu6yf6dkDb36Qigk/ITa0uZ3PMIP1JFo5m2WVM1Cf0VKk7gIbcXBM
 6NMnKIZUW6bt34J2Bfv8hbMIPchPS8yx/ym0HgVhNeiYg6D537afdKmc3wMAS4VtQw0x
 WWalyY0QtLdIgM5xInkpy+9I13ozdtMVxWkLTpDeqKHVOCwdwMrOMMP9fh5JF17iIE7i
 Bj4A==
X-Gm-Message-State: AOAM532Gnwzx0X5DlMXMwqi2MihuUBWnZBFFWHijGyp7Es4T3NgkKA9i
 O6gsWysLbEXwzly3o/bnNbAs6Q==
X-Google-Smtp-Source: ABdhPJyAWXkM6VqTJkdxKvasQFbMIxRAe+dRSQe3WImMA36u2ayzivsL+meKuT0GpOsQQIVtBcRRwQ==
X-Received: by 2002:a17:907:a042:b0:6f3:b4fc:be3d with SMTP id
 gz2-20020a170907a04200b006f3b4fcbe3dmr9098350ejc.318.1651088193357; 
 Wed, 27 Apr 2022 12:36:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1709067d5300b006e8488d9a80sm7269615ejp.59.2022.04.27.12.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:36:32 -0700 (PDT)
Message-ID: <b13f1af8-f276-3498-9360-9c71a1ecec1f@mind.be>
Date: Wed, 27 Apr 2022 21:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220426203036.2446167-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426203036.2446167-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/openobex: fix static with
 libusb and libatomic
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 22:30, Fabrice Fontaine wrote:
> Force LibUSB_VERSION_1.0 to ON to fix the following static build failure
> with libusb and libatomic:
> 
> -- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a
> -- Looking for libusb_get_device_list in /nvmedata/autobuild/instance-4/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libusb-1.0.a - not found
> 
> [...]
> 
> /nvmedata/autobuild/instance-4/output-1/build/openobex-1.7.2/lib/transport/usbobex.h:30:10: fatal error: usb.h: No such file or directory
>     30 | #include <usb.h>
>        |          ^~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/52b0edc4278f65fb4a9671b65c655cc4544a3103
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openobex/openobex.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
> index bc4a47e3d7..7109bffa8d 100644
> --- a/package/openobex/openobex.mk
> +++ b/package/openobex/openobex.mk
> @@ -20,6 +20,7 @@ OPENOBEX_DEPENDENCIES += bluez5_utils
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +OPENOBEX_CONF_OPTS += -DLibUSB_VERSION_1.0=ON
>   OPENOBEX_DEPENDENCIES += libusb
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
