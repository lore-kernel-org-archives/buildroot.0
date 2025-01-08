Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB071E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6A7605ED;
	Wed,  8 Jan 2025 21:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wisdcAn9KPX3; Wed,  8 Jan 2025 21:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667BB60687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667BB60687;
	Wed,  8 Jan 2025 21:42:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5370C1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2847E608C7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgV47i5A13lt for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:42:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3488608FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3488608FE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3488608FE
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:42:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 9240657;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:42:27 +0000 (UTC)
Message-ID: <7865952a-8cfb-4da6-b610-c9d60234c8a2@korsgaard.com>
Date: Wed, 8 Jan 2025 22:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250103224827.4074447-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250103224827.4074447-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=etQ7jK2Gd8r3UpHjGx87wnHxJoPsvXJ7Zp2Tx+LFVRW/GVMdWglu3+eHqKhucZjT5HA+Y9mnWTyTmn73YvkPz1u6zvkXJZ0RRvHSNzCztbaoZBKdZhM3Q1YznI3FN6aDiG+9YOHhesbbdaf49Xbqph/c9KqjC1YQ0mgreTeTi2cKYMhInOl1xgY9htwBtToC7phUKCm/n1wM1qmo/kEjqeks7e1XHtfWNCSulO2pa2Fspq/F1dYohp0Lbod38xIu7knv9fR9p8GLz2QXFTFIqf62ytXxN5dSn+J5ThZ3aw4x4K2cnWhfRR0SCWlcR4VoThSYDHuM3pLFsvOG1FlRHQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nnFJJf7lnOKkt8ZFM2lGjV2JMDux6OMHnlFrjfj3zGw=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=etQ7jK2G
Subject: Re: [Buildroot] [PATCH 1/2] package/igt-gpu-tools: needs NPTL
 threads
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

On 1/3/25 23:48, Thomas Petazzoni via buildroot wrote:
> With classic thread library, the build fails with:
> 
> ../lib/igt_kmod.c:1090:21: error: implicit declaration of function 'pthread_mutexattr_setrobust'; did you mean 'pthread_mutexattr_settype'? [-Werror=implicit-function-declaration]
> 
> igt-gpu-tools needs NPTL threads.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/85311ce68ae1fff771ca00b434be1c4f8453d357/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
