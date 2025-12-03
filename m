Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99135D15DAD
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 18:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492E6841C7;
	Wed,  3 Dec 2025 18:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ycxpw31bNXsY; Wed,  3 Dec 2025 18:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226068282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764785352;
	bh=eXxefqOoBEMRTZdILUALQrfC4IRs49AI7/2dk20l+kA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pPDwvEnSE5dBhTkXjgwntv9BMc7lLNPeWC8cgujH93qIJdknefqW1umyiPtQRC1r2
	 3God+oPlJ+K3+lc4ixochT/KEPw+eNnP012K001PpQYaHt1qODi+zu1hB9qgEW25WJ
	 L9R81Kj7AfRceGto4vsUzWxrGe/D0yubAlpAvB6MdhxoKuXpwyjBK3+53I1LXht98W
	 q07KcZ20PerMHScetOVWRkCyuB2A7pQg27H4wIgHeD/PQOxQzLzYNk/JkJagU7JU3G
	 pnIz1RfVqE3iUmytGbp3YMLegpDFn9ehVmcVrxslg9uVsCpAjSC/Af5/ZBoohdohPU
	 rvd3+2wrxisbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226068282C;
	Wed,  3 Dec 2025 18:09:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E314ED3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4D26413C9
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7DauA2pQrc4 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 18:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B18C40E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B18C40E60
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B18C40E60
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 18:09:07 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DB4542C88E13;
 Wed, 03 Dec 2025 19:09:04 +0100 (CET)
Message-ID: <136a6904-8955-4bb9-a657-beb5f515817e@bubu1.eu>
Date: Wed, 3 Dec 2025 19:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251203180334.2117343-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251203180334.2117343-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764785345; bh=limfzAiycAWWaOe/MF29QppaUMrLY1CJ3arcl0uqTNw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LvOpKb1lZZAOGZp5ZadsUBIzk4YXVrnbFMFn/iKCUych1KCj5ZAKk9VVuG8HJiYZZ
 CJHX0Az2XOIGs7hkW6qGeq4kFJOj0KTiPy7BODt6wktW765yoJcSGX/C6uZ0WaB+vY
 BSv5WsRL7DcYTy7KgQFakr22cQh5QEvXvJoefCv9q3qwrnICEjNOQfpSEqdSwYEYfB
 QfkmUSJPPXjYwyRcPve3i1qkNGj00dNoq5d0Cs+7POrOG9T//i+yVU/7inyvENxArA
 GkBYat770Tqg+O2SxOjtsPSVBrIiAasTpWcNuTlpT71xAy39rjQRnPY2oXVlUM5upo
 2dR+g4Ryan4LA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=LvOpKb1l
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.13.10
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

Hi Bernd,

On 12/3/25 19:03, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://www.python.org/downloads/release/python-31310/

This should probably be marked as a security bump, it fixes multiple 
security issues: 
https://docs.python.org/release/3.13.10/whatsnew/changelog.html#security

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/python3/python3.hash | 6 +++---
>   package/python3/python3.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
[...]

Best,
Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
