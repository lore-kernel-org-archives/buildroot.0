Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E11C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E705405EB;
	Thu, 27 Oct 2022 06:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E705405EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61uK-yWnsofr; Thu, 27 Oct 2022 06:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA6E640609;
	Thu, 27 Oct 2022 06:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA6E640609
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6B871BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7552C81347
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7552C81347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuNC1XkoKrKE for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:50:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F151380B64
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F151380B64
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:50:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F718FF807;
 Thu, 27 Oct 2022 06:50:08 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:50:07 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221027085007.1d08e379@windsurf>
In-Reply-To: <20221026203941.555393-1-fontaine.fabrice@gmail.com>
References: <20221026203941.555393-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAh0Q015g1iXY0Lp3NOHXi4uFfq+yRZUskKoWmxrLdQ=;
 b=WRKtz48J2fYbEcxNDGUY4sk1Goi71ff0Iy9Y/j69aVBAzjjGmVNd1p+YRMQ375gUu70Xph
 M0CFOLioX4sJaCJuARAOXZb4At5rsp7gb2LCeruunJtuDZXRezuAhGDknvaP8yklcgRRfw
 x9UV307sMsq9hPkb4Ul+rxx1VWS+czOjDtPtJdVpkQyVRV8Br1tWalQBG0Bajf8eeV+Vo3
 b7SqSLYXnt1dE+KcIojzwgCJvOHZiTv8uHmuJFGQ9qCLqYO6c/RQc/PKDI1wGxKzIk8m9M
 +DKiOD/pp9ieGBUeuZw5e/0vvZR3ZQkdR+AjljNhBsEeq56OoM3jcW80kRNenw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WRKtz48J
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf: fix build without threads
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 22:39:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without threads raised since bump to
> version 2.1.8 in commit ede944f53509f825aa983de19d34fc30259b812c:
> 
> Settings.cpp: In function 'void Settings_Interpret(char, const char*, thread_Settings*)':
> Settings.cpp:1281:9: error: break statement not within loop or switch
>  1281 |         break;
>       |         ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2bcddf8439f6913fdf19b1fc2d33999a787ab3b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...fix-single-threaded-compile-breakage.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/iperf/0001-fix-single-threaded-compile-breakage.patch

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
