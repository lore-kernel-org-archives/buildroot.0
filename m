Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED854C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13AC85109;
	Fri,  6 Jun 2025 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waeLryiFE_hv; Fri,  6 Jun 2025 20:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC86885101
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC86885101;
	Fri,  6 Jun 2025 20:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A724C1F2
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D92085101
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJRgaysqhN5s for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 20:02:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1472850E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1472850E0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1472850E0
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 20:02:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D7DF8B00579;
 Fri,  6 Jun 2025 22:02:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Jun 2025 22:02:05 +0200
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 22:02:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250603-bats-1-12-0-v1-1-e008a8f59265@collins.com>
References: <20250603-bats-1-12-0-v1-1-e008a8f59265@collins.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <adc1d8a9ab70d2613f025d1b207427d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749240127;
 bh=+BwvqsJgLupiIjHtlZFeCZoN5mtozf7gOxlGmapGK74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=muTBVn53Oq4gocCr7zsyImqQlU4tMlFJm187v82SS2B6teRdeOjr1d4Mg/m8UhrbI
 M1bgpMKhVfInsbjU6jCPxidoacQVTYk6mqdWV1D/ruY1D8mPw44iUSNkDs/STqCfb4
 q321meGavohv4mexrBq8N6xdz1I2V0xWFZGP9khlM4degoe3toaa5Ot7rK3gWQ3QSb
 ycnxsQtnwzACyo3ZvUdRdaYb3ArHCWvk3f1Ldet7y1iFBtx9UG5T+C1uoU11WZNDjE
 CwllO33mhXp2hgf7HRz7jkdopW43TQxZqsUExBhvuJWB/ZoizN/YW8UsW91iiPnVr5
 60EHvuCrrpCKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=muTBVn53
Subject: Re: [Buildroot] [PATCH] package/bats-core: update to 1.12.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/06/2025 15:58, Brandon Maier via buildroot wrote:
> Release notes: 
> https://github.com/bats-core/bats-core/releases/tag/v1.12.0
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
