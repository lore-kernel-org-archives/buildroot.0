Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE3BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9056E610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9056E610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE9A607A5;
	Wed,  3 Nov 2021 22:39:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkZq8eSbfFxd; Wed,  3 Nov 2021 22:39:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8144607B3;
	Wed,  3 Nov 2021 22:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7A41BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C5CC4032E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D04MwQRbASdu for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 876B340315
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:38:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9EA5B60002;
 Wed,  3 Nov 2021 22:38:57 +0000 (UTC)
Date: Wed, 3 Nov 2021 23:38:56 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211103233856.62d00a52@windsurf>
In-Reply-To: <20211030214622.2154510-1-fontaine.fabrice@gmail.com>
References: <20211030214622.2154510-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nano: fix build with uclibc <
 1.0.35
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

On Sat, 30 Oct 2021 23:46:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build of nano with uclibc < 1.0.35 is broken since bump to version 5.9
> in commit 3e62e9b14b2656f813c20ec6aaee99e3a85601c7:
> 
> In file included from ./sys/random.h:40,
>                  from getrandom.c:22:
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
>    27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
>       |                                   ^~~~~~
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
>     7 | #include <features.h>
>   +++ |+#include <stddef.h>
>     8 |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1932c524aa6b6a3337a0fc21b44adaac60972d30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...andom.c-fix-build-with-uclibc-1.0.35.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
