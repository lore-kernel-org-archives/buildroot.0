Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BE0CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE79C80E5C;
	Thu, 14 Aug 2025 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aursr-Dk2KmJ; Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A36880DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A36880DD9;
	Thu, 14 Aug 2025 20:32:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31416228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2328140459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEEDp6Zkceiy for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A82A402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A82A402F5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A82A402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so10282735e9.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203517; x=1755808317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eF8M8I5nblaaZIzeaY2atgeGcXrs5i7rxKKxu4aaQoY=;
 b=JNVijz4x1NX1fBFeY9ZIt+dnkAJyjNlqhoa4ni7aO9VaEC0jkciG27O+gMknsVw2+V
 PgH8a6aHUpfzrqvYm7pgY4+6qaqJf0V3FZr+tjLZbavx8e2+yLO6xulz78VeHt1S12Ci
 m1UkDFqND53wTS0+pceaZWVabmO2ViuZ3lpwBua5M4Z1H5MguCfp0mNQgP0IqSJOvWqg
 sXilTsAhe1qjjkvGMIQUM0+9PBsqr2EB61cRNZrTnn4Jmo/iWgkySqnQQjl0XzuUbBj+
 qQ4fnNvbkODG9Po3VvX+qoddhu3Cu0JWTBMCnOZt0ekNX7eV5/behTMp3cz1p+YQs3Cc
 dwbg==
X-Gm-Message-State: AOJu0Yy/3KWLeVN5wPbx3XOR+H7Jmo3SgOfzmppdi4e/ozKej5pN6zzy
 dwm/n5dHnEvlvcJOMoSyZDWJ0nq/H3GYF3xklJBsQwSpKKV867W8k3SYwmplX/gVKlC53C2kU1N
 M634T97M=
X-Gm-Gg: ASbGncvpzrh21XwhFu6BfB0DHGALD0QtV8dKn+LHf5q63vVqQ3j9Flncon33pfanGPm
 CFoqZzQyEPg0Q9ozzBX1pf5tU+u/lvUOMCfIB1TdTRhMgpcUY4ybEHqOZbnv0fsu5sR8KXdldIr
 mrKsojXQ10uA2HJaE6mwtvVSKX+68HNs+e71Wxvpjk3kBsWRbwuglF7KdPjrPDdS+IU6UkXXNam
 534Tggn+LUd3bs8Rkdl8lvZkCPeT7E/JJ+LxBUDJqGsQ5DtGEJLj2qC6A9psZMaAT4HBc44aVhE
 06Xwcc81XgsoAg7YV4cZ3ADTrCWHIjpgwLHFhTK2uucPuTNB73AY8ItcWxdgmJtX07uFBtuOFEt
 NdxiYvioCXJHYMA==
X-Google-Smtp-Source: AGHT+IFIkk0f5LL/88ddr+uGxufvw5Dsuo543agnvbqOVW18HKtdTtnPpCt82LYgHOjVYd11gj9evQ==
X-Received: by 2002:a05:600c:4ece:b0:459:e165:2661 with SMTP id
 5b1f17b1804b1-45a1b655425mr32529325e9.23.1755203517478; 
 Thu, 14 Aug 2025 13:31:57 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c748a9esm32918195e9.19.2025.08.14.13.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:57 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:56 +0200
Message-ID: <20250814203156.2816047-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803133400.2759380-1-thomas.perale@mind.be>
References: <20250803133400.2759380-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203517; x=1755808317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eF8M8I5nblaaZIzeaY2atgeGcXrs5i7rxKKxu4aaQoY=;
 b=hmsJ5Xt6wHMd7bW9b0VYb3VLtK9tLdvYEbWnart102HnkSeh344YlKSw4jMpq/fCqK
 i/f/zVN6ukBEwieaxdcdO5PMTvKTCOoXkYAy52o2CdpbuDd4SJsqeTk0VzbF/Mr1GdN/
 vJsBct5tyt7c47a6Y/mEgzBunGLa+shI+0wVOvct60xxjgqAit0gV9ykpQA+6iF+b7va
 jtI2WnwMKqckrabUTMPo7GXaj6xX8GMw7xduQVcFuZXM/ZhfqpxrFjlS+L898VeK3jdU
 dERyA9crngflmuee5rJGniHKGHzFxVreje05o8Q6tCbH/wBEp09F/S04qOnR8zo7iikI
 2mcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hmsJ5Xt6
