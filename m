Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A647C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCAE4023B;
	Fri, 12 Jul 2024 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUfOeMaYnOeh; Fri, 12 Jul 2024 21:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C898E40657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C898E40657;
	Fri, 12 Jul 2024 21:07:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8490B1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7185C400B9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Tb4xpD_u8tv for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:07:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18D0D400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D0D400A6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18D0D400A6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:07:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02AF91BF203;
 Fri, 12 Jul 2024 21:07:39 +0000 (UTC)
Date: Fri, 12 Jul 2024 23:07:38 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240712230738.7e056d3a@windsurf>
In-Reply-To: <20240522091608.3659847-5-aperez@igalia.com>
References: <20240522091608.3659847-1-aperez@igalia.com>
 <20240522091608.3659847-5-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720818460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abfKEt0L+gyhF4W2Rjk8W0nYZO9mewK7LtuM9Bah0Zc=;
 b=FJYxVgzOo5vFNKCoDrFGJ2Kgl+5JctfavUTYWX1iSi+G2WGm9OyIf2PVL4GnlG8ULlGZbl
 UVxy04RKuSKU+qt6f2BlLFtI1+Ec3KmpOQhica2UeneX195R4S75TgJIaiquXKObMNdtnA
 pbXXwtwqdLJKVRE9a/Z/dCZOzodJxxUVRujiQSrs4ZFxmKLVvqaeAN8PC66G+zDVgpkx56
 3HtI4T1UqqhTx/dJZ6uhFStO/QYlyJsvVHDzDF71Spfs/GpAJtJoXG2vgVkVJJkieBASER
 31QN2uVQnhD/DBWuxoyeMN86IQ1qpRj/n+umU1a2xRZmRUTrWHFv+6CUnT/PlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FJYxVgzO
Subject: Re: [Buildroot] [PATCH 4/4] package/wpewebkit: use libavif if
 enabled
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 May 2024 12:16:07 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Make wpewebkit pick a value for the USE_AVIF option depending
> on BR2_PACKAGE_LIBAVIF.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

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
