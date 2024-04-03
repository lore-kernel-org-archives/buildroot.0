Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840ADCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D51B41824;
	Wed,  3 Apr 2024 19:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 022ZSBPhwY2y; Wed,  3 Apr 2024 19:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D884184B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D884184B;
	Wed,  3 Apr 2024 19:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11D511BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A17041841
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tJiK9f5oIwb for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A20541824
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A20541824
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A20541824
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:57:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0CDE0004;
 Wed,  3 Apr 2024 19:57:49 +0000 (UTC)
Date: Wed, 3 Apr 2024 21:57:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240403215749.1b809b2f@windsurf>
In-Reply-To: <20230911061940.2392419-1-james.hilliard1@gmail.com>
References: <20230911061940.2392419-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712174269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHSWwCV771SuZmXaq1e57yz/yM7iJRu4cn2GtryNCt0=;
 b=cQwTE9s7S1DfL8oi9iEjtJPHPyHeRmVm9Gx9TMbtoWUInsNr4d/WORYqOuWgtU9Is5bdUb
 bV0aWG9KL82gDvdxQErByNRKVv8nhSt+xJp9YKO6wMNfUeoH/EIguzClfoSDnF62MX0po8
 szpvUlDWSPWmxAO6CEICqkImUGOLDhdz/1LOgElbF7hrEelpkGohyA0nU+c9vm2vA+DrGY
 4VUupDniNHikRRjJjx+48djmetvgeBkukdlgRcS5Glo5d4E8hpDQcoUt7wktNznJSLMoFh
 2p5gNvBHETD385PoG1IvBCWSPU6A4JOzUyIb5wX+EBel6VgDZVXu4A7E7btsSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cQwTE9s7
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: add support for
 u-boot-initial-env install
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

On Mon, 11 Sep 2023 00:19:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This file is needed by libubootenv for fw_printenv/fw_setenv and
> library API's to function when the environment is empty.
> 
> See details:
> https://github.com/sbabic/libubootenv/tree/v0.3.4#replacement-old-tools
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  boot/uboot/Config.in | 7 +++++++
>  boot/uboot/uboot.mk  | 8 ++++++++
>  2 files changed, 15 insertions(+)

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
