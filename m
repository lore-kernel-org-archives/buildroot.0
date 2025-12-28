Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3318BD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E472C406D6;
	Sun, 28 Dec 2025 22:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Mf_sW8thLqG; Sun, 28 Dec 2025 22:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5329E40489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960719;
	bh=v+UmRsFmevasz4eKsqxg6B1ZgsyCXDjkJXsa+2DCSig=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WRF3rWh4CIzkL2L5SeTsuhEwmaynNs1gS0KUeg9YAiHqiFfGss8teRiSVBDyNFlti
	 Arw8KzyQK8WnS+aYVqakki2Q3gB/yV6+qOxVufwEbzZVvx9YQXopmvwQercI/BSptm
	 jagjuMZqkdRyN72TpkzmjGnC/t+CZhQUSvPfDxiO5ShjYNkQMO22WA7BTuqB+g9mVg
	 sx7rFQY4h4Gays9pksF/xs2WXyIjpxKa35wZ9RWCb1FPvuFlFprTxpH9QB+IptPfmd
	 V/WU443aQVM0ylJ+rIxAVSnsLraR2qEKfdHvO5muK+v0a5yR+fJIqFxFWbdK48EzKL
	 Kn4zdqgSjK0lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5329E40489;
	Sun, 28 Dec 2025 22:25:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D492AD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C677560A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgqVyyGIrZJ4 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:25:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9FC760A59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9FC760A59
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9FC760A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DFA8E4E41D65
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B69FE60725;
 Sun, 28 Dec 2025 22:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 43BC411979391; Sun, 28 Dec 2025 23:25:13 +0100 (CET)
Date: Sun, 28 Dec 2025 23:25:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?B?Q8OpZHJpYyBDaMOpcGllZA==?=
 <cedric.chepied@gmail.com>
Message-ID: <20251228232512.49c447c1@windsurf>
In-Reply-To: <20251217193244.3770538-2-bernd@kuhls.net>
References: <20251217193244.3770538-1-bernd@kuhls.net>
 <20251217193244.3770538-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766960714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kJ5XLOrwcw+3jo/9Somq86TFnCupMsf/X1lQp6oyqfQ=;
 b=HVOd1OrRXyqnDOzEld7alXTEuGMQndqpVkekaDHQHNBHO3lgHAK87XJFNnVTMpuX9LHReb
 IXN23K1hhSNfXx2yM6zCTO2sHZf6qhE4Nj3ILodLE2n8iciQv1JA3znvCtSjOBP64knCWo
 otnMJ4kQBhYHVG5B0pcxSwHOBhpcwfRId8LnbPTFuUq1k8nPYC4/aXQhHcExKp7uBdByUg
 OkZhSG59e2PQcqiZi7yOcuF7lQ3S7BwPtY/5zvq5sis9mLYEm6masMvA1fjxqc1O3Zu04F
 IIHgjVNp+eI02xHgOtFc0LCd0F0qblX9NoUfypS99w0bLlTSK+F6zVcJykvf+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HVOd1OrR
Subject: Re: [Buildroot] [PATCH 2/2] package/swig: bump version to 4.4.1
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

On Wed, 17 Dec 2025 20:32:44 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://sourceforge.net/p/swig/news/
> 
> Needed for python 3.14.
> 
> Added upstream sha1 hash.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for the bump! I see in PATCH 1/2 you fixed one package that
would otherwise be broken by this version bump. Are other packages
likely to also be broken by this swig bump? How much testing did you do
of packages that depend on host-swig?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
