Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E27E8783A
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8670481A92;
	Tue,  3 Feb 2026 14:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCJweeUvCUJP; Tue,  3 Feb 2026 14:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9511981B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770129265;
	bh=tZNSAo3VEeN2BaAgkWZ5WpQUNNvnEYjMGddMNM4elew=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Z4L15UlEJYDXpxjYCtklaAU0f945yRtCbYOY3r4wFumOCUkmIQVQzuko1C6feENy/
	 WP4oNbBX7Cx5CMGtzyRh5g2HSajaZ8VX7tBXunflz8xB6ZQIJfDbj+bkMN8XirpZFJ
	 Jp2EqnvTAdVChZQu09lAfDoDFgwSyXrlv8ISpsxJBDqJNlVCoOQx0kXkbc46GRy/l4
	 uZXTeQi2OdgSJzA2QaIwvbXJP/GgY8AnHWMRs3rGxVDJwiD0kjIt0KUTpmMcS3/GWa
	 00k27taC5//IxQ3Gcd+tpJo7jKjXUDoK3TAmPf2HRc9Yc4muO8tET2q2Q+kDyQHiYA
	 xJGNTMuMH77Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9511981B9A;
	Tue,  3 Feb 2026 14:34:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB0EAF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C1481A92
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2j8YmBPjSF3H for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AFD081B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFD081B9A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AFD081B9A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:34:23 +0000 (UTC)
Received: from [192.168.129.52] (231.94-243-81.adsl-dyn.isp.belgacom.be
 [81.243.94.231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1873D2C83043;
 Tue, 03 Feb 2026 15:34:21 +0100 (CET)
Message-ID: <8953378f-9fda-49cf-a3de-6c73e6069032@bubu1.eu>
Date: Tue, 3 Feb 2026 15:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260203141627.C96F88395B@busybox.osuosl.org>
Content-Language: en-US
In-Reply-To: <20260203141627.C96F88395B@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770129261; bh=+Xfz7Psm7YC7OVpatiZ145GtTTIWI2i8E9zJd9dIkgY=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=k8RxrDbjwgksvzE1Ay5wW2LrjJ9fbl+yVaGXsb59GFghhQBAkp0VjsHPDmSedig4m
 NfmmEKrq1CfUZqsOSI2h4fSP9gJqzu4g59y++6SFhEc3iddPRBo8Cn3bz5uCObfQwE
 VCczPpQNu5SmUksHzJ9pgn8Eb4gGZO+KrCcBkkMYYyGucboXV/88TLPFlXTJ8xGZSw
 Pb48wb2KL/YyjCchZRl6mJNPo0vhgvacjjfT6wbmBJRf4rI/jFsRkD+DiyY5B78+5t
 kFqycE1j1nOzUbk6e5IR5+OxlQi1svOVHX6Y1mHOWhp+iblQ6B7kte5Y54kmyVIdJJ
 Rmq7mcxt51pKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=k8RxrDbj
Subject: Re: [Buildroot] [git commit] support/testing: python-requests: new
 runtime test
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

Hi Peter,

On 2/3/26 15:15, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=425abcd025374e6004d328b190ceb443fde568a8
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> [Peter: Fix flake8 warning, use http.server instead of relying on
>          connectivity]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
[...]
> index 0000000000..55a05d3910
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_requests.py
> @@ -0,0 +1,4 @@
> +import requests
> +
> +r = requests.get("http://localhost")

I actually specifically wanted to have a test that checks if requests 
can connect to https and certificate checking against ca-certificates 
works. And for that I didn't see a way around connecting to an external 
service.

This is obviously good to have in this form as well, but now the change 
in the second patch in this series would be untested.

[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
