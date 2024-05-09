Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17631C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55EB418D2;
	Thu,  9 May 2024 14:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KB1R8ZPEHP1G; Thu,  9 May 2024 14:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12137418CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12137418CE;
	Thu,  9 May 2024 14:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 316301BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C4783D6F
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NdpPFi1JJPJ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A4C483D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4C483D9D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A4C483D9D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:32:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FFEC60003;
 Thu,  9 May 2024 14:32:05 +0000 (UTC)
Date: Thu, 9 May 2024 16:32:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509163204.46e17d5c@windsurf>
In-Reply-To: <20240508201130.706168-1-fontaine.fabrice@gmail.com>
References: <20240508201130.706168-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FyMZTziHY0tV5+OejMS+EhoCWWLKaJsfKkUqxu+olM=;
 b=oeC/mMUTp39hsAvBIZseHiReNG4REXKLCRN2W3dErKPUOIRCmuV2utT7mH2/euUoIBJ4YY
 TVsB9mJ3DudkY0aWeqncfVszRA+Ykt6AJwk6zUxln6PZ7JWtQDGMWeH3SocC4cTOcziKqM
 n2e8w3xi9yumWfwGO2AkUeH9hwAj8JKJ1MR/qv4Y7nyfNtedMnvmyshhOLY7FLKzCelf7X
 PV2FlA0xshrrHyDPOsDkhS0b345tX2mg7IfBQiLNwAbLJ9Q3GsNckAK7rsj4dViRJS14ig
 UKmJLjq2WMWn6Hikoz+F0RjtFpFD08DghIMtLLqLLI+wHVg4TmS9ZLa8iw/f/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oeC/mMUT
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: fix uclibc-ng build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 22:11:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc-ng build failure raised since bump to version
> 0.17.07 in commit 6fb179b906a1755d77bda9e501c5335ac163f3cb and
> https://github.com/ColinIanKing/stress-ng/commit/e75ecbc8994e94b9e151b1191c1888bd2821fe72:
> 
> In file included from core-sched.c:25:
> core-sched.c: In function 'stress_set_sched':
> core-sched.c:170:22: error: 'struct shim_sched_attr' has no member named '__sched_priority'; did you mean 'sched_priority'?
>   170 |                 attr.sched_priority = (unsigned int)sched_priority;
>       |                      ^~~~~~~~~~~~~~
> 
> Fixes: 6fb179b906a1755d77bda9e501c5335ac163f3cb
>  - http://autobuild.buildroot.org/results/d7d38dbb10f7f188da8dccc44a84a3c46a720bed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...002-core-sched.c-fix-uclibc-ng-build.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/stress-ng/0002-core-sched.c-fix-uclibc-ng-build.patch

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
