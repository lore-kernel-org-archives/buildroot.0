Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6264AC3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 06:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C91A40C2B;
	Fri, 26 Jul 2024 06:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEtvhn6afi_S; Fri, 26 Jul 2024 06:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFC840C17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DFC840C17;
	Fri, 26 Jul 2024 06:45:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8DA51BF83A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D36464083F
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KORKjDzzNLf for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 98AC5407C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98AC5407C6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98AC5407C6
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 06:43:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6A3B240008;
 Fri, 26 Jul 2024 06:43:48 +0000 (UTC)
Date: Fri, 26 Jul 2024 08:43:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240726084347.69a91494@windsurf>
In-Reply-To: <20240725212804.1039110-1-bernd@kuhls.net>
References: <20240725212804.1039110-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721976228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKWtmTj95J5Oayvigki2nEtkUqny5jA15K+GgxcDE/E=;
 b=cBWoVnYFOQ2CKH3xTc07USl14wQpcNFYCDsbpw6FU7QJHn+TUICY0t7CnGM+47kT2sa4ha
 YgaXIJyP+hUPp80/qYGqmg/Y635vJ/4Qu+XjPAHnRREC31eqqVesG/IwIv0wY1mkMzZ4ZI
 zxBGu+2ktpti58a5nMIIquMSoZhCorKrBImMbAxBrxbvNgay6gh03pkE+MkumfOz8Gtvg0
 NsqDtvsiwp6leqVEljAkalo0JsmjsMmDFGSA3+u+itrYGNqh6sJH34BWAHC5mbn+rorKFC
 KQPZiQEk653e0dMEN4Rkddw6IC53/P9FFHK0YaMvdQZAmYQiK/jR2fJayILgvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cBWoVnYF
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 24.3.0
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

On Thu, 25 Jul 2024 23:28:03 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added upstream fix for build issues with GCC 14.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-Refactor-for-build-issue.patch       | 142 ++++++++++++++++++
>  .../intel-mediadriver/intel-mediadriver.hash  |   2 +-
>  .../intel-mediadriver/intel-mediadriver.mk    |   2 +-
>  3 files changed, 144 insertions(+), 2 deletions(-)
>  create mode 100644 package/intel-mediadriver/0001-Refactor-for-build-issue.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
