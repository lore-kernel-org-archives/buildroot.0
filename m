Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5809C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917974198B;
	Fri, 12 Jul 2024 14:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kKZonjk_vve; Fri, 12 Jul 2024 14:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C67419A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C67419A0;
	Fri, 12 Jul 2024 14:00:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF301BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9970A40273
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zixbJ6TxXvBr for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 500BB40185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500BB40185
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 500BB40185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:00:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 811994000C;
 Fri, 12 Jul 2024 14:00:38 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:00:37 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240712160037.3090745c@windsurf>
In-Reply-To: <20240627080205.1454694-1-peter@korsgaard.com>
References: <20240627080205.1454694-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720792838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMxLzZWXRtnKIcaHpbFf0zu4dSPiq7OiNz3ZkmdPUGI=;
 b=JeI3tFaE3Kjz59vkGGvMNg0nBIafhJrwvjH46NHJAd4xL0V4BJ5U7X6XjQ1+E0lOoTKS24
 nrJu0EyMSDnNR54DR+3TMj2OUxqn5T/uQScGjplx05HImcGrYBZYLLk3pHBDUysCIiaaaA
 70njT8AoIXUpcyd+mV1nMY8R9p1kV9bHRjeME80k+VirR9ZQLYsXRZhQOPjPWW/ctsoc9t
 fGS27tsLCoEg7CbH6mA0IDZhp/akNOhcDMqq4RoNOYn+rQm1Az6HruxMHMHYVSu9qSJLPN
 nT693LZ2zmBNRoIfOWNG7Q6o92L7czBzPpEkX9Ras4pFpBA2l4lS3gyOgsMXGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JeI3tFaE
Subject: Re: [Buildroot] [PATCH] package/dump1090: fix build with GCC 14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jun 2024 10:02:04 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes http://autobuild.buildroot.net/results/1d5804974153f96e80f5200793ec8cd12c9fa18a/
> 
> GCC 14 complains if the arguments to calloc (nmemb, size) are swapped
> around, causing a build failure as dump1090 builds with -Werror:
> 
> net_io.c:107:34: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
>   107 |     if (!(service = calloc(sizeof(*service), 1))) {
> 
> Add a patch from an upstream pull request to fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0001-swap-size-arguments-to-calloc.patch  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/dump1090/0001-swap-size-arguments-to-calloc.patch

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
