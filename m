Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A784C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 19:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0D380D00;
	Wed, 14 Aug 2024 19:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIoQuDHtfOdz; Wed, 14 Aug 2024 19:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEEB480D49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEEB480D49;
	Wed, 14 Aug 2024 19:30:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F06F81BF40D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB46760637
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 19:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBab0j0Q7Lys for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 19:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAEBA605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAEBA605ED
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAEBA605ED
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 19:30:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 721C220007;
 Wed, 14 Aug 2024 19:30:16 +0000 (UTC)
Date: Wed, 14 Aug 2024 21:30:15 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240814213015.4b1ba6a5@windsurf>
In-Reply-To: <20240814095541.433665-1-buildroot@bubu1.eu>
References: <20240814095541.433665-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723663816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KBScuUf4ddkaTJndMJrChnsc7DJO/bN1I9hjRjN+Ao=;
 b=kVWpQAZE8AvGtYZAQlqnnCnuzqygceUF+uDDy7Fe2Q3/vPkFL8L+3kmjDGrIDir0IXaov2
 EcTAK2ootuKqiVPvZiO+9lMA0QWV+dR5eDC6RGPHAWs6YXwdsR+kDiEYK0XmmzGloGy1si
 GOdsLxkbM/9cj/vuoWw9DQqG0kkntBcfDTmcRArzuzNsALSi2dFKA6un93Omloq7zrspgN
 d9kL1zgu+97oXxeGitolcrJH8rBdBhMEKVF9rfbecF91xu2E1TeY25QcoheId+zpBEpo/I
 yxsYh08AtyZpWJUX9Y2maJ3OpcXjDoxW/kO7hx3vi+rGEFtCs1E0vt/NgWk/Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kVWpQAZE
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to 1.12
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 14 Aug 2024 11:55:40 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://github.com/rauc/rauc/releases/tag/v1.12
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/rauc/rauc.hash | 2 +-
>  package/rauc/rauc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
