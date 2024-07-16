Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1537C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6566240BFD;
	Tue, 16 Jul 2024 12:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAhj0gMBBfX8; Tue, 16 Jul 2024 12:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11CB40C0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11CB40C0D;
	Tue, 16 Jul 2024 12:43:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E58B21BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3D1B6074F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0R_YTMxyM0Bw for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0F45600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0F45600B8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0F45600B8
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0009B20011;
 Tue, 16 Jul 2024 12:43:19 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:43:19 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240716144319.4d9fd99f@windsurf>
In-Reply-To: <20240716085747.490549-1-troglobit@gmail.com>
References: <20240716085747.490549-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721133800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KI6vm/44Ze7aXvBIKqnGzWmTbWi1wCT8mFQlBC4BhcM=;
 b=M/9q7WqzulNmW5rmXtQvn3VjmlTXUgFr2DX8lCUzx0xxvjQ9go8fTd+T7eNyu7rQUNXi7G
 yPwCk6pLF7bS0KsIUiBXgJGq8X3qI0YMkEOjU6/M4Hai9B65DgwxTs5C97onYSvJrmm6el
 IC9duAyuT1CQQG8s8LaREb7NYX3yUncuXsJicsRRBsgqla3JnJMEmHJqI0rAhGKESA4Xvh
 Je//oO6wal0+lwMtF30jPoZao8D8hfzZzvje6tjq1IZkiFAIP3PUhtDB5g4YzBCBHLGFwH
 TDqZc2WBwtIy9bVqLxocwmr1fn8fK+DbgxddMZ8iIznjrC4OqHJHrV7Jr9tzrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M/9q7Wqz
Subject: Re: [Buildroot] [PATCH 0/2] package/syslogd: bump to v2.6.0
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

On Tue, 16 Jul 2024 10:57:45 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Joachim Wiberg (2):
>   package/sysklogd: bump to v2.6.0
>   package/sysklogd: new setting

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
