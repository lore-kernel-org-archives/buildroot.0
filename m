Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DAFC3DA42
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C8940259;
	Tue,  9 Jul 2024 21:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7-J2MbkEDns; Tue,  9 Jul 2024 21:33:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D2340267
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D2340267;
	Tue,  9 Jul 2024 21:33:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 183231BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04E2A40259
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqDDih_PFvKa for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC85740310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC85740310
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC85740310
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:33:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CDA960005;
 Tue,  9 Jul 2024 21:33:47 +0000 (UTC)
Date: Tue, 9 Jul 2024 23:33:46 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240709233346.34a67035@windsurf>
In-Reply-To: <20240701193924.799937-1-ju.o@free.fr>
References: <20240701193924.799937-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720560827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/yqP5M4p4hyJzplBGcesSuJhupGL7nUMXtsslYpDTI=;
 b=XyDXDsZzC00wHxyeD+0NFggINGL0PrkN2IjIajtPiC48FNIKvbL9eCsXu4wagEfvcz9a4k
 twh5VxUvCNbuU4TSvSHcXQBHU4Ldrg9rCAMs+BuFQPVfTiB9FeAKsfu8TNPy48YuMYvDSP
 pr8ZXJWaz1OM8eCNhFfDU6/hAbICW/eyWHb6TvvM/1JvsFrYDqiC9HLu4F02jTsbEAr2N+
 0C0X+uDaOzsU4PY809SzGR8KRKgbFBUfBAhHgNZPXUvBooG4Bg+5QDPyo4iAPRzGKnqpZE
 7G8QhPqeXrWyY8yDz69QC1eXvIz+8g0dVqgWZuzmUD4O7IXDaHc9AzCG9M/VLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XyDXDsZz
Subject: Re: [Buildroot] [PATCH 1/1] package/xfsprogs: update Kconfig
 package homepage URL
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

On Mon,  1 Jul 2024 21:39:24 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The old xfs homepage URL [1] seems defunct at the time of this commit.
> The http URL redirects to https, the certificate expired on
> 2024-01-26. If the certificate expiration date is ignored, the site
> shows a "502 Bad Gateway" error.
> 
> The package README [2] advertise the homepage as [3].
> 
> This commit updates the URL to the new one.
> 
> [1] http://xfs.org
> [2] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/README?h=v6.4.0#n12
> [3] https://xfs.wiki.kernel.org
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/xfsprogs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
