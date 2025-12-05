Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE880D2F7CC
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD7B61CCC;
	Fri,  5 Dec 2025 12:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0utiCsv_Acx; Fri,  5 Dec 2025 12:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8435160EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764939074;
	bh=Z2TOWyj0DvxCDsyZQDevfhZRjSfdnAt6nkeiVsy4LYQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eLD/30jqV5OypqLbGUe2sKMzbKIgJ5D6rU8VuN0xK94udUF9pZmJecWwBT0M6Cl7I
	 etl3eRJpH9s3BrkSo143jNoyEyGbD44gUgImaI6HhZ8gb38yE7IYpzuvYRR8yaQK6T
	 iCjvYWkcyF9D5LMkYh53nYuhAmHGAzE0h9HkP0/WjzHRVQKLGgQiqUdOqpw7z3vrNb
	 49tH41Jn1iTKbPYUizhG4a/iVeCscb/2ipeey2566nxY77ZYgrLkyx+pliHjb/wCJO
	 asTgq1BMXFcUieRKQnhQUoKSUNIhqbS3N2Vbkd7yLbMz3f4kWTb3dzV4CCu6gjYwU2
	 SKtBDXV0Oj8pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8435160EA5;
	Fri,  5 Dec 2025 12:51:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31552E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23C3A40390
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9CPSwzIL1Xh for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAE59402C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE59402C5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAE59402C5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:51:11 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B40A02C89475;
 Fri, 05 Dec 2025 13:51:09 +0100 (CET)
Message-ID: <38b18519-e386-42d0-83f3-a6409ec9df81@bubu1.eu>
Date: Fri, 5 Dec 2025 13:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
References: <20251124160029.3122459-1-buildroot@bubu1.eu>
 <f69cf684f6b0b903864c5b3d74b22703@free.fr>
Content-Language: en-US
In-Reply-To: <f69cf684f6b0b903864c5b3d74b22703@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764939069; bh=JJgw2B06VC12nI9ZtTLnHc7LvynRoyDU1W7xCIkYZ3Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jpLQUWiiPfKOWbKl2iDdrPe0VYRzX/JMtvx/ZcatILQHAMfDjm9fJHyu9xMAwqhzn
 XR8Yt3aLfaYSc+91yeDdjuanpDgqKJVx4XBhHT2sThqHeUwPkND+3YsL0ZawGNHMnO
 /AriiqgiVBwhEYHVUjR5YwjMUbF1UjrM673GY+P05ZQUtgbpv6Y6cbxLbjb1ispUlt
 5S1pUH0qZrja8/7y+0Yd4jkBcyE4bWzTImvCA2+hlsA43hIeesDL+iJ2ofU4KYKeya
 nboWhVs+5SRaLBSE6O7vVCjf4RlrcNW2CcZFY/BB1na11rjNuf4TvQFJOo1Lh+jPk0
 Y3RXx6nHP2pzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jpLQUWii
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.121.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On 11/28/25 22:00, Julien Olivain wrote:
> Hi Marcus,
> 
> Thanks for the patch.
> 
> On 24/11/2025 17:00, Marcus Hoffmann via buildroot wrote:
>> This introduces a new trivial [1] runtime dependency (annotated-doc), so
>> we add that as a separate package.
> 
> Any specific reason to introduce this new package with the bump?

I think my reasoning was, we only need this package for the fastapi 
bump. But nothing breaks if it applied individually first, so sending it 
as two patches makes sense, I guess.

> 
> If not, could you please split this patch in two: a first one
> introducing the package, and the second doing the fastapi bump.
> 
> Also, there is a check-package error. See below.
Fixed in the second try of the new series I sent :).

(oh and also fastapi has released 11(!) new versions in the last 5 days, 
so I updated to the latest one now, but not idea what's going on over 
there...)

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
