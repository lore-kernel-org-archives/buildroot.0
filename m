Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F10C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 06:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF945845A3;
	Fri, 12 Jul 2024 06:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YSuM9K99ZJ4; Fri, 12 Jul 2024 06:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E37ED845A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37ED845A8;
	Fri, 12 Jul 2024 06:43:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD5811BF591
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 06:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6CF04045F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 06:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1nThU3EFSVf for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 06:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43CD5400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43CD5400FE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43CD5400FE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:43:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 141731BF206;
 Fri, 12 Jul 2024 06:43:32 +0000 (UTC)
Date: Fri, 12 Jul 2024 08:43:21 +0200
To: yegorslists@googlemail.com
Message-ID: <20240712084321.25f457f7@windsurf>
In-Reply-To: <20240617093626.38573-1-yegorslists@googlemail.com>
References: <20240617093626.38573-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720766615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfI0ABT+V/273JmXWWznuAU2jzI1gRH0XzoQNJR3q9E=;
 b=jPf9l/PSsgkZm4KQhSPSb4Z9+vipCdSjhvZyZhipSo8AMgg+0o40d5gD8qwK3Y+lf3kUbO
 frbYfCS6o6EaMhdn/RtRy/rZaJf37XjopWieDQsgFyqiGQmpPix/S9cjZmX9JEm8u95GSy
 grFXSHEU9aKLR0CRM+WS/OWnN3GsBSTbqrl+uLX+q38s6zlixCw8rUAIeWz9GEDIXx8uUb
 4RR1BWfjPHOpGrI3fOUu+NyNbyWUrg956jO7Ii2bQGhhDoyNH8USslJfpk1B2cpwSxiQyM
 FyNJuDlFcXxqxaNnoSQt+IERxb/Ma7YXDKv3Xqmx0TSXsqrPH0PslpNHVZxXRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jPf9l/PS
Subject: Re: [Buildroot] [PATCH v2] package/ncftp: fix GCC 14.x related
 build errors
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jun 2024 11:36:26 +0200
yegorslists@googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Patches were taken from Gentoo:
> 
> https://bugs.gentoo.org/921487
> https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
> 
> Fixes:
> http://autobuild.buildroot.net/results/058578eae885ce6e206c25b5a24aa11b625adf88/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
>     - add Upstream tags to the patches (Yann E. MORIN)

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
