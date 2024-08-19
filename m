Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14705C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D896B80CD0;
	Mon, 19 Aug 2024 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUQEryQ-0yXC; Mon, 19 Aug 2024 20:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E812880EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E812880EDA;
	Mon, 19 Aug 2024 20:26:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF72B1BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDC7680FD8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHHvtSaCQHal for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B073480EDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B073480EDA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B073480EDA
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:26:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E86A20002;
 Mon, 19 Aug 2024 20:26:09 +0000 (UTC)
Date: Mon, 19 Aug 2024 22:26:08 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240819222608.18026aaa@windsurf>
In-Reply-To: <20240816131856.461483-1-ju.o@free.fr>
References: <20240816131856.461483-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724099170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gw6cNkdzrXks+AgkOhMX1oQh2D44cwXkZbtAK2GbpCA=;
 b=jtzrwFyFPbISxLq9FKtw+B2a9WU45PQGOU3bttEfZ3m4XMaOM0I1hJPv6c+oRN2PJEL0jY
 7PfgYg0oH2dfSaLtS9UvH/TsGKEW2O09kUltu5TEVensu0tPJn5Rpq15igSVOXgFOp/i/G
 EcV7VnerP8xNvYY9Iip0MayLEjc8krEeAlWZ2aT2QngF3VbHOlqTiNqHJB+GWbTVHuf2Q2
 F2KaGMSphebbWdcuNo8xhTPGFKbLtukLWVbM3G80fLdHlIHa85OnM7HzU30QUfoSO5PFj4
 ZZj0kMbUzyY246eJDtWYWArYBle2IJSbIsGyKvY4F0eg+0bEoSovCnFmd31Aig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jtzrwFyF
Subject: Re: [Buildroot] [PATCH next 1/1] package/bcc: bump version to 0.31.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Aug 2024 15:18:56 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For a change log since 0.29.1, see:
> https://github.com/iovisor/bcc/blob/v0.31.0/debian/changelog
> 
> This commit also changes BCC_SITE_METHOD to "git". This is because the
> upstream source archive name does not contain the version. It is
> always named "bcc-src-with-submodule.tar.gz" in all releases. If using
> the https _SITE_METHOD, bumping the version will not download the new
> version if the directory BR2_DL_DIR contains an old one, with the same
> name. Since the upstream repository uses git submodules, this commit
> also adds "BCC_GIT_SUBMODULES = YES".
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/bcc/bcc.hash | 2 +-
>  package/bcc/bcc.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
