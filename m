Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899C2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C644022A;
	Fri, 12 Jul 2024 15:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLViyg1e3I9h; Fri, 12 Jul 2024 15:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24BFC410FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24BFC410FB;
	Fri, 12 Jul 2024 15:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF2281BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A916861382
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Fz-XIbXLnwz for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5134E6137D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5134E6137D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5134E6137D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:06:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B4231BF205;
 Fri, 12 Jul 2024 15:06:06 +0000 (UTC)
Date: Fri, 12 Jul 2024 17:06:05 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240712170605.07d80e4a@windsurf>
In-Reply-To: <20240701165616.1632323-1-james.hilliard1@gmail.com>
References: <20240701165616.1632323-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720796766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YO7SRZNLs610GgfEOCfoWjPLsPJMJFeb0tHTiLIqOPo=;
 b=l5CLD9tDFE7/vagDqsNyOrPyFxGAWZ1MEWgvhcOyIB9SicAHuWnCeYTCz1JFubG9f7OjKX
 y1Hg22wdDxwYUFI4OUcXZIV63L8FEnOI89wI5QChv+TabLX0pnY4aktheT/PSeDORQQIrS
 YAJ+/kUF840a5KnlUbQtrKu5VN3Q/Sa+cdUJRo8TyEkxztWMl5tuScE/BULlyva4EyW8VC
 NJzv/UKZ/DT4sbc7I5lEZ/dwuuC8cq5VNlfpEMZm+Z9n7Ib7TzeEzMBjCmhnwhlybdR/kj
 VEZWjzZHbuS9DO8yNiUd+rOsy8bzXyB4TqzASKsNTCs8W1o8YtXMypCaXNuYmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l5CLD9tD
Subject: Re: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 440c0059a21f06b5577499a80b55482cb99d6d1c
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

On Mon,  1 Jul 2024 10:56:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer relevant patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...c-Fix-TLS-offsets-computation-for-s3.patch | 43 -------------------
>  package/prelink-cross/prelink-cross.hash      |  2 +-
>  package/prelink-cross/prelink-cross.mk        |  2 +-
>  3 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch

Thanks for the patch. It was missing an update in .checkpackageignore,
as you removed a patch that was missing an Upstream tag, so it removes
a warning. I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
