Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C48C021BB
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 20:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE4E980CC1;
	Mon, 24 Feb 2025 20:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dBtK3GytVPG; Mon, 24 Feb 2025 20:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051DD80F2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 051DD80F2D;
	Mon, 24 Feb 2025 20:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B25401531
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 20:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE0B26070C
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 20:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyzNAgEa_d83 for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 20:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BCAF1607B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCAF1607B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCAF1607B6
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 20:38:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 50DD313F854;
 Mon, 24 Feb 2025 21:38:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Feb 2025 21:38:55 +0100
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 21:38:55 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250224193608.1700020-1-festevam@gmail.com>
References: <20250224193608.1700020-1-festevam@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <a470214ed21c60317f2e89eeba47f708@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740429536;
 bh=veOp2jZuEwbmDr0+ZR2NWfgR0e6n44tbSr5MyiMw6h8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ojc2c2nf+armfExG7dz47EuCoI4fkJXiD5YZjFEiMOIVVplF3xmbt1OKizxC0LVvl
 Ue8FUeRuqKdJoDTA2haAMSo0p5PYN3qXzEPunTHVSYHlfut9iyHREfxBLi4uo7oqaV
 2Gsm9PFeIWIUTrEBXVmwBpXJPXIsLhwdDDB4+mff+JZunXRGv9j1KPqcUi3yPqDenL
 6C5aGtwLpIIdBYCN1/qo5MoK7vKzMj9xnepruM1/ROtcbMcEdktHnitq1pvIcgqpzt
 5JLwXg5Ns0296z7jwPKZuZgltV5Yw5c4Ah+eyBHs3QuRRQGxrbEmwKtxeFRZyqnMFg
 ip/YWh5EeNXEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ojc2c2nf
Subject: Re: [Buildroot] [PATCH] configs/imx8mm-evk_defconfig: new defconfig
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

On 24/02/2025 20:36, Fabio Estevam wrote:
> Add a new defconfig for the imx8mm-evk board that uses upstream
> components, such as:
> 
> - Linux Kernel: Upstream version 6.12.16
> - U-boot: Upstream version 2025.01
> - ATF: Upstream version 2.12
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
