Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2DBD72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7DAB4082E;
	Sun, 25 Jan 2026 20:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7uOFwD-0l2M; Sun, 25 Jan 2026 20:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B63407A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769374600;
	bh=AdoBmCzo2LN5HCKrxVRTzC0SJ3O7pAuYNKj3NaG26dc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PjMnjIJtuRsKzR5gdOsV2CYgr/ixcA6CC7hKtbD2KZOv/FwmIOBKMEOtFINeRr1b0
	 b/KzQX76YC/rCcA3UQYJe8A8OOrT0t/RgAs4vTT2BALEqLIQOH/la9/AmlNCwOcz2L
	 nSZ90WMvYO1PwOs7jtZMyWPmi/BJiEqdPeoPqZbPvJv51NNc+OKyZ5YR9vuGsjmmPe
	 kZ3S1CYcijAwIAo2PJlVRdzw1VB2htZhrAYnKmkU2fUKXEdD+DIfAJ5Y4DZmzzLcbi
	 ZBmKmrpfTt083BbOLSYBRzi8NtuWMHUvwdVEGZHHBw0Mu241r3S/5vsjlQKLmfgIFU
	 GNUpoCyiRdL5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B63407A5;
	Sun, 25 Jan 2026 20:56:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42D8635C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27507821C3
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWnCg8BVBXWC for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 20:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 635CA81CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635CA81CDC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 635CA81CDC
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 20:56:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 31D6E5FFAA;
 Sun, 25 Jan 2026 21:56:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 21:56:33 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 21:56:33 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20260122183444.475411-1-dario.binacchi@amarulasolutions.com>
References: <20260122183444.475411-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <83779d28831b0f44a9a0ad2c16e5322d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769374595;
 bh=Gc5S6l0iCTq/Fkm5JF2P9TPvTB+kCOFlPieuawkMZ74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TFzMXMBeJWJBREH0JKedQiueC6faS/12GV7hEqLZF0qZaHhsVSKb00WYN4Uq11gCO
 4iNOQ0tbjpWoKchY526jalFFdgISa0ibNWus9YOaOA3p3f7aT+VEYK2C3iDgZXvPam
 4RGxnSNZ+vhXrT3iril/AEG9GGdQBzFyLOKdpQrjKo7yk/f4mgn8xmGToz1zHzWraj
 wMp/buI3b8LXY5IWmRkuZw53bEi5KXIDrZyMH/JkBnwYVP4gTuWmXYSDyZQMbVBwPU
 E79FpFQWii5fSmBL5SLEAuhbwudIjOhDLgm3WcAm5mjjBOfwx34sz5KBTYs/6CPRBF
 IqMS46FZGN6rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TFzMXMBe
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f769-disco: fix typo in readme.txt
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

On 22/01/2026 19:34, Dario Binacchi wrote:
> Add a missing space in the "Creating SD card" section of the
> documentation.
> 
> Fixes: 1a1239fd286ec5602e6ea29a1799e26b6254202f 
> ("configs/stm32f769_disco_sd_defconfig: new defconfig")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
