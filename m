Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFADC54E68
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 16:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9968460EB7;
	Thu, 21 Mar 2024 16:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuWeYYHNqIiQ; Thu, 21 Mar 2024 16:05:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B290E60EA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B290E60EA8;
	Thu, 21 Mar 2024 16:05:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F34C21BF2A7
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFBB160EA8
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jg8rTJl_aPqt for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 16:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCA1060E9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA1060E9A
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCA1060E9A
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 16:05:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6B0FFCCF8A
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 16:05:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A7D1C0010;
 Thu, 21 Mar 2024 16:05:23 +0000 (UTC)
Date: Thu, 21 Mar 2024 17:05:16 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240321170516.7ea0f9ff@booty>
In-Reply-To: <20240318140258.1083375-2-neal.frager@amd.com>
References: <20240318140258.1083375-1-neal.frager@amd.com>
 <20240318140258.1083375-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711037124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juMCt3abfIjW/oTJXusLvbCJRGCC6ZVgcRnzz0vyb+c=;
 b=GhmDk6ep5JRA8yTZTPRgioJBnN/I476JzJsjDMcdI8R37sxAZNpptP3k5mJQgxNyMp18qJ
 9JmFhfiDPBZbxuYWV6cQpxYMheugkgd9FePMxHfOpoiXKZDd9Vd7BlIsIPt+7ZuqFwBUO6
 8gRKAsWi0xTMc6a0IvMWC3CZetH7N3vqWJ+vWtYojwIAOsbT+wSd69c56pwhq2kZbOS3PT
 fPkufXgoEiQHHFqTdVYTBdr2nKJlY4FoCEvZ81IzM4kyJH+/quCgUMEAeJh5RP5DIiDKkM
 lKNveuBFoQtDVZRmvYFY+IzEAkWQJPIEUPlOwhM9sH+W2N5fUBZ5DfViBpuYiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GhmDk6ep
Subject: Re: [Buildroot] [PATCH v1 2/4] configs/zynq_zc706_defconfig: bump
 to 6.1.70
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Mar 2024 14:02:56 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynq_zc706_defconfig to Linux kernel 6.1.70.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
