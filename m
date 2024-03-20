Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20ECC54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80EFE80AC6;
	Wed, 20 Mar 2024 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYvv9psgrlXl; Wed, 20 Mar 2024 20:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 846AD81F04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 846AD81F04;
	Wed, 20 Mar 2024 20:32:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3310B1BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF6D406E8
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuCDHrVOjXaj for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1F09406DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F09406DE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F09406DE
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:32:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4146f2b3fafso1659425e9.1
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 13:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710966755; x=1711571555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Mm0newaudyXBd9SLaIrBP8sfNG/ZKycIzKAMoHWnIM=;
 b=gcPbVQ7Znl0WiPztmvnh1s2jDoN7ALFl0BxdAOCWICIVj0v82YKryJw3pkFzcXlvFl
 z4X8Ny/dpuEcX/RatsNL2759APFhe4ClGMMC0AAlQ0zu+x8jQR88je8uqDJKkNqpmGkz
 +CzdbxHdZ+tyU1uOEAuk69TR7EJbitMd0/8s8B61jH2hFtaKrrWSyT2ekQ6kgfaDoo+7
 JHw1ZLB6M9rP+3wDZeOakM9DKnJcsLEFEWLYVd6qVxBJqsYZsU8q34Ot8CRG8cX7ShMP
 eXoNe/7HRtC1mSFjCYhUxSU8qgpb7Ir1Os66UxFbF7l+WYcLqWWUMIZnTwGvAsS4LvoI
 UWLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOj+V04pMgxpsHCxYAaePRfMY++zyIPEVudhUFBPtqitIZgFoIPV18OI8U4FCtN0lw9vDAD25V2PClIrWnmBNYc+3LrKDQaQ==
X-Gm-Message-State: AOJu0YwqO0DXKbM3vEN2zPgfCU1KYsiBBnYGbbP9ALDQ9zCb8HQIEII1
 Rj3IrEhFle6c/M0+Vn4oDd/hLRj4ovwGGKaP0/2/vwUhd7SkKRDVza0tGupATE8=
X-Google-Smtp-Source: AGHT+IF2qsMeI5wNITIS2zhCL7//21iGujyNuzGoiyFv34e1Nuhae4ugPOB1E14PiNBQtpnXBvZz2Q==
X-Received: by 2002:a05:600c:1c14:b0:412:e50f:acaf with SMTP id
 j20-20020a05600c1c1400b00412e50facafmr13722143wms.24.1710966755398; 
 Wed, 20 Mar 2024 13:32:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b0041461a922c2sm3284776wmq.5.2024.03.20.13.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 13:32:34 -0700 (PDT)
Message-ID: <567c62c8-b9b6-4b62-95d9-dab0c3b74299@mind.be>
Date: Wed, 20 Mar 2024 21:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317144701.1042537-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317144701.1042537-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710966755; x=1711571555; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Mm0newaudyXBd9SLaIrBP8sfNG/ZKycIzKAMoHWnIM=;
 b=fEnjbYwddLJC2vcNf+JsaoXNZSSW/AevWktgyNFJpvW5zRUTeJ2EJs7VP+AX1LjlEF
 JRpD96OaYQbsZdoWynJUt/JUMSRK0q8/pOLm6788Dzb2d05+uh/8RElSx3xhatAwINin
 Kee/er1kDGv8nySP7WsfOH+E9PliMztnuRAF38OP6ibBGCdXv3WsqS07ezNuE2nRY98f
 Zh5z6gkRb5djTZ6Qgo6SUSS2yXRJ0e+Fa/2v8vvjW1yclLtrsKTcfxKnVANKoK0pPlCw
 VOVYLCz/e+HwuV/3Zwd4juhgiDQpZO3EEB0LoANm5TdyGLCc090i/QWVZpi1FMggaAma
 gruA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fEnjbYwd
Subject: Re: [Buildroot] [PATCH 1/1] package/mraa: fix build with musl >=
 1.2.5
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
Cc: Pieterjan Camerlynck <pieterjanca@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 15:47, Fabrice Fontaine wrote:
> Fix the following build failure with musl >= 1.2.5 (raised since commit
> f7f03445cf320adbbc41270a806b38c911d3454a):
> 
> /home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c: In function 'mraa_count_iio_devices':
> /home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c:341:38: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
>    341 |     if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
>        |                                      ^~~~~~~~
>        |                                      rename
> 
> Fixes: f7f03445cf320adbbc41270a806b38c911d3454a
>   - http://autobuild.buildroot.org/results/1f16df70e49a9f8823a791c0fcc677de07136835
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../mraa/0002-mraa-Use-posix-basename.patch   | 45 +++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 package/mraa/0002-mraa-Use-posix-basename.patch
> 
> diff --git a/package/mraa/0002-mraa-Use-posix-basename.patch b/package/mraa/0002-mraa-Use-posix-basename.patch
> new file mode 100644
> index 0000000000..3c5c99f031
> --- /dev/null
> +++ b/package/mraa/0002-mraa-Use-posix-basename.patch
> @@ -0,0 +1,45 @@
> +From 47c3850cddd63cebd9dc48e411963314449118f1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 31 Dec 2023 19:16:35 -0800
> +Subject: [PATCH] mraa: Use posix basename
> +
> +Musl has removed the declaration from string.h [1] which exposes the
> +problem especially with clang-17+ compiler where implicit function
> +declaration is flagged as error. Use posix basename and make a copy of
> +string to operate on to emulate GNU basename behaviour.
> +
> +[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/eclipse/mraa/commit/47c3850cddd63cebd9dc48e411963314449118f1
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/mraa.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/mraa.c b/src/mraa.c
> +index 653ea1fa7..b556d0455 100644
> +--- a/src/mraa.c
> ++++ b/src/mraa.c
> +@@ -12,6 +12,7 @@
> + #endif
> +
> + #include <dlfcn.h>
> ++#include <libgen.h>
> + #include <pwd.h>
> + #include <sched.h>
> + #include <stddef.h>
> +@@ -341,9 +342,11 @@ static int
> + mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
> + {
> +     // we are only interested in files with specific names
> +-    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
> ++    char* tmp = strdup(path);
> ++    if (fnmatch(IIO_DEVICE_WILDCARD, basename(tmp), 0) == 0) {
> +         num_iio_devices++;
> +     }
> ++    free(tmp);
> +     return 0;
> + }
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
