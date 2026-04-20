Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCC9F588C3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 12:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9BE5610EA;
	Mon, 20 Apr 2026 12:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk2820jZHuo2; Mon, 20 Apr 2026 12:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79FA610EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776688668;
	bh=zxuf0fsF+T8xelh9MjFNZ67FbWWfTOFZFzKKIs0+X+w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EfyzIf7m+3oSe25Z3sfdFdj5XCR+hj0eiA4PQzJWSKWn9j8eBjb/MLYGLRTF2VxkW
	 jOtX5Ocja/PJTVxayRkpxUQNhHv1BqRTMctjyfZFuK39+WJy3LmR2p+ONDS/lCnPjt
	 jG/t5dv51j1vzQAtw+YOewlogDHCFH6auhb1BfOKKNxoL/RB8HJ5crTt3LELAfEFZ6
	 k6RQO92zdUMw1i2RfitwaxOS0iVPaL8O9LA3XQGDYyGbB8+BVl/Xp9GX8Hv6ZiSRtl
	 kKc3Gq0GinaLfW4BC1CQramkVjn9rnM/tUiW7KJhJL5O3PtbXd0QpruofyvihSSwuJ
	 1ykDeIOq/kZWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B79FA610EB;
	Mon, 20 Apr 2026 12:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BED259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75103610EB
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtpaHupGi4dh for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 12:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B797610EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B797610EA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B797610EA
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:37:45 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 277532C838ED;
 Mon, 20 Apr 2026 14:37:43 +0200 (CEST)
Message-ID: <ae0eacb0-2de8-4160-a6ce-2f648980e644@bubu1.eu>
Date: Mon, 20 Apr 2026 14:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20260420095823.2561132-1-titouan.christophe@mind.be>
Content-Language: en-US
In-Reply-To: <20260420095823.2561132-1-titouan.christophe@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776688663; bh=2uWenO8E5l3VJ7PHh7HrEWEzlTeYEd+EYVnaAxT2Aa0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=lAT2qSUHuoEwqwRLjmkbtBWjbcFl5UWpOpb9frJC2Ld8AhDdQv866r1fIPVgbBQid
 LqAxw/l5jkk2ehte8FrQ/xdKJke7mDrhQUWi7xIg4wgthPehs/1CVWgMXFtS2UOHzk
 ksXvVjMSRWzXhslLqEp+VAO+RX+PEd/6mK3iZ+Ct8Mz/jVRs+cUjCZTjhtq8fPG99a
 Zp6ixA3hPRVA80TKTAQqqgbiXO/Z2RRMbHanANxAVUa3BDqZbAP+C36TqTv0NdrWp3
 hSftSd5On44Shdhnzzh3b656T6GUp2yRr6Ui7QpMHWeHEtp/0kbueaVsJb2l9w1XSl
 7roQ4VdmQVyPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=lAT2qSUH
Subject: Re: [Buildroot] [PATCH] package/systemd: security bump to v258.7
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

Hi Titouan,

On 4/20/26 11:58, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:

I've added a note to both CVE which patch release they got fixed by.

> 
> - CVE-2026-29111:
>      systemd, a system and service manager, (as PID 1) hits an assert and
>      freezes execution when an unprivileged IPC API call is made with
>      spurious data. On version v249 and older the effect is not an assert,
>      but stack overwriting, with the attacker controlled content. From
>      version v250 and newer this is not possible as the safety check causes
>      an assert instead. This IPC call was added in v239, so versions older
>      than that are not affected. Versions 260-rc1, 259.2, 258.5, and 257.11
>      contain patches. No known workarounds are available.
>      https://www.cve.org/CVERecord?id=CVE-2026-29111
> 
> - CVE-2026-40226:
>      In nspawn in systemd 233 through 259 before 260, an escape-to-host
>      action can occur via a crafted optional config file.
>      https://www.cve.org/CVERecord?id=CVE-2026-40226
>      https://github.com/systemd/systemd/security/advisories/GHSA-9mj4-rrc3-gjcx
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
Applied to master with these changes, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
