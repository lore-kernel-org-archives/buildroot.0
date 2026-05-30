Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92058CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67FFD84FFE;
	Sat, 30 May 2026 08:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8eAxvyxRE_v0; Sat, 30 May 2026 08:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CDE984FCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130121;
	bh=hRXFFddfmLZ3HqaZQz8oj2Y1eh8tJPw9NWMK5+dVUeM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=qUYEzp7lIiovIYYkKp/7sjMQTSaZ5Coei5v/lhdXwk++rRbEfwu/Bdw9djkohra9/
	 D4jmhCZ18FEmMzSX5n42zdHsm364fwoR/QJxThwbh4z9n36uxdPGk39M/PHVe9Y3kI
	 sHVFV+P2tYVs6i5VTVjJw/2EsBbGMs7ggBYsi4g++taYssJ/jq7wsuxgED9FMeI3fz
	 8MQFapwBbXDbPo9FMaY2oV50njTHW53Vzyd+zmLSKxCP9H0fUGaI+BZKfRCcTTSMvn
	 UV//+ADPXDAoh4xlZg20o6NeuiyfkJw0dRtfg3MRFOhiYGUWcKeBWp3ZmO4fNOaDTR
	 BZN0r9t3BnyVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CDE984FCD;
	Sat, 30 May 2026 08:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D65AD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A6A461CD7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ComL2ReY64G for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D79160F4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D79160F4E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D79160F4E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:19 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 342D82C89063;
 Sat, 30 May 2026 10:35:17 +0200 (CEST)
Message-ID: <0052aa9b-b1fe-4748-8caf-07c9b994c140@bubu1.eu>
Date: Sat, 30 May 2026 10:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sergey Bobrenok <bobrofon@gmail.com>, buildroot@buildroot.org
References: <20260518132112.852142-1-bobrofon@gmail.com>
Content-Language: en-US
In-Reply-To: <20260518132112.852142-1-bobrofon@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780130117; bh=URA2eI9SOE4Ds28eSfSiixauT8KFBlE6/qYYDyeHyRE=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=UaYQqQ4hmh4M3tg5sSyreC7r4Ll+ME3cJen/EV7Hup7jAWJZElpaIc6/kCuzRJm/4
 apyuu94dzi+8FeoUJsy+wmSwU8biuhgvnJ3rpMrBGiBmI/4aTvnLb353+lwQBwRDpo
 qKwEcMdQfn6HrMEu28HKR9COOnDDw8aqOllo3Rmbtl1szv6VNIIVBEgcBorYv1tZdG
 05drPmUwzimHknapjtKLDGl5mfXZLpaqN87YyUI6X3JSXUXBdRjtZgnxL0++9nYkUZ
 K9+nPPpunA+8uzszICmbWfHVkEZfovbyvIEIhxr1JcOvfZE70fECGhnMXW+JuwS4tX
 nQD8zZip+UwaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=UaYQqQ4h
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 2.3.0
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

On 5/18/26 15:21, Sergey Bobrenok wrote:
> Changelog:
>   * https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.0
> 
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
Applied to next, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
