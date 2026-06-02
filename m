Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB54CD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 06:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F63F40EB5;
	Tue,  2 Jun 2026 06:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ea3T5K5w4Grp; Tue,  2 Jun 2026 06:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5727540EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780383206;
	bh=dAONzviM8pFt32GF5RXA99ekTTApgE4ZMK+8WYq8Jg4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d1tZ0hIv0Ah+TUuMOtU8hIiWCwH2LHN4RPsjzDLMv2c7mlSf7CC5iHknnVJURo0Zj
	 XEIZaeazrBQWGYgJj/8YpKYnVJNs7CWXZ8dA6MVxjePqur+LfU66g19FNbKfBC6yHN
	 OeS3piuRgEWJx3YQICyB5d9+VDIz1IxWob0UlCyANtY1UFAXLmMF7c/IYN4XwnTL9+
	 XW8E6NZdEr7QjcKXWzLzTW98ts34WSwHVEkswCEOrTBskScLLX3aNhb8oTbX1wkF1X
	 QSu4k6uSyk5oeV8sm0chn/Q2WJnJHQqDmB6SVBFr5TnUVplsEZcjUzndDSUWApoKQJ
	 E6sWlVH5GSJCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5727540EB2;
	Tue,  2 Jun 2026 06:53:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C46E4D2
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 06:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E67F660A80
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 06:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBW23A-r-GlE for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 06:53:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D30C60A7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D30C60A7F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D30C60A7F
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 06:53:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E86D6B97C729; Tue,  2 Jun 2026 08:53:20 +0200 (CEST)
Message-ID: <cc4e5076-73f4-44fb-85db-09444ac824f6@rnout.be>
Date: Tue, 2 Jun 2026 08:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <59f5a749-6fb6-4459-a54d-2390beb532b8@rnout.be>
 <20260601210457.16137-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601210457.16137-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780383201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=RF5qUUd7/Xrk662Ymvu82DivQyYIPee7FSN2ZRSQhX4=;
 b=h10fYaUajO0wIAlHbk1fTFxZynp8G9gzTHNAxG8goaGuOj/3p1u0PU2c46ZVy/R6iKCZ6k
 uQkWnBORS4JzRSAgV0YvNpEtDg3mmQWF9yDIN6zLpTaTH6Q4NzmzyCrUy8712odtTqMOs6
 wLqeKEz5MaSj6kaIsbkpgSwElMbnCI/deKgHrbWNaaSnoU9ZmjXu5tvcVwVgu0ALcCyDvU
 ihBicXNEXFb6yKWGYxjeiqkNxMG/6iPRBCW1DefiNpjBRxvQpZkZ9G4Ku8coP500Xn9Mbk
 nYzCYfhScR1MXh5YZu0B8icW+2nBEiFFy3zNuGHZK/crU8TdBaoi2XlI8ZOBMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=h10fYaUa
Subject: Re: [Buildroot] [PATCH 1/5] package/busybox: re-introduce
 IGNORE_CVES for CVE-2023-42366
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2026 23:04, Thomas Perale wrote:
> Hi Arnout,
> 
> In reply of:
>>   Hi Thomas,
>>
>> On 29/05/2026 18:18, Thomas Perale via buildroot wrote:
>>> The patch `0008-awk.c-fix-CVE-2023-42366-bug-15874.patch` was introduced
>>> in [1]. The IGNORE_CVES entry was removed while the patch is still
>>> present in [2].
>>
>>   I was going to apply but it generates conflicts since we bumped busybox to 1.38.0 on Saturday (though that patch was already pending a couple of weeks).
>>
>>   Could you re-check which of the exclusions still apply?
> 
> The patch number 3 and 1 still applies and the rest are part of 1.38. The 1
> needs a renaming though.
> 
> Will resend this series to target 2025.02.x and another one that target master.

  No need to resend for 2025.02.x, just apply it.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
