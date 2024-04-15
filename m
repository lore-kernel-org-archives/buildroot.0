Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745D6C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 12:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26CB6605D4;
	Mon, 15 Apr 2024 12:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soLNkj0VlpRI; Mon, 15 Apr 2024 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 265596061A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 265596061A;
	Mon, 15 Apr 2024 12:38:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB53D1BF38E
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF5B402BB
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dayewAoX5nym for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 12:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4778640296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4778640296
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4778640296
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 12:38:54 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B4CEB2C80CDB;
 Mon, 15 Apr 2024 14:38:51 +0200 (CEST)
Message-ID: <aa627e66-c932-42fc-a5f4-aaff35449bf9@bubu1.eu>
Date: Mon, 15 Apr 2024 14:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240328110058.2037303-1-buildroot@bubu1.eu>
 <20240410232520.20172e60@windsurf>
Content-Language: en-US
In-Reply-To: <20240410232520.20172e60@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1713184731; bh=8XLAubJgi5NaS0gpej7dAvyWXvEKQ3MveiRTI73mqnc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZdB1QszD4MNH2GPgQV7A+XOwqSglbNlKfMRUz0OoKLKVcqcsq0ou0CWr7taH70v69
 d9BalTuHC9U5c+6NlBiIAqUEiS5S5JoygdwALjAfpxXCvgJkdSBC1G5/00aeCqTE3K
 B2ydaThhjz0uTmqVpTMKiyN8XEhdXPZDUbo0pbePHUcmUs4/dQysXVMXKc64EWqUlX
 et1LRb7ZM862d+YWXrNftux2FqYTjEHEpuoAEm77iQN1anUS29P7m8uVtA+JiWJNAo
 PlPEN79kn2WoJ5ihUYI9fvve+pD69/W6SDP/aEDNW2jEpOWIvQZm39VtgigZ6EWKAn
 UtJY9MFY1u/xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZdB1QszD
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump to 20.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 10.04.24 23:25, Thomas Petazzoni wrote:
> Hello Marcus,
> 
> On Thu, 28 Mar 2024 12:00:58 +0100
> Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:
> 
>> Release Notes: https://nodejs.org/en/blog/release/v20.12.0
>>
>> LICENSE hash changed due to changes in vendored components:
>>
>> * copyright year updates [1][2]
>> * version name update [3]
>> * change from "Unicode, Inc. License - Data Files and Software"
>>    to the "Unicode License v3" [4]. This is in the icu vendored
>>    dependency which is unused in buildroot.
>> * new build tooling script [5] under BSD style license
>>
>> [1] https://github.com/nodejs/node/commit/347e1dd06a5f927d9fd64ce72d776c56d5101910
>> [2] https://github.com/nodejs/node/commit/b88170d602791fa62fc45ac80ca9953bc1bdd25b
>> [3] https://github.com/nodejs/node/commit/c8233912e9fd7464898b549d6762130722bf0bf4
>> [4] https://github.com/nodejs/node/commit/625fd69b76b5a8f59152f803b31941c8986d924b
>> [5] https://github.com/nodejs/node/commit/b5bc597871ca701bab750c46d31ed626decd7f89
>>
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> 
> Thanks for this bump. Did you run our NodeJS tests after this bump? In
> particular one aspect about which we need to be careful is that we
> offer two ways of installing NodeJS: install a pre-compiled binary, or
> build entirely from source. Running our NodeJS tests ensures that both
> situations have been verified after a bump.

I did not (yet, will do now when I don't need my PC for day ;-)). What I 
did was build nodejs for our target which uses host-nodejs prebuilt and 
target nodejs from source. That continued to work as expected.

I'll report back about the tests once I get around to it.

> 
> Thanks!
> 
> Thomas

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
