Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37218CFC534
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D772740C01;
	Sat, 22 Nov 2025 12:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJZ_FXAz1nZv; Sat, 22 Nov 2025 12:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0508D40C0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0508D40C0D;
	Sat, 22 Nov 2025 12:48:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18DF2158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F31D360BE7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBDsTqjrR-eo for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:48:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E877B60BE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E877B60BE2
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E877B60BE2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:48:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C56E81A1C9C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:48:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89352606C5;
 Sat, 22 Nov 2025 12:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2DF6510371DFF; Sat, 22 Nov 2025 13:48:46 +0100 (CET)
Date: Sat, 22 Nov 2025 13:48:44 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20251122134844.3f75931b@windsurf>
In-Reply-To: <20251121163453.499648-1-yann.morin.1998@free.fr>
References: <20251121163453.499648-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763815726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZwnT7HWMVLXDM+FFunTVZHf/MtlPSWDeVbsYanGNtAs=;
 b=EL5ifD5voxdqurE9Y3894AECusWKxjgyzPeoLm4CxnHW/X0HOHOBKUVKLR7xpgo90cv5pw
 pugfECV1sYZBdabKpSloLHRgAI2Oq4+1e9HH6sMh2G7ikG98LfiHFIJ7sd2CYINz0u6+YP
 onFEGrLKsuToRiVVn9cny9QqKedIwl5EgLLS/Cj9o8+IWgEdjwTr/Pk8TzuOWi8OYn8fT+
 DxIhgSbSA0MhPHAbwgVCknXclynpetV62aDJORvNKSaN+HaV/SaoJBa4crRdUGKnskxYFW
 UghhQ6iguqEo+sKsEyJ4OAX70N2Kbblvdx6lBIf2xWQKGnsWPKiWZvn/f3t5qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EL5ifD5v
Subject: Re: [Buildroot] [PATCH v2] support/scripts/check-merged: use
 getopts instead of getopt
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

Hello Yann,

On Fri, 21 Nov 2025 17:34:53 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 1187c34d88e1 (support/scripts: move merged-usr errors message
> into check-merged-usr.sh) introduced the use of getopt to parse its
> options; doing so allowed to use long option (with two leading dashes),
> which is more descriptive than the usual one-character options.
> 
> However, getopt is part of util-linux; it is not a shell built-in.
> util-linux is not a prerequisite of Buildroot, so we may end up running
> on a system where it is missing.
> 
> We could add host-util-linux as a dependency when the system does not
> provide getopt, but that's not very nice; even though host-skeleton does
> not need to check for merged-bin for now, it does not need getopt, and
> thus we could add host-util-linux (which depends on host-skeleton) as a
> dependency of skeleton-custom. But that will not be tenable over the
> long run, especially if/when we do a merged-bin in host dir.
> 
> Requiring that util-linux be installed system-wide is not nice either;
> it's an additional requirement on the host.
> 
> We can do like we do in the oter scripts, though: use the shell built-in
> getopts. Its usage is slightly different, and does not support long
> options. As it's just for use in an intenral script, we can live with
> the less descriptive options, though.
> 
> Switch to using getopts, it removes the need for a new host dependency.
> 
> Fixes: 1187c34d88e16191753bfd0c3b4cd2f914813f31
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks a lot for the patch! I didn't review it as it was already
applied, but anyway the changes look fairly mechanism and
straightforward. Thanks for the quick reaction!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
