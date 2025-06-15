Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BC6C71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DA34052D;
	Sun, 15 Jun 2025 10:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30B332kTkvpw; Sun, 15 Jun 2025 10:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83EAE40571
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83EAE40571;
	Sun, 15 Jun 2025 10:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E080198
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 547BA40542
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsmZpsKTAOUs for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:08:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3E4E4052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E4E4052D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3E4E4052D
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:08:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 31B89B00593;
 Sun, 15 Jun 2025 12:08:45 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 12:08:45 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 12:08:45 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250611083131.1055747-1-neal.frager@amd.com>
References: <20250611083131.1055747-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d2ffbb603a41bacda4645133e67219b0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749982133;
 bh=PVMaDWXXqT+Si8lI080fcVSAQtsjPxJ8EmdPhxl9wXw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qe3l7Juzrc3cY5yhJR5M0/55djPxqaHVxgLmLCfbJ4Azaf/yngDakLHESXzNjC+++
 f3O5WyxggmlmbfrLbIudh8FWv4EJclpLFWBkSx2U79PNJDDyt8TnlHF+4T0fSWKp0P
 DcZsmaQR/YohD8ZC4DYjJe9WiL0+U9rXm/kbrpZaZP/VV4x4YzVvXPC8u/9KPOdFyY
 GqoG+cWdr6JNptIEd1Vi5Rfu/SFMqYNuCO8z0ChjG5uUqWHcHOAwGD5W8awM3jvQJM
 +Uc+DW2KTApuzcS14ka6nsPVR0DOgW4xRCKdrr5W+kHXzXWS9Gz2E5aYsQ/F54OAIe
 mq9UcA10ZyqjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qe3l7Juz
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/xilinx-embeddedsw: add comment
 dependencies
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/06/2025 10:31, Neal Frager via buildroot wrote:
> Since the comment about the xilinx-embeddedsw package needing a 
> bare-metal
> toolchain was moved to the start of the Config.in file, it is now 
> printing
> in make menuconfig for virtually all defconfigs.
> 
> By adding the same dependencies as the xilinx-embeddedsw package, the
> comment will appear only when the xilinx-embeddedsw package is actually
> selectable.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
