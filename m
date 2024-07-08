Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC02C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F27E360AB7;
	Mon,  8 Jul 2024 20:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSiWHOdzxC4p; Mon,  8 Jul 2024 20:22:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E71CA60B4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E71CA60B4B;
	Mon,  8 Jul 2024 20:22:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 885261BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AB3F60A70
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2FErJ6y8LcG for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DB3B60A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB3B60A56
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DB3B60A56
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C041BF208;
 Mon,  8 Jul 2024 20:22:18 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:27 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222127.200b0a40@windsurf>
In-Reply-To: <20240707061024.3850928-1-dario.binacchi@amarulasolutions.com>
References: <20240707061024.3850928-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16BFnFBQUcPADCh8BlUVCdGXIYAT3C425dhJ//zGDBM=;
 b=iNyBkmTHmJ8S+qNmPpIbzQaniiBcDD2w9UAL+M+x/UIasvsQbt6OPd6hgTC4J4EOIZ9L3X
 t3cHifD1x98eBczdVN4l9r/h4DTP7r8f7pU/Y1hUdJis5K9Rav8DJ/lulUisHiOK34IhHx
 WLOk+hEfS2EFbNZZC7GHball0XD2RhjAqoRJuGFg0DIWiGPvxVSXZlpBARNiJXA2r6d6pI
 BlyKmWflQ+UQtSfUh1jseflS6dx3KRNBZvRyODKj2YSrdjFm+kvl/qubPkpa2OwTm3+EKG
 XgsBD8Q4TlXBiej4dCuTHzk7zcsBdLV9g0RiFLIandti/UoRh4YwWHD/C41KCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iNyBkmTH
Subject: Re: [Buildroot] [PATCH 1/1] package/nushell: update the patches to
 be applied with fuzz 0
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

On Sun,  7 Jul 2024 08:10:24 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, nushell fails to build with output:
> 
>     Applying 0001-uucore-add-support-for-sparc64.patch using patch:
>     patching file VENDOR/uucore/src/lib/features/fs.rs
>     Hunk #1 FAILED at 121.
>     Hunk #2 FAILED at 137.
>     2 out of 2 hunks FAILED -- saving rejects to file VENDOR/uucore/src/lib/features/fs.rs.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../nushell/0001-uucore-add-support-for-sparc64.patch  | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

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
