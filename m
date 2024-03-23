Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F21BC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC5060779;
	Sat, 23 Mar 2024 20:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhNTL2nx597t; Sat, 23 Mar 2024 20:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2FEC6071B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2FEC6071B;
	Sat, 23 Mar 2024 20:36:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9022B1BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CA41410B6
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmfWzgw0CRVI for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9B75410B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B75410B2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9B75410B2
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:36:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3416a975840so2133529f8f.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711226167; x=1711830967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLeh4jk0IEn4aTs61AC/w/u3hzfKUI1r1bW1W8ck5Ao=;
 b=XUAUp4QVrPklwPU2kLOwd4zjLFJcR+TZ8j6PgD2R8Ev84t5uZl/+EoW7RgUuVtiSub
 U40CBPurCwFRrRGeRaSIp7UkjPjHuP1bqMpAn31lXDmqWB24HGOB/vLFz7k3+2+fjZBH
 X4yl6HidP1d/gBBdYyyt3N+fxx5iDzNOyTm5wIBlBRwPmYko+Gy1q0rB6+ixU5BDhBsG
 AA/K8SkDOtg8h3ypQ/Xw9dZtF0yCZpJcm+Q0RKl0QlzBoWiwgzBjKquDq/VvczlbUsh3
 dWLcUSahopWlaj9glCwz/fe8es+0dWTPP96d0u+g3WGUt4+sTjEbaCRlaXcFsE2QnFqx
 R1ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPb3gRmDwDVwLKWf5NEDx8/NF21KinDOh/YL37zUzQQXh/lc/PgM3sGMwgULaWBT6TMEx/Iw0oyFrFeol6RtEe7/fWzvByMQ==
X-Gm-Message-State: AOJu0YxnY4iCOdj41QEUiiQm1PLoaLRtEeSrUcUI6jJihVV3068PDFUg
 QadbD786dy3Q5FWrgGL+kB2uAN5mTf0ZnYGggAnKRT1vKiLcyX0nur/nSezc0f4=
X-Google-Smtp-Source: AGHT+IGQYmaL3P2HeN6550tzEoxNW4LmMpyKhg5EvSkbqLjmrgIQr34bEw2BlaZyTj60wbXbpV4sWQ==
X-Received: by 2002:a05:6000:4e7:b0:33e:c522:e3b9 with SMTP id
 cr7-20020a05600004e700b0033ec522e3b9mr2153060wrb.36.1711226166852; 
 Sat, 23 Mar 2024 13:36:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cr1-20020a05600004e100b0033b48190e5esm5164949wrb.67.2024.03.23.13.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:36:06 -0700 (PDT)
Message-ID: <c4912779-b885-464d-85bb-cde61f5f1bfb@mind.be>
Date: Sat, 23 Mar 2024 21:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240318214152.11576-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240318214152.11576-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711226167; x=1711830967; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rLeh4jk0IEn4aTs61AC/w/u3hzfKUI1r1bW1W8ck5Ao=;
 b=QpqAekTzEJAC4nTqmIt5EudfkQjZkEiCAPXTUb3o/lAlUvROFpnEvwZQl48s0IkVuB
 j+HxpJjx09avoVhMXSfklOedWsl9iVY1El0Q45M2FrB6vrsOWbkOcrVWvTa5Z08feroc
 CQLVoLSxynM3DUGcQlLKlvRCtUY7Q7G57eWh9e9SbmXoqNM4F1yWJmWHzUrb5BD0HSp1
 mO4iqpuEKOKEGYSkvHyNmRq42+BC4CfhFN3NvdVAjJqg+paleTziKWrMnyHiuqwnFnPR
 YQtajn8riUG8XrFEQ8wsBNR68fyffug+UXcU/FLbwYOIl+YQFnk6NSVLB0DUouEfcarz
 DEUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QpqAekTz
Subject: Re: [Buildroot] [PATCH 1/1] package/libpciaccess: fix static build
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/03/2024 22:41, Fabrice Fontaine wrote:
> Fix the following static build failure raised since bump to version 0.18
> in commit 136d4dfbe6126b5ed20237c571f599dfc163d110:
> 
> /home/autobuild/autobuild/instance-0/output-1/host/bin/arceb-buildroot-linux-uclibc-gcc  -o src/libpciaccess.so.0.11.1 src/libpciaccess.so.0.11.1.p/common_bridge.c.o src/libpciaccess.so.0.11.1.p/common_iterator.c.o src/libpciaccess.so.0.11.1.p/common_init.c.o src/libpciaccess.so.0.11.1.p/common_interface.c.o src/libpciaccess.so.0.11.1.p/common_io.c.o src/libpciaccess.so.0.11.1.p/common_capability.c.o src/libpciaccess.so.0.11.1.p/common_device_name.c.o src/libpciaccess.so.0.11.1.p/common_map.c.o src/libpciaccess.so.0.11.1.p/linux_sysfs.c.o src/libpciaccess.so.0.11.1.p/linux_devmem.c.o src/libpciaccess.so.0.11.1.p/common_vgaarb.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -shared -fPIC -Wl,--start-group -Wl,-soname,libpciaccess.so.0 -static /home/autobuild/autobuild/instance-0/output-1/host/arceb-buildroot-linux-uclibc/sysroot/usr/lib/libz.a -Wl,--end-group
> /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/11.4.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/11.4.0/crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can not be used when making a shared object; recompile with -fPIC
> 
> Fixes: 136d4dfbe6126b5ed20237c571f599dfc163d110
>   - http://autobuild.buildroot.org/results/7604706f4f4ab96a485a1dabe7cb4c98a2ef27d4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...lding-static-library-not-just-shared.patch | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
> 
> diff --git a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
> new file mode 100644
> index 0000000000..df1b4b415a
> --- /dev/null
> +++ b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
> @@ -0,0 +1,48 @@
> +From ad7e9cb4b291a46812eea321f0634cfc46fb94e2 Mon Sep 17 00:00:00 2001
> +From: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Date: Thu, 14 Mar 2024 13:55:55 -0700
> +Subject: [PATCH] meson: allow building static library, not just shared
> +
> +Lets builders specify -Ddefault_library={shared,static,both}
> +to control which types of libpciaccess library are built
> +
> +Closes: #20
> +Reported-by: Maxime Gauduin (@alucryd)
> +Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +
> +Upstream: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/ad7e9cb4b291a46812eea321f0634cfc46fb94e2
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + .gitlab-ci.yml  | 2 +-
> + src/meson.build | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> +index bcb75cf..185edc2 100644
> +--- a/.gitlab-ci.yml
> ++++ b/.gitlab-ci.yml
> +@@ -91,7 +91,7 @@ meson:
> +       - MESON_OPTIONS: ['-Dzlib=disabled', '-Dzlib=enabled']
> +   script:
> +     - mkdir -p ../_inst
> +-    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 $MESON_OPTIONS
> ++    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 -Ddefault_library=both $MESON_OPTIONS
> +     - meson configure builddir
> +     - ninja -C builddir test
> +     - ninja -C builddir install
> +diff --git a/src/meson.build b/src/meson.build
> +index 24eee04..e319688 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -38,7 +38,7 @@ endif
> +
> + inc_src = include_directories('.')
> +
> +-libpciaccess = shared_library(
> ++libpciaccess = library(
> +   'pciaccess',
> +   [
> +     'common_bridge.c',
> +--
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
