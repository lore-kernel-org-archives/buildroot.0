Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C67CFA450
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C51E607E3;
	Wed, 23 Oct 2024 16:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUUc9bVOthSc; Wed, 23 Oct 2024 16:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9990460771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9990460771;
	Wed, 23 Oct 2024 16:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D94127ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4BD40319
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G98r5m0Eyppu for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBDA740316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBDA740316
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBDA740316
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:49:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38B591BF207;
 Wed, 23 Oct 2024 16:49:57 +0000 (UTC)
Date: Wed, 23 Oct 2024 18:49:55 +0200
To: Andrey Nechypurenko <andreynech@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
Message-ID: <20241023184955.4c8cfd43@windsurf>
In-Reply-To: <CAOiXNkA9JLTKRte0_uKPeujF0CNZ7WahxF7pvnvVUsTNoGQvmg@mail.gmail.com>
References: <CAOiXNkA9JLTKRte0_uKPeujF0CNZ7WahxF7pvnvVUsTNoGQvmg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729702197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErM4mgoii5HV6cJBvm7rqMdghy07at90kZekU/DCUF0=;
 b=KMtLMov9iTZsrLC1CQz1rnmZ1UVE5FNn8Y73flujzCz8jVfE7ut3LIu4nEP9p2zAGycRUW
 APIZ8C+N8C/cr90FrbGbcSiHZxufq30ZNyG6WMN/aH0nvNLkjZG8slrohesKnNrrF1XCKM
 uPYKzuXKhtsTqzIjfBwIk1r0frpwHEsIVzf3l6hwzUjNMvNMPkoL/J6hyopswgnWuWCYib
 D6jEp1WQCB4rkZW6sWzzXyALseoevhtMMeRwj1f4GWQ0PAm9KlCGj7JPr1FbSbDeoTGYum
 U6Hj4huyYkj2caCLAYbvD0OOlb1uY9QjkWnMKt4qeFdspnEsTfbjXkqrLV9pGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KMtLMov9
Subject: Re: [Buildroot] HOST_MFGTOOLS dependency in BR v2024.08.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andrey,

On Wed, 23 Oct 2024 16:45:44 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> I am currently building images for the iMX8 board (BR2_aarch64) and also
> want to make the HOST_MFGTOOLS package. However, this package depends on
> BR2_arm (not BR2_aarch64) and could not be selected in menuconfig.
> 
> I am wondering if this dependency is correct or am I missing something?

This dependency was added when the package was introduced, back in
2016. Back then, i.MX8 did not exist, so mfgtools only made sense for
ARM.

If it now supports ARM64 NXP platforms, feel free to send a patch to
change this dependency, after having checked on your side that it works
for you.

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
