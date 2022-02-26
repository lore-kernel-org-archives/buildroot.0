Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5185AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 21:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B088186E;
	Sat, 26 Feb 2022 21:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9x4-arwHij4; Sat, 26 Feb 2022 21:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1688081779;
	Sat, 26 Feb 2022 21:25:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0031BF40F
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 21:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5A7409B0
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 21:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvZ3vCUE2JFo for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 21:24:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A7A04099C
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 21:24:58 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id w128so3338876vkd.3
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 13:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQ0IAMznSqBwvjJpVVu+gGyvR2YTFDI87jhzHipIKWA=;
 b=K6JmdchGs2kAA//lrKltN/vMxeWpyI/iBVslZ/2tn1EeqAMQ6YFT03Ox5JyIJvH0Op
 xcxOp11fMGE4Bqj5PKOdVgc2hipOM6BofNxEf3VFzGcwEMmZZFPYaqEymfKNnjXroaJ9
 jG9tRwslXrgbaKv7k/DmTfED2Ld1anHruo37V4/U8ckfznM4kt3qAJG3Ov4iOSDDcRXB
 fRuYDgu7gWkzAhTlGgEyvzWNr1cM3hX3p0jMNM7jHesgDzybi07gJlN99nDEay0+dgm3
 EUjPWVxUSCHAMrFkWpFx8uAxNixpIm2O0TE+uiGo/Xx+29VgM6LMopQlGgDeWK+D/DSR
 B9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQ0IAMznSqBwvjJpVVu+gGyvR2YTFDI87jhzHipIKWA=;
 b=baMmAEcE4ZmRX0L9wyLpNwNQeI5IDRURpwD78I0ab9SpxQNr+E45HmOWmdrAJsF1kb
 7RhYrk0jCVcJIaDvDUDUm39rqgWajrI5OF48JeUZt0kfXkx9iINpaB/1oLpeWx97L65Z
 v+HeTTOqjXD66SJ4jWKuKu8ikNsZBZ6Ndj0EnhfEijaSkGkPuNBdH/KxEnjiY6iUlWOb
 vd3T+CiB/QhF6b6CuVHziua9TrvqS1oT0Xndf5O69ggQ9bv/pUnUwahP578C5Ge5QmDq
 z6cCHD7N8AXGNWkcCWcLRfUOFa1/8f0fREQTwMoGwuDrvERAMHZju3fJw9kenrIWmhkI
 JG5w==
X-Gm-Message-State: AOAM532W7um8rmlkmZ6u6py8XpUR3k7sa2Ri6HPWEhAGiLvjjX5XykZz
 tfgFYj9DHnr0GMyMqlJ9yDll7rekabIl9A==
X-Google-Smtp-Source: ABdhPJwv98fFQC2RnkcIpMj7dbzFgnHbezd7upA0EXfXq7aMfTi0Ad397w0FRXEPnQlG7hT7xF49fQ==
X-Received: by 2002:a1f:a495:0:b0:332:59d4:cc4a with SMTP id
 n143-20020a1fa495000000b0033259d4cc4amr5484212vke.34.1645910696192; 
 Sat, 26 Feb 2022 13:24:56 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43]) by smtp.gmail.com with ESMTPSA id
 n1-20020ac5c241000000b00332f547e7e5sm570102vkk.34.2022.02.26.13.24.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 13:24:55 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id t22so9180275vsa.4
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 13:24:55 -0800 (PST)
X-Received: by 2002:a67:1084:0:b0:31c:5a10:ba1c with SMTP id
 126-20020a671084000000b0031c5a10ba1cmr5178177vsq.4.1645910695163; Sat, 26 Feb
 2022 13:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20220226102418.943851-1-tianyuanhao3@163.com>
In-Reply-To: <20220226102418.943851-1-tianyuanhao3@163.com>
Date: Sat, 26 Feb 2022 13:24:43 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pzKdDvtjz8z6TWeuKQSaF15VkU0_SFqRJ3NB7DyDc2pQ@mail.gmail.com>
Message-ID: <CA+h8R2pzKdDvtjz8z6TWeuKQSaF15VkU0_SFqRJ3NB7DyDc2pQ@mail.gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/balena-engine: bump to
 version 20.10.12
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
Cc: Christian Stewart <christian@paral.in>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Matt Weber <matthew.weber@collins.com>, Kyle Harding <kyle@balena.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On Sat, Feb 26, 2022 at 2:26 AM TIAN Yuanhao <tianyuanhao3@163.com> wrote:
>
> Also:
> - drop unused dependencies
> - drop invalid tags
> - drop the autogen step
> - simplify kconfigs just to run hello-world
>
> https://github.com/balena-os/balena-engine/blob/v20.10.12/CHANGELOG.md
>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/balena-engine/Config.in          |  1 -
>  package/balena-engine/balena-engine.hash |  2 +-
>  package/balena-engine/balena-engine.mk   | 42 +++++-------------------
>  3 files changed, 9 insertions(+), 36 deletions(-)
>
> diff --git a/package/balena-engine/Config.in b/package/balena-engine/Config.in
> index f48f361dc2..02f694515e 100644
> --- a/package/balena-engine/Config.in
> +++ b/package/balena-engine/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_BALENA_ENGINE
>         depends on BR2_USE_MMU # util-linux
>         select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime
>         select BR2_PACKAGE_IPTABLES # runtime
> -       select BR2_PACKAGE_SQLITE # runtime
>         select BR2_PACKAGE_UTIL_LINUX # runtime
>         select BR2_PACKAGE_UTIL_LINUX_BINARIES # runtime
>         select BR2_PACKAGE_UTIL_LINUX_MOUNT # runtime
> diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
> index 3f632ef381..ef590881f5 100644
> --- a/package/balena-engine/balena-engine.hash
> +++ b/package/balena-engine/balena-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  389282706562118608b6ac580e7beacd6a43f0bb3481c69fb1856bed9ac49b85  balena-engine-19.03.14.tar.gz
> +sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
\
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_ADDRTYPE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_CONNTRACK)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XT_MATCH_IPVS)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_MACVLAN)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
>         $(call KCONFIG_ENABLE_OPT,CONFIG_VETH)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_OVERLAY_FS)
> -       $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
>  endef
>
>  define BALENA_ENGINE_INSTALL_SYMLINK
> --
> 2.25.1


Reviewed-by: Christian Stewart <christian@paral.in>

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
