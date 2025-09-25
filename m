Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C7BCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6150B411E9;
	Thu, 25 Sep 2025 20:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PI7Z3fi1BuDg; Thu, 25 Sep 2025 20:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA02416F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA02416F8;
	Thu, 25 Sep 2025 20:17:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 208B8177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D71561553
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oRQ2g8SH9qU for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF04E6156B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF04E6156B
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF04E6156B
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so10426335e9.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831420; x=1759436220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Riy/XvlfzNS8NFdHkPGI+/P9clsaHCUMBD7PFD6hMAE=;
 b=WzlNJJ0rHJ+N2sMp/yA8TVvjI1pDuDp31hgfomsch3lXXAf1BN4u7ylaULRTJwCxDi
 xVRewKwRpEKDh7Ia+0c6nVhHOEgKJKqqfLKQR4s2MWAlMz4yS9gpydk1BYdH5kEj38j8
 BFacy98cky9p2hqeNsDHdKF2oj1SnQ2YfXMZ/XtD49eD2btjmV1uWlkryLI9dvFkIhn/
 Hl3ugvxv7gK83YBjdIZ2Lh3WcpHjU+jLTpBm0Lwh+K2cWV/kI/zskM/6I0D/4WuuEZOZ
 ds6cH1H1HjhtvQ9T4SGVoNP1XBr95r/a9awWW5tBXmXfujUSR7oNTPE5sGjpE5PA9iya
 3yYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQbUpBXjKDlxSHObUh8ydPxd225sTueF37ySuXXr23IFHk5DcGCm649I2IpqzjjRXUWc9Stj50L34=@buildroot.org
X-Gm-Message-State: AOJu0YxNoB7Nd5PmPzilCr12HW0fMgjEPViFMb04GQ/CMz+MFZZmN2U0
 +2xzZBinNDYIhNWikl88svxjE7RleyjdXpYKN8Y9abiP8Qk8jJYHxdZWG37opPkDLAvFZEL598d
 YGp496eA=
X-Gm-Gg: ASbGnctl9gONHJuwHBCLousltzU4SXjifHaapuSb9DjLNncY2KRNXWF6czHVQ8rqqu5
 UAMgaqXoFCLC7llwCT10OxDxN5jMWisfHxhS1IqScXu8zpUfl2Kcjgf6Q/phUyS34/vA0Vdd74/
 Ha0CpEPpazYSHM3pRgyERc+yWBDP5pPJoYzVdpRCZn724G3n9YRziLnfzZ6xYHtyVAdsmPdtATc
 jE6xHIYPQBrDSm6hr2YcNSy5hAw8C6vV5I6aYMHMQXhHNJxzNQEaUHRV0XFz0/iVgcro25oQIIb
 UEEvX/mq8lxTs8x+WiC+qdbcNRkTJ+Q//oTMgGBpRpUYPvNuUY/E/8Lg83i8+bxfwMxV3CkirOu
 O26gOpg0HNU3lwMc=
X-Google-Smtp-Source: AGHT+IGXKNuhJGgeFDA2SlHZkmYcTtKwBn5kfqyNCx26kq9HE1zSElzeXo8rEvjcCEgqdoIT1uVp6A==
X-Received: by 2002:a05:600c:1f8c:b0:46d:6939:a83 with SMTP id
 5b1f17b1804b1-46e32a3cec3mr42245025e9.28.1758831419574; 
 Thu, 25 Sep 2025 13:16:59 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31f62sm89104235e9.15.2025.09.25.13.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:59 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:58 +0200
