Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E41CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAFA460663;
	Tue,  3 Sep 2024 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0l2qDfe4Ii6; Tue,  3 Sep 2024 20:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9FC60717
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9FC60717;
	Tue,  3 Sep 2024 20:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6A561BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B367C40382
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSDoUuR9QB87 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 451B940198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 451B940198
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 451B940198
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:24:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97630C0002;
 Tue,  3 Sep 2024 20:24:16 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:24:15 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240903222415.7b59ee6d@windsurf>
In-Reply-To: <20240831175600.3952894-1-festevam@gmail.com>
References: <20240831175600.3952894-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725395056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OV/YfblCTTKYMrt3TW4nzJ4xBDbi89KK00LH2RCDlPk=;
 b=oy5wIEf23acRYwD1+qaxgQGUv14kn4JSeGrtyyORTU+tkgc1dW26B8bSZkYOwzrbUQLmRE
 CzJo1wtrl7xjIM4z4J0GCwPRpidrpWl0QOk06BEsLJ3WChoGNPh1Vq/PcNTcSkkzHiIil8
 mfsv2FJKsk/7SFOVZGPUktTiqrAp6mBPbaUedympMhroc6tGePBNV8Ac07OwbBizfOJw3S
 Xd/tWpAeUwWHuVd/DeWTHbD4/uaoQ6dHPTw7lidX7BU2YnDUWGV9G9gl4r94IUqmi2pRIZ
 RInbWt5OSccslc28DSU2bOmX1STBPtNt9MQCzEf4ZgGLethnaaoEpoWQk8BabA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oy5wIEf2
Subject: Re: [Buildroot] [PATCH] configs/imx6sx-sdb: bump U-Boot and kernel
 versions
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

On Sat, 31 Aug 2024 14:56:00 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump U-Boot to version 2024.07 and kernel to 6.6.46.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6sx-sdb_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

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
