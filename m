Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6C4CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 10:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 730DD60878;
	Sun, 24 Aug 2025 10:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4RTcrqvsIuU; Sun, 24 Aug 2025 10:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F1960889
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F1960889;
	Sun, 24 Aug 2025 10:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3A51D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3003460B00
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-FPdbhYdILg for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 10:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30FA160859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30FA160859
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30FA160859
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:56:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CD4192003C3;
 Sun, 24 Aug 2025 12:56:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 12:56:00 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 12:56:00 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250816091514.1361588-1-thomas.petazzoni@bootlin.com>
References: <20250816091514.1361588-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e04bb527d67761a7dcadae0b93942243@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756032964;
 bh=ua5ZJrpxu2j/Xu+d5rjz++vaZ4X2jhMaeEviHZ3TdLs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C2Bez1ol8j+1wFBruvAoeQRrJ8T4Gs1VKSxDCTSzky9GFXqhmrlq6iDvilU8tswJ1
 3AmHUXyqFpM0GstFudSeWHtGc8iXe6yiGDbYA4GaNcZUKlglfsM0lMFdtNwBwAd4/E
 kr0VF8bpGgRVHYfBv0s1pBFqoaGEhh1PcptsA/gREMD6V2hLKGuvQy5FgE19kLt+e4
 C9hnxEx+RIBgMfK1wCSDgUOZ16yD1nl5/cb/Cyoyq9KYc25M+clf34XCpDW3Q3Rfah
 c6Z6rSJkJ8jqr7Lzn3d+q+bfrV5PcLifztLkdMOmQaUOzQ5RIs5fo2QZ+gLZ0Y0/vS
 iQco2VhqsXEag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C2Bez1ol
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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

On 16/08/2025 11:15, Thomas Petazzoni via buildroot wrote:
> This will be needed to work around a GCC bug affecting python3. The
> bug is reported at
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121567.
> 
> This bug affects GCC at least since 6.x, but we couldn't test earlier
> versions, so we simply assume all GCC versions are affected. Even GCC
> 15.x is still affected, as reported to upstream GCC.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thank.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
