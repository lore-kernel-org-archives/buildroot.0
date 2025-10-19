Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FD1CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 10:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4655483CD5;
	Sun, 19 Oct 2025 10:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqJzuy4_qk0K; Sun, 19 Oct 2025 10:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FFB083CCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFB083CCA;
	Sun, 19 Oct 2025 10:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A4A43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19FCE400C1
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35ofKAL_FYwj for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 10:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E39740072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E39740072
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E39740072
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 10:44:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 22198780368;
 Sun, 19 Oct 2025 12:44:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 12:44:53 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 12:44:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251013183749.3515456-1-bernd@kuhls.net>
References: <20251013183749.3515456-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2b9a41fba420f1dc820e085f63305399@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760870694;
 bh=b3K9y4nHO+SwBKEYwYZ308bRXOnTSAHVHCegIZLYmDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g9KSzEoy/qaHOKfhju0JM7ivQeNMyqBsW1TN5+MattdTdqiVnl4E82FdTvC/Ztnx1
 JG+69ZQgHFXmyAFd3PrtwFdMSlJajdfPnKuVexojgJ/mb9QraPqfSOXmLseUgesb9w
 d/XtUqKklmyRdfoCZ60e/0HSa4yCAAJsK5mt+RTBynqCmqOcajzKP1lx/qVUhuTkIW
 iTXgvw1Cm4iOJ1MSbaFpV/T9zGaoQwONz6srIQbjF4xMTGFKhR4FIURExnxT34h7+u
 KQIKPtvY0EPtD1ceaigJeuTv4TfogGnpOVflNcSS/U6ydUOz+vJef9KbYy8dlgPiRo
 40PEUKDvYpfdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g9KSzEoy
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to
 2.6.0
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

On 13/10/2025 20:37, Bernd Kuhls wrote:
> Release notes: https://github.com/cisco/openh264/releases/tag/v2.6.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
