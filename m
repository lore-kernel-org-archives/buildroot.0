Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DC8CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31EB1611E6;
	Tue, 16 Sep 2025 20:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpCygoKYe7Gz; Tue, 16 Sep 2025 20:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8AA611E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8AA611E0;
	Tue, 16 Sep 2025 20:52:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE33199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF70240502
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08hTuLOKvYCY for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D2B1403E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2B1403E2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D2B1403E2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 96F345FFAA;
 Tue, 16 Sep 2025 22:52:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:52:33 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:52:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915220742.1599145-1-james.hilliard1@gmail.com>
References: <20250915220742.1599145-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <10a3cda6220fd595eec3140d4d878e63@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758055954;
 bh=+bXdZ5DwWGTCqlMjzbAndgsIDsSFOyrsayzwz48tP1U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V/qTolwbb3duY4IQnwwKKcOalQK9YbeTI8pPTsTcGJQstt9jGUiXHCfpITDVS/h9J
 wCknxK3OSEKsp9QTkIFtHCWpts7ukDcEm1t7xsBE6Q2EfaxCYFEE2ujwxKOK0EabHO
 j2AOa/+s2EeGTARxnAaI3aKPJ53c1At+MW/7cTaM8YTlHoFNa+ZSS4WomuJUnDCJjC
 9+zSGjVwcUay1C74QS8+6UWLvLN20d6NFOZTY4OHSjuyZLTsLHC2vvXw0DK8v8HiiB
 pNt6n4F+CxbCZGggtX71+gZovWW1hX47FSiEBuMDGocBkEW15MAbeDBXWjrMoY8vk0
 DZ7YS/OoYJ6Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V/qTolwb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncclick: bump to
 version 8.2.2.2
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

On 16/09/2025 00:07, James Hilliard wrote:
> Drop python-anyio runtime dependency which is now an optional
> dependency of asyncclick.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
