Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC581C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 22:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C365E40801;
	Mon,  9 Jun 2025 22:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfVgNqUYpWsI; Mon,  9 Jun 2025 22:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E9B406BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08E9B406BE;
	Mon,  9 Jun 2025 22:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E65CD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAF5882B2F
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsOaxSIyIGfT for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 22:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9DEC82220
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9DEC82220
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9DEC82220
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:10:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 815665FFAF;
 Tue, 10 Jun 2025 00:10:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 00:10:38 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 00:10:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250603134812.2883296-1-neal.frager@amd.com>
References: <20250603134812.2883296-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a590951260bcf61021601f8bfc73d75e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749507046;
 bh=nvNmaQT1Y9GzaEgsgidd4jTVwRXIu9HLQOKeP03xOhs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lZW0J2ESNqsCJdX4RRTCOSpU6T3FhKGdlORkYbyDrW0KycFuXi/X+oo53KsumTf9z
 W+QS1CsM0qRJWAykWy0Rz2Flcfi4/z5QXCZbL0wJj+SoAgI94kEtwv0HTZMrkCoQ7/
 QWhxg1VuLUmZZDkb+/xEsx5BjWTBYxYIAVSy5SGRmLcoWTsWFSy19IcgHsszb3a1jP
 MHfvacH7RX2JWg9VgLC3FQ8ewvaHvfiYbvX+kanFYX4TMoWWFhuApjtGYVicKOwXa7
 BZg1ce3QKExZEcpsgwRx0QzPf7E0WkpmsQZkpgAOrCyXEBpNUJZSPpwPBh5BIepugE
 6rs6nfU99GlVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lZW0J2ES
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bootgen: Re-apply fix build
 on machines with modern flex
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

On 03/06/2025 15:48, Neal Frager via buildroot wrote:
> With bootgen 2025.1, the directory structure was re-done.  In the 
> process of
> doing this, the source files in the bisonflex directory lost the fix 
> below
> which had been applied on an earlier version of bootgen for the issue 
> below.
> 
> Bootgen embeds an old version of flex, but uses the system include 
> syntax
> (#include <>) to reference it, causing conflicts on systems with the
> development headers for a modern flex version installed, leading to 
> build
> issues like:
> 
> ../bisonflex/bif.yy.cpp: In member function 'virtual int 
> BIF::FlexScanner::yylex()':
> ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator=' 
> (operand types are 'std::istream' {aka 'std::basic_istream'} and 
> 'std::istream*' {aka 'std::basic_istream*'})
> 
> Fix it by using normal local #include statements by:
> 
> sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *
> 
> This patch re-adds the patch to fix this to buildroot.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/056384322246877253cd8d0781717ce495cbe769/
> Upstream: patch submitted to AMD internal jira process
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
