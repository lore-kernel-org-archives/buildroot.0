Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D719C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E26F605BD;
	Wed,  8 May 2024 16:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTxkvURH1btx; Wed,  8 May 2024 16:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35F8060C2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F8060C2E;
	Wed,  8 May 2024 16:37:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B22271BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F27340147
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fm7EbOlcVOeh for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 660B340125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 660B340125
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 660B340125
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:37:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CEEBC60002;
 Wed,  8 May 2024 16:37:10 +0000 (UTC)
Date: Wed, 8 May 2024 18:37:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240508183710.3ddc798f@windsurf>
In-Reply-To: <20240507172832.3546905-1-james.hilliard1@gmail.com>
References: <20240507172832.3546905-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715186231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BCr3kn2ulcGeXKFqca3fp3mXpYwtcaagRyRp/nKDI0=;
 b=p25+ap7K8i68XPMpJ7U2ASv9qfbggIe+kNYCESo8k6GWK1rdpXZ8f5VN+LUfKROIPD7k84
 6ZjmwnYLZ6ClNoUsHZgDHo3T4rcRfy+wq4pMYnjXlzFR086tv5PsrPbA1OLH60ChLFVDMI
 rdxuXV5pF5ERGA+QdGQxFXsxgCEaSpGcR6UDjVubWxnhCMOwsrDxK26kyg7Y8et3jc95Xt
 cRej18j44qM4I/9SlLtRXZ+R/6KOcnDLSzdoqw2R3CHb+JhLeAvZu+fACEUdHOrN+kK5+X
 sp5PHykfaENUcy1iBsU4GyvGGfGZUsIvIIIyG2ZCTgF7w0hYXZNHafpqrnFBnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p25+ap7K
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: drop
 CONTRIBUTING.md from license files
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

On Tue,  7 May 2024 11:28:32 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This is irrelevant as of 402ad9fe5407 (package/network-manager: bump
> to version 1.22.10).
> 
> Details: https://lore.kernel.org/all/ZgXKrtfSjahxswtP@landeda/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/network-manager/network-manager.hash | 1 -
>  package/network-manager/network-manager.mk   | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

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
