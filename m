Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E5C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 15:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019A5410E7;
	Sat, 12 Jul 2025 15:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hi-AgbMvMeoh; Sat, 12 Jul 2025 15:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E8D40D15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E8D40D15;
	Sat, 12 Jul 2025 15:29:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C021CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED2EF81141
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUndEFG-VpuQ for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 15:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3F9D810E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F9D810E9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3F9D810E9
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:29:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 03F8FB0053E;
 Sat, 12 Jul 2025 17:29:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 17:29:35 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 17:29:35 +0200
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, stephane.viau@oss.nxp.com,
 festevam@gmail.com, maeva.manuel@oss.nxp.com, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250708234739.2969797-1-Mr.Bossman075@gmail.com>
References: <20250708234739.2969797-1-Mr.Bossman075@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3f8181f38fc425accf8bec12508de767@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752334182;
 bh=J6xHicDcd6J6UdKYekBNwr7EG6idc4y3Aes/VxeyIrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z/qQgNfAnPmhazvdPS0/VAuV/5gt5eC++dAsCpZbTjP9rYNYvXEI5OQYtCYf3ocr/
 aQhz12glho6oxJuEbZNdKE0tNSgXYJDL1UAzg4RCdwgv4z/NbXh47cdZqs7DPouHQF
 Pq7jmZ8QTGn3TZp5fdYVDwOi1DSpRuJ+aZTMDbGQ2E4ZQQSGOfwp8PQOx8RYSOGy6I
 NgDjBtpzzET0t7dbPawrGMpvk+7T60obBOc83FMwvcZS2YVI2ov+r8tfA+kO4BOYTx
 iJ2iYuLzwGnKrQGOxlaI9DGtmOiAeE6KHFploYNr2k+AGd97IikR0E2C13/ALwlUqG
 9OGozJiEcJQGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z/qQgNfA
Subject: Re: [Buildroot] [PATCH] configs/imxrt1050-evk: Switch to use
 extlinux.conf
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 09/07/2025 01:47, Jesse Taube wrote:
> Switch to extlinux instead of built in U-Boot script.
> Drop custom U-Boot fragment and genimage config.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Applied to master, thanks.

I mentioned the uboot bump in the commit title.

I also needed to add:
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

without it, building the defconfig in the docker reference
image was failing with error:

     error: command 'swig' failed: No such file or directory

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/051d145137ae86f040742478ece1529c65123a1f

As a suggestion of followup updates for this defconfig,
could you consider:

- enabling BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
See for example commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/683681261b19a0ea541e55ae7d5497ccf05e40a9

- enabling bootlin external stable toolchain
See for example commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/dd3ef914867dca5e429bb25ee14445fb0c87baa5

- updating to a newer kernel LTS version, e.g 6.12.y series,

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
