Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D2DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A66BC4028D;
	Sat,  1 Jan 2022 20:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwNl7dRb9Y3o; Sat,  1 Jan 2022 20:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D89540184;
	Sat,  1 Jan 2022 20:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4785C1BF479
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E2B140240
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmyTjkCekapE for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 20:43:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 015A04023F
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 20:43:32 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3lDunIpKtNi3c3lDun4msS; Sat, 01 Jan 2022 21:43:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641069810; bh=hW7QHl/xP+lpriEcQLg2YOUbEwL7I8UcW6qOn5h8Du4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=bmmHXN/7e5eVIWjClWUA1D3k8S3mj1SBrVcxV0ze7qjY23JwEBzpqycsxEwIRs0wD
 TbluNfbSsfTmwNtDFn59dboWj43X8nSZc7tTX2nclNKu9kHP2PgGSaLtS7AebgztbE
 W+yZqMHZuhZXGj9JAlADJAjsEjlQCGhZenxD1TQ3SQy6zeE/5sqBG474yxP8VNUuSb
 EBcQ4dn0fO83LD1CU0pQXT32cRBgjTltqs/3KMb+cnZRtuWAocRlDcFquJuUfRAPPa
 xkyKl2jT0GuYaqb/TSImp8b/t7jNmMtzUKBG4IhEwzwb56ynPe6UTKpZTDtLbtHDOH
 P4Pn8MU05dmGQ==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210930231424.249681-1-giulio.benetti@benettiengineering.com>
 <20220101115058.0515c8d9@windsurf>
 <9c4d8993-46b2-8f1a-6aa3-bdd9957b783c@benettiengineering.com>
 <20220101210957.0fde77e5@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <56356313-5055-5bb4-e69d-c5ed8d16c274@benettiengineering.com>
Date: Sat, 1 Jan 2022 21:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220101210957.0fde77e5@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfM65d/zwU/0JJ6tJqtEvXQMG9CYRrIaxvXZ2RTlvG7trzDST7GYTkM5KCmnQriy+nobQx3J39XEEBjF+7KhRXXV5PTbtSd8aywuxzfPsqPdn1pZlJd1K
 645ptzX2vGqVUvqDmfJaB2X5h8qab3ye6NQhN2GdPT30gb5dQGLV6Pzp6D43QlwEmPeHO5fzqGuAHrHCzOSZjXeLhCrN+63jNwjHdL8JXrB9nel3Tg9/LIO0
 +7vLO2KamgU18RFNLZMpOg==
Subject: Re: [Buildroot] [buildroot-test] scripts/autobuild-run: extend
 timeout from 120 to 180 minutes
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/01/22 21:09, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 1 Jan 2022 16:10:09 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>> Please
>>> note that this HUNG_BUILD_TIMEOUT value is the per-step timeout: it
>>> verifies that one step of one particular package doesn't take more than
>>> 120 minutes.
>>
>> Ah, I thought the entire build, but that makes no sense since some build
>> can take way more than 2 hours.
> 
> There used to be a global timeout for the build, but we had false
> positives when really large configurations were built. Due to this,
> commit 86892c63f754b4f6c9a4a517fde30160127b3506 change to a more fine
> grained timeout: we monitor the file build-time.log (which gets
> appended everytime the step of a package starts or ends), and we time
> out after HUNG_BUILD_TIMEOUT minutes if that file hasn't changed;

Thank you for the explanation

>>> Did you identify that the python-uvloop and python-lxml packages really
>>> took more than 2 hours to build? I did see at
>>> http://autobuild.buildroot.net/?status=TIMEOUT those timeouts dating
>>> back from ~November. Did you reproduce the issue, and verified that the
>>> build indeed completes at some point? In general, if a simple package
>>> such as python-uvloop or python-lxml takes more than 2 hours to build,
>>> it means that the compiler (or linker) has gone crazy in an infinite
>>> loop, and the build will in fact never finish.
>>
>> It was only my suspicious as specified in commit log. I couldn't
>> reproduce it and I thought it was due to the autobuilder's host.
>>
>> And yes, now that I know it's a per-step timeout it doesn't make sense
>> at all for such little packages.
> 
> Yes, for such small packages, it clearly hints at a compiler/linker bug
> that stays stuck in an infinite loop.

Yes, that was the reason I was looking for in the beginning :-)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
