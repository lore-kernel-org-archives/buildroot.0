Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DADC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 366FB42C2E;
	Fri, 10 May 2024 21:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5y01e6KCFsPa; Fri, 10 May 2024 21:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5A5B42DAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A5B42DAF;
	Fri, 10 May 2024 21:29:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49D821BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4334D6137E
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1XmaorFZ0u6 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:28:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 311E760786
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311E760786
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 311E760786
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:28:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23E44FF804;
 Fri, 10 May 2024 21:28:57 +0000 (UTC)
Date: Fri, 10 May 2024 23:28:56 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240510232856.328f807f@windsurf>
In-Reply-To: <20240325115114.140028-1-buildroot@bubu1.eu>
References: <20240325115114.140028-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6GR+JCF1MsDggmp0jV9KZF2HlveLc92pERXjMJ907U=;
 b=Kns9uBAKJk3nZspuKd0ERY3RpB2Veb+iuJw8IPHEt8YesQc1xVz/c7+x7J5dc0U1TmSrhN
 4OhsnOLEwKVBQo5rusMhpoIzEZcOC9K/C9qAcL0jfjR8UQuEZhMMnBSOuCjVjmqLcWB6l7
 bawOL/1Qt1QffrKxW4Tprt96wl1qS9IMrxpVZy2X8G+JbkcJnmlcKDtULnbsIBhZhGcdui
 tG4t4S2hh7+xFu+KH9T9zlWBdAdGetLLeN+rGoY5gNWItlo0vaiiKUggCDcLlNWIPy3Rtr
 nAXijVI7A4yPeanF7h9NGcKBd4BwfSQIhlRiHqp9VosTiH6H7JRgNMD2XGih3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kns9uBAK
Subject: Re: [Buildroot] [PATCH] package/python-hatchling: bump to version
 1.22.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Mar 2024 12:51:14 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> https://hatch.pypa.io/dev/history/hatchling/#hatchling-v1.22.4
> 
> Remove now optional editables dependency [1].
> 
> [1] https://github.com/pypa/hatch/pull/1255
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-hatchling/python-hatchling.hash | 4 ++--
>  package/python-hatchling/python-hatchling.mk   | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

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
