Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D29C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 17:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9147282422;
	Mon, 15 Aug 2022 17:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9147282422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHO6vscmkTAE; Mon, 15 Aug 2022 17:02:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1D9B823C6;
	Mon, 15 Aug 2022 17:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1D9B823C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 813671BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BE10607A4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BE10607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jIR1HYv06LU for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 17:02:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9649605E8
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9649605E8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 17:02:35 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r4so10309176edi.8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Mms6kBAVmrqb84jwbX60JP59T2SVfx9jVjtv7sp3V+I=;
 b=KqPWL8kgs/7iENvBQjmsuvWwmJguUiWvcuwWYHRaOQ6ICHydOSDuWlMfHQHeY10rUc
 Bgk/ZIkewXTtZbCY5HRXU4vMPs0uQ5e0hedWhotXSLBcIMPrY4FGL1x3USvmYZTSBLr/
 pEUl12HkPYCrotQJHn06H3KDzD8Xb00crtGLruWWTa9egNghMcF+ZwMh8h+QdZ0PX9qG
 asPtMoLzU8Jd8PL6UEhk88p9WXI/bDBLtJf2/HHpVns+y2t3x85Y3e7TpHUN0R38iasU
 qH+G+5GrZz6HW/AcXc8ouHH3RwzMz1RaUNkmlHlPIhNj/gywbbuFB2eAwD0azeZcbbmj
 qGTQ==
X-Gm-Message-State: ACgBeo1rkPupW/oI72n/whcyzxsVf0aTPejqxHPYmKhuw/MrDNLX5OSh
 WVnihmdKt/iIfs2lwPaBhFFA/J5tORwLyrp4
X-Google-Smtp-Source: AA6agR5AVp7pzxDJyCUzWsRERgbcWdzf+WMjn63E0sXMDnkrWr24TncMQ/OF/ynjAlbro52CuzmQ9A==
X-Received: by 2002:a05:6402:51ce:b0:43e:74bc:dce with SMTP id
 r14-20020a05640251ce00b0043e74bc0dcemr15718183edd.225.1660582953970; 
 Mon, 15 Aug 2022 10:02:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709060cc100b0072fa1571c99sm4249939ejh.137.2022.08.15.10.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 10:02:33 -0700 (PDT)
Message-ID: <d716d273-012f-4f72-70e4-55be2e89d1aa@mind.be>
Date: Mon, 15 Aug 2022 19:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220809144132.1913960-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220809144132.1913960-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=Mms6kBAVmrqb84jwbX60JP59T2SVfx9jVjtv7sp3V+I=;
 b=dH0IkhA5x0MY00TfqoZUk5dCuC8YuxtAp9fw7sX7jC1t7yrmbtzwK7aInYpJJdfeVK
 jZjMzQ/ZyxWN0hWXqZtg2vyvCoPc6IYdyuMCkONRCekBo4/vuOnzerct1Tw4+c3YB6SK
 +wWVHuLnrtdbURPzVfRFsAWnqQGLYNXevJvwgUFU6ZU7fM07hlU92lE4C7q+6NEoQUBh
 cDX9UACbCx2SBSzs2++FCwJbd+MF4hanCpOqQuDsjt7TdK/EI1NTU+zLyl7WAH0yeWoN
 lcGBcN9Ta+l7Wjo+4VNUvrVezOMnl1I/WGiAkVe0edAo8lgdUKowBXiRAJWeM7i6D3ME
 0ejg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dH0IkhA5
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: fix webrtc build
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



On 09/08/2022 16:41, Fabrice Fontaine wrote:
> Update fourth patch to avoid the following build failure with webrtc
> raised since commit a40a516c8ae2e8c11549115e10aa74d98a4fab5d:
> 
> ../output-1/build/pulseaudio-16.1/src/modules/echo-cancel/meson.build:13:0: ERROR: No host machine compiler for 'src/modules/echo-cancel/webrtc.cc'

  I didn't understand at all why it was OK to enable C++ unconditionally. So I 
investigated more, and ended up adding this to the commit message:

     That is because we removed the C++ language from the global meson.build.
     Add it back to the local meson.build in echo-cancel.

     The echo-cancel module is always built, but the echo-cancel meson.build
     is only included if webrtc-aec is enabled. We only enable it when
     webrtc-audio-processing is selected, and that package depends on C++.
     Therefore, it is safe to depend on C++ in the echo-cancel meson.build.


  Applied to master, thanks.

  Regards,
  Arnout


> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e60d72268667ed57a254d7552fa2d785e2e21726
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...0004-meson.build-fix-build-without-C.patch | 22 +++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
> index e6453d641d..e770927f54 100644
> --- a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
> +++ b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
> @@ -1,4 +1,4 @@
> -From 9de058e15a4caba4939a864fb7caf67e0164f07e Mon Sep 17 00:00:00 2001
> +From ac88536d7c3fde3c22933368296c9029bb67b9fc Mon Sep 17 00:00:00 2001
>   From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   Date: Mon, 25 Jul 2022 21:49:25 +0200
>   Subject: [PATCH] meson.build: fix build without C++
> @@ -16,8 +16,9 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   [Upstream status:
>   https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/737]
>   ---
> - meson.build | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> + meson.build                         | 3 ++-
> + src/modules/echo-cancel/meson.build | 2 ++
> + 2 files changed, 4 insertions(+), 1 deletion(-)
>   
>   diff --git a/meson.build b/meson.build
>   index c5135330f..8248f263b 100644
> @@ -37,6 +38,19 @@ index c5135330f..8248f263b 100644
>      add_project_arguments('--coverage', language: ['c', 'cpp'])
>      add_project_link_arguments('--coverage', language: ['c', 'cpp'])
>    endif
> +diff --git a/src/modules/echo-cancel/meson.build b/src/modules/echo-cancel/meson.build
> +index 641cd35e7..3b998364e 100644
> +--- a/src/modules/echo-cancel/meson.build
> ++++ b/src/modules/echo-cancel/meson.build
> +@@ -6,6 +6,8 @@
> + # '-Wl,--unresolved-symbols=ignore-in-object-files' otherwise it fails
> + # at link time.
> +
> ++add_languages('cpp')
> ++
> + libwebrtc_util_sources = [
> +   'webrtc.cc'
> + ]
>   --
> -2.35.1
> +GitLab
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
