Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B879E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE56740630;
	Sun,  5 Jan 2025 21:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXif2IFm5_Tb; Sun,  5 Jan 2025 21:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3CD40612
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3CD40612;
	Sun,  5 Jan 2025 21:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C33F7D92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 21:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 972FE80EDD;
 Sun,  5 Jan 2025 21:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ligSj4UF8E5b; Sun,  5 Jan 2025 21:11:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.201.130;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEAA280ED7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEAA280ED7
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEAA280ED7
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 21:11:48 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 77D9842D;
 Sun,  5 Jan 2025 22:11:45 +0100 (CET)
Mime-Version: 1.0
Date: Sun, 05 Jan 2025 22:11:45 +0100
Message-Id: <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
To: "Edgar Bonet" <bonet@grenoble.cnrs.fr>, "Buildroot development"
 <buildroot@buildroot.org>
X-Mailer: aerc 0.16.0
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
In-Reply-To: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=kernel.org
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
Cc: Romain
 Naour <romain.naour@smile.fr>, Chris Packham <judge.packham@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> Fulfilling this kernel expectation would require a new
> configuration parameter for the name of the appropriate vendor
> subdirectory.

No, that doesn't work. The vendor part *has* to be included in this
config option as it may contain different device tree (file names).
Don't assume the vendor part will always be the same for different
device trees.

Somehow we have to split the source directory of the OOT device
trees and the (relative) destination within the kernel tree (eg.
'freescale/fsl-ls1028a-my-device-tree.dts', or just
'my-device-tree.dts'). Please keep in mind that the device trees
might also end up in the target filesystem in /boot and these might
also need the vendor prefix (see BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME).

> It would also require changing the relative paths to included
> .dtsi files.

Yes, but I'd argue, that the current solution is broken in this
regard. Yes we shouldn't break things, but newer OOT device trees
should use the same #include directives as the in-tree device trees
to ease sharing the files between u-boot, linux and OOT external
trees. As of today, it's not (always) possible to use the same
(OOT) device tree for u-boot and linux in buildroot, i.e. if the
arch has subdirs and one use the OF_UPSTREAM configuration option in
u-boot.

-michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
