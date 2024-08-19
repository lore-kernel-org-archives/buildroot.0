Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEB4C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 11:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7DB880FA6;
	Mon, 19 Aug 2024 11:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UL4M8-KvbRSx; Mon, 19 Aug 2024 11:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 649D280F92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649D280F92;
	Mon, 19 Aug 2024 11:10:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3E2E1BF3DF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2B7740223
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 11:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qcj81Q0FSbz for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 11:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4778940147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4778940147
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4778940147
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 11:10:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC500240003;
 Mon, 19 Aug 2024 11:10:20 +0000 (UTC)
Date: Mon, 19 Aug 2024 13:10:19 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240819131019.7943c4a0@windsurf>
In-Reply-To: <ZsGD4xW/yBXU6AKG@waldemar-brodkorb.de>
References: <ZsGD4xW/yBXU6AKG@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724065820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcZn0tqV6b5cBNlPq4nlK7EADbaVA9J+iFKruriVSxU=;
 b=W8US7j6CVFohGlEsJmh859z/4nQNdjWir0GPJ9YhkwUXsWk24EW2/fFMIuA/yLakBVZG1P
 +BLZgf/pcP9iC7/yBSWJ3g6Y4IL2NKJhskVhdbbEiZX3sPkoaZ0aRBrb+xVvkvv2YW2dus
 fy+H9/BlEi9vLEiRl/rmadzDws4emiCSvUdxiypC7YJ8izZc4hCsfAIJABvIUv/PJbaspT
 3wFZT9bqOjS9VZG09B8jX5HHjXOgXDNndSEaj43qOxIWsBfxQ1IylTgMDDlukNJ2/jC/hD
 UW5NFyWINGUNUAUGqI7Lfu13gf3DcWbTLdtBJ85Pt0LLGy9N191hrob4bXsRVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W8US7j6C
Subject: Re: [Buildroot] [PATCH] package/libnftnl: update to 1.2.7
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

On Sun, 18 Aug 2024 07:17:23 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> There is no changelog available, but you can browse the git log
> here:
> https://git.netfilter.org/libnftnl/log/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libnftnl/libnftnl.hash | 4 ++--
>  package/libnftnl/libnftnl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
