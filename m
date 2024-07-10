Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0812CC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC78A60885;
	Wed, 10 Jul 2024 21:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWKtKQI0-blA; Wed, 10 Jul 2024 21:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A4E60BC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A4E60BC4;
	Wed, 10 Jul 2024 21:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706B61BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E00360BC4
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts1P8cbKapSP for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E1DC60885
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E1DC60885
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E1DC60885
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:16:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38BAB40002;
 Wed, 10 Jul 2024 21:16:47 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:16:46 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240710231646.3299b8f2@windsurf>
In-Reply-To: <7e24df50-3710-4700-a644-901528a1a939@mind.be>
References: <AS1P250MB060825741529F073326AA014A9C82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <7e24df50-3710-4700-a644-901528a1a939@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720646207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1biIBoTnToVUwApWlI5oxG5xKSLrJul3mI1/Y/KjCHM=;
 b=Xkm74a5RbP4gqrECrHwBQutaZ0uzb7kIDLhN15mZIbQ36uX/t59e+PXLmYrcPC6g7yKFLu
 w/XjoMEhiBo8s+/aMS8/YP4FgCztf+Ay8DMQhIXS6GuqT7a7uRSTh+awhFwgGCt8bOyZGH
 8hRlu4jl1IFZBSZ8PMTIQVVWOcXuppjoa8xJhgWHGS9sfbNxmZiOaQY6i1znue2DV8IQ78
 bMtKnILq30cEEQaGsai6RehDo3PTAdXHy8X2lcTkAWVQ58OChQLLdgHVjfF4IELFhhGH/6
 49fqvZQKGfDyEwuFy2BqnfQZmkSPfIjbtSun4kJwbD1dkoUZAemNCPGjDp062A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xkm74a5R
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 0.11.0
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jun 2024 18:03:57 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> > -LIBZENOH_C_VERSION = 0.11.0.3
> > +LIBZENOH_C_VERSION = 0.11.0  
> 
>   Does 0.11.0 come _after_ 0.11.0.3? I.e. should the final .3 be interpreted as 
> something like a -rc3? This is very counter-intuitive... And it breaks 
> release-monitoring.org...

Yes, 0.11.0 came *after* 0.11.0.3.
See https://github.com/eclipse-zenoh/zenoh-c/releases, which clearly
documents the following releases (in reverse chronological order):

 0.11.0
 0.11.0.3
 0.11.0.2
 v0.10.1-rc
 v0.10.0-rc

No way one can write an algorithm that figures out which release is
newer than the other :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
