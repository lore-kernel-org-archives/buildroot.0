Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB055C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911EF408ED;
	Sat, 13 Jul 2024 14:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWAyitiq7oJX; Sat, 13 Jul 2024 14:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA86408EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA86408EF;
	Sat, 13 Jul 2024 14:27:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541F51BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4031C408EF
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCdthHCIi2qT for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21F6F408ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21F6F408ED
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21F6F408ED
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:27:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AD231C0002;
 Sat, 13 Jul 2024 14:27:14 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:27:13 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240713162713.23744ae9@windsurf>
In-Reply-To: <ZpJJ3vTjho2fmfAh@waldemar-brodkorb.de>
References: <ZpJJ3vTjho2fmfAh@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nx+PsPwwTOVWYgP5MRJNxdGmuAyixPutMvRwQeDiWk4=;
 b=YF4p9mxR6ix4TJxm0SmE1foCFEkerK1bOjs+pG509TiL65P0zwkqXLXpmOP23/o4YFUbys
 eu+KYlCfPMnKnjBjaIjW8vtid4+gEJYqw7qhGgdJz326B1qVdI8EvL4RAy5CKGY1yUaEGQ
 HPGO09mycZu7ZYNIct9HWk9PcaZ1qg2meGzczf8JKha4iNuyfhr7t6rWrJrVt4HMHwwwm/
 ElnLprseeGLjkQxQIm3i/m9KCxboL4XDj9XlqytkZbKMnpi0WaFwTzkzeKAu+8iVotQlmU
 b9m59ADDwbniNK1Au8PNSr08t9+6MhXQYXFvU8fAcp3OXTb8FraOxJVFGf+QmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YF4p9mxR
Subject: Re: [Buildroot] [PATCH] docs: add time64 status of uClibc-ng
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

On Sat, 13 Jul 2024 11:33:18 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  docs/manual/faq-troubleshooting.adoc | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

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
