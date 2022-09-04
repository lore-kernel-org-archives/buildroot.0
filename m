Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E189ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 19:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66C3813DC;
	Sun,  4 Sep 2022 19:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D66C3813DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVTQnUZbAGTp; Sun,  4 Sep 2022 19:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C0A2813E3;
	Sun,  4 Sep 2022 19:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0A2813E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 494071BF303
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3141A4024B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3141A4024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXOfKIKskih5 for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 19:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F70B401A3
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F70B401A3
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 19:06:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m1so8864772edb.7
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 12:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=YE9+jW75rLtKwdUR29NfGdbFnKdIbIblhYpy1gYqTYs=;
 b=MZli8+RamXIVBLbK4tuX7r2D5M+oN3YxP8ZZZdaww1IzWdatTlQTp2BxxSOlcBKNVw
 86VKMERri+4WhsXviQNO6F4YhDkaZJrvep6sUFUNhafZwaB93gPvDhMtyiLSngaoGIdg
 emQf85i83ml4QkUfwDq3a867zBDf3G5PXZ9mQtyshqdZGCyHHW/NkvAkLj+kZcheIoeF
 r1yhUeR6TPgNCIpFnSaiCclijkJZI3In0oInSM+EhlveFAAwvMde5wUxUmDca1RdCgIG
 XAuf1LhKfYsU6QLx/X5+cFn5rDARsCGT6eW25kWo8xicWse64pxEbDDKDZP/mvJvFMbe
 2fqw==
X-Gm-Message-State: ACgBeo1HEgVV4WYLwNprWJ/smQzBUZLhfkZKiWDSVVCwkuNp2LAcvkpi
 l3j4NWBOE9ZhRUbWTOyJCDsr3AHQdRFjp76r
X-Google-Smtp-Source: AA6agR7D3gDFaowu08+OlhaaUqXpTMRVYHfNJjXsiGhKobiNiYFBkVowJAATDA8mDvOb8EBiwNLUFA==
X-Received: by 2002:a05:6402:3203:b0:435:5a48:daa9 with SMTP id
 g3-20020a056402320300b004355a48daa9mr30854984eda.304.1662318389821; 
 Sun, 04 Sep 2022 12:06:29 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 u3-20020aa7d883000000b004482dd03fe8sm5101284edq.91.2022.09.04.12.06.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 12:06:29 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id u6so8819754eda.12
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 12:06:28 -0700 (PDT)
X-Received: by 2002:a05:6402:3484:b0:448:cc83:2bff with SMTP id
 v4-20020a056402348400b00448cc832bffmr23188636edc.65.1662318387648; Sun, 04
 Sep 2022 12:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220616163309.5271-1-raphael.pavlidis@gmail.com>
 <20220904125359.18844-1-raphael.pavlidis@gmail.com>
In-Reply-To: <20220904125359.18844-1-raphael.pavlidis@gmail.com>
Date: Sun, 4 Sep 2022 12:06:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rReW+jaQLWObg7HEbhjtA9TKwTexMeK2=38aQXheASrg@mail.gmail.com>
Message-ID: <CA+h8R2rReW+jaQLWObg7HEbhjtA9TKwTexMeK2=38aQXheASrg@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=YE9+jW75rLtKwdUR29NfGdbFnKdIbIblhYpy1gYqTYs=;
 b=MWKMEqg+FEAEIgzj3lVFUcpRmYnK/4Rp9PD0mNcLV/3fPm5QiZ8Awu6YpBS2t738Q7
 vQqJAXbfGWvAj4O7ATUVK3/Hd3vWoz/t9/zbPnLjC7pKB6G0X4E7/zVaYPnbXHzEbZ4t
 hBL0dlRfGcTlpaH2q8sk9EuQhrzsy9xzHB0V9y9e9r5Rm1MsE1s2eshx9SVXM9K9FNpd
 VAuZpIuK+Y5+tywpyZnI24xaHrURRM9c73ZeFM6VU0Hsn8LLf/UATynGjmvlBMlwzM8Z
 kdhpi5lCvEMHt9AeBqXKnrVqZaWXU14i6+COtS4OdFqwsMG3yZgMF5dOecR4xak4HZKq
 YT9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=MWKMEqg+
Subject: Re: [Buildroot] [PATCH v3 1/1] package/cni-plugins: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Raphael,

On Sun, Sep 4, 2022 at 5:54 AM Raphael Pavlidis
<raphael.pavlidis@gmail.com> wrote:
>
> cni-plugins contains some reference networking plugins, maintained by
> the CNI team.
>
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

I guess this is a follow-up to my cni-plugins submission?

https://patchwork.ozlabs.org/project/buildroot/patch/20220821053547.667311-1-christian@paral.in/

You're missing a few things:

+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+CNI_PLUGINS_DEPENDENCIES += libapparmor
+CNI_PLUGINS_TAGS += apparmor
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+CNI_PLUGINS_TAGS += seccomp
+CNI_PLUGINS_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+CNI_PLUGINS_TAGS += selinux
+CNI_PLUGINS_DEPENDENCIES += libselinux
+endif

> ---
> Changes v2 -> v3:
>   - DEVELOPERS: add Raphael Pavlids for cni-plugins
>
> Changes v1 -> v2:
>   - change BR2_PACKAGE_CNI_PLUGINS from config to menuconfig
>   - turn on all plugins by default

Was v2 submitted before?

I like adding the options for the plugins, but you're missing some -
here is the list from the other submission:

+
+CNI_PLUGINS_BUILD_TARGETS = \
+ plugins/ipam/dhcp \
+ plugins/main/bridge \
+ plugins/main/host-device \
+ plugins/main/ipvlan \
+ plugins/main/loopback \
+ plugins/main/macvlan \
+ plugins/main/ptp \
+ plugins/main/vlan \
+ plugins/meta/bandwidth \
+ plugins/meta/firewall \
+ plugins/meta/portmap \
+ plugins/meta/tuning \
+ plugins/meta/vrf


> +
> +if BR2_PACKAGE_CNI_PLUGINS
> +
> +config BR2_PACKAGE_CNI_PLUGINS_BRIDGE
> +       bool "bridge"
> +       default y
> +       help
> +         Creates a bridge, adds the host and the container to it.
> +
> [snip]

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
