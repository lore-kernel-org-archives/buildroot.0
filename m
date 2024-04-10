Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7316ECD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB30605CA;
	Wed, 10 Apr 2024 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvMzME8jBn4g; Wed, 10 Apr 2024 21:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EBDA60E8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EBDA60E8D;
	Wed, 10 Apr 2024 21:10:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB1C1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51C3E60E8D
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQzlaiDIsdYr for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04698605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04698605CA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04698605CA
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:10:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1D2B40002;
 Wed, 10 Apr 2024 21:10:01 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:10:01 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240410231001.5be130c7@windsurf>
In-Reply-To: <20240330095933.601540-1-fontaine.fabrice@gmail.com>
References: <20240330095933.601540-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712783402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTygwv2xTHwoqU5hgGuuQMhwh5m4HZB+X8SQ5h878hs=;
 b=LmE3+GdbNDbJPkp8L1K9JBjAItAFmxHld8chLpjRjw+cOPqJF4xaf/uAsBVF5oKWfIS4Ma
 JEmFOQbDwdIMb3XZ1N6Yz53J+bmA7UHQTpQwSITVVicJwM2w8B6M1ATJEwAipA1zexpUpy
 w8/Innd8fK1Yhi7dEfDsE9JQpeoGoRuEOwNRW+R7fOVTMen9GVbtZEuJ1WpG3S63MHYHon
 N7fO/Vc9Wnj/ViU/A91DU9ULFweJFJ60V1B/sH3WKtVrxYc+5PnFxROo01bjpU0QFZeWha
 WeMxmCH5veq7jjMwEyqKO4KxQkvorwE7H15S42v/O0Fdk2duZ+ernyu2LtZklQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LmE3+Gdb
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: bump to version 4.3
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

On Sat, 30 Mar 2024 10:59:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://lore.kernel.org/all/20240215183844.00003735@linux.intel.com
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 +++++++++++++++++++
>  package/mdadm/mdadm.hash                      |  2 +-
>  package/mdadm/mdadm.mk                        |  2 +-
>  3 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch

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
