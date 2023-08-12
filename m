Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A75C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68719408E6;
	Sat, 12 Aug 2023 19:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68719408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSJhonaRH1ZB; Sat, 12 Aug 2023 19:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3996141559;
	Sat, 12 Aug 2023 19:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3996141559
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8EC11BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81A7960E53
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A7960E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCimpKKBWi30 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:39:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0002260E2E
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0002260E2E
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDCE960002;
 Sat, 12 Aug 2023 19:39:51 +0000 (UTC)
Date: Sat, 12 Aug 2023 21:39:50 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812213950.4592a9cf@windsurf>
In-Reply-To: <ZNeDSjN9ON9dG18Q@waldemar-brodkorb.de>
References: <ZNeDSjN9ON9dG18Q@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691869192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3dmi59aNh7doWoCROF6ywG/K5sQmd9Ell41y8SgGb0=;
 b=Dkizf/aT2eJzqg7WvrTb1QcsOnPqJ3j5bs8b3PccetTDHZAVkABswZs29Rabf9z9af+XaR
 MUyWuHmo14xYzUREasFHXkgA6HO1pPM0miQA1VjyKxvsLl4H6+gDWaDwre2ECs1yzSsV98
 yoqCia/AzdjCVYJsadgdyhx1Zzg5j8A+T4VqgcmzIm0RaaMHDzHZqx4sq1JaZFJT0YaCC1
 idONsLwGDaLF1pUU0E97CWlW4CVfrr3cQhevcSZQAwsBTFSaVGaFyNRydGVQuySqzgeD59
 y47T4BSfnpkw+He2u09rJLwk3wba56aHnK3+A5XNfExmEQpf0zpFp/DXcr7wSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dkizf/aT
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xfsprogs: fix linking error
 when -O0 is used
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

On Sat, 12 Aug 2023 15:04:10 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Urcu does not like -O0 it needs gcc optimizations.
> Force -O1 in this case. Inspired by package fwts.
> 
> The issue got introduced in commit 2f8f69012e0eee7f3e98212fb3da118c211f3c0b:
> before this commit, xfsprogs builds fine at -O0, after this commit, it fails
> to build at -O0. As this commit went into 2022.02, the fix needs to be
> backported to stable branches.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3bd/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - add more information about when the problem was introduced
>     from Thomas Petazzoni's review
> ---
>  package/xfsprogs/xfsprogs.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
