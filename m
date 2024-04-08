Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71D9C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B564940543;
	Mon,  8 Apr 2024 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-pcLmcG3e1O; Mon,  8 Apr 2024 21:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BC2405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1BC2405F0;
	Mon,  8 Apr 2024 21:40:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EAE461BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7404407D9
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_KKhWyKAnp0 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90DC9407CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90DC9407CE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90DC9407CE
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:40:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F17C20002;
 Mon,  8 Apr 2024 21:40:29 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:40:28 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240408234028.27f28acc@windsurf>
In-Reply-To: <20240404175552.672410-1-festevam@gmail.com>
References: <20240404175552.672410-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712612429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqfQe+42pKMNqibs0hNnBBSVJElJjROwnbC4PFRoylI=;
 b=S7zKntcfLk6igIhsxsww/Aj+6z+tpV7b+ddk4ZcD+MoTOzBBjnsYSNg9wO1C+mu+hwErnP
 UBw8ZC79VzwCi/QmIABxf0YG6Q2XqZW0aXziCKl/aUtYehK9TPLrUQ4t5ZE2dVtXBIPHnb
 Nij+CK7Rous0dHQRh34Pv+It6LVXN3Kaykimggpeujoj7oHaN1WVhTQr/WeB1uemb7CE1C
 RvpcQKn7TXrLPc4x5BHNiUlIxIDFbO5v6636vfOL1ZjYaoNWrM5xIUj5hsa+kzYGdtvQ97
 O9tlS0GypBZ7G57YBbprkpjrjkNGcTvPKjt6JV0lfP8O8iLOswVHxmk7unvaJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S7zKntcf
Subject: Re: [Buildroot] [PATCH] package/crucible: update LICENSE information
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

On Thu,  4 Apr 2024 14:55:52 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Since crucible commit 7fe0bb96da65 ("move to BSD style license") the
> license has been changed to BSD-3.
> 
> Change the license type and hash accordingly.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/14dfa0a47be54929c527c12fe9b95f34c1d8c7f5/
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/crucible/crucible.hash | 2 +-
>  package/crucible/crucible.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks Fabio for the fix. The commit log was slightly not complete
enough, as it didn't say which Buildroot commit is being fixed by this
change. It is in fact your bump in commit
be3f95ed14559f8a9739a12cff604add622b0416 which forgot to update the
license. Having this information in the commit message is important as
it will allow us to understand to which of our stable branches this fix
should be backported.

So I've applied after adding this information in the commit message.
Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
