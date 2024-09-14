Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC81C021A9
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 18:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B2080A78;
	Sat, 14 Sep 2024 18:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_XEQD3kRZyy; Sat, 14 Sep 2024 18:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F0C680899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0C680899;
	Sat, 14 Sep 2024 18:16:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4955A1BF283
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3834D606CE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 18:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah8qRx7nwwxc for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 18:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 878A4606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878A4606BA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 878A4606BA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 18:16:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96DA820002;
 Sat, 14 Sep 2024 18:16:23 +0000 (UTC)
Date: Sat, 14 Sep 2024 20:16:22 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914201622.56e7318e@windsurf>
In-Reply-To: <20240906185059.1263571-1-james.hilliard1@gmail.com>
References: <20240906185059.1263571-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726337784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9URoQ2NQPbuvk+Kmr+wJ93ae2EbCifIr+E5FspBhaeA=;
 b=V51VJoX2wxZHqKvUEFe6ShD1eTgUc1vq1K5BhqlCa5BLyyWyyGGOjInIdkf4I3qeRX8w/W
 bPV2SOXab/3NjnqN3BXu/foy+WS6Fxw9LlivD+oPrWhZKj3AB+jAjI5Lw+fA350OlphqJ9
 aXBGEw+h3Er4F/qaVxjLjJJvinB98He1ZOh0PMYN6rry+53hE6j8b+hCK/fCaCS04md239
 2VqD0Ie5PjlC7uYAaCRLa5reCHAPBfCztjBvTDHbdgdc11Wsc7MSwA+xKRO6/412PhSW+1
 dnFEvl8bG4hJ1dBJKjHSaXvhHNx+xPOY5Qx18UBaEr7HBEhAieUV9CH7K1GmMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V51VJoX2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.7.2
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
Cc: Falco Hyfing <hyfinglists@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  6 Sep 2024 12:50:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 4 ++--
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
