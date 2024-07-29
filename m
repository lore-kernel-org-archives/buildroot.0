Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9489BC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA9D60647;
	Mon, 29 Jul 2024 18:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tex4N1ymYkI7; Mon, 29 Jul 2024 18:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B53660862
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B53660862;
	Mon, 29 Jul 2024 18:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2671A1BF267
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2130B811B8
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9iHLM2xdIoQ for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 207BF810A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 207BF810A4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 207BF810A4
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:59:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28FFD40003;
 Mon, 29 Jul 2024 17:59:11 +0000 (UTC)
Date: Mon, 29 Jul 2024 19:59:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240729195910.75a2043c@windsurf>
In-Reply-To: <20240728075339.4793-1-bernd@kuhls.net>
References: <20240728075339.4793-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722275951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCMo3nKLSeOTNtd/bGYh3lUcY1f6V4WrYGnuqmza5DA=;
 b=NY8bV17wKEcRyvXdoR6dcvkjzMQ1sDw0vqQLi3yXoDsnKpmZL+v5DfivoHgXtnqXQB65Al
 HUdxdFb62JkWte42xrrzOIvlqff18LveuAKYZVYuOgQSM5MhFtyA93z/BKYjsOoCaQdGUA
 xH2JuXMRfaY71C87sSzuxZXMduOh8X3nCKxdB6lKFY1tqSc4J9Et/1IfAmjiwat41F5vg9
 4mYYDb+gkIoxvUB01xsW6NX5ZdEnvBvdrVZRuHSNfYIz1Fn7dhZHXF3Sm6+1m32xepyAp6
 0jOyi0ROYi/MIG9WmXsFgT10OGS8/weg4jxYu9XSz7SOiAzhpbjxyqY/q2iIag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NY8bV17w
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jul 2024 09:53:39 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/tvheadend/tvheadend.hash | 2 +-
>  package/tvheadend/tvheadend.mk   | 2 +-
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
