Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE1FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B75C404D0;
	Sun, 27 Mar 2022 16:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFvp55W5gmSm; Sun, 27 Mar 2022 16:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD04440189;
	Sun, 27 Mar 2022 16:28:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D82E71BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4EF060681
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8syG-xyJ0tyh for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF45860625
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:28:33 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a8so24083196ejc.8
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tpgAYB0+/MLkcozYXtY5/tZwaq0CQct180y8Sz6N3xM=;
 b=dDb3nZ2W4yv/j6wxtMet4omp6GJzCRwB2v6U0nro9AWe6NXILtOdNBS3ndk8MBlCnq
 RtimD5pDYk45hyW/5/01EgkX9VUZNCi0Ks8iCqs/tJWFF7GzReh7aj2AnwPyQXel/vC2
 W6eZCEsdHJPyLpUlKmeuJkEwAl80gutApPoBagR3J71hS9yIqD/CNDhE2FImhhxe0Pgn
 4T4bV45ESXcVxNTLKvw3vk2ZjZTwm4RuIGUK4r7+v/Bx6I3HhKf5+N2AnUZqsyJh6SrX
 9AXISsokkz2ssNOmoOCC/iBF4w+OSM4RgYgF259KM++X5TlZt4KndArnWMmZ8Acp6+CM
 jW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tpgAYB0+/MLkcozYXtY5/tZwaq0CQct180y8Sz6N3xM=;
 b=hJ1qFDlaHgjEoTpUvxo4BcuWu+Ac/6Pl8NGucdIqHDaE33Ea9p5Fd0l3qYqWpLfIm7
 OvuuUK4EU96cC0SXed3pj1bLUi/7heEmQdTRn9A4W7QoaOsRlHtVRO4lp3e8lN8Pi3K7
 56Q1s9I0EnonwU48X33I8gKGZCL96mTJhZrWEiXcKFk3iRMpvkvSnd8H4FG9Om9JKSlR
 ZdTyRhftxMUVbd8Lsl+Qp/4N1s4R/Y13xAY6exYmyeoaCMXplBK9Uc6XZUT29HHA8onR
 /stfez1TGT7uMajtmI7DMyrazT4ML/TNHrdF7+UUC16Af4+QtBP4zaGFnpJiFWXzMmQJ
 rn3w==
X-Gm-Message-State: AOAM531WkzByJtzputp11G1nn5HCs0QlPVwm8P04kFMybywcs8Op4RXl
 YA2x2OKW94DJlT35H85dmPlw4w==
X-Google-Smtp-Source: ABdhPJxg9x6FvB9ExxzqBl6RJt+BVnf1Vwz7c0wHZteBLHRLlI5cS2V9NAAh0GBV1X28Wa2w9w9Zbg==
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id
 nd33-20020a17090762a100b006da7952d4d2mr22691751ejc.260.1648398512114; 
 Sun, 27 Mar 2022 09:28:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 nb6-20020a1709071c8600b006e02910f818sm4821009ejc.157.2022.03.27.09.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:28:31 -0700 (PDT)
Message-ID: <6e6b1d54-a96f-1115-be91-7349e652043f@mind.be>
Date: Sun, 27 Mar 2022 18:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220324223218.27767-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220324223218.27767-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: fix build with
 clang-tidy
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2022 23:32, Fabrice Fontaine wrote:
> Fix the following build failure if clang-tidy is found on host (and
> protobuf is built before protozero) which is raised since tests are
> disabled in commit be4869f393561aa5c297b631efc62dfd5e1c3f3f:
> 
> CMake Error at CMakeLists.txt:77 (add_dependencies):
>    The dependency target "writer_tests" of target "clang-tidy" does not exist.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c3ae3b5caf79eb30c8a1786f58abea4f2b41a26e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...xt-protobuf-is-only-needed-for-tests.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
> 
> diff --git a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
> new file mode 100644
> index 0000000000..3033e24aa2
> --- /dev/null
> +++ b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
> @@ -0,0 +1,35 @@
> +From 1c16d3ffccd9e415c6ea3681f23231cd5184043c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 16 Feb 2022 00:11:38 +0100
> +Subject: [PATCH] CMakeLists.txt: protobuf is only needed for tests
> +
> +Don't check for protobuf if tests are disabled. As a side effect, this
> +will avoid a build failure if clang-tidy and protobuf are found but
> +tests are disabled
> +
> +Fix #109
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/mapbox/protozero/pull/110]
> +---
> + CMakeLists.txt | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index b975d49..df2ca15 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -52,7 +52,9 @@ endif()
> + #
> + #-----------------------------------------------------------------------------
> +
> +-find_package(Protobuf)
> ++if(BUILD_TESTING)
> ++    find_package(Protobuf)
> ++endif()
> +
> +
> + #-----------------------------------------------------------------------------
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
