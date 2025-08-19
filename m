Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82B6CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 09:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D784409AF;
	Tue, 19 Aug 2025 09:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA_zJCP6QXUY; Tue, 19 Aug 2025 09:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73CCB409B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73CCB409B0;
	Tue, 19 Aug 2025 09:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C326CDE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9779409B0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vs08oyA-SPqN for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 09:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5BD8409AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BD8409AC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5BD8409AC
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:55:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 080E9C6B390
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 09:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 863F560697;
 Tue, 19 Aug 2025 09:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6326C1C22858A; 
 Tue, 19 Aug 2025 11:55:01 +0200 (CEST)
Date: Tue, 19 Aug 2025 11:54:59 +0200
To: Leo Liang <ycliang@andestech.com>
Cc: <buildroot@buildroot.org>
Message-ID: <20250819115459.34b62b9b@windsurf>
In-Reply-To: <aKRGPS7VOFk7VNCs@swlinux02>
References: <20250818203223.3219221-1-thomas.petazzoni@bootlin.com>
 <aKRGPS7VOFk7VNCs@swlinux02>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755597302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HMQWVw3y2d2bVQ1Gpf62FErtiakQ3elNhntOWSJgXPM=;
 b=DWXLWdKidDuDrrpzi7RFtfdwJv3gq6VCxt9aHl3C7SgS+Qq8uzTNG24WcIQmw98KNsvEkQ
 YCNnTY8QtMIU6DBPWHa2K7Gf3aLwCW1sQYyWV1PaiSNZoqZDB2apE4aVUVBJvBrhtgCSUa
 XwE3QBunre9DvLtakAfRWunDeCTv2CrVZlpOfsd/3L2wkRxb+RsKeulaeBK4dr077/TT8N
 EABBiLpiTPYzAVLaEmYsNmJhOfHtu3J2DftzqAFjkX1uYqBQ/KgaRqizlEqGW0ly2Z5gZe
 pM2IzffSYeCHqhOfl+Z+9LqczspGRSvMn2/2u4mDE5eyBUOYo4zE82RMH8CcyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DWXLWdKi
Subject: Re: [Buildroot] [PATCH] configs/andes_ae350_45: remove defconfig,
 broken
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

Hello Leo,

On Tue, 19 Aug 2025 17:39:09 +0800
Leo Liang <ycliang@andestech.com> wrote:

> My apologies for not catching the CI failure earlier;
> my email filter was misconfigured.

OK.

> I've fixed the Linux tarball link and confirmed that the defconfig builds.

When you say you "fixed the Linux tarball", you mean you re-added the
missing branch to your Github repo?

Note that the defconfig is apparently using a branch, which is not
correct. It should either use a tag or a commit hash. Indeed, branches
can change over time, while our defconfigs should be reproducible.

> Would it be possible to drop this patch?

I'll drop the patch, but aside from the branch vs. tag issue above,
there are other issues to fix in your defconfig:

Patches lack an "Upstream" tag:

board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch lib_patch.Upstream
board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch lib_patch.Upstream

The post-build shell script doesn't pass Shellcheck:

board/andes/ae350/post-build.sh Shellcheck

Hashes are missing for the defconfig:

configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash

Could you please address all those issues to keep the defconfig in a
properly maintained state?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
