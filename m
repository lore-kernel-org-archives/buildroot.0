Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF8BC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 847BE60604;
	Mon, 22 Jul 2024 19:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32irEa6G99Fh; Mon, 22 Jul 2024 19:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91FD96060A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91FD96060A;
	Mon, 22 Jul 2024 19:51:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 611231BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C35080ADF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78vuB5XYohLT for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D58780ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D58780ADE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D58780ADE
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:51:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E487E0003;
 Mon, 22 Jul 2024 19:51:15 +0000 (UTC)
Date: Mon, 22 Jul 2024 21:51:14 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240722215114.6c81a7a4@windsurf>
In-Reply-To: <20240715-support-testing-fix-testinitsystemnone-v1-0-299145b2d342@collins.com>
References: <20240715-support-testing-fix-testinitsystemnone-v1-0-299145b2d342@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721677875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z70EtE7LT5y5WMrMZdfpQ7MP7jcKChjNCOaG/vqp9WE=;
 b=H37T98AVK89GDil7LroFFgH3FSxXfv+9A5zK5/H6rWEnmNRRps7owu3pgai70Q7HX1IjB+
 BwXm90mP8hdbu4pYjc58txu/hNoSnvbPnoycDh+i1XJTac5nG37PDQPW4TS8jVAkJxn54P
 77aFonkrGs6ZrXO+cGdsVTRGRjzpgbEc2B9WRnDv7nxCWoZDLinZVOKmH/OblckWNyoV4l
 iCBqPC53fBgAleYsvKc0gjZg5wlKGMpiKD9PH2B1UJ496+9y/RU0R00+F39C+8vC3T24Gr
 Zz0mr00NQ2WQiozK++9PvEKyVNfLLH/m1rzMW6H7xXa5yjTDbWYW83Sa93w0GA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H37T98AV
Subject: Re: [Buildroot] [PATCH 0/2] support/testing: fix TestInitSystemNone
 for non-login shell
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jul 2024 14:50:38 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Brandon Maier (2):
>       support/testing/infra/emulator.py: support init=/bin/sh
>       support/testing: fix TestInitSystemNone for non-login shell

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
