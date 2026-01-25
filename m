Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65826D7237C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D5C760AE4;
	Sun, 25 Jan 2026 21:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bRF-Z1MwVP6; Sun, 25 Jan 2026 21:59:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF64660A87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769378366;
	bh=yYlN7HQmMiWd+hhTK0vJ0qsdwDGthNCuad6FjQIQdsk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=As4XCu+OfhEB5mF3NDPrrHHGIcyS/qhjdKzUOSpI6ysBrDlSs7r611V71e4SD84A2
	 wurJ3+CEOXpE1/uJl1x/HNnpBFukFCrc6BWuVlwcayIzZeZnybYKpcATnsyTgqEfXA
	 Xa6imjZHmsm6223f/ZMRQhxMWJdR6klEEgqLkggIJixuHiI8vHqEzp0PyzXH3I+N8I
	 AlP/HWI4Jxotj47cfLbkQAmvN0zE0SvJtJjAEW1TbSf27ruNNKSMKTimoV9Sh7h4tG
	 XqN2pC5pLFp5hOksg5Ag+Be7aNMbgWenXzmgU1Jfjl/VGnGG6p28b2hQk0qScYcYEG
	 fhDwhdd1vncTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF64660A87;
	Sun, 25 Jan 2026 21:59:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E9DF1CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E17B401DA
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRzSI6r3q6gh for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:59:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CE3240085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE3240085
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CE3240085
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:59:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 11F1213F88D;
 Sun, 25 Jan 2026 22:59:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:59:19 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:59:19 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260125204856.4192059-1-giulio.benetti@benettiengineering.com>
References: <20260125204856.4192059-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <b31b7b49b24a36e40e1d2db822671f03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769378361;
 bh=oo453BFwmzfPUYO7QfPEiwa0WbU5VxnBlMwrOrx0rIo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CnMYkKRH0ZKooCR9gO1MQNIh+NEC6QKYcJmlAiefqtbKoSSIzrrDa+cQ/S2X0WKWM
 PhyBB3DWfRbSiFmttc0JWKR+cn9qYn+9M49yEyjjX4BhcvSoZMWh460t1WXrb0jQod
 mtD5gdXpM7ELDHjg6ux82o7NtVTZvMCmgnOFnLoOxRm/+cRzsTK6MVQSuzHYEuIQh4
 4/kRbf377vinvnoCzDKwGoeH9RMswDbm4F8DESAp1CUDQkpu9+q6wO9WVaORZ19FQi
 RSP83liax3kVDHRaG2L7pdrw6/kheK6taf/hCQjnZj8wcO0998tVSPrOU8M87aB7nM
 oz3Em3pmxtArg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CnMYkKRH
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 12.3.2
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

On 25/01/2026 21:48, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/12.3.2/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
