Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FC4C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF94D80F92;
	Thu, 20 Mar 2025 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qgOuWEtE3Rf; Thu, 20 Mar 2025 22:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B201D80D17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B201D80D17;
	Thu, 20 Mar 2025 22:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1D351A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C7780D17
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmIH1AV5W0kg for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E9BF80C7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E9BF80C7A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E9BF80C7A
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:20:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4A3EC780331;
 Thu, 20 Mar 2025 23:20:09 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 20 Mar 2025 23:20:09 +0100
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 23:20:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250317221828.3061240-1-james.hilliard1@gmail.com>
References: <20250317221828.3061240-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c6d82c68a48fcf4ccc3f74f4daa5df4f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742509210;
 bh=lq0CT6wLlBN/IO5KgFj/WoCAxLyma3+PtrTvEh+um3Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aaA7N0eP6fTOb0CBiG0D/4qSoVgfHR1y8e5Kku75lmONRYEECJ12Ei2uXApjPpe2b
 +W4W9OGdeeNbzF3henUhqABJ3KX/hz5wIZCT3peaKs8CiFPTgfpxxNrx7xw9+mTcmw
 cCaoDFW63pXE35U9WhQlLOuxVu9ztJXHFQPWM4OoRFMfEsGOffaEDbOGvIndWI07Gc
 GmR58niRJt96734j/yt1liZ+1dgi5dEfehJrU9NPF9Ik3w/JcPhbhPBtfbB6blQ6nA
 iGjG+DaX2CyqRuvbE/xPncV+L+tFfAKix5eLhcyhLeY+NbD2wNIqAlmVU1/fwbpWWz
 20/zgsVt4yPyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aaA7N0eP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.24.2
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

On 17/03/2025 23:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
