Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCDDC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B4841523;
	Thu,  2 May 2024 07:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkprU6mZOL1a; Thu,  2 May 2024 07:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A64BE414EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64BE414EA;
	Thu,  2 May 2024 07:49:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1652C1BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D82104148F
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNtRgC-O4UPF for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5E90409F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E90409F0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5E90409F0
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52C3BE0002;
 Thu,  2 May 2024 07:49:08 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094907.403cb6ed@windsurf>
In-Reply-To: <20240411210012.2127800-1-bernd@kuhls.net>
References: <20240411210012.2127800-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYfrK/KJynINrBdVvOV4OEVRVglRZ8rsrl3Z2LVDNrk=;
 b=T8Ieypw3V4DcFWZdBsTw5n+xgmZ5IFAbk/3LQvL9R+Cdy0Grx4vBTBAKGxNwm1c61p7inX
 BJLYpmIPm2uFyxpBGlWu9qirdeQNwa+JWo+nNQnxHul5fgQDjPQuvZKrXG/zwoJoEfNBKU
 YcgD7FkaDt1fp2c3oS7bD9aBGF+1YV48bDQMYCtbVlgjNNJA2RtyVc0VfVoiS3tVe/64ha
 N3ACsgdFM0Nc1Kxf5YA4dVkQLjO63noGrEwQjeUenGCZpxxUBlL71smfo7SuOm9uMY+QD8
 s+Zg5XrwnDkmuUg5WMDuc3olu50NGFOP+tk7OgEaSZTMAzrWGro/HuwXHc7zQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T8Ieypw3
Subject: Re: [Buildroot] [PATCH] package/intel-gmmlib: bump version to
 22.3.19
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 23:00:12 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
