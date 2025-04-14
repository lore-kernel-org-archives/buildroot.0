Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51456C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D77F60810;
	Mon, 14 Apr 2025 18:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_toWP822dLm; Mon, 14 Apr 2025 18:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD1F60BFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD1F60BFB;
	Mon, 14 Apr 2025 18:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10764108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA4B960DC6
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2klEzyPzOomI for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A39560D4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A39560D4C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A39560D4C
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:20:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BDF915FFB7;
 Mon, 14 Apr 2025 20:20:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 20:20:01 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 20:20:01 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250413210640.384406-1-giulio.benetti@benettiengineering.com>
References: <20250413210640.384406-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <0c0fd70163242a0877830d47cded6fdc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744654803;
 bh=b4Z1fRRaFN1yuomQ4dqoZ7/ybDnwaolJscT1IGmQ5Jg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JYT31ePcKRiBNajpjLf8fuAPm9g29d1uFmlxmfzwgzW+XyVzurvGzSSf7W3Yk0C4m
 yOd5VfwLCCgwGExB5TEpW7AXGajRlLVg1l6NY+bh1TJ2COGp55roDqPhWkkpCQoDST
 B4hVonjw9gNYGHlRoVkGsu8qE6fd1Oz4i8fU2sqkYku6A8embb/M8evmr0i+M6pdCs
 hhGHVxAugNdroWxePYXC8OGaA1lbZklKhd1gfzbkeDy4giGoWknxx/lhvQeiKaEv/J
 us/rXqnKJ52zsHjz23dEJcFsgpl3aPV7Noz+O/H1NKSogdwPX/Zp5RegoG4vXVr9K+
 jdjjhDZ6CwOtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JYT31ePc
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.13
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

On 13/04/2025 23:06, Giulio Benetti wrote:
> For release note, see:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.13
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
