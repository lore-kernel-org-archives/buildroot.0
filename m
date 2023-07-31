Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5997EC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DFA94013B;
	Mon, 31 Jul 2023 21:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFA94013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVhBBVJ6sRm4; Mon, 31 Jul 2023 21:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4421D40BAF;
	Mon, 31 Jul 2023 21:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4421D40BAF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EA381BF25B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28CB860F0A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CB860F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xCMvJZSfw2UB for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:46:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFACC60EE3
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFACC60EE3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FDF7FF803;
 Mon, 31 Jul 2023 21:46:17 +0000 (UTC)
Date: Mon, 31 Jul 2023 23:46:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230731234616.2fb8056e@windsurf>
In-Reply-To: <20230731211332.2696959-1-bernd@kuhls.net>
References: <20230731211332.2696959-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690839978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2R5HxiSxVaF5aUws9AOnvlwNDcInNtncn2YEFwpV3U=;
 b=RmHMr8HddZFWNFIte07tkPG/EakrTTy6sTDYyuG8KednVtMHla+FLsVZIArMnB1UdGaXB3
 2ye0JRRNe+CQIkVt5Pa48JVUJlCsYZjNbojPAiKNbPNB+s0lh7/CdXGRgGSuHphIUrTUUQ
 rORpqrDmJlRX/C7YfoV1Zmqj8fN9i87M/blHVhtvdKXzz2aMzYNx6GE65bTK/fBZ7PNK/I
 ILOddz+Jk66qJmOidQvtSrkKfoqkW+q1tkhuv/0sE7sc/dg6HOovV4bN9VeSx0ES+zZDCM
 l6ZUpopaHhclZfwE6oxwR8e0B/aV4aP3yWkOuVSalqMMRLVfqZ5TWO7va9xJTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RmHMr8Hd
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: needs __sync_*_8
 intrisics
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Mon, 31 Jul 2023 23:13:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/992/99235aa2aca1afe031a088baebbd46057fe75fcd/
> 
> /home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:253:
>  undefined reference to `__sync_lock_test_and_set_8'
> /home/autobuild/autobuild/instance-15/output-1/build/tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a/src/atomic.h:81:
>  undefined reference to `__sync_fetch_and_add_8'

Same question as usual: since when are they needed? I.e, which
Buildroot commit caused this breakage?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
