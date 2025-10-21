Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFB5CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E413402E9;
	Tue, 21 Oct 2025 12:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNG6k4N-19kx; Tue, 21 Oct 2025 12:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A68402EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A68402EC;
	Tue, 21 Oct 2025 12:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 975A543F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E7026069E
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH9yh0jpP3g6 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63A3E6068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A3E6068D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63A3E6068D
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:07:43 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 347D52C84551;
 Tue, 21 Oct 2025 14:07:41 +0200 (CEST)
Message-ID: <932c78f7-947b-480a-84a3-41a87dda3fd8@bubu1.eu>
Date: Tue, 21 Oct 2025 14:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251021093500.744569-1-buildroot@bubu1.eu>
 <20251021121609.2a9d08be@windsurf>
 <4b8956d4-d402-46d6-a20b-0c380b032598@bubu1.eu>
 <20251021134103.6f1e6693@windsurf>
Content-Language: en-US
In-Reply-To: <20251021134103.6f1e6693@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761048461; bh=amK9kYPEewOwEg7yw8jyByy+0pzN3deF0pTD9tKneSE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=oeEf8JgGl2cKuA2W8RswJnAniJR7xufizn+v3h4k8ztfOkznnGlAWQPLL0t/CDFI7
 RCzBpgC67Nb2B4YA6IjhXrdmGKxX64p7lakutHS/BQPbtTeC71iPxA3FGlKBwINehV
 oro5vKkqqmqdXNLD0VkOxxTE9KnK6F4adef3h6nMykUEQ7xTnDpJE4Gxg1XTdzlGxa
 J6HTI3AEFQTTNyc1aGPicZv/86dGXA45haFvNWoVokJcEoH3RWRWqtP+rSI8hOeIFl
 MSnnFeKhcuqSC9LeB6SfV7hIGb63NhhI94acYq9JXymozkSwFD4hjjyctEOEopSWnA
 LSpde7IXvRoSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=oeEf8JgG
Subject: Re: [Buildroot] [PATCH v2] package/python-diskcache: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/21/25 13:41, Thomas Petazzoni wrote:
> On Tue, 21 Oct 2025 13:31:14 +0200
> Marcus Hoffmann <buildroot@bubu1.eu> wrote:
> 
>> This was, unfortunately, a very common pattern in setup.py builds but
>> it's going away with projects switching to declarative build definitions
>> via pyproject.toml. (Which diskcache hasn't done yet, but I assume will
>> do eventually, maintenance is a bit slow currently). setup.py is just a
>> python script and python allows importing modules from $CWD, even if
>> they are not installed. That's how that works in general.
>>
>> Now I was confused why past me claimed that the same doesn't work inside
>> the buildroot build and the reason for that is that host-python3 doesn't
>> build with sqlite support, so the diskcache import (at build-time) fails.
>>
>> Perhaps a less hacky, but also more wasteful, approach to solving this
>> is enforcing host-python sqlite support is built when diskcache is
>> selected. I just tested that and it works, unsure what approach to chose
>> now. WDYT?
> 
> Sounds "meh" to me, because important diskcache during the build is
> actually... useless, it's just used to retrieve the version number,
> which certainly could be done another way. Having to build host-sqlite,
> and sqlite support in host-python just for the sake of doing this seems
> really wasteful, and is generally not a approach that would work well:
> imagine something more complex than diskcache, that has more
> dependencies. It means we would have not only to package these
> dependencies for the target, but also for the host, just for the sake
> of being able to retrieve <foo>.version? Seems not very efficient to me.

Alright, I sent a new version that keeps the current approach and just 
explains why we do that in a bit more detail.
Like I said, I expect the package to switch to not using setup.py 
eventually as well, which makes this problem go away then.

> 
> Thomas

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
