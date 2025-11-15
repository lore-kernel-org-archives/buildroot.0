Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD93CEBF84
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E386A60A6C;
	Sat, 15 Nov 2025 21:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDphUN21apdh; Sat, 15 Nov 2025 21:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7D860A53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A7D860A53;
	Sat, 15 Nov 2025 21:00:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A7211A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 805C781431
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC4NU_x1Pzof for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 21:00:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8734813C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8734813C5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8734813C5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:00:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 273915FFC0;
 Sat, 15 Nov 2025 21:59:56 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 21:59:56 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 21:59:56 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Phil Eichinger <phil.eichinger@gmail.com>
In-Reply-To: <20251112110644.4054902-1-peter@korsgaard.com>
References: <20251112110644.4054902-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bd1b7237e38dfdb67148eea74188a7c8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763240398;
 bh=tNp9AYsuMy2cFPJaYhMWO+37cVw9Vl7zETRn9Qwnj3Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DQLhZ1q8vR7/P9hIx4OAEoPiUUSMKD+mY5yMcDiauZe46zFuSGoqyE3nM8m+5iteM
 KjYpZF1ok7b0UAgdtNIHI3NbMRMdcdMLu51mrjQggjBYrX4vc8vFctM6CnA/5nTCLs
 32/eTNeMZdbNUJ26TreLt1QI7ZQfdRu3hlBagDcGrHMBdOxHdM9EINRSim1EfYtr4z
 /ywRBAorjpkXpogi+Is+sVw6QK0MZthRIau+976rmDUFsA53HekgiL8+cRPFaeCsUa
 lbyrrw91d3DQgZW4q0Z2dKFpUrKqWfA/7ko7Gl55BSyyvn0ELDQofGtkb8EmHc2pdY
 zpQ/2vUHmuNvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DQLhZ1q8
Subject: Re: [Buildroot] [PATCH 1/3] package/psplash: drop 'default n' for
 fullscreen mode
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

On 12/11/2025 12:06, Peter Korsgaard wrote:
> Commit a028f0a51de0ed ("package/psplash: add support for fullscreen 
> config
> option") added a 'default n' line to Config.in, but booleans default to 
> 'n',
> so we typically do not add such redundant lines.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
