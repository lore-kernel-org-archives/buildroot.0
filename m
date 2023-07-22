Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27036C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D61B58144D;
	Sat, 22 Jul 2023 21:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D61B58144D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTO1POy4Vhfn; Sat, 22 Jul 2023 21:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 754B0838B3;
	Sat, 22 Jul 2023 21:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 754B0838B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 897781BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FF9560E59
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF9560E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogobtOWAYpl3 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:24:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F417060E7D
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F417060E7D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B33720002;
 Sat, 22 Jul 2023 21:24:34 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:24:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722232432.69f57c07@windsurf>
In-Reply-To: <20230721220837.3289702-1-bernd@kuhls.net>
References: <20230721220837.3289702-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/wDLeie+tLRQ7qyZscMhWDA+emNgH4nQkgiu9uVByI=;
 b=mjw098FvsTtmZBoDJQQIDi3OWU17AqAT/34ymenvHeOgdVODUGvqJz6FLh07vLqmBFATW+
 EOjdq6Ue5g7sO05l4yqKY2AXwGjDyoBGdhdx65RYRRHn+T7Y3bGLk+ZS5fpGuVW860Y8+Z
 5a7faUXULdSVcB/7U1cicqAfNQb8JCYvho763Mg0sNzH++58P5poVJjyBEblRvY6Myn8bl
 GAzk3/ds/stXLcyh6c06LJKopMjcfewtviTcxi+G32LMcvElh4vdqTtUiDLIVclAP8uPEy
 DluobPIxsdhLCdiPxhz3tZ3zXtwOAFhKxUdrksnLkc3Cl1SvhEEfHLhk72Zgrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mjw098Fv
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: enable threads on
 static builds
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

On Sat, 22 Jul 2023 00:08:37 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Revert upstream commit as proposed on the upstream bugtracker.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b8e/b8efae5bf6ac3b51e8443951ef1dd88824af3f2b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0006-Revert-Fix-static-builds.patch       | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/libopenssl/0006-Revert-Fix-static-builds.patch

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
