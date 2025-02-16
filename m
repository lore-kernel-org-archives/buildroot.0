Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AC9C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4368B40D7C;
	Sun, 16 Feb 2025 12:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jty7OyhIA9zo; Sun, 16 Feb 2025 12:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 359BF40DAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359BF40DAF;
	Sun, 16 Feb 2025 12:44:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9FD91BA
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84C54013D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeGFQ45R42CL for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C1DD40EFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C1DD40EFD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C1DD40EFD
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:44:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 94E2320039E;
 Sun, 16 Feb 2025 13:44:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 13:44:47 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 13:44:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <0c2abc96fab2e91a794019f5d2ee577f2c9268d0.1739524072.git.yann.morin@orange.com>
References: <0c2abc96fab2e91a794019f5d2ee577f2c9268d0.1739524072.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <718dabd04b0ddf34037a41aac094645e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739709888;
 bh=Zw9chD5W4pMVRBNFNkxc7DFycx9MR4zUK1E9WiZmmNU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZSOH7dJYyrX4ZIOE/g6QRFPuNJsf3TX66t2GyCqlyBAeduRtnBaSdqaAAIZIJhe3x
 +1NOBXRIZS443ngEcp3Qf69UpU5AXCq9cCmJM83AHRK4hiTxmQmaL8tK2yOe76Ion2
 X80bOkJXqiyi8fHeZj7EFpsi4dkVbqJK1Gyw4VBvZPm8E4Ip9XMzenBtdzVbCY43BD
 gHgYJnlYWffuz8jjZMaoxbUWMJbJdpVk5w9+S2RWeUhMgiFjq0/16tyFsaWihzLQGO
 9r/lj8W29nsNQM7G7VtJ+9CVRY1Tu7CITpEIvPHX6T+CM2wWXLvSt/fLnVNJsWKWvr
 0E17PMdI/uwXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZSOH7dJY
Subject: Re: [Buildroot] [PATCH] package/skopeo: bup to version 1.18.0
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

On 14/02/2025 10:07, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
