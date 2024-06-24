Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6439AC2D0D1
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3252A6072F;
	Mon, 24 Jun 2024 20:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOJ4i4CFVsuR; Mon, 24 Jun 2024 20:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259F0608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259F0608FB;
	Mon, 24 Jun 2024 20:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C60301BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3CE408E3
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YW-aHu9j8f57 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A03D2408E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A03D2408E0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A03D2408E0
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:01:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so40592585e9.3
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719259310; x=1719864110;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1D4VeI7ZlriZmrNHUtYHNTaltji2bMXePSVUzf73wo4=;
 b=n0MBq2bqcx1E5nJd+IbsM521MvheebZtKz2vFXQUjiCR/SxIvrGUin60QHa4SnALMe
 bXIGPRBnuKbOKNqgHczbhS2gxMRYBJDpuAMeUSd7Ux3ZX9TT2hdHE7uHzZc//gZ/WBbA
 kMcdxdEcLMps88tNnBpwH3faQTIvBuRYmKpSaA9TGTvYvIy5NCL4j5uikTy3gACPowqQ
 YdUmw8glLaEloP4h845RTAjiJ3YZsE0q/cDA8fuDpq1a7LDiJ3raxJrRGvC4WS4zX75i
 H7VuscTgPB4Mzhzk/l6s51gn0WSOjyiyJ8kn+V8jhaKuRJme4UEhO+Sy4RU9NlO5YeD1
 L5aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLDJBrF0hX4Nj/TITQc0F7HoGVOHVHR8+FenYlNXNtKRrMEPGzLMx0XJ6qKrK8e9CnXOxfiddvSuzNmB8lNwVVzsVWiJLiAQ==
X-Gm-Message-State: AOJu0YyQ85bbRL9861KuJdAQFVtUbIi6SpF45MMZ0h1oKga0IKAFPNE/
 q5qls4ksicYV8r5r4YYSgmb8U/EdTSOVuNNejteIHKLR4yDYKc0iQEDEEBJ/29M=
X-Google-Smtp-Source: AGHT+IEvOE2SgXTZTpXnyPFtT0qX+GQvUGCHbMjpNtXs6wAkb8ohfro2s0FvCpZhW5a8VwyP7t8dxA==
X-Received: by 2002:a05:6000:18a1:b0:366:eeda:c32a with SMTP id
 ffacd0b85a97d-366eedac3eamr3606844f8f.7.1719259309581; 
 Mon, 24 Jun 2024 13:01:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248191fac8sm144877725e9.42.2024.06.24.13.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 13:01:49 -0700 (PDT)
Message-ID: <c5aaa90f-625b-4a3f-8207-0cd165efc403@mind.be>
Date: Mon, 24 Jun 2024 22:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719259310; x=1719864110; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1D4VeI7ZlriZmrNHUtYHNTaltji2bMXePSVUzf73wo4=;
 b=A5gpBcnVoLHaZ7T+PfmRvTswacIWDnFGoPR0KHZTRCK9dmiEiVJK/15atPXgxn5hGy
 fxipnqzQPpGtD6KC+6BA4CEt5+WzvmfGo9IVQiVClPjqELDbftj1Je/E+7TaDnS/TNRq
 fqCOLjBxOEcrRc3SIACuGLTbu+dh0GNPecbj86Sv59ZvcYKfsimT8p4oMOLDTBLE/laq
 nxFAI7yGCaWrijFB4dvf0TE+ti0OuhwIbCnetr2oFBHGf9J1/FnU7mRr69ILdzlAjU11
 6O1DFWW1ydyqF3P+ye7XZ9pcnLtHISAPRNL1V9lLaztKKXAeb4/KHpRulKMJtb8H2axL
 bhbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A5gpBcnV
