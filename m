Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D75C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8966541E87;
	Thu,  9 May 2024 16:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoytFdWi1o3e; Thu,  9 May 2024 16:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40F8041E92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F8041E92;
	Thu,  9 May 2024 16:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 501EB1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C67D41E92
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TznlK9u5VCJs for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE48741E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE48741E87
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE48741E87
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:57:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4975C0003;
 Thu,  9 May 2024 16:57:39 +0000 (UTC)
Date: Thu, 9 May 2024 18:57:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509185738.5538d527@windsurf>
In-Reply-To: <20240407114445.683504-6-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <20240407114445.683504-6-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715273861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oOtLFrR4rXg2KcBKF4j58v6Kdhgi7yI1Vb34ITK5Xw=;
 b=NrlztyFltzUTgIye8PSK5rRvv8fcakItSkF0xQG/fwYf1mgO4eBreOQe5/Am/OBsxoSW5A
 8pRDI7Ca5VaEP8EOPaT85pw206QsKWFldr4IhDe5hfZ3i4L8hCQte9EcvKRjm40HHHlX/b
 UWEKrqwDnVmYSjalXX4IXlsmx3hr7UJwk2ZbDw+tVgZLmjIxZKnNNFoQWjY8jvHVtUaHC1
 UWSa+R37uI1LbkTzIPq1zbfF+XCspu7XesdAaOsYpIrKoZrS82YzhhR7jpYLo10Du8xQ3w
 dk+mQK5H7NWTvblRTYZYkT0HbnT+BUG2Zo8KPWWrDSpYNsVFTZUuAjX4NaF6eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NrlztyFl
Subject: Re: [Buildroot] [PATCH v2 05/20] package/ffmpeg: add optional
 support for libvpl
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 13:44:30 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added with commit
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=7158f1e64d9b76afea78537a35c465447df0cff8
> 
> "It will fail to run configure script if both libmfx and libvpl are
> enabled.
> 
> It is recommended to use oneVPL for new work, even for currently
> available hardwares"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/ffmpeg.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

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
