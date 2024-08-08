Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3733CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 09:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA68681858;
	Thu,  8 Aug 2024 09:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9BPAd64ZQDN; Thu,  8 Aug 2024 09:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F185680C86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F185680C86;
	Thu,  8 Aug 2024 09:35:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC8A51BF2BC
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C98E440327
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAJXumcNxoR6 for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 09:35:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7261D40CBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7261D40CBF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7261D40CBF
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 09:35:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA11B1BF206;
 Thu,  8 Aug 2024 09:35:31 +0000 (UTC)
Date: Thu, 8 Aug 2024 11:35:30 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20240808113530.5b33a347@windsurf>
In-Reply-To: <CH2PR12MB5004FF40F90027519556EDA6F0B92@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
 <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20240807162841.52d0481d@windsurf>
 <CH2PR12MB5004FF40F90027519556EDA6F0B92@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723109733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7lalMr1lCVDAUt3r4VX4TVZvED3fBZHEZNyqQYLQ48=;
 b=NKt9pcLJzArzsezoExY1gd97YBf/UMf+hKMWn1gUeVZm8BSf6Wad8fNofDo0bTDsFQEdF8
 o3FQ4mjEkk3UV3SAb9O4TM25lIrpZxObxQXgiDiwuncHj4A8JAR2As7s6kHlfnJAsPLaFb
 YGO4NEJ7AIRJtOrAJyTsYmB2PU4mJR+e7l8s+2K9Du/jhuKIPZ/z8q0Bjj2lJIgqshqH77
 Rc4/tX0gXuWrGt1v1Kgf3X7ODlO+HZkW6LyshpnVCGNVia4GJTa6yCcOHYBzcVcHKkWqJd
 v7QvkaBqOe5XLDa7M2yeajCE5RSz8wqzrz6rrDQxeYCcuwcLxBBWTHRBdkP2PA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NKt9pcLJ
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 8 Aug 2024 09:10:45 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> We have a better solution now.  I got our team to re-do the release tag for
> Linux 6.6.40, so that all the needed patches are included now.

Re-do a tag that has been published, arg. You want to break build
systems like Buildroot? :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
