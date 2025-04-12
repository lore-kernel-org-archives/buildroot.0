Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E35C369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 11:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0148B417A1;
	Sat, 12 Apr 2025 11:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sv88xO8ZOM9; Sat, 12 Apr 2025 11:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF7E41775
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF7E41775;
	Sat, 12 Apr 2025 11:29:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F18CDE
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40CCF40F75
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLtmgll04GKK for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 11:29:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9DFD40E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9DFD40E1F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9DFD40E1F
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 11:29:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 846FBB00548;
 Sat, 12 Apr 2025 13:28:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 13:28:58 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 13:28:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Andreas Dannenberg
 <dannenberg@ti.com>, Michael Walle <michael@walle.cc>
In-Reply-To: <20250411095040.2276825-1-heiko.thiery@gmail.com>
References: <20250411095040.2276825-1-heiko.thiery@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7907892a603264500d40c22a85846c37@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744457345;
 bh=3cTFEphDllvwb8LtbOzqD4UETUK3iW7T8eGk7PP7+Pk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FX6QaXcH1GQ0csSQCK3Y1ePktdCYoOD1HiDZ7vN+nubGDreFC8PMhJz2Ts+3yKsde
 Tma4MFZRf8v/X2V4zx98+0fyx92LTMJZMq1S7hKcxU1Zuid872R2XGF0L/KRXXJe/a
 jhwm1dYZTD1Ll5kSs6ka+HeRIbsb228sV+Z/+d/UJFfY+MSNnKpeiGi//ecah93GWL
 dFDLmxa7mVsOJMrXwBbZs8LkNenOpXFYuwqt5mfnKGCNuj9oZzZ5rvMG0bkzDz3Kd8
 H3iO3oIDCFk30QyR0nrkZabKiSnnKk3LdR3PsFpy00CqTGSR5QYvrohN9XmjU8b9vr
 mqn0Nepimqibg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FX6QaXcH
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to version
 11.00.10
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

On 11/04/2025 11:50, Heiko Thiery wrote:
> Update to latest available version from TI.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
