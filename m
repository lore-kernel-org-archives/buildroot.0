Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E391FC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B216760764;
	Mon,  6 May 2024 20:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRXxBPVieSGa; Mon,  6 May 2024 20:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF53E608E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF53E608E3;
	Mon,  6 May 2024 20:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4234C1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A2FF405EE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiaoEoH8gE8j for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:39:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 004EB405C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004EB405C1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 004EB405C1
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:39:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B4BBFF804;
 Mon,  6 May 2024 20:39:14 +0000 (UTC)
Date: Mon, 6 May 2024 22:39:13 +0200
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <20240506223913.31a83b67@windsurf>
In-Reply-To: <20240502045518.4875-1-dm.chestnykh@gmail.com>
References: <20240502045518.4875-1-dm.chestnykh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715027954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISgyZyu94tFU56yHr0VcJ3K4YnE56rrktV65sC+0qe8=;
 b=P0v5bVx1e5zHSyIRJ8hdy1nMkAa30B5XcT+o/M0flfiXTewpYVI1u2I0AiNdA5HZ++LeD0
 UOm07xGZF98c3OAf9yfTtkIJdm45kBeSZyocv91a8gXJj2C1/lcGYOrjwA04nl3lDWCiP0
 3UICtz29ptiZ4ZSNxT+v0qw2YZx9XP4LSeccWbfh3GQR/T8nt506EIWz4m3FI7oou2M0fx
 O248mMJeZAaOX7MSuoBCZfq/Pe0TvHBxFpoBQbBL/kBv+FhcqyrbmwV8FK5DssKUAEO0wZ
 7LtuuJe9b60YRn/ZWt5g8BrXvj0QxeiAPz3XIr0dNLkpRqU8H+9/Q6iAbZ7eIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P0v5bVx1
Subject: Re: [Buildroot] [PATCH v2 1/3] package/uclibc: Bump to 1.0.48.
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

On Thu,  2 May 2024 07:55:16 +0300
Dmitry Chestnykh <dm.chestnykh@gmail.com> wrote:

> - In 1.0.48 release uClibc-ng has provided the fix
> for SPARC related to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
> - The hash for COPYING.LIB was changed because '^L' (0x0C) characters
> were removed from COPYING.LIB in uClibc-ng repo.
> 
> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---
> v1 -> v2:
> - Describe the change of COPYING.LIB hash.
> ---
>  package/uclibc/uclibc.hash | 6 +++---
>  package/uclibc/uclibc.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, with minor commit log fixups. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
