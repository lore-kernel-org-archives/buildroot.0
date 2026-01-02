Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C59EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8041F60C1F;
	Fri,  2 Jan 2026 15:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8p6mMn4B3Nv; Fri,  2 Jan 2026 15:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96F5A60BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368379;
	bh=XGE0IY6ZPEiSM6VcnS7Y9Ae7iAWjkLLAYNAMuCBxaKs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dpe4F7AdY3edN2qqrw0fUng5aFqKKXx0XUpZK7Cr6r6jt3ksEicAPYKvHcSKIqYM2
	 9T3aVUuHCAUs9FJXU1uKlQE9cIt5rpBv74g2tFRGRcv4ey2Mlz6/tqKEbwSkwJj6Xx
	 CBE49P7hFnvVD58kiohyEatY6KLC+pTxbWvHFbMIgzRqm5US8JbkufPVCbMw6oO1RF
	 jFSr6SZhnIlyAEvvrpthSmKavhwfpAjcviw5YaiIoIfcxVrx3PmhpcAduFtepSkyd4
	 9tNTK8msvlHlOpqA2nFZZyFYTpNQNIbp/MX+a+hQuxxTOJZIVFTF++SDomKZ59vo5F
	 Mny4j6ZJ9cGJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F5A60BC6;
	Fri,  2 Jan 2026 15:39:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CC3C19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E1C8188A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rww5rOrONNvH for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 958AE81A2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958AE81A2B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 958AE81A2B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:39:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 07F434E41EFE
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:39:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D431B606C7;
 Fri,  2 Jan 2026 15:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1F05113B071B; Fri,  2 Jan 2026 16:39:28 +0100 (CET)
Date: Fri, 2 Jan 2026 16:39:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260102163927.54224f14@windsurf>
In-Reply-To: <20251005123246.1165560-1-bernd@kuhls.net>
References: <20251005123246.1165560-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767368369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tVJN9LQjbjWIo+Z4bAvjXxsHCMkM5YQtGmFw9cNwZO8=;
 b=J4CSoE8nJV3PMXizJC/AjO2Eya4gzzrCNdKsq+VJxZs0JhMGPrs3el+EWb9lUHE6XQw6fn
 cLKje7+TdulgMnFnCNYvSau7xmteOM3fkUQvwnSz6NUfRcf4CIb276WxSIZ62lZ7TAZfdR
 +FLb1hQrC0Z1k8CUbDYHtOhKpAl2T8SyWiMYd6gQmp/gvOglNYYZa6r7ahlJ3+pDQEWPrT
 5lhUsOE+dvQVmypZ0sXiOSrYr+cU8Cxa7ttXNFuHxNe7Opc077IjYx/rztwpSWpDGtTWWD
 ygI5N/UayR6gQoD0hlWzuDjeeDE4P4Hm4ALn/LrqkeuBph4Uug5UvlKBB9kk4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=J4CSoE8n
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: link with -lm
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun,  5 Oct 2025 14:32:46 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes Apache runtime error:
> 
>     /usr/bin/httpd: Relink `/usr/lib64/libapr-1.so.0' with `/lib64/libm.so.6' for IFUNC symbol `modf'
> 
> caused by glibc bump to 2.42 with buildroot commit
> fb6256c0efbc93d242e9ae2aa2d3b4a2e7fd149c.
> 
> Configure check of apr does not detect the need for -lm:
>     checking for library containing modf... none required
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for this patch, however I believe the investigation is not
really sufficient/convincing.

Why is the configure.ac check not detecting that it should link with
-lm? I did build apr, and the configure.ac check indeed detects that
linking with -lm is not needed to use modf(), and a simple test with a
trivial program calling modf() confirms that.

So why does that work, while apache complains at runtime about libapr
having to be linked with libm?

Also, what changed in glibc 2.42 that causes a difference here? Did you
indeed confirm that the problem doesn't exist with glibc 2.41, and
exists with glibc 2.42 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
