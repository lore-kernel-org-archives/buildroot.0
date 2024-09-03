Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAF9CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D6156058D;
	Tue,  3 Sep 2024 19:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-vqsRwxcQHY; Tue,  3 Sep 2024 19:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6031060631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6031060631;
	Tue,  3 Sep 2024 19:48:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17E181BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054E160645
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stw4hzOJV8lo for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0CAD6058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CAD6058D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0CAD6058D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:48:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F098FF802;
 Tue,  3 Sep 2024 19:48:54 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:48:53 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240903214853.1704c313@windsurf>
In-Reply-To: <20240902180029.2651596-1-geomatsi@gmail.com>
References: <20240902180029.2651596-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725392934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yBayz/8WaTphMOUczGRaINDesMqN/lTo4C62O3UnAQ=;
 b=E9pLzB7H2yfAJDOqkGHKEItk2ls82ggxM6hLno9FP+/hRx6rPPl8QFmsBqbkZwkcOvNRnA
 rEBpUnhbiOpB0O3yQ1ghDFf7oLNKz+kQ7Vab9S6Wc4IFbi7HlxbKkB8ng8pTeWH4WncE7Q
 IE2khs4alQRLfcvw41+djjz003CtF1od2PauyHbJZQ/voS3nuAHm7eRV8IQm1myeDRQOmD
 hEQX0Xv4HgsA+L2X4nyZnmJwoGt1FdSJxkTlKnnFacXVqchRK55sxdwFV5B92AByT1opRm
 Y9bv10/B8zHo1bF/41Docri4C8eNchc9UezTcDbVztzMZHDYiKgb9Fhc+gXjbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E9pLzB7H
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: macsec offload
 needs headers >= v5.7
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

On Mon,  2 Sep 2024 21:00:20 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Hardware offload in Linux macsec driver is enabled in compile time if
> libnl version is >= v3.6. However this is not enough for successful
> build since enum 'macsec_offload' has been added to Linux headers only
> since Linux >= v5.7.
> 
> Add upstream commit that extends compile time condition for the
> enablement of the macsec hardware offload adding Linux headers version
> check.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---

Applied to master, thanks a lot for having worked on this improved
solution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
