Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DF0C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C03680B40;
	Sun, 18 Aug 2024 09:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbESuzDuZkqS; Sun, 18 Aug 2024 09:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF0D680B7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0D680B7C;
	Sun, 18 Aug 2024 09:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0D1B1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCA996065C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYC0kZjjKd8z for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FFFF60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FFFF60639
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FFFF60639
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:03:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 68EFB13F86E;
 Sun, 18 Aug 2024 11:03:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 11:03:21 +0200
Date: Sun, 18 Aug 2024 11:03:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsG42c-EDQ9ABf-T@landeda>
References: <ZsDg6V61COGNWtyT@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsDg6V61COGNWtyT@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723971803;
 bh=7IWifmr+7eAlYK8Gk1fnkqasq01MbpNPJl0dQT/zd0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D5MyVxQehngshg6mSzjJdERtMxHlYTvQy9ua7EgJm/IEuyRf1Ke2OSOdgm/WdCT6k
 d6y87HFZvGTjLOuPrp7tRJlIxAeLw8frShEZIMepSuvQUF+9vuWsIdOtLWSegxZ5xM
 STettmRXAqghRIZShlPtjynmFbhfxwuh5vt5VqO1q9lldjGrnBpskO84ulCwJT2RCq
 F7fbYc8QkNDOPGiYS9WnAP605o4B7aOiU+GW38mxsRbQA2QOw1fcF5ynYQMKyjWCMW
 kDTBhQaAZOP5d76oNokn7nwQTfqBnUV3gno1rN0UvkB9YXB6nVBBHH4T6+oym+GCTs
 HwXWhBG1IJFlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=D5MyVxQe
Subject: Re: [Buildroot] [PATCH] package/libsepol: fix reallocarray detection
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

Waldemar, All,

On 2024-08-17 19:42 +0200, Waldemar Brodkorb spake thusly:
> For some toolchains the detection of reallocarray fails with:
> ld: final link failed: file truncated
> 
> It is hard to tell if it is a new feature of gcc or binutils
> or even an architecture specific bug.
> See here for example for an old bug where it was a HPPA specific
> binutils problem:
> https://sourceware.org/bugzilla/show_bug.cgi?id=19526
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/335/335aad5ecba2a4d21772767aa3a80d7d5631f4e4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libsepol/0002-remove-o-dev-null.patch | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/libsepol/0002-remove-o-dev-null.patch
> 
> diff --git a/package/libsepol/0002-remove-o-dev-null.patch b/package/libsepol/0002-remove-o-dev-null.patch
> new file mode 100644
> index 0000000000..b6559f6dbd
> --- /dev/null
> +++ b/package/libsepol/0002-remove-o-dev-null.patch
> @@ -0,0 +1,23 @@
> +From 7a9b8b4329285215e5608c3393394bef435b2220 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Sat, 17 Aug 2024 19:05:42 +0200
> +Subject: [PATCH] remove -o /dev/null
> +
> +With -o /dev/null there is following error happening:
> +ld: final link failed: file truncated
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: https://github.com/SELinuxProject/selinux/issues/438

The "Upstream" tag is to refer to what the status of the patch is. So,
rather than point to an upstream issue, you should rather submit the
patch anmd add the URL to that as an upstream tag.

It is nice to refer to the corrsponding issue, though, of course, but
then it should not be an "Upstream" tag, and just a pointer, like:

    Issue reported upstream: https://github.com/SELinuxProject/selinux/issues/438

Can you look into sending the patch upstream, and adding that as an
Upstream tag, please?

Regards,
Yann E. MORIN.

> +---
> +diff -Nur libsepol-3.6.orig/src/Makefile libsepol-3.6/src/Makefile
> +--- libsepol-3.6.orig/src/Makefile	2023-12-13 15:46:22.000000000 +0100
> ++++ libsepol-3.6/src/Makefile	2024-08-17 19:37:14.447327553 +0200
> +@@ -31,7 +31,7 @@
> + 
> + # check for reallocarray(3) availability
> + H := \#
> +-ifeq (yes,$(shell printf '${H}define _GNU_SOURCE\n${H}include <stdlib.h>\nint main(void){void*p=reallocarray(NULL, 1, sizeof(char));return 0;}' | $(CC) -x c -o /dev/null - >/dev/null 2>&1 && echo yes))
> ++ifeq (yes,$(shell printf '${H}define _GNU_SOURCE\n${H}include <stdlib.h>\nint main(void){void*p=reallocarray(NULL, 1, sizeof(char));return 0;}' | $(CC) -x c - >/dev/null 2>&1 && echo yes))
> + override CFLAGS += -DHAVE_REALLOCARRAY
> + endif
> + 
> -- 
> 2.30.2
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