Message-ID: <20250925201658.44232-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
References: <aM2fDL1IHgxX7arz@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831420; x=1759436220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Riy/XvlfzNS8NFdHkPGI+/P9clsaHCUMBD7PFD6hMAE=;
 b=DM+aU7wMBSw3wVOebio6WbcWgf3V6iS6TjudkPVsJiKyG4NEQqBDKFZ2fsqes6cr1W
 TeB0S0WHg4twqA4IioIxAC3rY4Z3hzu0DQgrzyabb4/tSQQZlayT9Sa7+zrn7KnUxtTZ
 iAL/1Iwz1mXQdwTKiDVEvkohB5r/99FmBMN17cRct5s5wBg1UgHWwNKMT24cUI6C1F7l
 iTgAyG/g3Cm2sGVfbWj94h6rbDLQw8OUNezFwmPuDu/0IvN+UKWyRiF8OO81J8rVHM5p
 K1MGhERX3er9Qj1AuRxieLJ6o486fz42dOiEiZjN7Aim6UFp/dUxCAtrLCihT8aRPFzb
 4+4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DM+aU7wM
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.55
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Finally the aarch64 tls bug is fixed. (python 3.13 segfault)
> Unfortunately it is not covered by any testcase of uClibc-ng-test.
> 
> Here is the git shortlog for the release:
> 
> Marius Melzer (1):
>       malloc-standard: Fix truncation problem in malloc
> 
> Waldemar Brodkorb (5):
>       Fix Sysvipc for ARM, AARCH64, RISCV64, KVX and m68k
>       remove uClibc specific gettext_printf
>       aarch64: do not force tls-model in CPU_CFLAGS, this isn't required
>       aarch64: respect r_addend for TLSDESC relocations
>       bump version for 1.0.55 release
> 
> yliu (5):
>       mips32: Preventing FORCE_FRAME_POINTER from being optimized away
>       mips32: Define __IPC_64 according to kernel version
>       time64: fixed msgctl/semctl/shmctl result errors for for MIPS32/RISCV32
>       time64: fix *ctl functions in mips32eb/mips64
>       time64: fix *ctl functions in mips32eb
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
> 
> Dear stable Maintainers, it would be nice if you could update all
> stable branches with this maintenance release.
> 
> ---
>  ...emove-uClibc-specific-gettext_printf.patch | 34 -------------------
>  package/uclibc/uclibc.hash                    |  4 +--
>  package/uclibc/uclibc.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 37 deletions(-)
>  delete mode 100644 package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
> 
> diff --git a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
> deleted file mode 100644
> index 96736da562..0000000000
> --- a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 9ffed9adb130d45b9f31ca7a305153e86586c877 Mon Sep 17 00:00:00 2001
> -From: Waldemar Brodkorb <wbx@openadk.org>
> -Date: Fri, 15 Aug 2025 20:29:52 +0200
> -Subject: [PATCH] remove uClibc specific gettext_printf
> -
> -Other C libraries like musl/glibc does not define it.
> -Including stdio.h here breaks Grub2 compilation with
> -gcc 14 and above.
> -Thanks to Thomas Petazzoni for analyzing the Grub2 build error.
> -
> -Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=9ffed9adb130d45b9f31ca7a305153e86586c877
> ----
> - include/libintl.h | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/include/libintl.h b/include/libintl.h
> -index b7123a963..6d8b9f342 100644
> ---- a/include/libintl.h
> -+++ b/include/libintl.h
> -@@ -50,9 +50,6 @@ char *bindtextdomain(const char *domainname, const char *dirname);
> - 
> - #endif
> - 
> --#include <stdio.h>
> --#define gettext_printf(args...) printf(args)
> --
> - /* to supply LC_MESSAGES and other stuff GNU expects to be exported when
> -    including libintl.h */
> - #include <locale.h>
> --- 
> -2.47.2
> -
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index 8d8b333958..56174a33b8 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.54/uClibc-ng-1.0.54.tar.xz.sha256
> -sha256  d1ecf65cc2217dd4118a4dafc1abf27c585b5cb578f3bd7991fc640b79643ff2  uClibc-ng-1.0.54.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.55/uClibc-ng-1.0.55.tar.xz.sha256
> +sha256  5f7f3aafddb2ca08fb295be45561c0188407103d7446cfd264b9b822fed3ed2d  uClibc-ng-1.0.55.tar.xz
>  # Locally calculated
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 1e49463dd4..0c303d77f8 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UCLIBC_VERSION = 1.0.54
> +UCLIBC_VERSION = 1.0.55
>  UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>  UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>  UCLIBC_LICENSE = LGPL-2.1+
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
