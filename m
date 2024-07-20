Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E1C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18868403D4;
	Sat, 20 Jul 2024 21:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yz1gDSPkxbMY; Sat, 20 Jul 2024 21:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0402403D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0402403D9;
	Sat, 20 Jul 2024 21:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8312A1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F9BD403D9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INMWjb_fgQhK for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24517403D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24517403D4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24517403D4
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:02:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC60820002;
 Sat, 20 Jul 2024 21:02:49 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:02:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230248.27cd1bed@windsurf>
In-Reply-To: <20240720202231.1432128-1-fontaine.fabrice@gmail.com>
References: <20240720202231.1432128-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5L0zIn8uud356MP60Qq/1zvJnVGMjWJDXoPHir34d0=;
 b=ctEaRa3XF6fFqNkPwXaUdjFBxFcxmnPI2xLqv1+2c1dAyNjh8RbaJ1WBAAYwISvod3ZRJA
 DcOnUut1cbj095RowL2jOekfsKjqpliG2h90ZnN0ZtBOq7BXiTRXeS5H0ySFmyxHDnEvnQ
 cqnznRjLocVANlKSm2S8IdjetJyGxcduIACju16F5dhNo999Yogi/Ny3tfnBoEMTdPGGGA
 G5ba42cp9BEb+ZdkGXnfINfwv1LYbg8LH0s78i/brF5o29LJK/gwf/vxDZAlRb1Gacbhu8
 HeKXAOzd8QsKHemsH+ZJhwz0GVb3B057Y7SK9i5XQoePFV9m+sfxyA/xpYceKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ctEaRa3X
Subject: Re: [Buildroot] [PATCH 1/1] package/augeas: bump to version 1.14.1
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

On Sat, 20 Jul 2024 22:22:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with gcc >= 14 thanks to
> https://github.com/hercules-team/augeas/commit/792fb220a31a42043de6962fac6a1f6c030d67c5:
> 
> internal.c: In function 'xstrerror':
> internal.c:436:12: error: returning 'int' from a function with return type 'const char *' makes pointer from integer without a cast [-Wint-conversion]
>   436 |     return strerror_r(errnum, buf, len);
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> https://github.com/hercules-team/augeas/blob/release-1.14.1/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/65014642966721115ae4050c23b083a7f39e1300
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/augeas/augeas.hash | 5 ++---
>  package/augeas/augeas.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)

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
