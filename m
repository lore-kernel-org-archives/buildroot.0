Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DA6C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EA0401CD;
	Mon, 22 Jul 2024 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elm_RlnbkR8y; Mon, 22 Jul 2024 16:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD33E401CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD33E401CF;
	Mon, 22 Jul 2024 16:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75C511BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DA6C4043A
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3fs46gKTL1Y for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:25:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 209E94023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 209E94023C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 209E94023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:25:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AAAB1BF20C;
 Mon, 22 Jul 2024 16:25:43 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:25:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240722182542.3a07279b@windsurf>
In-Reply-To: <20240719045639.3336541-1-james.hilliard1@gmail.com>
References: <20240719045639.3336541-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3/pyVL/J8VszG+btwmWJmvPOtgTEckiQ01TMk3572Q=;
 b=YOCufAxBaDIQvsLhwDpwyvlrk+jPTCWx5xf5eKg97S9hTi0XiEmkVQUjaqJvGTQ7laknOT
 bbrnNmgG7yv4D1jdSJ+PY6OMQGMM202XvlctSDL9Ku1Reycj+YqhFCya20FGYKUysrVyMJ
 T7qBsxqAJnXxH/yGq5zFJbxuxiGOpXWCD6J0AQTEoLGJi3LtcKOdbh6q4kOHQiCvE/vQR8
 62S4tNysVj3UBDIu2dXdN4ezZef4bW8n4uNn1YG9HR5VUfH/wvHLzDfBCqYd5G7ZOPIZcJ
 0Sj9pvSVOdkit8nKzYFLJTFW83OfkOw2ESi+sXGR1za98cYfGyk+xKrYFWjVzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YOCufAxB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jul 2024 22:56:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)

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
