Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D52CD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 14:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99C86F813;
	Wed, 17 Jun 2026 14:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nuppFAVrs0W; Wed, 17 Jun 2026 14:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F016F77A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781707381;
	bh=58xJ0fJMVapyqZLaexZ6B9xBTKLetaAnBk6jgReaB8A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fm42hL5jkZtaSFVF/iEumYw6MsJE73tleQCAatGnuMX4XFaa+JlJrWTAVJ1YE0GSO
	 eqf0eMe+VpYlOMt+vVBTiBSd56Qv2sEUV+ufvHKuqrBKhy0a65w+p4owH8JyM/RyIJ
	 DSBEdRZNoz7av5WgRpjNQYnbhstTZ63dPuAVsbww8YdXyU9EGMDnUPwlFjvZJiwTg8
	 wTZ0Qkok4gZN5HRAgPP05RFDvn+bvXaKW/++wTZNLF2Gm38An6P7KuoNm9LvapvKwl
	 J5kbzUlfPe+byVxojsIliBLCIS5xzG9bOoaeLcwhQ+9scmtKFCckrJHJJYLfW0DS/l
	 qXHCRaa+Yp+Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F016F77A;
	Wed, 17 Jun 2026 14:43:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2E03D8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C89C24EDEB
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtWvQglfn20d for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 14:42:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1287E4ED18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1287E4ED18
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1287E4ED18
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 14:42:58 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 608DD2C80C5F;
 Wed, 17 Jun 2026 16:42:56 +0200 (CEST)
Message-ID: <5b4df693-df59-4fc5-8a2f-a047eee3b386@bubu1.eu>
Date: Wed, 17 Jun 2026 16:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260617143527.1442235-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260617143527.1442235-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781707376; bh=pdqV+1hU8SzwqWtuAKSrDr9WNvmNYU03KTo8RmWafYI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=hyR8lQS4gS3367Th9v1QCbqslLJBVNz6vYsqBNjPX6FX9LLvWPHPI9sWIssBBDagD
 7vKFTD3058MwyYXg6C9RAcPzFLKk2/kJvYVnSBouZTc4uJ/06Id5Hmt/w0n9hqxTW3
 k5kQAjIEIzL0jesKSs29oOOS+fQdFiRgPlk46mEGTPysu38Vrol8S81dgs1u1r4C8O
 /slYiUYGSnybLtvceXEAGnK3K+Q10ymjEXsiHA8nsqUZHY1clmUzNvglszORuFLHl4
 eO4VThq718Y62YlgsNlEm7tWFtRtme20DRJKP31sfJecg2T2iSGDb1KRkKeqXw0wxv
 4Pkp0F/9KY0JQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hyR8lQS4
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/migrating.adoc: document
 iwd network config change for 2026.08
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

On 6/17/26 16:35, Fiona Klute via buildroot wrote:
> With 8536a5d04a6a83d9ec4b4922b99c14a7c4a8ae92 the upstream default
> config is used, changing EnableNetworkConfiguration.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
