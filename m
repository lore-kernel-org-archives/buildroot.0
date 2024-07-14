Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E976C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C41605D2;
	Sun, 14 Jul 2024 15:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybqhx6S2QAYu; Sun, 14 Jul 2024 15:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E403605D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E403605D9;
	Sun, 14 Jul 2024 15:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0071BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9E4481153
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQbqPW3lTYNP for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 999EF81152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 999EF81152
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 999EF81152
 for <buildroot@busybox.net>; Sun, 14 Jul 2024 15:38:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2699E0003;
 Sun, 14 Jul 2024 15:38:05 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:37:52 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240714173752.1161d1da@windsurf>
In-Reply-To: <20240713183024.129627-1-francois.perrad@gadz.org>
References: <20240713183024.129627-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720971487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqiYwCBXrkpYMcvVaxaP7yfvKiggrUW09DsM1rhIKRw=;
 b=GBZhw/bjW+yYflkUxIaFDod/u3Q4C3KAQCsgWt5J/FHXk9w6X0POOKySUOHWKlS3PdAE5T
 GpIwacqYH9adTff3XzALKuzx7RaYWDfgiFrpOSM87u6NgMT7K5v94y1XyVcbme/dZrgb1L
 ZtVpAw1jKTYhMndWXsJeXWBn6zbybs034/C/6SDkUR//paUC4yCk4t9jWZ27PkpAUBnacY
 CTeLIxBZQKJfLBYqUGccGsW025tUE9+hfLluPH3fzUayRUbzpsJf3GYXZuZ1Go0qtHs1VF
 4xrGYgOxRE9oBnQcpXVgm7pcYzhmyGGOFx5IQ8wMJql/yBxJCcDgXOKwRWJqTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GBZhw/bj
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 04dca7911ea255f37be799c18d74c305b921c1a6
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 13 Jul 2024 20:30:24 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit.hash | 2 +-
>  package/luajit/luajit.mk   | 2 +-
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
