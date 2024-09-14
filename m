Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE15C0218C
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB4E80DDB;
	Sat, 14 Sep 2024 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQIginuKlcmN; Sat, 14 Sep 2024 09:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280498110D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280498110D;
	Sat, 14 Sep 2024 09:34:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D23C11BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0CB46064F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuoqZj9YlmC8 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 962DC60645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 962DC60645
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 962DC60645
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:34:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC246E0003;
 Sat, 14 Sep 2024 09:34:11 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:34:09 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240914113409.2951a4c6@windsurf>
In-Reply-To: <20240910210556.80476-1-yann.morin.1998@free.fr>
References: <20240910210556.80476-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726306452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGciQxHMLJchriHbdYBU59gWx8g1S7vMTVzoXctR9bI=;
 b=YptsUAqUn3AAzv+rukaatE4l6nfRonkyJh3Y60DqqrGopjRVn3r1kACVIJRTTq9uvxA7mp
 7R0tFqASx9bwv0EjqI/rLd7XneutseRY71IwfCqhmnsMOhr3C5UwIGMTmMbcwpHNGDjKiK
 n4AHGztqkdIj/kl87jMakdKhD5jDQESpTbx1+b8qefdg1GuPmBchSmU6KMt2m/nFz8gdjm
 QNUX5rv4Tye67eFIMzVkQLg3nzJB7puFEB9GCKt4G/KH3EUrfsGr1UomExc4+GebT7XmTs
 w2nrOcllCIwL5E/YzulpeFF6fN4hoN4RTG3z+B1Pp6KKppA+9TqjiziUomlrvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YptsUAqU
Subject: Re: [Buildroot] [PATCH] paclage/genpart: change homepage and
 download location
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

On Tue, 10 Sep 2024 23:05:56 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The old homepage is no more, and the download location has changed.
> Update both to the new download location.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/genpart/Config.in      | 2 +-
>  package/genpart/Config.in.host | 2 +-
>  package/genpart/genpart.mk     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
