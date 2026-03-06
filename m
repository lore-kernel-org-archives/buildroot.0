Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628CDF513E9
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 00:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08525836C3;
	Fri,  6 Mar 2026 00:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBQfmA68txzY; Fri,  6 Mar 2026 00:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73037835C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772758166;
	bh=btjBaywJ/8Ap0Dti4rjr3OHi1LqXfKMX3l1KVgQU7D4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TwNrOR4zdMIDMru+VRRYu6ifMD2b/LB2/ZtQ5sa0xhyEegtdQ3XfQF9P09fJj9tdV
	 Lev5z9r6SN2vk+xH4ZKOvz4aX/Y2I4S1CvGc8LU2T4cL0/u1NJ02DwU7QgCuJvypcE
	 ERi6IIb+nTvaLVRAaaQ4Th+xrC3w0ZuWd+HHJEBoDaK9OkAouzlpl+9bBMXpYQO0Hi
	 vKfETQ6M1TxDWzTXPdv/6BrsQ6X+N3/TvrdcHeRsXqBXe1QfN93tqS1pbZF9/aWd1Z
	 p/+3kDjaDTmbidarjGwMXsVnDQv6OwkJiqYn/dcCdM2ynAWr+k9cu+dFWmDmJGglN3
	 jZpBFEcdjdRsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73037835C8;
	Fri,  6 Mar 2026 00:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDF2A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 00:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B33B3835C8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 00:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGvMJA4UvSWN for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 00:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAEF5835C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAEF5835C6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAEF5835C6
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 00:49:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1veSJJ1nGl-018LMT; Fri, 06
 Mar 2026 01:49:10 +0100
Message-ID: <5c104076-e333-42a6-b278-fea3ec139fb9@gmx.de>
Date: Fri, 6 Mar 2026 01:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260305002951.3614234-1-fiona.klute@gmx.de>
 <874imuikpx.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <874imuikpx.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:BWzUNp5JL4o3cj3ZYsLLnY5H6FX6yfIekArCgM4MZf3oJjglDte
 Dbb9DLiWIDgjy0ocO5kb2h90LLVA5IjNzvsKrp6LVjf7hZyuDdZpbODZy+e+3qvMkeVeqmX
 3k4h0MNzP1UJC/4ZAYZEH+oqZX74YgWT9hMBLMJ9sHNZ3V7bk6bqB9w68RBirg85FGmh4eT
 2TRD1ddbQEqpeRMdxj/VA==
UI-OutboundReport: notjunk:1;M01:P0:pq4cE0WcdLA=;EMF0YirZM5Ilgbiwn5LLwh3+guv
 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
 1hYJ72AIPnmzsFVHwVc++TjRmfpnG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772758150; x=1773362950; i=fiona.klute@gmx.de;
 bh=AZUT9X1fKSUgr5yy4IdNesU88m+DFDDckfOwFiiuhss=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MIpNchbNVzk6uqtMpBxs+Hz//WB3kkQf2aoYmd53NaUePMfbrNcryNDC6Aae0y56
 R7PMlPRucm66Zs3Dj86NOJkNa+cEkyeqorII3gTN1CJgk0fQSbbYdHDyW0zu61W9X
 FLIhDqArBq4R8Elx4Idiwm4pvxkFuoZ7Pwvqd0NvkqZ/NMN1wgjoXXRzMGyUeMUgL
 f1Yzk5/AYllUKLp8CG9XZ0j33v73Tx34DppQbKjQxop4L009VQn7r9KuX/p4JG82G
 Ne9iNfaJnqCr9W1Keselo1dQoZzD92aBDILJba4GCSNbIHxrcVH84qicvixbXl7Pt
 B/HsZO+n5iAV6DZyNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MIpNchbN
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.5
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.03.26 um 12:23 schrieb Peter Korsgaard:
>>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:
> 
>   > Upstream changelog:
>   > https://github.com/plougher/squashfs-tools/blob/4.7.5/CHANGES.md
> 
>   > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>   > ---
>   > The issues in 4.7.4 should be fixed, hopefully we can get 4.7.x into
>   > Buildroot now. :-)
> 
> Committed, thanks.
> 
> I see that there are now some options for reproducible file systems.
> Maybe we should use those in fs/squashfs/ if BR2_REPRODUCIBLE is
> enabled?
I haven't looked into BR2_REPRODUCIBLE too deeply yet, but it sets 
SOURCE_DATE_EPOCH, so according to the squashfs-tools documentation we 
should be good implicitly [1]:

> As an alternative to the above command line options, you can set the environment
> variable SOURCE_DATE_EPOCH to a time value.
> 
> This value will be used to set the mkfs time.  Also any file timestamps which
> are after SOURCE_DATE_EPOCH will be clamped to SOURCE_DATE_EPOCH.

I'd be curious to hear about test results. :-)

Best regards,
Fiona


[1] 
https://github.com/plougher/squashfs-tools/blob/708c59ae80853b0845017c33b42e56061cc546cd/Documentation/4.7.5/USAGE-MKSQUASHFS#L493-L503

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
