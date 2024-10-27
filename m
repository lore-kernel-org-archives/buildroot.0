Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83382D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE9C406CE;
	Sun, 27 Oct 2024 18:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JI_GIO7tSDiQ; Sun, 27 Oct 2024 18:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B844074F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B844074F;
	Sun, 27 Oct 2024 18:45:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E07971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED90C80D6F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dGmlsj3LX8P for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBE8981441
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE8981441
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBE8981441
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63C4DFF807;
 Sun, 27 Oct 2024 18:44:44 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:42:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241027194248.71a1dbca@windsurf>
In-Reply-To: <20241026205848.2664636-1-bernd@kuhls.net>
References: <20241026205848.2664636-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApryCrKr1xWDo0qCCRG4Cts/kaUCKYPWI6w1aDSiTxI=;
 b=njLJU6SL3/7+0HReXRYmbk7Ji1xRUEvh7sqpUOZ6EpDyBzJyU/UcaJFw3GH66EYvUZ37lp
 h0LDasdvIhz44u4J8ZlOG38k7RuxI5eT325wpmonzjIUpT/lm4Gu5xSANv1t2Ja6R0cbgp
 Kmy+IavcxYzxIYZslH2gqFQXG705+YBmKNJZhwu3uU2t0HujYmym9m1aqFvbubp8zMZlML
 0odspeGkZyRAGYs5NWWbEf9z0nneiBscArD7wCMpQuN93pX5JOu5JipLiGU9Kp9S9cG4w2
 3bIXF097o/Pj35gd4qCbakOg6A5mFTOJD6RbhKqMfl+JTrwcPMV2qwsxkYaYNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=njLJU6SL
Subject: Re: [Buildroot] [PATCH 1/1] package/libuv: bump version to 1.49.2
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

On Sat, 26 Oct 2024 22:58:48 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/libuv/libuv/blob/v1.49.2/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libuv/libuv.hash | 2 +-
>  package/libuv/libuv.mk   | 2 +-
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
