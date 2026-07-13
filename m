Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098FFC43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 09:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E30860807;
	Mon, 13 Jul 2026 09:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOJ69yrZWuGS; Mon, 13 Jul 2026 09:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D07D960717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783936555;
	bh=zT+3uL8xDbY/9dTg0EE8KNQCQ/IKuW5Yc4P1cgGKNrY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ntslh398QX2HOnNkW8EU5TK3CxXMCKmrAJIyx3Fhb/28m/qz1+QgMllQE4QpN/cDK
	 9MRmRAlphW4WXrcR5+pJloE/a6J9DKEq+5zYkCminYO/LzyftCwkm/jfuIp8DzFCLE
	 Xkhq2LD6KWk1xrU/Qwu2VQm2HFn2IPGMwCdERCxpABXtsi72F0a8YLifhoFw4hhNdq
	 W1ClCTUBpuKosC1L1aQC8vZlkccZOlC19B2Tmkv0pJgnJJaanaZX/ia/+eratt3mEy
	 K2pQ6v7dTeoj1LfoqtMcbAgDpvV+yT8rdZUPgmIrCgr4uDWg/k/2txgJra2udGD1O4
	 vUUWNsO4Gl1TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07D960717;
	Mon, 13 Jul 2026 09:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B16AD2EE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 981D460717
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ta0m4iOUnGN9 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 09:55:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A371A6061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A371A6061B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A371A6061B
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:55:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5FE225FFC0;
 Mon, 13 Jul 2026 11:55:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 11:55:49 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 11:55:49 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260712160044.2562619-1-dario.binacchi@amarulasolutions.com>
References: <20260712160044.2562619-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <ac02040daee66414f33d4c841b671c98@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783936551;
 bh=oZSL0SV/RQ09QznAmgS49JW23kp9oBhDPN5fU8dNZZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JQSYv8SMmqntr65QBqA/nvu/9f1ohiun473r39XPSZgwLdRUywTUNEbUIvWGIE6k+
 wO1MAX7ke0PAWPkeQJD1uNKB+ICeuaSl4PE3vADPERKI9hJ1Iy9oOLMw7ymv5mZWea
 lHWH1kFcVbOxbFNdcj5bwSU8VSA3o/cxebP1b9CSh/HdV4bQAZovmuGyzfKhCyf48X
 /ltAGHHb72JbhV1BVSGcpMph0J5THlZ5dqPKlKQfQQpFV88rZrfEQHaPfSWSYG1M1W
 lEFV+ehnQtalQi8yAsTuEaIVP6sflT+BQnkOrzRP7Rw0ovkFKknUfIv6mU7ilQ4gbQ
 JAdGY+OK9zXeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JQSYv8SM
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f746_disco_sd: bump Linux
 to 5.15.211 and U-Boot to 2026.07
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

On 12/07/2026 18:00, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.211 and U-Boot to
> version 2026.07.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
