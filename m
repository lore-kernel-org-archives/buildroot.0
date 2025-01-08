Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3DAE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 802368113C;
	Wed,  8 Jan 2025 21:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okbKvC_32ldy; Wed,  8 Jan 2025 21:19:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BEDC8113F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BEDC8113F;
	Wed,  8 Jan 2025 21:19:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBF0F1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CF4040973
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIoaxrgNImTN for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 822C040A24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 822C040A24
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 822C040A24
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:19:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 640523286; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:18:54 +0000 (UTC)
Message-ID: <058b7c62-a43c-4990-bceb-f125d0d8d831@korsgaard.com>
Date: Wed, 8 Jan 2025 22:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250101223727.2348482-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Stucb/GsLT8xxgm2EYXeLaLAOountPg1OPhytEAgLHUizMpjdo9fWv4VGiHhLLp2pvU/ZTtRfcvkY3RswcalWX60naUADBGFbHPIIlk2+mm/A0KkKMAv1xCVMCa4wUAX40XvA4uEunBse/1ds21Y67j0flHaimhZsVe4G9MUl+DZGu8dsPS75uoZ9Quomv+gPmzz8+BLoB1gQ5K8SEKfmY3s7PaLMqtZ9IpIrA/tvi2F6yln7aSDyAXJV0KOXlsjsvQonM1gtlC/nc5u8BxaDgMbngA0euAHgFMu20+UPQGxzlKErEMWXOT/lZ0oOFNhiX0C5y8ewa2sajFRxjsF+w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=lz2SDVkU6YgzOkdle5WfLNgHNE5EUeKPEBFxT/s1efE=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Stucb/Gs
Subject: Re: [Buildroot] [PATCH 1/2] package/c-icap: memcached code needs
 <crypt.h>
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

On 1/1/25 23:37, Thomas Petazzoni via buildroot wrote:
> The memcached code of c-icap needs <crypt.h>, which is no longer
> provided by glibc since glibc 2.39. So add some logic to add a
> dependency on libxcrypt when needed.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/63b04f86bb8794b79d206659a883acef96dfebf0/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
