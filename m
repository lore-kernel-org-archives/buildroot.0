Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6D6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD5181D34;
	Sat, 12 Feb 2022 13:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVZhn8YoYB_A; Sat, 12 Feb 2022 13:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D09D81B14;
	Sat, 12 Feb 2022 13:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D63F1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BBEE41484
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImJp_A12Yx1C for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:12:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B1FD410E9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:12:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id jg20so3216743ejc.3
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=da2aw474uQjqM1KgJIdS7zvYdG9C7e3fIzHrsT0p4wg=;
 b=GZ4x3+s3fHT8aXkS9/2lepLKtOeBARjmfuBSzE3E5Xgwhyu3vXXrvoK+neAn2ZWxyY
 87FtulgE61V+c/D3RFmrq6ubkfNIxhqhnQu1DZCD5uhMQj4g2dfDO41tQLPT9h72LtTI
 fyJ1uGn91V0Vw0X2Z6H4eynmj/FxBHYer2fTmiOXr+WcCv3ix/aa+yEGirWMuc336M1F
 uEddYgrfVtibuYXVwjdmkZlFsRzUHysE0abShWtOTMOP/h7IoeIdsyyD4I7FtCV0PvUB
 D7OorlBxUNsenLHdk4VSJIWvWkVEGGk6yyEAQ9UvIzxn7bqgc/XPlXG8RDnw1Six/ATT
 zsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=da2aw474uQjqM1KgJIdS7zvYdG9C7e3fIzHrsT0p4wg=;
 b=Ys1HKa2WzjGk88xCH1aGM1eo1lNrLHBRSN0hGleXkAatQRjkNQZwPjiAeVkkWqbIrq
 FwLIu/yWLiEvh3T+krtu4BcOZfA2VyK5sR4BE8/qf9ITmNMQ7sMbfAgiyCZS+tiRgl+7
 h44axf98bupcTuFLlK2J1R5CiHEIes5O7hi1T241Eqh0tQxZD6l5Mu8ifOjOZj3RHvyW
 zFsYos8c2SfsiWQVCfG7W5Vh99x/N0CuXdp6PS5/6ISLaT4QGjCJnQm5cFxoxY6W71R1
 3L0Azd37sIa00ZwYXKAA+J+GJDxbxR1tBtXX1GVDCV+SkwgRAiMMyVN0q54mphbujhvr
 tIdw==
X-Gm-Message-State: AOAM533DPDxMmAWYOgsLTMJETrklE4P20pjz69WiGUJzEZ1+S9nG0Ih1
 AxJEJgiDiFI22VV74e9pX0iwxolF1adTwg==
X-Google-Smtp-Source: ABdhPJw1nI7afCZWA9OHBxFCncp6dXOt4CJyyjfU/0ah0jwWkYvk94OyRg20kvOdxPQ6UPaCaCcFhg==
X-Received: by 2002:a17:907:6e14:: with SMTP id
 sd20mr4837443ejc.749.1644671518245; 
 Sat, 12 Feb 2022 05:11:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cn15sm6877582edb.37.2022.02.12.05.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:11:57 -0800 (PST)
Message-ID: <ba0bc0d5-aeb6-902c-f4a3-ee914306aba4@mind.be>
Date: Sat, 12 Feb 2022 14:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220128045140.272465-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220128045140.272465-1-fido_max@inbox.ru>
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.7.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/01/2022 05:51, Maxim Kochetkov via buildroot wrote:
> Drop upstream patch.
> Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.7.1
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...CMakeLists.txt-respect-BUILD_TESTING.patch | 47 -------------------
>   package/protozero/protozero.hash              |  2 +-
>   package/protozero/protozero.mk                |  2 +-
>   3 files changed, 2 insertions(+), 49 deletions(-)
>   delete mode 100644 package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
> 
> diff --git a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch b/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
> deleted file mode 100644
> index d0267e3283..0000000000
> --- a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 03daae49c8fa94513b508bd12f1597e8e5e086f2 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 17 Apr 2021 13:06:44 +0200
> -Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING
> -
> -Don't build tests if the standard cmake BUILD_TESTING variable is set to
> -OFF.
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/mapbox/protozero/pull/105]
> ----
> - CMakeLists.txt | 9 +++++----
> - 1 file changed, 5 insertions(+), 4 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index f9702d6..7a40212 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -23,6 +23,7 @@ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
> -
> - #-----------------------------------------------------------------------------
> -
> -+option(BUILD_TESTING "Build tests" ON)
> - option(WERROR "Add -Werror flag to build (turns warnings into errors)" ON)
> -
> - if(MSVC)
> -@@ -134,13 +135,13 @@ install(DIRECTORY include/protozero DESTINATION include)
> -
> - #-----------------------------------------------------------------------------
> -
> --enable_testing()
> --
> - add_subdirectory(doc)
> -
> - add_subdirectory(tools)
> -
> --add_subdirectory(test)
> --
> -+if(BUILD_TESTING)
> -+    enable_testing()
> -+    add_subdirectory(test)
> -+endif()
> -
> - #-----------------------------------------------------------------------------
> ---
> -2.30.2
> -
> diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
> index 5453e01ecf..f0b8e39009 100644
> --- a/package/protozero/protozero.hash
> +++ b/package/protozero/protozero.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  beffbdfab060854fd770178a8db9c028b5b6ee4a059a2fed82c46390a85f3f31  protozero-1.7.0.tar.gz
> +sha256  27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99  protozero-1.7.1.tar.gz
>   sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
> diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
> index 80d16192e3..a46e37d69b 100644
> --- a/package/protozero/protozero.mk
> +++ b/package/protozero/protozero.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PROTOZERO_VERSION = 1.7.0
> +PROTOZERO_VERSION = 1.7.1
>   PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
>   PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
>   PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