Subject: Re: [Buildroot] [PATCH] package/snooze: fix build w/ uclibc
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
> The following error occur on the autobuilder for static build using
> buildroot toolchain and uclibc:
> 
> ```
> /usr/bin/make -j17 -C /home/buildroot/instance-0/output-1/build/snooze-0.5/ PREFIX=/usr CC=/home/buildroot/instance-0/output-1/host/bin/arc-buildroot-linux-uclibc-gcc CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -static"
> make[1]: Entering directory '/home/buildroot/instance-0/output-1/build/snooze-0.5'
> /home/buildroot/instance-0/output-1/host/bin/arc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -static    snooze.c   -o snooze
> snooze.c:22:10: fatal error: sys/auxv.h: No such file or directory
>    22 | #include <sys/auxv.h>
>       |          ^~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [<builtin>: snooze] Error 1
> ```
> 
> This error can be reproduced with:
> 
> ```
> cat >.config <<EOF
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_STATIC_LIBS=y
> BR2_PACKAGE_SNOOZE=y
> EOF
> make olddefconfig
> make snooze
> ```
> 
> The error doesn't occur on external toolchains.
> 
> The `#include <sys/auxv.h>` was orinally included in the initial commit
> (see [1]) to use the `getauxval` function declaration. This function
> usage has since been removed in commit [2].
> 
> This patch removes the include that is no longer needed.
> 
> [1] https://github.com/leahneukirchen/snooze/commit/56480881978a4cb5813746232de9950d46cb3369
> [2] https://github.com/leahneukirchen/snooze/commit/610e6b35ec614764770d47b5974b30fd90dce6fe
> 
> Fixes: https://autobuild.buildroot.org/results/aec/aec463f87094a47ee059113f08e8ee3604dcea9b
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> Hi,
> 
> Not sure why the error only happens on the specific combination of
> buildroot toolchain and static build. The `__linux__` definition is
> present on other toolchain as well so it should fail in other
> scenario.
> 
> Regards,
> Thomas
> ---
>  .../0002-snooze-remove-unused-include.patch   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/snooze/0002-snooze-remove-unused-include.patch
> 
> diff --git a/package/snooze/0002-snooze-remove-unused-include.patch b/package/snooze/0002-snooze-remove-unused-include.patch
> new file mode 100644
> index 0000000000..fba92cd6b5
> --- /dev/null
> +++ b/package/snooze/0002-snooze-remove-unused-include.patch
> @@ -0,0 +1,36 @@
> +From 2eebd33c10d5a0f1a9831e3e49215857ab41ec03 Mon Sep 17 00:00:00 2001
> +From: Thomas Perale <perale.thomas@gmail.com>
> +Date: Sat, 2 Aug 2025 23:09:31 +0200
> +Subject: [PATCH] snooze: remove unused include
> +
> +The `#include <sys/auxv.h>` was orinally included in the initial commit
> +(see [1]) to use the `getauxval` function declaration.
> +
> +This function usage has since been removed in commit [2].
> +
> +This commit removes the include that is no longer needed.
> +
> +[1] https://github.com/leahneukirchen/snooze/commit/56480881978a4cb5813746232de9950d46cb3369
> +[2] https://github.com/leahneukirchen/snooze/commit/610e6b35ec614764770d47b5974b30fd90dce6fe
> +
> +Upstream: https://github.com/leahneukirchen/snooze/pull/24
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + snooze.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/snooze.c b/snooze.c
> +index e47ad11..11925ca 100644
> +--- a/snooze.c
> ++++ b/snooze.c
> +@@ -18,10 +18,6 @@
> + #include <time.h>
> + #include <unistd.h>
> + 
> +-#ifdef __linux__
> +-#include <sys/auxv.h>
> +-#endif
> +-
> + static long slack = 60;
> + #define SLEEP_PHASE 300
> + static int nflag, vflag;
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
