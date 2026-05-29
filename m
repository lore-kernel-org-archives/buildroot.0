Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFFCCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32BF8458F;
	Fri, 29 May 2026 18:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUTLizHjlcrS; Fri, 29 May 2026 18:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A93A845A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079178;
	bh=BTIvXMjuL2RsigXMBm4tWnbSBpW29bOuNA1cb84vVc8=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f26zUCYB+JLRWNa/hCruylrNT8l0+U1mCRheoeyRrl83RNh0GHLTP4bJ6ZYGEGhDk
	 KqJPxjp9UBDxZ0HfEq1Pzsj2BeMx04miAZ+sOYrQ6LbhLoch2NQOjyFLLbWMViu8Vv
	 JUpHP/HtVbeCyNTaMfla/TPvMoN59AN5W4mJAhUniZQEwso/j8RMYuNb7OkVsXryXC
	 sXudkast+844/ZVVjAWxdf27tcKG05JG8YyovblFaMfEjX77PoQ28tO7SoTsg/8iHw
	 6s1aK3/D7LbRGk0ybN6z2O3GLam69ZUqF/dy8EozBApLmLt5m2HGjqw0lIDVpmccMT
	 xdE2itRfLgb1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A93A845A1;
	Fri, 29 May 2026 18:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9ABD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B69661634
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-Mko2606K5P for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CCAC610EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CCAC610EB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CCAC610EB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:26:16 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E31CB2C84123;
 Fri, 29 May 2026 20:26:13 +0200 (CEST)
Message-ID: <49aee293-7af5-4e38-8ac1-10b8b66078bf@bubu1.eu>
Date: Fri, 29 May 2026 20:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20260526201622.375239-1-james.hilliard1@gmail.com>
Content-Language: en-US
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20260526201622.375239-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780079174; bh=7o3dY81aniKPoQlzW/h/cv5C+xWF6EWs/CuFxgkeB5E=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=rQ22F2VwXNk5MAqeoHtdeb9fJYjEiShPdhY+vJbLO8/P2boxpk4fU/1yJYt9U9hRF
 PMqhRj0BK3Esip6KxaOIYWef/eQ81cCLzSTVCvjIOdzdC5TOjARJaSyXvHtOu0sO/B
 IbLm6Im0jbla/WjK9vN3FY75Z+Tq+mUp+Cw858Ra6Y182eVvNYNLBCW0qyeijnoXiZ
 HsnTVScfQm+azqVcWcI8pizoweiCKgFBbJtzsV6RTvI7Xu+jZmkZKHb0kXiU69TI0z
 Pgb2s43R3k3eyPWjDFwGE/lZknkAThjsfyiS74QRLPncODmzKaJi8xTnI4+mvGlc3e
 5j5Ksxi3vUuJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=rQ22F2Vw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.136.3
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

On 5/26/26 22:16, James Hilliard wrote:
> Add new python-typing-inspection runtime dependency.

It's not a new dependency (as in added in the version you are bumping 
to) but was actually introduced quite a few versions back in Feburary in 
0.128.2. This wasn't actually a problem in practice as fastapi depends 
on pydantic which already has this dependency.

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
Applied to next after clarifying the dependency situation and linking to 
the release notes, thansk!

Marcus


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
