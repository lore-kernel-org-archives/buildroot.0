Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31904C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6498E61186
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6498E61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3941D60F28;
	Wed,  6 Oct 2021 19:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IF8c8y7DoWOL; Wed,  6 Oct 2021 19:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783A860F26;
	Wed,  6 Oct 2021 19:21:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D20A1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A2904078D
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNDm_Umm70Ik for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14702407D4
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:21:28 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id dj4so13817225edb.5
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=GLu8BU43+MiWn0b796scY1y2n4RZ12fXlFqmsAqx2gs=;
 b=K0GkZb2kidDHnXWB7jAd6rJeDK/75YRxvYqNbgsSPgVVZT4NPQpBfaDlebjvR4kR2f
 xHrF36n85RTXn7sF6fJmrkCFxUbY11dUyyzXNG/j59CXNvKXyRuYWUlDtMU7fY3Cm2Yg
 BwQDMgg+YKuyiVYANL5ZPC1y2YO1LR5rJQQsogZaMqCm1c8KNPDob4xEgoiU81PnRJlK
 p+rtmBOFjMUSvVVxJn+OGV6fuZer1J/Uqxf4VQ7ZxM67uS9KvTLNqg5m52Q1/vrgTAKu
 9f6of5ZiR4W3bKFWkBuLHQRyiM1s3iuGb8tseLnY3c/j+1EUQemso7ioRetRMGacRdLF
 nVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GLu8BU43+MiWn0b796scY1y2n4RZ12fXlFqmsAqx2gs=;
 b=1pJ959A7ZcJUqUr37jDaiXNyr1+eAIzfGazLsGLtzT4hIQSZw+kPCZrQrQTtzAcsbg
 uAxnSi4OOiH/o1ld0qL+uawoxcXcrSqZ1xEscUCVEvymfE2M6ADp0xusibWOTOHZfJCh
 Vt7yF7RM++RY93QBeM/DV/9mRltVjqpYQGIgbYAdHpfiT1TcEfnvsZm6/MwYHjq2PiZ1
 9swsq7p1P/jkuQs41BrZrqpDfI1yN/5OqBW213257Iiz9KH0Vq7cFjJWW2z/ZlhIIu5Y
 eOW4Fu34rMtWDkHz8akE1e5KL8Anm6ob4aeSDTnbMP4F5w8MzStMCMNSVdqZCxLdU9uU
 HRvQ==
X-Gm-Message-State: AOAM5323Fm53sWczbYrWJxwVbHfirwGPKhi5psfWBLta0YczU7nLW/5/
 /21cGUICT6GwRtYKqC4MrnAfE7x4sdhR8NZS
X-Google-Smtp-Source: ABdhPJy8EmQzHQrS63iuG+OknHJoYoncpNDrd4ADt2oY1MvKXy3WUPa+71dOYGp0+WRb8PlwU2p2Tw==
X-Received: by 2002:a50:bf4d:: with SMTP id g13mr36125502edk.195.1633548086108; 
 Wed, 06 Oct 2021 12:21:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 19sm9252400ejw.31.2021.10.06.12.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:21:25 -0700 (PDT)
Message-ID: <1fef6a82-debc-eb49-29ee-35a75304fb3e@mind.be>
Date: Wed, 6 Oct 2021 21:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
References: <20210922094113.1166868-1-judge.packham@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922094113.1166868-1-judge.packham@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/syslog-ng: Bump version to 3.34.1
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



On 22/09/2021 11:41, Chris Packham wrote:
> Update to syslog-ng-3.34.1. Drop patch that has been applied upstream.
> Update version in config file.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ules-diskq-dqtool.c-fix-static-build.patch | 33 -------------------
>   package/syslog-ng/syslog-ng.conf              |  2 +-
>   package/syslog-ng/syslog-ng.hash              |  2 +-
>   package/syslog-ng/syslog-ng.mk                |  2 +-
>   4 files changed, 3 insertions(+), 36 deletions(-)
>   delete mode 100644 package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
> 
> diff --git a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
> deleted file mode 100644
> index 3332b12e9e..0000000000
> --- a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 04c8fe720d09bd6e53c4bcea9ad72ff131925ce6 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 23 Jul 2021 18:41:29 +0200
> -Subject: [PATCH] modules/diskq/dqtool.c: fix static build
> -
> -Fix the following static build failure:
> -
> -/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x2c): multiple definition of `verbose_flag'; modules/diskq/dqtool.o:(.sbss+0x4): first defined here
> -/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x30): multiple definition of `debug_flag'; modules/diskq/dqtool.o:(.sbss+0x8): first defined here
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/syslog-ng/syslog-ng/commit/04c8fe720d09bd6e53c4bcea9ad72ff131925ce6]
> ----
> - modules/diskq/dqtool.c | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/modules/diskq/dqtool.c b/modules/diskq/dqtool.c
> -index 6105f2ec68..50be452453 100644
> ---- a/modules/diskq/dqtool.c
> -+++ b/modules/diskq/dqtool.c
> -@@ -49,8 +49,6 @@ gchar *persist_file_path;
> - gchar *assign_persist_name;
> - gboolean relocate_all;
> - gboolean display_version;
> --gboolean debug_flag;
> --gboolean verbose_flag;
> - gboolean assign_help;
> -
> - static GOptionEntry cat_options[] =
> diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
> index 4d1526b812..55d01501cb 100644
> --- a/package/syslog-ng/syslog-ng.conf
> +++ b/package/syslog-ng/syslog-ng.conf
> @@ -1,4 +1,4 @@
> -@version: 3.33
> +@version: 3.34
>   
>   source s_sys {
>   	file("/proc/kmsg" program_override("kernel"));
> diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
> index df8002341c..99ed363eca 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  0b786a06077b9150191d714f45a1b4b3792952cb58163a3af336f074da9fb14b  syslog-ng-3.33.2.tar.gz
> +sha256  cece39ec1c68c88d493705e0a528b83d038da384e89d4838393ccc75f62a2d4c  syslog-ng-3.34.1.tar.gz
>   sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
>   sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index 765e886b12..f37e7c2ea5 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -6,7 +6,7 @@
>   
>   # When updating the version, please check at runtime if the version in
>   # syslog-ng.conf header needs to be updated
> -SYSLOG_NG_VERSION = 3.33.2
> +SYSLOG_NG_VERSION = 3.34.1
>   SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
>   SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
>   SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
