Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE62C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 08:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AAC96081E;
	Mon, 29 Jul 2024 08:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-dmx16-YQqj; Mon, 29 Jul 2024 08:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7BA6081F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7BA6081F;
	Mon, 29 Jul 2024 08:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A10A11BF591
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 08:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FB7180CB2
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 08:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIfVWphrzi9O for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 08:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8398980C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8398980C98
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8398980C98
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 08:15:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CD38240008;
 Mon, 29 Jul 2024 08:15:53 +0000 (UTC)
Date: Mon, 29 Jul 2024 10:15:52 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240729101552.3452ec04@windsurf>
In-Reply-To: <20240729063420.4147514-1-troglobit@gmail.com>
References: <20240729063420.4147514-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722240953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TccUQJNhBjF9dW68MNbKAYrD7cDq1HzxZAGflrmIpXo=;
 b=JYDk1sIkon+x7P8nntDrQWnSc5iaFDpnAsCF8G6HOVctYS/4WBazmDw1rCp6+xiEXcjRBC
 JJzePvfjInP85LAsksGRHC79f3fRpLpfwcx+r8ODl/NNtT660Plrjwh25ZwEz1FakHbOlt
 uRSWZD5Lh59hQQn1eV7oDICuhk+2tP3xu7v0B/eE0QWXKoClhRW4GWo6E6N7R1ZwoDq0kf
 klLCeSGTjK0hsetlPQs8KWIFrizZ+9rtFBQ3C6Ho9LNhYZe6hbUD7scZ/8hqqKqEKep7kV
 FoAEW5nJn4lOuGl9VSz4/b9G3SbFrUXf7FrMrDY2QCfyykj8WfkhKdU+PrVo3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JYDk1sIk
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.6.1
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

On Mon, 29 Jul 2024 08:34:20 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> From https://github.com/troglobit/sysklogd/releases/tag/v2.6.1:
> 
>  - Read .conf files from include directories sorted alphabetically
>  - Add extra linefeed to wall messages to ensure they are seen
>  - Fix segfault on SIGTERM, regression from v2.6.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
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
