Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2784EA7190
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4B8381D73;
	Sun, 19 Apr 2026 14:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWIbB1BpUVrd; Sun, 19 Apr 2026 14:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C21881CA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776608718;
	bh=Bw0PTs1eNVHR/vu7w+oCAWc5pHDEhvqhUL1eE880YH8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q20XDMzetnOd8QFWx9JWfG4Bwaiu1nKltcZWV0JgmGpaZ2hVG3dxoZVG0rs6nNS0X
	 y8wv14cr+AgugCizsHDKUjdH3UsQzgmYecPzDFvHADnXaS9bO/K8saLU/FmOC1l3GR
	 F1OMeKHdZqFc/o5KrvxWYP2HAWV8ynuRqcMO2Jmzw8H5eXmsXX8jPtXTQ1WAtat8OU
	 t7mpfqg7ZOdAcPWasA9ltfiDnmnzFkM9Sasx9gP5KSFzroHm9tVbSYZzOE1QMgaWS9
	 2BLXCZ247nDablRbpqmSQtyB12aossMbYDYw6/G+GFXs/uoAavAH6lZqRVqvRqQ6NC
	 ZLWpQZEL3INXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C21881CA3;
	Sun, 19 Apr 2026 14:25:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 979FF259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95E6080F73
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rKsiIZqLoT3 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:25:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC48980CF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC48980CF8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC48980CF8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:25:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AC2F113F8A7;
 Sun, 19 Apr 2026 16:25:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 16:25:11 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 16:25:11 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260419085623.1200423-1-giulio.benetti@benettiengineering.com>
References: <20260419085623.1200423-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <557b2171da13bdf3cebb5653bb0191bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776608714;
 bh=eXEr8aA/ky1Cym/Q4Bt8NM9bPWzpDCmamXEinUqH88k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UG/fhHzsvLxE4Y49r+v9yeP0n2BM20mnDj3tRAfgSTuzXbY1kwsrNLDOpMEQS/lOb
 H5gQh5ilHhlNZ8QXhAqmzpnN0nkcmrKtdreVh/Lexdn0j+X/FjKd58O97Rum+cCiNF
 1bim3M4MPEHMdUQCpnrYqA9cBru0h4/jWZwTD7pbLCRsI7Thg5SMDFJqui7t5ek/10
 QELExDpvrhUbn3iT2o8CvspUPu7shxsX6XXmhVv/3x4D7ZODknOSFs67taRiR9eAFA
 XACt3VzBY/b1HIO+9dIO/0nJM77cb+R38iZMxdZAVRuXrY3yZpZq1H6gOkv36qZWzY
 9hn8DyMKKNc8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UG/fhHzs
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.123
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/04/2026 10:56, Giulio Benetti wrote:
> For release note, see:
> https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_123.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
