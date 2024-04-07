Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCBECD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 07:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0D560833;
	Sun,  7 Apr 2024 07:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uc-hXvcca1U; Sun,  7 Apr 2024 07:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E96460859
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E96460859;
	Sun,  7 Apr 2024 07:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4F691BF340
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF65D40184
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8aRgc36rmhk for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 07:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA816403B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA816403B3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA816403B3
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 07:59:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91EFCE0002;
 Sun,  7 Apr 2024 07:59:30 +0000 (UTC)
Date: Sun, 7 Apr 2024 09:59:29 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240407095929.1f2e3c13@windsurf>
In-Reply-To: <20240406230336.9906-1-ju.o@free.fr>
References: <20240406230336.9906-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712476770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDWPEFSc2lsoXS6VsCJyyxenwvHR4azis7zcDu3PS+s=;
 b=NbnVxOCr3EMmpTo0QYaX8LP8v+S7aw1uThZO4RMbuyV1wiJ5XbwlF8KxoXEc92qYbXuLAu
 tFgEi3oNEOQFrQ2kWDMP4TD4VcK/C10m8XRFoIsjKnVYKdqjKvBCeY64oSJ0RYCjzXu56F
 ddxfrFgkXVXVmAAQb1/DXjwPK6sSpXEIv9SMvqs/gxEqUZKy/mw5q6nkrAWTtBDIx6Fx1K
 1XG71dVVPt0K0fm69BiBn8efIjaQZWANl/UeumI6Y5QfDvI3Q4jbLch345B9IQuBTjd79a
 XgUJ9XTVUO0aPobADTTZZT9qE9PZU1/kieGEMkPcYlZD4/vDuc1jaQBKhZB5UQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NbnVxOCr
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.27
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

On Sun,  7 Apr 2024 01:03:36 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v0.3.26, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.27
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/openblas/openblas.hash | 6 +++---
>  package/openblas/openblas.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
