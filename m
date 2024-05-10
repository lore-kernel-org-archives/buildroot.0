Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C4CC25B5F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6B1C4056F;
	Fri, 10 May 2024 11:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MTj4Jmbewwa; Fri, 10 May 2024 11:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 023BA4058B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 023BA4058B;
	Fri, 10 May 2024 11:56:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B07D41BF995
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9F9384579
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZntIzYH9MFqj for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A73284574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A73284574
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A73284574
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:56:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F355C0007;
 Fri, 10 May 2024 11:56:38 +0000 (UTC)
Date: Fri, 10 May 2024 13:56:37 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240510135637.07b082e7@windsurf>
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715342198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q76YWFG69UL7V112GKBnyi1XBeE3khp5dlgunGzAc+g=;
 b=Y/WbVGMCA4FRFg0wPWcaFtKskTK2Ai/9+gqeNuf3ReE1SZMUYPdJTAJ9TUKZAfaiMURrVA
 z+KagcyVvHFHyhw4qPHYDcloVUoZz8sQ9X/txzFPrrk8iLR9yU0IePTEpvapzN5g5gweSa
 TBX10A0BkMlwLplEeUfqFxS3sCj5FJKlbdpgBnOl12XRs6n8nB9kX1cDQ/GYI3H6jiI3Mr
 2nxr640lawFTozTW+dsIAphzr3/IU/kMhunGZXHQTjSPzkaPKv4MFst1+Bj6tYiDjErLAw
 Q++4ZQeXYWr199OPJBKB8OOyIOCZ5JO8mWKr3C0jjyZhXUqX8rIFkt9NLyFGJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y/WbVGMC
Subject: Re: [Buildroot] [PATCH v2 1/9] package/libsepol: bump to version 3.6
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

On Sun, 24 Mar 2024 15:24:32 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/libsepol/libsepol.hash | 2 +-
>  package/libsepol/libsepol.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Entire series applied to master, thanks! I'll reply to PATCH 3/9, which
had an issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
