Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E984E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC2A400D3;
	Sun, 12 Jan 2025 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqUhuUBA6Pcb; Sun, 12 Jan 2025 11:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE392400E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE392400E4;
	Sun, 12 Jan 2025 11:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4EDE942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C639060A97
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9B0-fEreIMSk for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB737608EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB737608EA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB737608EA
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 41092B0055A;
 Sun, 12 Jan 2025 12:37:03 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:37:03 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:37:03 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111185555.2956037-1-james.hilliard1@gmail.com>
References: <20250111185555.2956037-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1253141f042e554b6b4bb37fab43d0cf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681824;
 bh=pSFiElqq7i5xENfoe+sKabatT2jUIVMTvjTm1Bd4IoA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tHixUiiiqlm76Rxbsei7eUvvGWNQukuUACGnGm8hUSF8BNuynZZGzkS975svUrOxl
 ubTr+3pEngMBLfAHwU7LM9J6ThJSS/6aa6IKLmczd0E3M6Aw6kx1+NDUJmXBVw5zwM
 J0yVWMfsZDievL7Oshp3qKufO0z5CSS9cBHjXpUjFpb/nuF9WgM4VdWToEeNr5MTp8
 4EAfE6yB+tkHDJd5bpWA3U1rjSgbTCP6gBoo7y6fL+h5/n6PkGTdUl/MmRTQOMEmqx
 kurnlhl3lQdmgNsyFDZbLuJdVMGdAgbBK7dN+lNRQKm3y6DabCiDTU640B8KDSCRIB
 N1/iKIUxNnxEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tHixUiii
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uswid: bump to version
 0.5.1
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

On 11/01/2025 19:55, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
