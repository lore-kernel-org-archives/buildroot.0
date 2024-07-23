Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F028C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEC840A11;
	Tue, 23 Jul 2024 08:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id md_S8xHQSF0G; Tue, 23 Jul 2024 08:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C837140A2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C837140A2F;
	Tue, 23 Jul 2024 08:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3E2E1BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF04840A43
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoYwzyQYmAYo for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:55:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9AC4240ACD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AC4240ACD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AC4240ACD
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:55:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DCED4000F;
 Tue, 23 Jul 2024 08:55:06 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:55:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723105505.6e23353a@windsurf>
In-Reply-To: <20240723080250.342850-1-fontaine.fabrice@gmail.com>
References: <20240723080250.342850-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721724906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnEMlbodmCgS42dXO4vLKNKcTkcqrtf7fPtmWcP2yNw=;
 b=JbbQ95wuiJl354vaq1f0UAN0R4CCoxFhOWO0wyoEYM4GqTiEyMm2XkRE1DO10C4HZ4fimK
 iRZjnK4NWidjoqxXyDLhLtk8Wdo5FyOYs34tPMlpiaBxvKgSvTXW8EQbBP2B6mf/zlZAtT
 pk1ORC2V5V0rEvQb9PFViPrwcDOtImy61XM5+lEj1uD6jkGQaEZXXOta6BaFHEtvo/sQAW
 28aMXsD6ypiFKctJ6q7HFD8xGg7nuGFSZCNFtacr1Yc20ynNk9Gfz39auzhqBXb17359LK
 2Bt2qdR9Yvb6+WSiRJrw4LjBIfHQGdyI9XAfj/wii14TjR+CZND5GPa/RUgEoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JbbQ95wu
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: renumber patch
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

On Tue, 23 Jul 2024 10:02:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 94e072849e6c86a8c75402b1e600642673ebfb57 forgot to renumber
> latest patch
> 
> Fixes: 94e072849e6c86a8c75402b1e600642673ebfb57
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...04-Enhance-setting-write-gs-base-with-cmake-variable-30.patch} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/fluent-bit/{0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch => 0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch} (100%)

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
