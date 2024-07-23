Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0074EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C154940108;
	Tue, 23 Jul 2024 08:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoARR_87pbCO; Tue, 23 Jul 2024 08:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97209402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97209402BC;
	Tue, 23 Jul 2024 08:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 965EB1BF215
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83769402BC
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdBmgR7v7Kpj for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5555840108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5555840108
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5555840108
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:59:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDF806000E;
 Tue, 23 Jul 2024 08:59:35 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:59:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240723105935.4d1c783d@windsurf>
In-Reply-To: <20240109060128.3974794-1-james.hilliard1@gmail.com>
References: <20240109060128.3974794-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721725176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CT1rPeFu8M3LzJF7wTq2uOrz0qvRn7rxDmoxhS9+WJk=;
 b=Qy7zpcS87qpFwa1NbzAQn5Qjwe7xb1CGHJUblVX7vS997pbP2ZCYQRkL8PV1fYiy6f3Mj9
 5wAR9HoeLx+hTpGw9UOmTbik+yEpR5UADxoEIvEd8tR2Xt7wdRBpUdm+MUVwhdOdyn7glS
 o2K86pEhluOUByphO84jTnOLBg5+9dIcswquoWmkbprgQL83AIIXDZsUtKL1qhqF5mSDJm
 JM4hY65socAmhECNrHXrvT7s2be0MHH3GbYPXdb2MFDfZ+CISTpVucs38Poy1XTehnMdI4
 C0p94NhqSQymM129wMg00kkeh9fxkJai2vkOezkj6Oth7BaBwq0zdFGIqse4dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qy7zpcS8
Subject: Re: [Buildroot] [PATCH 1/6] package/python-autocommand: new package
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

On Mon,  8 Jan 2024 23:01:23 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks, applied, with one change, see below.

> +PYTHON_AUTOCOMMAND_LICENSE = LGPL-3.0

License is LGPL-3.0+

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
