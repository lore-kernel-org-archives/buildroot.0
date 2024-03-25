Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E9AC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 23:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC51608F8;
	Mon, 25 Mar 2024 23:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duj2Hjfmg5m2; Mon, 25 Mar 2024 23:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B8460906
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B8460906;
	Mon, 25 Mar 2024 23:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74C7D1BF417
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61E3A81846
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 23:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0amz7a3oVO8l for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 23:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FE26813B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE26813B6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FE26813B6
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 23:46:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso3463823f8f.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 16:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711410393; x=1712015193;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KyEoAm0X6hbg4ZWwRd9JF0aioetEbZBBPjITKuHkOvQ=;
 b=roVqn/pZboJxz6pxk6TukyNcinrZRehFRAetuRoS2E+QN73IH+kFkAzuHYCL2TihZb
 8bn6EWxP9MucLJJiUZbBKnaHExLj0yTOAi0vl7R+fSeJtC7NBRZttvwMzQwl6qqA1QI6
 6F/pyVSK7avrFa6fsw/ZMWaRCMpF6TWk+ZiindD23cJqhShzOx8Yd/Xo1+noyZmBDnuv
 LJ5E6GbtcdejDOpW3uENXzjiJ0pgASub+V/Ta1aTakFc4UG8rpDYkwgLTydwbEhjdtqV
 B5PJy8JOG5IHV0i0HfWZYb5ECaEqV63CrIZ8PwLoNge7cKLeEkmb9CfsrNVu7LlzZ3oo
 oR6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBO3s5mOqi8tra9LJ2tgVx7kNG48aFun7dU1N+Pb08YdhdX5sa0VqKM8J+xCzy7GmsG32hdh9DVcMeSYONEPYCuDkQZgPwzQ==
X-Gm-Message-State: AOJu0YwUWiYlumF4YwIsDP54adVjCI3BSyxSF7WNDSbW6hEKJ29LGNJK
 2uDiTdL809b+Jr65aLtEhz+1LePVPq/U1KiFg5P7oD2ilPZEUauiS0/L8KZGGJ0=
X-Google-Smtp-Source: AGHT+IFutmse4L3Us8OOc+4x+8AymyIMsFLA06lX61VqO1mUYgQKmUl4rAmFaUXKHqm4Ugo+T5yQjQ==
X-Received: by 2002:a05:6000:1369:b0:341:c454:7ad8 with SMTP id
 q9-20020a056000136900b00341c4547ad8mr5086615wrz.13.1711410392959; 
 Mon, 25 Mar 2024 16:46:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 dw1-20020a0560000dc100b0033e3cb02cefsm10697804wrb.86.2024.03.25.16.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 16:46:32 -0700 (PDT)
Message-ID: <0edf02d2-14f7-4f03-8622-183c48646729@mind.be>
Date: Tue, 26 Mar 2024 00:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20240325223424.108702-1-adam.duskett@amarulasolutions.com>
 <20240325223424.108702-12-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240325223424.108702-12-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711410393; x=1712015193; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KyEoAm0X6hbg4ZWwRd9JF0aioetEbZBBPjITKuHkOvQ=;
 b=MTuDMq0aSwUdmHW6SHppc4pSYRNmlLAA0sd7onYtLnUgWeoxM9js04/eF8VNHEXToY
 s1KY/4xTCiUvGbhbKMiIwt+n0TB9FK0wnj/kom0j1mQ7S2j9BKRwwYTBIQcdxWTKfeKd
 B5cSrlr+U+sSFAugRNkbb8l8VKzCzK54yzNCRdczc+LNcApxyeoh5f+YTy+aip5X4odl
 qJ09O6adsfLcnwvnLW8iNJhSGYTC9oGU7u0Rr6ARqX0h4+gfDWur1O0/ro4UO8dMy7lN
 kp9agUyceDzQwNPGvw8MMJ9+HrvTPIpQMka2oEWE2CuRlxsCoHLLud+PweyOazFE9T0J
 jTAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MTuDMq0a
Subject: Re: [Buildroot] [PATCH v2 12/13] package/flutter-engine: bump
 version to 3.19.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2024 23:34, Adam Duskett wrote:
