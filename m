Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C7DCD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5882881EDC;
	Mon,  1 Apr 2024 12:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2j7v-wA5Y3wG; Mon,  1 Apr 2024 12:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7119A81ECA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7119A81ECA;
	Mon,  1 Apr 2024 12:42:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 573E21BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43A50406B9
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTMS33VWyvce for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C602406B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C602406B7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C602406B7
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:42:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DB4C713F838;
 Mon,  1 Apr 2024 14:42:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 14:42:01 +0200
Date: Mon, 1 Apr 2024 14:42:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZgqrmSR1rXd6sGat@landeda>
References: <20240331085319.8585-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331085319.8585-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711975325;
 bh=Jwf9iG+9mesYrHbbcq6HpubWBjodDxCaF3AmYG4Q8u4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OoIYPzh0lk2kL2egkJVCcgZ6tIsTF0MguiNHLzjz/L7o7U4HnEJ9vVqiPNdLLpHP0
 JjYMbUPyAHdz0fbzKKk79S/kYe4AhZWWNXZZhTy5NxrfNHiumck/Q9lu3xqdvXRiuS
 iqL3ZEThtk+yXFmUE7jxSiGA01h5t/mKP69jomByp8kHcD08EhRy2dCdSstdH3tOIr
 jZwFNUJEyUFXAeYCHfPkfq2mq+DZZm8fsq82A6XcaPs4YJHnxJYTusVBdEivShURLv
 PeJFTvzgG6QC9gE2xAYKdxJBvh7wv/U5kfrcF2qlhdXWmNqK2xFOub52hCaoajhcXm
 OsabDxwRRVJ9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OoIYPzh0
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: fix m68k build with gcc 12
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-31 10:53 +0200, Fabrice Fontaine spake thusly:
> Fix the following m68k build failure with gcc 12:
> 
> In file included from ../src/lxc/syscall_wrappers.h:19,
>                  from ../src/lxc/mount_utils.h:15,
>                  from ../src/lxc/conf.h:24,
>                  from ../src/lxc/log.h:19,
>                  from ../src/lxc/storage/btrfs.c:20:
> ../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
>   423 |                 #define -1
>       |                         ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-lxc-syscall_numbers.h-drop-define-1.patch | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
> 
> diff --git a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
> new file mode 100644
> index 0000000000..4a944e35b1
> --- /dev/null
> +++ b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
> @@ -0,0 +1,133 @@
> +From 82fe01821cd5cb8548598d7d93b07d6ef3f6b604 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 30 Mar 2024 16:50:46 +0100
> +Subject: [PATCH] src/lxc/syscall_numbers.h: drop define -1
> +
> +Drop "#define -1" to avoid the following m68k build failure with gcc 12:
> +
> +In file included from ../src/lxc/syscall_wrappers.h:19,
> +                 from ../src/lxc/mount_utils.h:15,
> +                 from ../src/lxc/conf.h:24,
> +                 from ../src/lxc/log.h:19,
> +                 from ../src/lxc/storage/btrfs.c:20:
> +../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
> +  423 |                 #define -1
> +      |                         ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
> +---
> + src/lxc/syscall_numbers.h | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
> +index 58840a5981..5e659d1b81 100644
> +--- a/src/lxc/syscall_numbers.h
> ++++ b/src/lxc/syscall_numbers.h
> +@@ -53,7 +53,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_keyctl 219
> + 	#else
> +-		#define -1
> + 		#warning "__NR_keyctl not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -92,7 +91,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_memfd_create 279
> + 	#else
> +-		#define -1
> + 		#warning "__NR_memfd_create not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -129,7 +127,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_pivot_root 41
> + 	#else
> +-		#define -1
> + 		#warning "__NR_pivot_root not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -166,7 +163,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_setns 268
> + 	#else
> +-		#define -1
> + 		#warning "__NR_setns not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -203,7 +199,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_sethostname 161
> + 	#else
> +-		#define -1
> + 		#warning "__NR_sethostname not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -272,7 +267,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_signalfd4 74
> + 	#else
> +-		#define -1
> + 		#warning "__NR_signalfd4 not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -309,7 +303,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_unshare 97
> + 	#else
> +-		#define -1
> + 		#warning "__NR_unshare not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -346,7 +339,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_bpf 280
> + 	#else
> +-		#define -1
> + 		#warning "__NR_bpf not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -383,7 +375,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_faccessat 48
> + 	#else
> +-		#define -1
> + 		#warning "__NR_faccessat not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -440,7 +431,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_seccomp 277
> + 	#else
> +-		#define -1
> + 		#warning "__NR_seccomp not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -477,7 +467,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_gettid 178
> + 	#else
> +-		#define -1
> + 		#warning "__NR_gettid not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -518,7 +507,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_execveat 281
> + 	#else
> +-		#define -1
> + 		#warning "__NR_execveat not defined for your architecture"
> + 	#endif
> + #endif
> +@@ -759,7 +747,6 @@
> + 	#elif defined __loongarch64
> + 		#define __NR_personality 92
> + 	#else
> +-		#define -1
> + 		#warning "__NR_personality not defined for your architecture"
> + 	#endif
> + #endif
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
