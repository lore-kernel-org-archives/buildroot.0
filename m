Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46499D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E77440206;
	Sat, 26 Oct 2024 12:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kxxTEy963OR; Sat, 26 Oct 2024 12:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E594F40232
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E594F40232;
	Sat, 26 Oct 2024 12:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF8B65C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDBB86061C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SB-lIGztf2LO for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6B71605E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B71605E5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6B71605E5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:57:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBC1FF803;
 Sat, 26 Oct 2024 12:57:33 +0000 (UTC)
Date: Sat, 26 Oct 2024 14:57:32 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241026145732.4a8aa966@windsurf>
In-Reply-To: <20240922092758.1129708-1-james.hilliard1@gmail.com>
References: <20240922092758.1129708-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729947453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P122GGbUzibKIrusNh2ZZozDM86hebYTHn3fH2tAW/Q=;
 b=cHKpbarwrKd9mSUacBawVph6XIEZn3d+ZE9z2Js9/UUxItgEK1thPPJ1BLZPjw2t1DEYA7
 F4Y3f+0nkO4ih4DF3RQyFkQYtKBoYo+UrQj8k36vcstaSAidM25ki+tBN2/Z5wB6h9wwNN
 8kxFP4fMJ/szDUeiOAu7xkNkrXF8f+UONlHkoRfVA6R6ixLqaqOYgTE/T40oBTsvYjUj6O
 EnOtcnmX5PLb7rrPEQx7UdbLL63kdPohjYDmkq7tLOVrQ3PnrBUKf+Vv2EfbMEAPxPez67
 L+suEuSAxK6eNXbHCjBZQ0oiatjeOwkhdZnpUHqG+eFBfj20hSCMyM/U9ZoJmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cHKpbarw
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.81.0
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

On Sun, 22 Sep 2024 03:27:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   4 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 68 insertions(+), 68 deletions(-)

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
