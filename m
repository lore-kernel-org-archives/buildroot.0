Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4BEC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A278060EE7;
	Wed, 21 Feb 2024 17:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lG3U7jSHqrK; Wed, 21 Feb 2024 17:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6585360F2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6585360F2A;
	Wed, 21 Feb 2024 17:21:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0699E1BF384
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7DC741771
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEFweb5tKQLm for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D01D40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D01D40120
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D01D40120
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:20:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6630C13F838;
 Wed, 21 Feb 2024 18:20:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:20:50 +0100
Date: Wed, 21 Feb 2024 18:20:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <ZdYw8pl7diVV4b80@landeda>
References: <20240212143222.1555220-1-aperez@igalia.com>
 <20240212143222.1555220-2-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212143222.1555220-2-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708536052;
 bh=FlLhitEYFyeoqkkYiT2CEYTptJiF0IrEkZsFNmsHI0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdnGURF7EWPwK1oFX8ik9K2CxdMV1zXnOkf5t90pb4f79ATYl+T5vEBPb/p74Hfi3
 ZHovyJ3czwwfOkr72CA/fi49Np3MEY6Ty3NZZGxMOicvP7cGsiXFAxK6eOF64/ZbbW
 Avh53lq5TYVX2ulwhCk4g1ogz+0icXcnCbzJ8gMLN8rE8D5vIFPMZAGAO7SeUNs7vu
 aMphDlwPvVsxVkVZJ6ikYrNIbChXNmt+bhaquo1QZ3/SLCkBbsfv4sSdU0LpnvFeeu
 2Z6/faL9kaidXyfguS7QTsImwzTiepvkG5uNf1657a8q2x0Gd1fIH6jv51VxJQnFrO
 iKwkXSXUfoDlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DdnGURF7
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: security bump to
 version 2.42.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adrian, All,

On 2024-02-12 16:32 +0200, Adrian Perez de Castro spake thusly:
> Fixes the following security issues:
> 
> https://wpewebkit.org/security/WSA-2024-0001.html
> 
> - CVE-2024-23222: Processing maliciously crafted web content may lead to
>   arbitrary code execution. Apple is aware of a report that this issue
>   may have been exploited. Description: A type confusion issue was
>   addressed with improved checks.
> 
> - CVE-2024-23206: A maliciously crafted webpage may be able to
>   fingerprint the user. Description: An access issue was addressed with
>   improved access restrictions.
> 
> - CVE-2024-23213: Processing web content may lead to arbitrary code
>   execution. Description: The issue was addressed with improved memory
>   handling.
> 
> Add an upstream post-2.42.5 patch to fix an issue with an invalid
> backport causing a build issue.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...velInterpreter.cpp-339-21-error-t6-w.patch | 39 +++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash              |  6 +--
>  package/wpewebkit/wpewebkit.mk                |  3 +-
>  3 files changed, 44 insertions(+), 4 deletions(-)
>  create mode 100644 package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
> 
> diff --git a/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
> new file mode 100644
> index 0000000000..a15d9e647f
> --- /dev/null
> +++ b/package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch
> @@ -0,0 +1,39 @@
> +From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Mon, 5 Feb 2024 11:00:49 -0600
> +Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
> + =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
> + =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
> + =?UTF-8?q?=3D268739?=
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Unreviewed build fix. Seems a backport went badly, and we didn't notice
> +because the code is architecture-specific.
> +
> +* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
> +(JSC::CLoop::execute):
> +
> +Upstream: https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +---
> + Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
> +index 5064ead6cd2e..9a2e2653b121 100644
> +--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
> ++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
> +@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
> +     UNUSED_VARIABLE(t2);
> +     UNUSED_VARIABLE(t3);
> +     UNUSED_VARIABLE(t5);
> +-    UNUSED_VARIABLE(t6);
> +-    UNUSED_VARIABLE(t7);
> +
> +     struct StackPointerScope {
> +         StackPointerScope(CLoopStack& stack)
> +--
> +2.43.1
> +
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 322e494c36..71e41bb1dd 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,6 +1,6 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.42.4.tar.xz.sums
> -sha1  34da38e9554586154c83fdbb5c20e353b6d97277  wpewebkit-2.42.4.tar.xz
> -sha256  8836040a3687581970b47a232b713e7023c080d5613427f52db619c29fb253a4  wpewebkit-2.42.4.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.42.5.tar.xz.sums
> +sha1  50a18f43452520e9f34f84c04bc0166af655ffff  wpewebkit-2.42.5.tar.xz
> +sha256  4dbab6c5e6dc0c65a3d7dffc1c2390be5f9abd423faf983fe3a55fe081df0532  wpewebkit-2.42.5.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index e54ec2952f..60a45b13b1 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.42.4
> +# The middle number is even for stable releases, odd for development ones.
> +WPEWEBKIT_VERSION = 2.42.5
>  WPEWEBKIT_SITE = https://wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> -- 
> 2.43.1
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
