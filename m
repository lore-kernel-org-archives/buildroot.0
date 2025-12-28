Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E6E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 13:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163E3405EE;
	Sun, 28 Dec 2025 13:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXYBUgJ1yNrL; Sun, 28 Dec 2025 13:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0373740569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766929601;
	bh=5hlI8dct0HWM2JTF4E7QJ39+4bWWPyRLWteKu5mK36E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d0gP2eWc5jTPrO9a43+haUkofXYoaygcb6M8uVD53V4Alf/6L9j5X6009C1J2rN/A
	 M1r9s9A5JbZIbx9ZIkd6k2SleWHyP1A8c7DEQiMFX/RrVBPjdOV1RX4v+98CctE7vm
	 3LmihPQkceSptad6Zvzel3+5Xcqy2R2kHzlfpZGbeQWZBtgYxU5+e/6wedZJaBHRfm
	 XZEHVXfr7MOtO22JNMfRi4CWlx/zO8PbGAxSlt54NN4w5/K8OdYC7Kk8K3K+qM3tQ3
	 ERD5RmEZ8n6xHzBh27zDv5yDGkawE7DX6PwfD7rCIKFevqL/HXaWevkqMw4A3uxVev
	 gz3cYQUuRwogw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0373740569;
	Sun, 28 Dec 2025 13:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAB7B1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90E6D4013E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvvGjWiSUC4t for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 13:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DEBC400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEBC400E7
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DEBC400E7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 13:46:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 25C65C1D709;
 Sun, 28 Dec 2025 13:46:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7577760725;
 Sun, 28 Dec 2025 13:46:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 79F3811978DB1; Sun, 28 Dec 2025 14:46:33 +0100 (CET)
Date: Sun, 28 Dec 2025 14:46:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20251228144632.688b5d31@windsurf>
In-Reply-To: <20251207130030.3668435-1-bernd@kuhls.net>
References: <20251207130030.3668435-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766929593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qnyVaD19Y/oaqaV+zpboWsh7AhGyY2vXqZh7921aDgQ=;
 b=17S+l14437mcq+2qbbC7ujS9pKVP+r3WOABdsf63dlmnzsyswQ5uAb91YmSbIFTBNP8jVs
 D2PZYygLdSJFY8Wei1gHa7UqLaZgpeVwmmUGrDj37dlyhrJnfzVwkfhZYYbZR/G8vHfMlx
 YqOjOLKs3IBgHSDKosyRQkNTvkHxAjSEIQgdpfIwmv3b+ZiT0pSfvcBIQuiqCgv4rXZTCZ
 nAmIYrzaDsbpnGdFUV50te0pXkWDybRP3Th1oAkK262U1cEI1q8XxGUKFr5ZFOUavBgrkp
 qOvb3q1GgSM0m3UktIG6QxGk3kbG0sr7Bx6Ah1yGw3fk7TgEXXljLV7s9KkN6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=17S+l144
Subject: Re: [Buildroot] [PATCH 1/1] package/xvkbd: Fix build with gcc-14
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

On Sun,  7 Dec 2025 14:00:29 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/86f/86f2ba051e864375bda620dd92e01cb7b8532ac3/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/xvkbd/0001-gcc-14.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/xvkbd/0001-gcc-14.patch

Applied to master, thanks. To be honest, I would probably recommend to
drop this package. I don't think anybody is using that on embedded
systems, last release is from 2020, there is no Git repository, it's
for X.org only, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