Subject: Re: [Buildroot] [PATCH v2 00/18] apply patches with fuzz factor 0
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2024 09:02, Dario Binacchi wrote:
> The series will allow applying package patches with a fuzz factor of 0
> instead of 2 (the patch command default value).
> By setting the maximum fuzz factor to 0, we avoid that patches which
> cannot be applied are incorrectly reported as valid, with positive
> side-effects on version bumps.
> 
> To avoid regressions, it was necessary to fix all those patches that
> were applicable with a fuzz factor of 1 or 2 before implementing this
> change. The series was tested on commit 47078cc11862 ("package/zxing-cpp:
> add options for enabling readers and/or writers") with a script that
> executed the make legal-info command for all defconfigs contained in
> Buildroot. Then, for all the affected packages, the compilation was
> executed.

  Series applied to master, thanks! Since this was about a month old, chances 
are that some new fuzzy patches have been introduced through version bumps. But 
the autobuilders will report that.

  Regards,
  Arnout

> 
> Dario Binacchi (18):
>    board/orangepi/orangepi-zero: make the patches to be applied with fuzz
>      0
>    board/pine64/rock64: make the patches to be applied with fuzz 0
>    boot/syslinux: update the patches to be applied with fuzz 0
>    package/alsa-lib: update the patch to be applied with fuzz 0
>    package/bzip2: update the patches to be applied with fuzz 0
>    package/elfutils: update the patches to be applied with fuzz 0
>    package/ffmpeg: update the patches to be applied with fuzz 0
>    package/giflib: update the patches to be applied with fuzz 0
>    package/libabseil-cpp: update the patch to be applied with fuzz 0
>    package/libglib2: update the patches to be applied with fuzz 0
>    package/libnl: update the patch to be applied with fuzz 0
>    package/libopenssl: update the patches to be applied with fuzz 0
>    package/openocd: update the patch to be applied with fuzz 0
>    package/patchelf: update the patch to be applied with fuzz 0
>    package/qemu: update the patches to be applied with fuzz 0
>    package/qt5/qt5base: update the patches to be applied with fuzz 0
>    package/vboot-utils: update the patches to be applied with fuzz 0
>    support/scripts/apply-patches.sh: set the maximum fuzz factor to 0
> 
>   ...RM-dts-orange-pi-zero-enable-spi-nor.patch | 41 ++++++++--------
>   ...ARM-dts-orange-pi-zero-enable-spidev.patch | 23 +++++----
>   ...328-needs-itb-image-to-boot-properly.patch | 18 +++----
>   .../0015-efi-main.c-include-efisetjmp.h.patch | 10 ++--
>   ...01-Don-t-use-fork-on-noMMU-platforms.patch | 19 ++++----
>   package/bzip2/0001-build-objects-twice.patch  | 14 +++---
>   package/bzip2/0002-improve-build-system.patch | 12 +++--
>   ...e-Werror-conditional-to-BUILD_WERROR.patch | 12 +++--
>   .../0003-libavutil-Fix-mips-build.patch       | 16 ++++---
>   ...dd-targets-to-manage-static-building.patch | 18 +++----
>   ...veral-defects-found-by-Coverity-scan.patch | 20 ++++----
>   ...0001-force-position-independent-code.patch | 14 +++---
>   ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 16 ++++---
>   ...workaround-to-the-libc-compat.h-copy.patch | 17 ++++---
>   .../0003-Revert-Fix-static-builds.patch       | 16 ++++---
>   ...01-configure-enable-build-on-uclinux.patch | 12 +++--
>   ...ke-the-rpath-relative-under-a-specif.patch | 48 ++++++++++---------
>   ...on-t-build-fp-bench-test-if-fenv.h-i.patch |  9 ++--
>   .../qt5base/0006-Fix-build-on-riscv32.patch   | 18 +++----
>   ...05-include-sys-sysmacros.h-for-major.patch | 12 +++--
>   support/scripts/apply-patches.sh              |  2 +-
>   21 files changed, 204 insertions(+), 163 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
