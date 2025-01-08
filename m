Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BB7E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E434380F8E;
	Wed,  8 Jan 2025 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzQinnrEQe6M; Wed,  8 Jan 2025 21:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14A6180F9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14A6180F9F;
	Wed,  8 Jan 2025 21:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48BFF1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CAC580F9F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzcoJApi1w5E for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4960C80F57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4960C80F57
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4960C80F57
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:17:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1803846444; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:16:58 +0000 (UTC)
Message-ID: <5d70cc79-b74c-4352-b162-b08d64d2c27f@korsgaard.com>
Date: Wed, 8 Jan 2025 22:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250101214216.2117350-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250101214216.2117350-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P9kS3kqUYYSi8IY0PCdudLiUqdRKufnnyCwklzDyF4mWzQw455dcaprXs+8a79o+qv84Q9z/VwX1QxgQiI3iPAbJ5U07+8QiOJC9ObJarGepMMt3zo6Pfi4Whnm+Ah5NGz3E/X0svC3CBwT5ydcnHkQPAFN6+N81w2FgJgl+bsViFX3FPNDyZV/ScrZ6oyJ97xTBZE+HYSGr8ecgMbRSRvkHaq5/qGTWkyGxyuzS5vd2VokuaUyvA+OcfeqtzhG0p96MrRtulMYakAsvoUSs13dje3U9M/6MdpwEWrxKzSnblIc8tEbiJzn5+CRPWHs+UGTlD/ZCwjxRe0y7rGZA+A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cA5zCgVr/SeXczI+TU0zqclf3YnuY3+0kP3nlJNYu0g=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=P9kS3kqU
Subject: Re: [Buildroot] [PATCH] linux: the aarch64 defconfig also needs
 host-openssl
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

On 1/1/25 22:42, Thomas Petazzoni via buildroot wrote:
> This commit extends 5dae966a30c5485e45b94f750a739d36810cba4c ("linux:
> select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed") to also cover
> the aarch64 architecture, whose kernel defconfig also needs
> host-openssl.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/375f48cabebddce3b1d23c820bc3a722c8cdd819/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
