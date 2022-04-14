Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14093C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B9E41862;
	Thu, 14 Apr 2022 19:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6Z71xte6WU5; Thu, 14 Apr 2022 19:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D8704183D;
	Thu, 14 Apr 2022 19:24:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A46C1BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B7D83E0F
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DATqiBsZeTS2 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:24:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1327383E0D
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:24:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r13so11897956ejd.5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=btJ9+12ivKRc2ZpZL0yTLL22EqdVO/2RsOY5Xp5oLSw=;
 b=AKzBe7Ty9Al0LzmnnpTndYGZtQH8P9n1p00EPoxloBuiZ8UdZg/R966E1K6NrRJqSx
 NUV0iJnTdQX34uwpFYcJ18IVjMBy/bPi/WX2qpPhFGntWW3Qh0LgKjAnM74yS35nuHFR
 7ZFuqT+VJmY4sXaxB70K2gh5MzxVCPa+kdk2kn3opQjXOfg3/+adX7ICbOOHDIG9Fxxa
 s8E9kxlv15OpSlP0JIlNqUhBW5RDpFikJpqukV9tvUCdb7uXXcMl9PRFcLheTzRVU9as
 dlg7xHFolIS8wNFAeeTP9QgvFxkpXcTYQ2/el0VcMEeDerE9NYxe1Q1NO1ukCvvaPh8F
 XuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=btJ9+12ivKRc2ZpZL0yTLL22EqdVO/2RsOY5Xp5oLSw=;
 b=F1BFGV85/GEiWuK+7WzJkGHF+xd+FexW0Cl9c8IKi8j3vlj7pmoXsJp0fSX4x8YAYg
 eJgJs9MPJ1dstOHkH4kGNQmfn5eG8+mgUPZV6z1Mjq/gVAyXfR1uyI5iSGQST54wOEAV
 OtKTaXI5ToYdjMZzoc7S7/QX/8gg7KUakvVucF21apGOaukCOHA0cwOpxvE56Tp6TO+7
 qNct4w6DG0gGGhAG9JiIP8f640Thrr/A/EpcLAc7utkqqf09ZNOfv9GYqsL2P25ufbTE
 OLiQ634E32hiL+ECBrbkV+bYKlQSnTUQtDEbfJP9j7dCFjgia/zVzfd+UgzaKWpcKlo7
 s7wA==
X-Gm-Message-State: AOAM532HmZTIeJRYXYpNdgvtqaQOhswdL7EC1hLr8u+PgT33dwGfw4nU
 8Fx5sxt9n4HERVRDV3rlxN9CiQV21RZLCQ==
X-Google-Smtp-Source: ABdhPJyJ9UpmasfUm1WFg3iF9UgngF/mL8dx7lfE8Edz8F4de+fHqIN95V7o3n8csYiC5tFAAMhnJA==
X-Received: by 2002:a17:907:980d:b0:6d6:f910:513a with SMTP id
 ji13-20020a170907980d00b006d6f910513amr3411531ejc.643.1649964281244; 
 Thu, 14 Apr 2022 12:24:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056402519000b0041d77e14005sm1528191edd.82.2022.04.14.12.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:24:40 -0700 (PDT)
Message-ID: <3cd32b76-fabd-8b07-a211-c3caf6a01962@mind.be>
Date: Thu, 14 Apr 2022 21:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220406163300.4006892-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220406163300.4006892-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: fix build without C++
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/04/2022 18:33, Fabrice Fontaine wrote:
> Fix the following build failure raised since switch to meson-package in
> commit 1db13226394ff7e6f5e7ca643e275f35d6c633bb and
> https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:
> 
> The following exception(s) were encountered:
> Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/polkit/0003-fix-build-without-C.patch | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 package/polkit/0003-fix-build-without-C.patch
> 
> diff --git a/package/polkit/0003-fix-build-without-C.patch b/package/polkit/0003-fix-build-without-C.patch
> new file mode 100644
> index 0000000000..8e16de256c
> --- /dev/null
> +++ b/package/polkit/0003-fix-build-without-C.patch
> @@ -0,0 +1,50 @@
> +From abbc04f6f3acfc2dfa34b1c07decaa658786e142 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 2 Apr 2022 18:33:08 +0200
> +Subject: [PATCH] fix build without C++
> +
> +Fix the following build failure without C++ raised since
> +https://gitlab.freedesktop.org/polkit/polkit/-/commit/957a015157fd359d9679540f664183e4b9492896:
> +
> +The following exception(s) were encountered:
> +Running "/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-14/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
> +
> +Indeed, C++ is only required with mozjs engine
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1d52c8100414aa384572b23006a13f9b806d2d5a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.freedesktop.org/polkit/polkit/-/commit/abbc04f6f3acfc2dfa34b1c07decaa658786e142]
> +---
> + meson.build                   | 2 +-
> + src/polkitbackend/meson.build | 1 +
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index c6765fd..da60930 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1,5 +1,5 @@
> + project(
> +-  'polkit', ['c', 'cpp'],
> ++  'polkit', ['c'],
> +   version: '0.120',
> +   license: 'LGPL2+',
> +   default_options: [
> +diff --git a/src/polkitbackend/meson.build b/src/polkitbackend/meson.build
> +index 266f280..7c5d443 100644
> +--- a/src/polkitbackend/meson.build
> ++++ b/src/polkitbackend/meson.build
> +@@ -38,6 +38,7 @@ if js_engine == 'duktape'
> +   deps += libm_dep
> +   deps += thread_dep
> + elif js_engine == 'mozjs'
> ++  add_languages('cpp')
> +   sources += files('polkitbackendjsauthority.cpp')
> + endif
> +
> +--
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
