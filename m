Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB9FD5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319C960F1A;
	Mon, 28 Oct 2024 22:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORlaQcuJIpwP; Mon, 28 Oct 2024 22:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3932560F14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3932560F14;
	Mon, 28 Oct 2024 22:16:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A8C54EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6889C40633
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsVB1vOYKJMb for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36F6F40630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36F6F40630
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36F6F40630
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:15:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEF82FF803;
 Mon, 28 Oct 2024 22:15:56 +0000 (UTC)
Date: Mon, 28 Oct 2024 23:15:55 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Message-ID: <20241028231555.47e73fd0@windsurf>
In-Reply-To: <20241028221045.3354144-1-james.hilliard1@gmail.com>
References: <20241028221045.3354144-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730153757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eggpaxzNIhU71riNYfwuNc7OcurQbXyyoGfGGeZtCwc=;
 b=ccdi+kdfjNhgP7jUUgEkO23PCqh/YqA+MnCqdCO4OOySNlIoOtoUfkKXViFk5nZnDNp4i8
 Crc3352ocyGnmpOKFVUqyaMC4soSnBU3zmy1c+pmN/vMupdBvPiUOs1/FHCtLSbIr1HsBL
 QKtX0t7w95fdyerYo1xkGM7fLo536KloKxwD5nfZxlMboeEyBpBQ2v9n+h3cP2NYY2i3fR
 eZ3H62Vqr1WiF/UzFT9WDVgTaRQzWAkIfur7H5GvQMRSeqt9U372a65AI6wB6VelHwA9iP
 Np5U2WToRZm0wJFoJXHhGGx20b1DOS+HOyAQv8KJyzldfHAs5+FeVsmyTC14Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ccdi+kdf
Subject: Re: [Buildroot] [PATCH 1/2] package/go/go-cf: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Oct 2024 16:10:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is a fork of go needed for cloudflared to work properly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This is really nuts/crazy. Are we going to have to package a different
Go compiler for each and every project?

(Note: your commit message needs a lot more explanation on how it
integrates in Buildroot, what happens if one uses both normal Go and
go-cf, whether they will conflict, or not, etc.).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
