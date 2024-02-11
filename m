Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F5C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FB1384E37;
	Sun, 11 Feb 2024 21:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ONB5Huao-mR; Sun, 11 Feb 2024 21:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A895284EE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A895284EE6;
	Sun, 11 Feb 2024 21:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10E661BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F189C4012F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r60q0gYxOvYg for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 807C14011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807C14011D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 807C14011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:48:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B92FBC0003;
 Sun, 11 Feb 2024 21:48:43 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:48:43 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240211224843.36f35b11@windsurf>
In-Reply-To: <20240209193743.1204013-1-ju.o@free.fr>
References: <20240209193743.1204013-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707688123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmRxmiMIVoirJWcAbx6zNmDPZkyFso8tU3lvWQ+6ps4=;
 b=URBpVmu10PjdPD1WRACRNjvUCFueC6Uh2/H8p+HjIVsWOEgnjzkVnmAuS5r2r2PRV4Wt/C
 9iRWU4gtIrqnc99NCxRF20j9xGexipH3yzKpwp0thak7CPZDD0AP+k634/GhAswZzH52/o
 4E6oaYzxJftfP8lhoP1th5TrawHRwuzLkBJd1kbZ8L8AzO1g+vGXA6V15qU52NBXFzW2lw
 xP/avkBlUiXEudROUAJ+BQnib3Z3jtnRFA5r1NSzKPTx6zZKOfJciJ9wNJgXs66/nZ5spe
 HXwyAqA6tZjacinM5VB3zFXIfp+e/ZrX+KsVl0VXzL4bL6WS/DsW/DQGrxojkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=URBpVmu1
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add iozone runtime test
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

On Fri,  9 Feb 2024 20:37:43 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_iozone.py | 22 ++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 support/testing/tests/package/test_iozone.py

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
