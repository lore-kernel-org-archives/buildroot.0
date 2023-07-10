Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4338CEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 16:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA0940886;
	Mon, 10 Jul 2023 16:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA0940886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngTusKV1XXmw; Mon, 10 Jul 2023 16:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6938640583;
	Mon, 10 Jul 2023 16:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6938640583
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5550A1BF414
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2061D40489
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 16:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2061D40489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbFdA8qmWwhf for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 16:39:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3CAE4013F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3CAE4013F
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 16:39:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 928F0E0004;
 Mon, 10 Jul 2023 16:39:36 +0000 (UTC)
Date: Mon, 10 Jul 2023 18:39:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710183935.6d59f61e@windsurf>
In-Reply-To: <20230708111431.425846-1-bernd@kuhls.net>
References: <20230708111431.425846-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689007177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eu8MA87Uv3slyvVH2fpG+krAnS235/LIqW2h+OUlHEw=;
 b=NxPyEotfHGiDXBYzHhSKufAKYswVf/3EiEhK36R175+nuJzpCH2/Hr4SdalXmAq5mTDDpc
 8fiO0XIhoXPxdu7i0SfDxxV4dfWtagYUWC1cC8ENzY+mTF1Oagq3a9PsKQlyqcUNt2s8db
 Jvoq4LguaWzshb9toKdUKFTMCoSxu2Zd+A5H/FidwThD0KSWmA14bJ1UBQkC45Mhsq3Dig
 w0UHMLKv/vC4UzcswwOA2ccsqBYbKElrNTSGIaa56XWXugt9bAlLtwEIn1M3R3PRc02ipg
 kvGLweq5CrNYYB85dRCyLXcOXDubi/WhOLgrhQkMMqmacjj8/GqvAIs6g/Py2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NxPyEotf
Subject: Re: [Buildroot] [PATCH 1/1] package/emlog: Fix build on Linux 6.4
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 13:14:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/f6c/f6c52f58c3c016cee59d2dfe513c449d96dc3b09/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../emlog/0001-Fix-build-on-Linux-6.4.patch   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/emlog/0001-Fix-build-on-Linux-6.4.patch

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
