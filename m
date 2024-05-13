Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F919C25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B330840859;
	Mon, 13 May 2024 20:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTApa2ccMSwE; Mon, 13 May 2024 20:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 270074085E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270074085E;
	Mon, 13 May 2024 20:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 894E31BF947
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73C304012A
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDtPvPM4wneU for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42322400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42322400B8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42322400B8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:35:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8873640003;
 Mon, 13 May 2024 20:35:46 +0000 (UTC)
Date: Mon, 13 May 2024 22:35:45 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240513223545.6b43108d@windsurf>
In-Reply-To: <ZkDsA9NqjGG5GwdB@waldemar-brodkorb.de>
References: <ZkDsA9NqjGG5GwdB@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715632546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHHCpnz06hyYxjtK+j+6WvCV9hr8YXtbTUtyNpDPLio=;
 b=crsDACZkbz1pIuHGkQTAc+OtaM2E3YRh/jE25ojoaHSnhQG3rgbUvmVccZ9AKrq/MMzxvq
 P9g8P3Kr8KO+se7yDUY8s6/oXTPl4/TCjl9775LAhXR4aQ4+m09nU7cKwfeAicGg6Cj/On
 2KrPQzxBhmgh1KU2NlFSE5i7WkbrZweK/swyjCG3wJPppzq9k13z6VLEZ9XVlpA1yanZm2
 VTy225XniC8Y66MvTHgge5y9C/mgCZjLF0QFnLhC9ejmTidOBTJDV9gXj0mWCN7uoVIbxZ
 ZrwHhRMq68lXv/Hil9pxy9gFyMWq40nOqDcBfukpbwUgnhNL0QM+U+puDuFD+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=crsDACZk
Subject: Re: [Buildroot] [PATCH] package/gcc: enable obsolete nios2 target
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

On Sun, 12 May 2024 18:19:15 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> GCC 14.1.0 deprecated NIOS2 so we had to enable it explicitely.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gcc/gcc-final/gcc-final.mk     | 5 +++++
>  package/gcc/gcc-initial/gcc-initial.mk | 5 +++++
>  2 files changed, 10 insertions(+)

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
