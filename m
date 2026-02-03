Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C2EE8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 013FF6064F;
	Tue,  3 Feb 2026 22:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5Sl-57pP59U; Tue,  3 Feb 2026 22:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C0F60837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156654;
	bh=Y4ICdavBqYsix4sgQuRdMshFFsVipW0zL3ukV+qOpxk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kXKtXYIzGEnkwucO3TikK3m+epxElX7FweK8g2jhOJzk65KnFl7H7EKZJCQ0pfYCW
	 6U2Uq4w1hcGnZt6NJPbqltYVfgwMydVECgu5AZFlG7uL8vWfWzikeJV1GInlSzcPbN
	 xheKZEqs85cbJUrShsrn0xnjGhZTtwLGP+Mp8x8Yc2zU4XtLuBuWs98aQWfV5lA6zx
	 doUY7lzLDoYg3HuXGwxGwQIcKDF0rDDhZ+ZmspSfUxDRnvNc5uV6YAH8SsUjXppqxs
	 4+9iGX7oRgxvIOvK8EOnmLHfk48NKSkGAA2ckJ+t8/Ll+xsPgrCeeJzeMmDh6YPqIb
	 r7GA24ZKpXj4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C0F60837;
	Tue,  3 Feb 2026 22:10:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEF1F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B0CD40188
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLHK2EQj_mCJ for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 403A640185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403A640185
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 403A640185
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6F1724E423E0
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:10:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33DDF60728;
 Tue,  3 Feb 2026 22:10:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92B11119A8888; Tue,  3 Feb 2026 23:10:48 +0100 (CET)
Date: Tue, 3 Feb 2026 23:10:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYJyW-eu_OtQ6IQ5@windsurf>
References: <20260103094508.1212757-1-bernd@kuhls.net>
 <20260103094508.1212757-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260103094508.1212757-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770156648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=2OXWHvlHjAq8YlMcXvinho3p9nUl/Et2o5gUj2gTOds=;
 b=c5Gi7nWGdsyJPO0D3VNR00wYVar4NBG/Bv3vTFQtH7RQ2t7dFKIXAMfe0qpSrosG0PZ1mb
 hG4fUKKZZdku3ih9SEXkAOgjor+EEuwa+TUyApig/yKzG7jLehEdV9/YbYOC15THFu18uV
 MKWoFa/KHqR5Q61lc8YCTk2gRzRnbM92G57rEmT1Vh2L/dB6qTPunhkoRbgrnGTuLgKnNa
 yPIxoOV6OfkNWuOy1Qq7ZivEOahY+1zghZLfW3DnefuNxmhNzQS6yqD3x1SJqS0CPxU45L
 43V5R2f4nedk/Jg7zITh4cvCzlWiPMNR8WbnZTJuirrQgz36+/c/0bZAnjrulg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=c5Gi7nWG
Subject: Re: [Buildroot] [PATCH 2/3] package/freeswitch: Fix compilation
 against >=2023/06/02 spandsp
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

On Sat, Jan 03, 2026 at 10:45:07AM +0100, Bernd Kuhls wrote:
> Needed to fix build with upcoming bump of spandsp.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
