Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB47C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 065E6810B7;
	Mon, 22 Jul 2024 20:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgBLoWyA8dwX; Mon, 22 Jul 2024 20:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E1F810C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E1F810C5;
	Mon, 22 Jul 2024 20:21:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20F331BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05C3A810BE
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JI8sxSejHW39 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02045810A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02045810A8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02045810A8
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:21:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 297DD1C0004;
 Mon, 22 Jul 2024 20:21:16 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:21:15 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240722222115.7a3be754@windsurf>
In-Reply-To: <20240421113120.82861-1-ju.o@free.fr>
References: <20240421113120.82861-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721679676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+/81nOAZQBiLr9UlwKfkGZcs2P533RlQs9imOebMdw=;
 b=Ti5I9pfRqZ5KhFPEGP0Zl53rpkTpzdlE0kT6aYslHD71Xct4BVjA2uu7EwHXhW7pDf5A5J
 M1hzCS2nRBEL0ECVoSgXa1ucu1wbCJt7QFCXMAN/vSO02Sj+gAG5/tsOli28naL371/n79
 T7P4Zz5n93XrI4X79mqH1iEED2v65nfe748cOIP4zhozxGYKcYq74aBMKvi746m4hd4XGQ
 3v81J1XC66SjMngDqGJ6muYJErFIwHlLNLHgATnr68Hp14FkSiZ5c31WEvRrrO5oT7xYZ7
 QbgizO27VVVhcaAX74ayucTIk3XfDDfhccJMzJwJgU6V9SUuWC4p6rIVhy4Hnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ti5I9pfR
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add 4th runtime test
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

On Sun, 21 Apr 2024 13:31:20 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                |  1 +
>  support/testing/tests/package/test_4th.py | 55 +++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 support/testing/tests/package/test_4th.py

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
