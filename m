Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8B7FDEE49
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2522C60F6E;
	Thu, 23 Apr 2026 20:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_EmxGg7e_jN; Thu, 23 Apr 2026 20:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3499660F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776976420;
	bh=QUaG79Bt6eeZwrfRtAEbhnGOaXfJULfcb1h3opGrLSw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pcq4RqRbPiu8jhIt5jEu7rOsRhwNhJX3m2kJsiH1l/Gj5ww944s5ONXcK2zJ9tFUW
	 45gUjOCtKtFPqv7WK41UAPvVHYiB+/Vp3rTWt41CaXp+t9UPhx2Ppgh0m9r9BAM/1G
	 bjlxq+SGVFABB+P5BAvHEbcMJDtrKimkGgW0g/+QBMWnHYzAMUYkhcIAMQzmSNilse
	 CG8rPMrN9fx8anTrpWPaqHFAmI9WxbwuYWKTvZBmQ8b0TH88ngJdtTkvdOtv9L6ssP
	 hcUB8ILnV+RDwR3Bar7/QVXKDsX+9ndFGRtHv7uueWN3QkjA7XUh6wVkaannNlSuPR
	 S4vZHMh4EXNew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3499660F72;
	Thu, 23 Apr 2026 20:33:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B213231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7103183DCE
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3R5xkBKPLI4 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:33:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AED3183DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED3183DCD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AED3183DCD
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:33:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 68E97B00535;
 Thu, 23 Apr 2026 22:33:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 22:33:34 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 22:33:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260420174507.3612219-1-bernd@kuhls.net>
References: <20260420174507.3612219-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <d4e80a87ee230cfc9e80861fbe7affb1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776976415;
 bh=oNSKdQR8g6al9Tc2sBtjnlO9VBysIZvEc/pOpdvot5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M/I/8GV4O/pG9k5y08wTq4liCTBPIcZiLnAPRlwW4plbkXAqTiDxEaSwptRCFHgfg
 Nke0BnUsZA2McOForJoDdjzqfqmy2WVNPv9xSvs+pRnFHQ0ND5Ql/kFoFY7HId6OCC
 juHzaJKE8g69wdYtO5ls2nZ67ZWgwXeB4trVaScK9smiQn9TEl4xKLE9YPtX33Ah7V
 BQvpZ2iruHNHGZAtiTjl6eejh3b01v3KjwK7voSerfNC1LLY0iAixSOyKrBni4RGeK
 kCc+7EG+T9eJ1TQeeLAPjDVPUbitFDQYjwyOArHgfRPFPpw8MyxXhOl3biiZr692aT
 PpfJ0r7LiKz1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M/I/8GV4
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Clayton Shotwell,
 e-mail bounces
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

On 20/04/2026 19:45, Bernd Kuhls wrote:
> <clayton.shotwell@collins.com>: host
>     mxb-00105402.gslb.gpphosted.com[67.231.155.145] said: 550 5.1.1 
> User
>     Unknown (in reply to RCPT TO command)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
