Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1C6D5B149
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE8A80AE7;
	Mon, 28 Oct 2024 20:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVXUU0P5Q5sh; Mon, 28 Oct 2024 20:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB9E80B46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB9E80B46;
	Mon, 28 Oct 2024 20:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 125A84EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A126062F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrEoT5aJaShL for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2214605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2214605C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2214605C4
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:26:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06A44240004;
 Mon, 28 Oct 2024 20:26:41 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:26:41 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241028212641.66346fa0@windsurf>
In-Reply-To: <20241028193803.17032-1-ju.o@free.fr>
References: <20241028193803.17032-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730147202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZGtiB/vzFkk/GD4PRk2gSVWklLyLQ6NDp2CMJ4T4o0=;
 b=nehgVBEW1io3lqrlXie7Yyz1D9wdznlj04qg0h8TNYJp9/6HpLl/cSwaeHpaH5v+kykhAQ
 Jrcd2QkHAXxwBcuN7fP8e9YYHw/EW336twD5DOr+po1sOwo2n+HMgYmYeK5SKY1Jva7t2Z
 fX267cipIGLyHFBInp7LzPKiKRlrdDNFROTPRWnk4yX5k0NAdNGuunQhHSRu6Pxckf7h5q
 CIfPIDI2o59mJROMeOVqJNrM/uJZDyTcipw2mK1PHz/Y8usmbGPaiT7OgaVbzUigC1HimW
 TtQ2L1kXQ0xgcJwkeu5lBLKp3DH2+lIEyiqw1ESIWzSeiisCL4pjaFfRWDZ5Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nehgVBEW
Subject: Re: [Buildroot] [PATCH 1/1] package/opencsd: bump to version 1.5.5
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

On Mon, 28 Oct 2024 20:38:03 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/Linaro/OpenCSD/blob/v1.5.5/README.md?plain=1#L344
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/opencsd/opencsd.hash | 2 +-
>  package/opencsd/opencsd.mk   | 2 +-
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
