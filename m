Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66167C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2549640822;
	Fri, 12 Jul 2024 14:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWKBhi-25DJm; Fri, 12 Jul 2024 14:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB4C408CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB4C408CF;
	Fri, 12 Jul 2024 14:53:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 901CD1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DD6C60631
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnXe-oED-ghR for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F73E6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F73E6061E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F73E6061E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:53:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EE5D20002;
 Fri, 12 Jul 2024 14:53:04 +0000 (UTC)
Date: Fri, 12 Jul 2024 16:53:03 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240712165303.21ae8d44@windsurf>
In-Reply-To: <20240705073527.3254389-1-dario.binacchi@amarulasolutions.com>
References: <20240705073527.3254389-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720795984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2IoX/Zk4sz9WcxMJwSgk4G7FDr5BCtGS7rhreXZFqU=;
 b=BcqZnlMxevifzfHHRzFb+yA6G61X1Ofre0SViILXsr3HyXEeuEbpk4+kU7slgnhz6RVKgd
 5ipNglAYMmebyXOmrwV0YWaQ+TqQxn99PL6N0mrZJFzSVu37hEOmU472/Go6XFANHucelp
 fRmpJqwn9p2o9XzXaSndhDv4dJs5JDhwAnq7nfDp9SySTQNNomD/xusbatHhCgI9GR4Yp/
 K94ES/2yjhWP7DSc1D10Tundw0JLHQzxfp8XmmIKTAtBTjsD2tJlvcs6vc87oTe9Woc1lH
 j0lspUVh0Y6ylvys/Zi9OpoTEcTeIk1H9JeyUCiVTzfYxkzMm0XNzM85UAQRTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BcqZnlMx
Subject: Re: [Buildroot] [PATCH 1/1] package/oatpp: update the patches to be
 applied with fuzz 0
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
Cc: Alessandro Partesotti <a.partesotti@gmail.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  5 Jul 2024 09:35:27 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, oatpp fails to build with output:
> 
>     Applying 0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch using patch:
>     patching file src/oatpp/core/base/Environment.hpp
>     Hunk #1 FAILED at 29.
>     1 out of 1 hunk FAILED -- saving rejects to file src/oatpp/core/base/Environment.hpp.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...re-base-Environment.hpp-include-cstdarg.patch | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

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
