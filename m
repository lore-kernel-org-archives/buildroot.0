Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DCCC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB2EE811AB;
	Mon, 29 Jul 2024 21:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHucokexxeFi; Mon, 29 Jul 2024 21:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D46F5811CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46F5811CC;
	Mon, 29 Jul 2024 21:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18C931BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13F0C6085C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmkHALFZ2xrD for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 446D060760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446D060760
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 446D060760
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:13:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D41860004;
 Mon, 29 Jul 2024 21:13:00 +0000 (UTC)
Date: Mon, 29 Jul 2024 23:12:54 +0200
To: Torben Voltmer <mail@t-voltmer.net>
Message-ID: <20240729231254.1e6123fc@windsurf>
In-Reply-To: <20240729193242.1409148-2-mail@t-voltmer.net>
References: <20240729101119.22f92091@windsurf>
 <20240729193242.1409148-2-mail@t-voltmer.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722287581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQLTqSbiRy2Rvh/KyzUYoFmOy8Tkx7Ltn/DJqUe2pKU=;
 b=IET5pvmuKfTzTOaKzxFTinQPYX/mErbMRqM1Q0vGHlBA5QeCtPAVhiEVG52PfidI6Ws+0S
 YidS8touM6caD/XGcO96XyXU4JyPHHakRydMeYxY+5SYsEo3Nx+0k3k/cAoJuBEQsm2AIH
 +hDQ8tUBB8usli76swZUmEgkMMGTYJLr83KFLyzKZPc/glZgXyCGhfaTkEQbQWzGZiCAUi
 iziA/NOljaaR3oXyI2uf66cqqqt/38aAJ5VWvUqU+MVNG54NJsQFDPQnL9XuJQNDNUn8Mk
 JqwbTK32E4QNBo1e3ygP/Wh59+zA8Oz0o+jnThcIsjdImWWcgNSYOWcHQcMIRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IET5pvmu
Subject: Re: [Buildroot] [PATCH v2 1/1] package/espflash: add udev dependency
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

Hello,

Thanks for the new iteration, which I have applied. Just one minor nit,
see below!

On Mon, 29 Jul 2024 21:32:43 +0200
Torben Voltmer <mail@t-voltmer.net> wrote:

> Adding the dependency on udev, since espflash links libudev
> (via the libudev-sys crate).
> 
> Fixes: http://autobuild.buildroot.net/results/c61b6ed4b6fb4d18d503ac37add200f5e6ae3706
> 
> ---
> Changes v1 -> v2:
>   - Added missing dependency in espflash.mk
>   - Added missing depends on in Config.in
>   - Verified that the updated patch fixes at least one autobuild failure
> 
> Signed-off-by: Torben Voltmer <mail@t-voltmer.net>

The Signed-off-by: line should be *before* the --- sign. Indeed, when
git applies a patch, it drops from the commit log everything which is
after the --- sign. This is why your changelog (Changes v1 -> v2) is at
the right: we don't want this changelog to be part of the final commit
message. However, we do want the Signed-off-by to be part of the commit
message, so it should be before the --- sign.

I fixed that up when applying. Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
