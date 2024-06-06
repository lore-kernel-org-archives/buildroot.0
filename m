Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20346C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 20:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DED1849EB;
	Thu,  6 Jun 2024 20:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ah6n9_e9tlkU; Thu,  6 Jun 2024 20:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E4F849CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E4F849CE;
	Thu,  6 Jun 2024 20:23:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1028B1BF577
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A53E40247
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lJsxfNfWXbh for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 20:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4489A40110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4489A40110
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4489A40110
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 20:23:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0AAF613F88F;
 Thu,  6 Jun 2024 22:23:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 22:23:22 +0200
Date: Thu, 6 Jun 2024 22:23:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <ZmIausTMGdCgzXgC@landeda>
References: <20240606182124.4069700-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606182124.4069700-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717705406;
 bh=+gUEA62kfC/NBlBPGV4Jm5BSNZ8LlF3rMfLmUlwttjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KZrI+qHQAgpiktjOd6b8x/oSmTVYm07CBtvGZVYqM6nG38Cb0FWucPbUQQRz+aSx4
 WlSB676Inv68yONcCChEUOSbYxUkqLDunfiBYjH32tlMZsVe4UpOy/Kx8Jzvhb9SPL
 SLlr+w/xzbokfEO+8UKgCM8OrvaWVKbMahU/ECx0R1f9r61WCbAhSfCnk9rRyhOw/n
 ZWdwpvCX3QfOne9eoK5HZpSsUlGkcsM4iFBmhNwaDfoxsMYrSo9H1LZWsL0TAh/zSi
 i9Z4hHrg4APOW4vvqy+XB72nflEo4oGC5Zhfj8w2Un2Lcq+uo7X7yEPCf7RPKmQbbF
 UmDorVWHdDR6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KZrI+qHQ
Subject: Re: [Buildroot] [PATCH] package/ntp: remove the obsolete patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2024-06-06 20:21 +0200, yegorslists@googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> 0001-nano.patch: both MOD_NANO and MOD_TAI were added to glibc
> on 2011-03-30 in commit 83fe108b0a9bc4f2deb14695bb0c8b2011e79f28.

It would have been good to state what glibc version first had that
commit. It was glibc 2.14, released 2011-05-31 (funny, we also recently
decided to assume that host would ahve at least glibc 3.14 ;-) ).

However, in 83fe108b0a9bc4f2deb14695bb0c8b2011e79f28, I only notice that
both MOD_NANO and MOD_TAI are actually _removed_:

    --- a/sysdeps/unix/sysv/linux/sys/timex.h
    +++ b/sysdeps/unix/sysv/linux/sys/timex.h
    ...
    +#include <bits/timex.h>
    ...
    -#define MOD_MICRO      ADJ_MICRO
    -#define MOD_NANO       ADJ_NANO

So, technically, it _had_ both even before that. And bits/timex.h was
introduced in the same commit, as a copy-with-diff from sys/timex.h.

For musl, they were both added in f5ba2bc9c, also 2011-03-18, first
released as 0.7.5.

For uclibc, they both were added in 2d8ea0524b, 2017-03-17, first
released as 1.0.23.

So, do we consider that uclibc 1.0.23 is old enough that they are
guaranteed to exist, or do we still want to keep them just in case?

Regards,
Yann E. MORIN.

> Renumber the remaining patches.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .checkpackageignore                           |  3 +-
>  package/ntp/0001-nano.patch                   | 28 -------------------
>  ...patch => 0001-ntp-syscalls-fallback.patch} |  0
>  ...ch => 0002-fix-pthread-detach-check.patch} |  0
>  4 files changed, 1 insertion(+), 30 deletions(-)
>  delete mode 100644 package/ntp/0001-nano.patch
>  rename package/ntp/{0002-ntp-syscalls-fallback.patch => 0001-ntp-syscalls-fallback.patch} (100%)
>  rename package/ntp/{0003-fix-pthread-detach-check.patch => 0002-fix-pthread-detach-check.patch} (100%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index d0bd179a5c..a7d353e7d8 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1118,8 +1118,7 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
>  package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch lib_patch.Upstream
>  package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upstream
>  package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
> -package/ntp/0001-nano.patch lib_patch.Upstream
> -package/ntp/0002-ntp-syscalls-fallback.patch lib_patch.Upstream
> +package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
>  package/ntp/S49ntp.in lib_sysv.Variables
>  package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
>  package/numactl/0001-link-with-latomic-if-needed-again.patch lib_patch.Upstream
> diff --git a/package/ntp/0001-nano.patch b/package/ntp/0001-nano.patch
> deleted file mode 100644
> index bce3478261..0000000000
> --- a/package/ntp/0001-nano.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Fixes issues with glibc header files, see
> -http://bugs.gentoo.org/show_bug.cgi?id=270483
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -Rebase to apply cleanly.
> -
> -Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> -
> -
> -diff -purN a/include/ntp_syscall.h b/include/ntp_syscall.h
> ---- a/include/ntp_syscall.h	2015-02-11 08:42:37.794576469 -0500
> -+++ b/include/ntp_syscall.h	2015-02-11 08:43:03.216957279 -0500
> -@@ -10,6 +10,14 @@
> - # include <sys/timex.h>
> - #endif
> - 
> -+#if defined(ADJ_NANO) && !defined(MOD_NANO)
> -+#define MOD_NANO ADJ_NANO
> -+#endif
> -+
> -+#if defined(ADJ_TAI) && !defined(MOD_TAI)
> -+#define MOD_TAI ADJ_TAI
> -+#endif
> -+
> - #ifndef NTP_SYSCALLS_LIBC
> - # ifdef NTP_SYSCALLS_STD
> - #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
> diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
> similarity index 100%
> rename from package/ntp/0002-ntp-syscalls-fallback.patch
> rename to package/ntp/0001-ntp-syscalls-fallback.patch
> diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0002-fix-pthread-detach-check.patch
> similarity index 100%
> rename from package/ntp/0003-fix-pthread-detach-check.patch
> rename to package/ntp/0002-fix-pthread-detach-check.patch
> -- 
> 2.34.1
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
