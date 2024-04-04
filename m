Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE17CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 23:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C5BF60683;
	Thu,  4 Apr 2024 23:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpkdVzKX5BXg; Thu,  4 Apr 2024 23:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9685460658
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9685460658;
	Thu,  4 Apr 2024 23:35:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D32E1BF2EC
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 23:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28C29415B7
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 23:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hl4fZxd-hdNW for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 23:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=martineau@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2502C4158F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2502C4158F
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2502C4158F
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 23:35:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A4EC261773;
 Thu,  4 Apr 2024 23:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA923C433C7;
 Thu,  4 Apr 2024 23:35:28 +0000 (UTC)
Date: Thu, 4 Apr 2024 16:35:28 -0700 (PDT)
From: Mat Martineau <martineau@kernel.org>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <034c6423-66b4-44b5-ae63-6ecfe1671e87@mind.be>
Message-ID: <3262c29e-784d-f829-9c02-573870d5d742@kernel.org>
References: <20240120011759.2454452-1-martineau@kernel.org>
 <20240120011759.2454452-3-martineau@kernel.org>
 <034c6423-66b4-44b5-ae63-6ecfe1671e87@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1712273729;
 bh=0gKGDxgQ10Qn951CwCXM0XLOu6/xOFX9u+X9kcflvCk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XqlV+3FTOTds9obnsdh8Wh+6TJSPzOUgpAUhJkreu0K1P/fyPp8KEcEA5RFOrM1fs
 s6ZAVhcUlFNDAVWIMJ440sn6pNEATEXQCA7p4TQ11GmVYd+v1SXjt4BRwKgtd8s6dY
 /N/rokcci/1cI/6v8/wbae6f4JNoJe4LSRrRXRIgCL/cKvCBHj9JBRyGpnF0Og9nXY
 p/6V26laOOOpxOeXxyrTVLmSNtucG5E5dbxDZT+rY2dPW6/taAo/szBCqrSErOE5xI
 YRVxEELvYvmNHyL5tNRKNUekYT98mkWt4zVE47maV2oqu/Kz9bdA9vaaUCGxJL52si
 ZwADtxf9E5g/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XqlV+3FT
Subject: Re: [Buildroot] [PATCH v7 2/2] package/bpftrace: new package
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
Cc: jugurtha.belkalem@smile.fr, Romain Naour <romain.naour@gmail.com>,
 qyousef@layalina.io, naveen.mamindlapalli@gmail.com, buildroot@buildroot.org,
 romain.naour@smile.fr, Qais Yousef <qais.yousef@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On Wed, 3 Apr 2024, Arnout Vandecappelle wrote:

>
>
> On 20/01/2024 02:17, Mat Martineau wrote:
>> From: Qais Yousef <qais.yousef@arm.com>
>> 
>> bpftrace is a high-level tracing language for Linux enhanced Berkeley
>> Packet Filter (eBPF) available in recent Linux kernels (4.1 and later).
>> 
>> Only tested on x86_64.
>> 
>> v7 changes:
>>   - Ported to current buildroot release
>>   - Update to bpftrace 0.19.1
>>   - Add libcereal dependency
>>   - Use new configure option for USE_SYSTEM_BPF_BCC
>>   - Update dependencies
>>   - Use BUILD_SHARED_LIBS=OFF instead of patching cmake files
>>   - Don't install tool docs in target filesystem
>>   - Propagate config dependencies
>
> This shouldn't be in the commit message, it should be below the --- line.
>
>> 
>> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
>> Cc: Qais Yousef <qyousef@layalina.io>
>> Signed-off-by: Mat Martineau <martineau@kernel.org>
>>

Hi Arnout,

>> squashme: bpftrace: more review fixups
>
> And this shouldn't be there :-)

Whoops, sorry about that!

>
> I applied both to master with this fixed up and a few more things.

Thanks so much for the review and fixups, I'll take that information in to 
account for future patches. I will send followup patches for the latest 
bcc and bpftrace versions.


Regards,

Mat
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