> Add 0005-skip-configuration-dependency-if-unit-tests-are-disa.patch, which
> fixes gtk+-3.0 being an unconditional requirement.
> 
> Other changes:
> Flutter 3.19.x made Wayland and X11 an unconditional requirement, resulting in
> the following errors when compiling:
> 
> """
> ../../flutter/third_party/swiftshader/src/WSI/libWaylandClient.hpp:18:10: fatal error: 'wayland-client.h' file not found
>     18 | #include <wayland-client.h>
>        |          ^~~~~~~~~~~~~~~~~~
> 
> ../../flutter/third_party/swiftshader/src/WSI/WaylandSurfaceKHR.cpp:15:
> ../../flutter/third_party/swiftshader/src/WSI/WaylandSurfaceKHR.hpp:22:10: fatal error: 'wayland-client.h' file not found
>     22 | #include <wayland-client.h>
>        |          ^~~~~~~~~~~~~~~~~~
> 1 error generated.
> [1369/11229] CC obj/flutter/third_party/sqlite/sqlite.sqlite3.o
> """
> 
> After raising an issue found here:
> https://github.com/flutter/flutter/issues/144635 and after several hours of
> searching, the problem is https://github.com/flutter/buildroot/commit/d01da2716
> which hardcodes the following values if building for a Linux platform:
>    - ozone_platform_x11 = true
>    - ozone_platform_wayland = true
> 
> As upstream maintainers listed the above as low priority (P3), a simple fix is
> to add two additional sed calls in FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP and
> FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP which set ozone_platform_x11 and
> ozone_platform_wayland to the appropriate values.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   ...on-dependency-if-unit-tests-are-disa.patch | 32 +++++++++++++++++++
>   package/flutter-engine/flutter-engine.mk      |  8 ++++-

  This version bump is fine, but it looks like flutter-engine doesn't have a 
hash file. The commit log that adds the package explains why - but that's not a 
reason not to have a hash file. THe hash file should still be there, just with 
"none" as hash. In particular, the license file should still be in the hash file.

  Regards,
  Arnout

>   2 files changed, 39 insertions(+), 1 deletion(-)
>   create mode 100644 package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
> 
> diff --git a/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
> new file mode 100644
> index 0000000000..125bfc6910
> --- /dev/null
> +++ b/package/flutter-engine/0005-skip-configuration-dependency-if-unit-tests-are-disa.patch
> @@ -0,0 +1,32 @@
> +From 2252a85e59669b5826019f60a98b7a69939dacfd Mon Sep 17 00:00:00 2001
> +From: Greg Spencer <gspencer@google.com>
> +Date: Mon, 4 Mar 2024 12:30:41 -0800
> +Subject: [PATCH] Skip configuration dependency if unit tests are disabled.
> +
> +Commit 88baf62f made gtk+-3.0 an unconditional requirement, see:
> +
> +Issue: https://github.com/flutter/flutter/issues/144421
> +Upstream: Merged. https://github.com/flutter/engine/pull/51179
> +
> +Signed-off-by: Greg Spencer <gspencer@google.com>
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + flutter/testing/BUILD.gn | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/flutter/testing/BUILD.gn b/flutter/testing/BUILD.gn
> +index 9eac29452..a7d094695 100644
> +--- a/flutter/testing/BUILD.gn
> ++++ b/flutter/testing/BUILD.gn
> +@@ -51,7 +51,7 @@ source_set("testing") {
> +
> +   sources = [ "run_all_unittests.cc" ]
> +
> +-  if (is_linux) {
> ++  if (enable_unittests && is_linux) {
> +     # So that we can call gtk_init in main().
> +     configs += [ "//flutter/shell/platform/linux/config:gtk" ]
> +   }
> +--
> +2.44.0
> +
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> index d08274f546..ff21e0949d 100644
> --- a/package/flutter-engine/flutter-engine.mk
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -21,7 +21,7 @@
>   #
>   # There is no hash provided, as the gn binary (used for configuration) relies
>   # on the .git directories. As such, a reproducible tarball is not possible.
> -FLUTTER_ENGINE_VERSION = 3.16.8
> +FLUTTER_ENGINE_VERSION = 3.19.4
>   
>   # There is nothing for Buildroot to download. This is handled by gclient.
>   FLUTTER_ENGINE_SITE =
> @@ -154,6 +154,9 @@ else
>   define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
>   	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
>   		$(@D)/build_overrides/vulkan_headers.gni
> +
> +	$(SED) "s%ozone_platform_x11.*%ozone_platform_x11 = false%g" \
> +		$(@D)/build/config/BUILDCONFIG.gn
>   endef
>   FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
>   endif
> @@ -164,6 +167,9 @@ else
>   define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
>   	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
>   		$(@D)/build_overrides/vulkan_headers.gni
> +
> +	$(SED) "s%ozone_platform_wayland.*%ozone_platform_wayland = false%g" \
> +		$(@D)/build/config/BUILDCONFIG.gn
>   endef
>   FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
