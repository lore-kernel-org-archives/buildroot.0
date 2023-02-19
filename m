Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7472C636CC
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A5A60F4B;
	Sun, 19 Feb 2023 22:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A5A60F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yc_k0Qjv6nwm; Sun, 19 Feb 2023 22:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F5460F2E;
	Sun, 19 Feb 2023 22:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F5460F2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D332A1BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B99A560F2E
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B99A560F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nnUbsiCjQQ9 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 22:05:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2461460C2C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2461460C2C
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 22:05:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2381860006;
 Sun, 19 Feb 2023 22:05:11 +0000 (UTC)
Date: Sun, 19 Feb 2023 23:05:10 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230219230510.4b29d5be@windsurf>
In-Reply-To: <20230219161453.87903-1-fontaine.fabrice@gmail.com>
References: <20230219161453.87903-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676844311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vh2CuAR6cMt1QZHryigf024ygMYrntnK5l2E7Mma1c4=;
 b=ZfzcJovqLPJLMsg06HAVldG+rI58jRVqeNscLl2zqpXHYtRWdVXWbEQrmQGUvzfgTITjpY
 2TlFaKoo6F4rFPF3/caL0luL3jJ9LsQqcvMyXgz3LiIhzyHH6kBXg0VgDs34YIH3TGgpTV
 DjJaN+vRpvohutWkjKASGlXmThz7w0HCqDwhgarBrLumnesvWhtMHXNvBXrU7MzdMRlmpW
 xF7+ZwvPMEKkwifydUQoHdb498HiDIPkXy0otFNFqwJNn7Oft1QoDmqqqg9eeeadxLOxVc
 WtlAmAbcwaUv6HT2KDmhQbBSNzTC/1Uy4OvJJj/wnwCcvf78C2HCGoIXNnlITw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZfzcJovq
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmiutil: fix uclibc build
 without wchar
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 17:14:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> For an unknown reason, wchar_t is incorrectly detected with uclibc
> resulting in the following build failure:
> 
> In file included from igetevent.c:136:
> imb_api.h:150:5: error: unknown type name 'wchar_t'
>   150 |     wchar_t *Buffer;
>       |     ^~~~~~~
> 
> The build failure can be reproduced even when reverting bump to version
> 3.1.8.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e9ff3bd08e106dc834968bf5e4296ce8299027f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipmiutil/ipmiutil.mk | 1 +
>  1 file changed, 1 insertion(+)

I think the problem is that uClibc-ng defines the wchar_t type even if
wchar support is disabled. I believe if the AC_CHECK_TYPES() check in
ipmiutil ensured that <wchar.h> was included, the detection would work
correctly, as wchar.h contains a #error when wchar support is disabled.

Anyway, in the mean time, what you proposed looks fine to me, so:
applied!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
