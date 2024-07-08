Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0067C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DFA260A95;
	Mon,  8 Jul 2024 21:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvaX3RWEEIdb; Mon,  8 Jul 2024 21:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B0F360ACD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B0F360ACD;
	Mon,  8 Jul 2024 21:01:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E80E11BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4FAA403F4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17MuDUBEdGMJ for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93D71403E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D71403E5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D71403E5
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:01:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60ADB1BF204;
 Mon,  8 Jul 2024 21:01:42 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:01:41 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240708230141.5c9c0c42@windsurf>
In-Reply-To: <20240706102322.3127779-1-bernd@kuhls.net>
References: <20240706102322.3127779-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720472502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05asHGGRkZayaH0FSvQmWqcRyHYMFprRr/1f7Wsw86Q=;
 b=WJ5vpiZw/OUNZlX2TEv3wKgiWkQWOKwfoVjoUpD4zqTSpR6dyfJj70/81zJLK/LrT3B/pK
 4wqzIMW++RdD1Wvk5f9nqdEcXEXhYMZbtkVw1lF33FpuCF2FSO/3VK5TNBVjzgwkLzTdWh
 dx+TrtZ+GQmxRdb/bL72OjuLlZOff8WEqssLas94euM8xGzCt8oyeY3cFo9ZCaC7OTtNTa
 LxeKSUG6vkmFSDln2W9OaQtjYVT8cgAd8TfMr5JFoYq1IPXjPKQQfpwKIf7ZuFnF/dwAnY
 4AtSAjkfnl1F/yMFtu77fCOagEHOMOmm1MDaVMkJxs5lLZcR/4NbY2nYch8+KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WJ5vpiZw
Subject: Re: [Buildroot] [PATCH 1/3] package/libdisplay-info: bump version
 to 0.2.0
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

On Sat,  6 Jul 2024 12:23:20 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> Use xz tarball and its sha256 hash, both provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...0001-displayid.c-Include-sys-types.h.patch | 36 -------------------
>  package/libdisplay-info/libdisplay-info.hash  |  3 +-
>  package/libdisplay-info/libdisplay-info.mk    |  6 ++--
>  3 files changed, 5 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libdisplay-info/0001-displayid.c-Include-sys-types.h.patch

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
