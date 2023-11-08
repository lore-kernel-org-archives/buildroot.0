Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD53C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3392B60B8D;
	Wed,  8 Nov 2023 22:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3392B60B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dH0pyVNlF_Dc; Wed,  8 Nov 2023 22:11:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7022660B78;
	Wed,  8 Nov 2023 22:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7022660B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA4441BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61C7960B6F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61C7960B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVza_e5qi50j for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:11:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5486360B55
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5486360B55
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8444CFF803;
 Wed,  8 Nov 2023 22:10:56 +0000 (UTC)
Date: Wed, 8 Nov 2023 23:10:50 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231108231050.095a9433@windsurf>
In-Reply-To: <20231029180509.283133-1-fontaine.fabrice@gmail.com>
References: <20231029180509.283133-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699481457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxC9QDitZb791YTnnIDi8mhHjvUGWHkn4SFlrIae2dE=;
 b=nPjt/y+HOHalv1nmXL6qlyfx09Kz2yIkSUnWtRosdYPv4jBceoPN4wMV6QrvChJmm7tsfj
 4ZoJjBrpwFsNqxxz/Te8lMhpx+1QnUYXMzG774u7UhcD2c8/RDGkCke8B3YJ6nO5+jtTPN
 SlWW5MASkRx/ETAwG8dj5myDDuIyVYTai2zmuQXo3QlyC8aR9ZBh3wuFFdaJ+eE68r686m
 lkR5SBrnguPQucm2rxfsvYn4MgDOfEx5iepU1OIXEpd8G5oWlLYand72vNYO6mk9pGsLU+
 DerTmE/37stCmeqYU9pJyDLXTIFMxfxPemohyRjfX5Qr01xBILHEr2eQOT+7GA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nPjt/y+H
Subject: Re: [Buildroot] [PATCH 1/1] package/atop: fix musl build
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 Oct 2023 19:05:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with musl raised since bump to version
> 2.9.0 in commit 8c70374c4f0f9f77875eac26a5e51ab662575c1c:
> 
> atop.h:157:1: error: unknown type name 'time_t'
>   157 | time_t          normalize_epoch(time_t, long);
>       | ^~~~~~
> atop.h:157:1: note: 'time_t' is defined in header '<time.h>'; did you forget to '#include <time.h>'?
> atop.h:157:40: error: expected ')' before 'long'
>   157 | time_t          normalize_epoch(time_t, long);
>       |                                        ^~~~~
>       |                                        )
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e7ec8d16f2299320f374a0198c8e9b18a102b037
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/atop/0001-atop.h-include-time.h.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/atop/0001-atop.h-include-time.h.patch

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
