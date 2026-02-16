Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B6E7BDA3
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 11:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A336E80FA8;
	Mon, 16 Feb 2026 11:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Duzh4YJwwASY; Mon, 16 Feb 2026 11:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A20A802FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771242562;
	bh=XEKT5fmdk3KA3Fs1kPa6AH9IrkHvX6S35m2rBDdFBpc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kwcad6jtMhGjAGAjmSdyd4ZxtD9+rIDKPnvun3QqN/R/8W+1+zg+lTjban6vvbHLs
	 KxTxZeljDE92JMUy9yBKsyyyobLn5OpYt3r4O/pEaN5VF+2fzraVu7xqnVCap8ZKNo
	 WVD25dRqYxqClcp26btFsu50o9yZ0LLt67B/Rj569Xt/IlCns7jMOl8qov36fNS8+M
	 o5wNbmdqrzT2wxJCbh41fXwyBCJAqeBqVLMf/PC/LCiTPz4F8btdww7GzHr3WazwQL
	 YZ+NsIXk7P8E/b5r5vnJo4tigc8MYIveiQfRwl6LvYrjbuQRq1uIgAgEGA6Wnvwb/9
	 OTNySBI7t6SnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A20A802FF;
	Mon, 16 Feb 2026 11:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 302701EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 211E640603
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7xrf07v6_6s for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 11:49:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6212140137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6212140137
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6212140137
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:49:20 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EE1472C836C1;
 Mon, 16 Feb 2026 12:49:17 +0100 (CET)
Message-ID: <60317d10-8c06-4383-ae02-080b2905d394@bubu1.eu>
Date: Mon, 16 Feb 2026 12:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260215213913.713705-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260215213913.713705-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771242558; bh=aS8vGdWlwQSvk3kjKsfgmR/dT0za95Y5cqkHTM+HO2w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dCbZezPUs1thqelJ0o1zaSxAhBES0pno3ftq2jHR4heOhkI0r+NWMjmYChBxe8nwk
 XYoSbcW6EkwClQgsC3dvZowBBqOs9asoAlplu3MZEbWFId9zfsJP+DW84skFUKYddw
 x3rnQ0qf0o2EI2sY2xM2ACciKFZ3p4URNMsE4lXsUnwgEcfZIp2YfXSS8f5jK082cK
 GmZn1ngplfKsJwBj3Xjg6f9tXgoW/Sd6ZxnKZHT3j0v4fZd8GeKD5YsNGaYsVbsykw
 OE9OmP26FKGUGYXzHBxo3wsv3O04uQQ6dYYaCsqaZpUsyl0CUbWlqqqdyKRsoZgiBs
 34jFE4U2F2pKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=dCbZezPU
Subject: Re: [Buildroot] [PATCH 1/4] package/python-rich: bump to version
 14.3.2
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

On 2/15/26 22:39, Fiona Klute via buildroot wrote:
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---

Series applied to master after adding links to release notes.
Thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
