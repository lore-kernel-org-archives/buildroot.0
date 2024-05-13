Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB83C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 713CA60642;
	Mon, 13 May 2024 19:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPSWGmE24dHn; Mon, 13 May 2024 19:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA9F606C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CA9F606C4;
	Mon, 13 May 2024 19:59:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 066421BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E739B607C4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywwKG-hmWsHL for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2D9C60642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2D9C60642
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2D9C60642
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:59:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33EE920002;
 Mon, 13 May 2024 19:59:26 +0000 (UTC)
Date: Mon, 13 May 2024 21:59:25 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240513215925.54d80174@windsurf>
In-Reply-To: <ZkHMhbT9Nq1M32sV@waldemar-brodkorb.de>
References: <ZkHMhbT9Nq1M32sV@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715630366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rH0XDKBtD4MbbA97qxlMF29KmgPMZ0t8eOMUrhMdTTo=;
 b=bJVaAtsTWMMdQvSAY/T0h1ccoNMR+Fycm561FvdbnutAiB+/HAWt9B4BAnlOY6qMu2QYKA
 aMnLTNiTwSaXgFDoTRpsUGuPCvzWSgwcbOq2FdkpCadQwGkhHABisKBIqbkNUavrLIG+93
 wjRJ+9iOlJUGEWjiac44aWfch6SxtMvabY3hzybLGF0okZiLNEelXfuZsxWNSSWcBQmFWZ
 +DSeErMdvUeLwlSOmDogYzq/+7GBtHqPcR1c3l0FmW4EWU3gVKdWMgjhB16+CLsAqcQxRN
 HsqE0+nRPkpwt3DvmBYy9dLZgs1gPFKMPBuS1ybDyO7JxWmHR4DHgRX66iNyuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bJVaAtsT
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix compile with gcc 14.x
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

On Mon, 13 May 2024 10:17:09 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add missing header file.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/e022040c15e1b1aebc539a0ca0e00b5a1888ccfe
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-futimesat-add-missing-header.patch   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/uclibc/0001-futimesat-add-missing-header.patch

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
