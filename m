Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441FFD3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE0BD40092;
	Mon, 11 Nov 2024 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AER19MI4cI33; Mon, 11 Nov 2024 20:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D6040131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D6040131;
	Mon, 11 Nov 2024 20:27:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB3ADB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E72D60706
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDDvnKd_5r0F for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BF2960702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF2960702
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BF2960702
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8DB0240003;
 Mon, 11 Nov 2024 20:27:54 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:27:54 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241111212754.62316c76@windsurf>
In-Reply-To: <20241110211144.720818-1-ju.o@free.fr>
References: <20241110211144.720818-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbOD6PqIinNiBTCMPRBh5VtHHxkVDWaeLgOpDxCX1U4=;
 b=mTw/V27o4RaQjfsxyODq12/PN+4meyWso05FdwhZVqg6ruInJhAKaLQq/DzsJCVfRFylf4
 0y1bFqxi30WDgaaOOBSgqFzVCbZ30rQl+uPm+HtbAGSTWRnIubxxTp3JEwQD1uMnqJKJsO
 2qAfwA9E8wIclrLlyzM8TXDk857h4kbCVzx63biiAStW5fH5cs0gjcCuFXwXwXIOU6HjdI
 Q4BKSvPrcyql2cU91YXhCD0/GL036V3jbpFKdrUkd9CZvREsNnDFE8EYqwUBECGk7XXu5v
 4aill7Dxih0M2f1x62+8Hkr7tSO8OZJRexkp6RYeKfT52Xi9dufI8qWDhqbA2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mTw/V27o
Subject: Re: [Buildroot] [PATCH 1/1] package/motion: bump version to 4.7.0
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

On Sun, 10 Nov 2024 22:11:44 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For the change log, see:
> https://github.com/Motion-Project/motion/releases/tag/release-4.7.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested (compilation only) in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1535518810
> ---
>  package/motion/motion.hash | 2 +-
>  package/motion/motion.mk   | 2 +-
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
