Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B43FC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD00781D72;
	Thu,  9 May 2024 16:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYgxuYBua8oY; Thu,  9 May 2024 16:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0C0818C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0C0818C0;
	Thu,  9 May 2024 16:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3A511BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9076560FB4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fzr6dC1w1Qtt for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83596606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83596606A5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83596606A5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:01:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00C25E0004;
 Thu,  9 May 2024 16:01:44 +0000 (UTC)
Date: Thu, 9 May 2024 18:01:44 +0200
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Message-ID: <20240509180144.08e21d72@windsurf>
In-Reply-To: <20240422073505.12139-1-ps.report@gmx.net>
References: <20240422073505.12139-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715270505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpDnCMwGj5V3UmacPkAeDpzUYio1aCiXJwXdkdcAasc=;
 b=ECojppQS8RUl9RT62YsZXcQt4WJ+rx1rtMkEc+QFsAWY8RjVfxzJDAMdOszdVFKyioOHGf
 rx6IDG6vEmWfGZ+vhovWXrYG3hCf0OjSTbejVg7+DD0lk901aMdcSNhjd3IcTcAINZ379F
 R8GEs9i3CIQpCO+SLAK/Yc3bH+pBXDuqiVUKMBjMVimR5IvtFaFfy6cISmIlf93nXUeen3
 U/IUelaCddNJiClf+qFnZPc0JYlcxs0ZErhVvgBowyuum3u16tNUB2InqzZiqA0c3yLLAN
 0vK/1gZTAcM03XgeQShca0KE4LxoMq4TH25dhtjJIX3QtWsw7mhlBcwhzrPrTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECojppQS
Subject: Re: [Buildroot] [PATCH v1] package/fft-eval: bump version to 777749c
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Apr 2024 09:35:05 +0200
Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> Only one commit since last version:
> 
> - 777749c fft_eval: ignore spectral data containing zero noise floor values
>   (see [1])
> 
> [1] https://github.com/simonwunderlich/FFT_eval/commit/777749c5c7cc0af1fe5a74e3c589581eabcf0f1e
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/fft-eval/fft-eval.hash | 2 +-
>  package/fft-eval/fft-eval.mk   | 2 +-
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
