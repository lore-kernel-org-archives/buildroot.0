Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D47CA0FE6
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 08:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 932C66100D;
	Fri,  1 Sep 2023 08:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 932C66100D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xmqo_T6g3AQL; Fri,  1 Sep 2023 08:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED37760FDF;
	Fri,  1 Sep 2023 08:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED37760FDF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51CC11BF2B6
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AFB081FA4
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 08:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AFB081FA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yCdUHs7YqJP for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 08:10:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE59D83A8A
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 08:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE59D83A8A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86A911C000B;
 Fri,  1 Sep 2023 08:10:42 +0000 (UTC)
Date: Fri, 1 Sep 2023 10:10:40 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230901101040.29144065@windsurf>
In-Reply-To: <f308772c-310e-622a-4e6a-11624f4c0ded@mind.be>
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-5-dalang@gmx.at>
 <da055153-9ec6-ade2-46ee-49c2d33ebf36@mind.be>
 <142d199c-ed4d-4574-ba83-ecbff73817ad@gmx.at>
 <f308772c-310e-622a-4e6a-11624f4c0ded@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693555843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+mh25fM+/R3Te4CPG57rjQ6WeX4qUZaKUA+oSyR3WNA=;
 b=EACwFw4Lewd4/p14LSHYgJhyLZnmBqVwBJLVdGr+852+j6DALdBFRdCn0+NToxZqcU4EcF
 SkZqBQPLO1ewP2RiCl/lDfoFnwHoCMOu1RjJpgphGXoULR+NAVMx2QYNXWY6XSmZ3cPLvh
 k7sN/jN3QFuF80awvuSd2Nv4TpTRfRr1E6lmCjfWi0NjjiN5tKKVY+n5+Ktj1MsBdyd4ns
 iwd9GOfxAj4alVLX3yppgXPGl26/PPGFRFIKD6Lbq2xV6rvg7N6+0wvs8s52QVsiJ8UCbA
 buNSn5w57nqyasAhIWWwdwuhzV9t70i84yqzC1pppqTIi+Aei4Diw2p6rfdmTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EACwFw4L
Subject: Re: [Buildroot] [PATCH v3 5/8] support/scripts/nvd_api_v2.py: new
 helper class
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
Cc: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 1 Sep 2023 09:03:45 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   I think on a.b.o is running the script inside the buildroot/base container, 
> which has 3.9.2. Thomas?

No, the script is not run in the buildroot/base container. The machine
on which I run the script has Python 3.8.10.

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
