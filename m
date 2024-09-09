Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB862ECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 13:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7146D4035E;
	Mon,  9 Sep 2024 13:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yPbg2tl97Tq; Mon,  9 Sep 2024 13:24:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3587140398
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3587140398;
	Mon,  9 Sep 2024 13:24:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9FA1BF375
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 13:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DA9A607C2
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 13:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwqTti7GX1lF for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 13:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7258A607B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7258A607B9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7258A607B9
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 13:24:02 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 018102C833BB;
 Mon, 09 Sep 2024 15:23:59 +0200 (CEST)
Message-ID: <16181c27-0f7c-44e6-a334-9df5aac77a7b@bubu1.eu>
Date: Mon, 9 Sep 2024 15:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240904154417.168646-1-buildroot@bubu1.eu>
 <20240905214551.06532f87@windsurf>
Content-Language: en-US
In-Reply-To: <20240905214551.06532f87@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1725888240; bh=b3rkd4EEswG++D2IYT056nQt4rY2Qrc2Nr9ILoZ5UT8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HFf5PcDVZcNlg1/mYhpW6XXnqiRtmswUUXnAmAi/y7nXqHqzXaIQV5hob8rdGSOSa
 gC4cF1GSgUDPgFrLJP/TDTVHe88YAoonImhtVnVgfAYACZ2vczw1Maz24cJTKEbsIy
 Xw1u1O2m4Ho34YtvQBdLGt/Tfb8BONJyAJfoLtMR8f6Al4rw/BOrhEMNOSupBLFyTn
 MXng2NWcJMz6MI7GIapBvEec5IJoQsIgDJ75+VqYZo9ouLEe1wRcnxG8SamgLfeAq4
 9qIH/DBeWthE0Umry4kynHMIxLhMo1hNgBCa6+mMwfaIlMBqXKvb4pz6e+vZxHp6ko
 5NDtANvSfA9Wg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=HFf5PcDV
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 05.09.24 21:45, Thomas Petazzoni wrote:
> On Wed,  4 Sep 2024 17:44:16 +0200
> Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:
> 
>> Fixes:
>> * CVE-2024-45230
>> * CVE-2024-45231
>>
>> Further changes: https://docs.djangoproject.com/en/5.1/releases/5.1.1/
>>
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
>> ---
>>   package/python-django/python-django.hash | 4 ++--
>>   package/python-django/python-django.mk   | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> I've applied to next, because next had 5.1.0.
> 
> For master, which has 5.0.8, we need a bump to 5.0.9, which fixes those
> security issues I believe (and 2024.02.x should also upgrade to 5.0.9).
> Could you send a patch against master bumping to 5.0.9 ?

The release was cut before I had a chance to do so. I've sent a patch 
against the 2024.08.x maintenance branch now. This should also apply on 
top of 2024.02.x I think.

> 
> Thanks a lot!
> 
> Thomas

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
