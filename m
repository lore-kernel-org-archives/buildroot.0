Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD94C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64DE341129;
	Wed, 22 Feb 2023 15:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64DE341129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqeV9pLpM9XQ; Wed, 22 Feb 2023 15:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA1464107F;
	Wed, 22 Feb 2023 15:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA1464107F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 678181BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FBBC60A6A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FBBC60A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9NEY-ynjacw for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:05:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 321E5607C7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 321E5607C7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:05:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6769F240009;
 Wed, 22 Feb 2023 15:05:19 +0000 (UTC)
Date: Wed, 22 Feb 2023 16:05:18 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230222160518.3361b224@windsurf>
In-Reply-To: <20221231174208.1999716-1-giulio.benetti@benettiengineering.com>
References: <20221231174208.1999716-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677078320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=051/3K9Eu+/vrQigAyM0GWc2fWiNem9JZ3+2KN0aOxU=;
 b=QlIzAye8w/zKHFLywf0fz0Kv1gkg+U361b8lH5EMLGskoiczdDPc/wdaumvhmSRMU51ohW
 3NCiu63t2FyYonsbqvSsXANAVSAxWhmhvMTnwUk2hu4xvyJaKe3dukGGw9BFItomyeFOH7
 ykeiwg+eD/dMwAdTiRB5WwovH4j0NBQmzNa5oGJ2Qjq9nQZ8K/GQX8xLJh17E5Zj052Acm
 3C8q+eKDmACPfe2hsHku8mt18fTjFlZenHP+rcugby6LNR5d+JPBXh+fqycX6Tmq6Ku0+L
 nLZbRScIPf+j9l096+PvE31EMhkQX78dc4CXjp3ofRqUpzI8D1T8BnAWq06Axw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QlIzAye8
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure due
 to wrong pointer casts
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 31 Dec 2022 18:42:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch pending upstream[0] to fix the bug.
> 
> [0]: https://github.com/embeddedTS/wilc3000-external-module/pull/3
> 
> Fixes:
> http://autobuild.buildroot.net/results/0a0/0a022d5c053bf8f7a53349b8bae4b2168a9cd134/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../wilc-driver/0005-Fix-cast-warnings.patch  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/wilc-driver/0005-Fix-cast-warnings.patch

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
