Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA41C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 21:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C46CC40B38;
	Tue, 20 Aug 2024 21:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3Xyj7n-B05j; Tue, 20 Aug 2024 21:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 820BA40B46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 820BA40B46;
	Tue, 20 Aug 2024 21:22:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84F761BF3B8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F048401D8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 21:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vv0jSjUOmPfn for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 21:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45987401D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45987401D3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45987401D3
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 21:22:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92658FF802;
 Tue, 20 Aug 2024 21:22:27 +0000 (UTC)
Date: Tue, 20 Aug 2024 23:22:26 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240820232226.00c650a9@windsurf>
In-Reply-To: <20240820064531.3680998-1-yann.morin.1998@free.fr>
References: <20240820064531.3680998-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724188947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfrLG3vzGLjsNSA4okowo2QbJWeowrEl9NurZSlJ1/Q=;
 b=dDZ9ZDkM+KL8rn04D5bLQxXeF8CS+QWc48ZnVbDMf1dl0xNOpLPscznj0P/+r8H6priA0p
 cF0xPiI/kIcpjwcy4fmD95e7MbMyzb+qfyazP7x08wcF2GP6mem3F+f17kyhcXVnWdU0vP
 UxtbjVtpv4LKhabR/Ucds3UWJd45Q17LfRLHsdB4+Xn9B2Kzu0Gwz1QwtVoVvlhPE1x3Kv
 ktd3v1ZjwoSoFWaDtMjIivLl/1bg6eKRhKY0YNxT7EIIt6iueEpG26GsZ8nTXa71VtWsni
 67so+E45XflSyHU6haOA0gHZQqGruSeP2i3JIAXOfRLT9b7cap3JQbBe+CKgJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDZ9ZDkM
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: fix fallout of
 dropping toolchain CSV
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Aug 2024 08:45:31 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 2f260084d577 (utils/genrandconfig: remove support for toolchain
> CSV) kept the --no-toolchains-csv option, but in the rework forgot to
> keep it as a bool, while argparse default is to expect a string.
> 
> Rather than re-introduce the action="store_true" which implies the
> argument is a bool, explicit make it a bool.
> 
> Fixes: 2f260084d5771728f3340ff6a86a23391133a635
> 
> Reported-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/genrandconfig | 2 +-
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
