Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA91CC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAB178214D;
	Tue,  6 Feb 2024 17:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFzrdPh8v5KB; Tue,  6 Feb 2024 17:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D8782CA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D8782CA5;
	Tue,  6 Feb 2024 17:52:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08DDB1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF9148316A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSPYQXO7XQJB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9224D82CA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9224D82CA5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9224D82CA5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:52:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5DEA240002;
 Tue,  6 Feb 2024 17:52:41 +0000 (UTC)
Date: Tue, 6 Feb 2024 18:52:41 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240206185241.2d3bba6e@windsurf>
In-Reply-To: <20240131112223.2175855-3-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707241962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqch9J2FQeg5DaI6lXUBM3s/vs04u+wCF7HZUHBovz4=;
 b=FVqAOdCX4vN3S1qJQPuUXKmXpyQGOX8Rg7ZyyE/Mh9YuvZbTKI+s7G3P1z8F1Rt60rGl9D
 zX3kD3SpBRYnNFMZH4cC0CXzOmKyfO3dfpjD9GGpXF/i43wdCPeAeeJqs8WcnWlOWQkfpH
 /rSmTjydhJWJwaMIs6PHw0XWonsZpLAnmKa+YS75glRFHwhqY5eseSrHDgRNm+ze0o7kYd
 gaN3/BFLPKStBKY/J1EheBGJXZXz+TKNIh6rq1j0FD0fSwH80bOGwiMUeJkiYSCr9+NS/D
 52tau/kYO9VeTlABHr5KDZ5+sTkiGAI8cIyRzO/zuHWqbYQJ9WiyTJtzAcojIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FVqAOdCX
Subject: Re: [Buildroot] [PATCH v9 03/11] package/gcc-bare-metal: new package
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jan 2024 11:22:15 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a new package for building gcc for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> V1->V2:
>  - removed default enable to be replaced with toolchain select config
> V2->V3:
>  - no changes
> V3->V4:
>  - split tar instruction into multiple lines
>  - replaced unnecessary =? with = for assignments
>  - changed xlnx-rel-v2023.1.tar.gz hash to sha256
>  - improved menuconfig help comment
> V4->V5:
>  - moved to upstream gcc without any xilinx patches
>  - reduced all lines to <80 chars
>  - added license files
> V5->V6:
>  - migrated to toolchain-bare-metal-buildroot
> V6->V7:
>  - removed Config.in and hard-coded version
>  - added sysroot for newlib install
> V7->V8:
>  - no changes
> V8->V9:
>  - integrated changes from Thomas
> ---
>  DEVELOPERS                                 |  2 +
>  package/gcc-bare-metal/13.2.0              |  1 +
>  package/gcc-bare-metal/gcc-bare-metal.hash |  1 +
>  package/gcc-bare-metal/gcc-bare-metal.mk   | 61 ++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>  create mode 120000 package/gcc-bare-metal/13.2.0
>  create mode 120000 package/gcc-bare-metal/gcc-bare-metal.hash
>  create mode 100644 package/gcc-bare-metal/gcc-bare-metal.mk

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
