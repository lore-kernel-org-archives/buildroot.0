Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62F0C35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D004400C7;
	Sun, 15 Sep 2024 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txfwagrozNnP; Sun, 15 Sep 2024 10:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35275400EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35275400EF;
	Sun, 15 Sep 2024 10:02:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A32101BF947
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5403E400C1
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzEaDAUPLTXP for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:02:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C95240504
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C95240504
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C95240504
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:02:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A086FFF803;
 Sun, 15 Sep 2024 10:02:15 +0000 (UTC)
Date: Sun, 15 Sep 2024 12:02:13 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915120213.408e53bc@windsurf>
In-Reply-To: <20240915083852.1578142-1-james.hilliard1@gmail.com>
References: <20240915083852.1578142-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726394536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4PLN/zLJMNjea6CRphbsdIyS8bOPlUNkG//3S2yOj4=;
 b=TzqHYBcTN0LCWp+iN3+EXdGCyCGzgS9oDHKhMd/qGTQECfiu5IRJqXndLsfcp8KFdnoQqR
 84LhWqyRBuL9QHRafVZTITVVXd3n17VRvY+HcDW1k2xmKbWdC/R//lFVywheeOyZFxrm8Y
 xUI1Hv5mCIzoPJKkKY8vDsFLGYQwZhr/F+BPUdsDWq1fk5j2t1IZ/xGE775lTMjtxTGSwq
 TpXQ7pZCmhcPL6uMr4Y95wS0Aew93Tl/N+DgwTVgyd+wQUO7eTCwBfJgGVifyUoa4IaFTZ
 torBWG587hPYopm+WMV3I1lhLIjxsX/NBAE23BNBhnLVY9KAUi+b1mh5kbEgbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TzqHYBcT
Subject: Re: [Buildroot] [PATCH 1/1] package/python-influxdb: bump to
 version 5.3.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 02:38:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-influxdb/python-influxdb.hash | 4 ++--
>  package/python-influxdb/python-influxdb.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

All patches from this one to package/python-jaraco-text applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
