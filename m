Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE95C36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8CBF405C0;
	Mon, 24 Mar 2025 20:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5KPQHzJmNyh; Mon, 24 Mar 2025 20:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02FC1405BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FC1405BF;
	Mon, 24 Mar 2025 20:45:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1730C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D26A8405BF
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kK-DmLlBu-A for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDC77404C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDC77404C0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDC77404C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:45:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DDFBD5FFB4;
 Mon, 24 Mar 2025 21:45:43 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56670])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Mar 2025 21:45:43 +0100
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 21:45:43 +0100
From: Julien Olivain <ju.o@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250324091653.234226-1-arnout@mind.be>
References: <20250324091653.234226-1-arnout@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <efdea393cb39a8cb43132a911c5bdc5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742849145;
 bh=oJ8AGVSlR99oQWCXz5+onSYbLAVBhuRqwffrZiXV/5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ELR4bYnXRagDTWUSJVJmBUER98VS4m0FJtv7cn3Dvm3qxTjfBGLvjh2RTvFPGuO76
 PwoMZLrAjK21vJ6LLpoJmamCrwExAkRrSbOzhaccpbgnPt/bH8+3o3Q0QtHTZ4l73v
 BUC/NZFJiYKW0u9tyQabCokaz1/t17qts8QV8zPwVffcmQ5PAdc49NBvNV0IzB8IAL
 tdlLYBEqTAlpGXyTVtFAHMMnbi+VRMzWgG39TK4lMbY7Y1OTWeR87DaOkpNZ3dPWns
 gJCjw/rlRgWkjXAeRANXw+jJCmL9ZC1idh/BPYUkwe9jhazU3qvX27kt8IZ3/fcNWW
 kcPZ+v26RMxhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ELR4bYnX
Subject: Re: [Buildroot] [PATCH 1/2]
 docs/website/images/openhomefoundation-logo.png: crop for better layout
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/03/2025 10:16, Arnout Vandecappelle via buildroot wrote:
> The Open Home Foundation logo is in a white area that is too large for
> how we display it on the sponsors page. As a result, it ends up at the
> bottom of the logo area and it looks very unbalanced.
> 
> Crop the logo to a tigher area. Since it is going to end up being
> scaled, it's difficult to predict what the best size it is, but 
> cropping
> at a height of 300 pixels gives a visually pleasing layout at at least
> some resolutions.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Series applied to master, thanks.

For some reason, this patch 1/2 did not reached patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/?series=449692&state=*

Since it reached the mailing list, I got it from there.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
