Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48465C5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 18:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1751809CE;
	Mon, 10 Aug 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCbZQKNZ4ANs; Mon, 10 Aug 2026 18:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C2E80A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786387231;
	bh=WECaFaNkDUon2/lQiYzSCLaunZAzhQ0pwA1lRshsuX8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B//AiA/32aIujm/vFxVLPBieAxBvRqqQLjnwu+fVZI4RZgbiCv8+rMb6Cvslvf9az
	 M+UHJB9jmaX0zrin77ym6vC3UJzTMUPD4IHj6aoQ2cmtuWw9FsnEI24bFqUElJ2iiS
	 3jZD2c8DfrU6kOyOQm3vDpwOD/kdUREiwVQ5QgCmTp5+QlO61m4KHkm2aFn9ryWie1
	 iJy90pnz9CZLxHKjxGM88j0M49KmxC+d0c/xbg56JadR4IrkdH5WJURAqDFR/s2640
	 +oqVUGsYEL3Bw7AIaqKpUvQjxdbz4hPLw7+FLT4fE7hTQ9pbkLM5Kjv+PfZl7yXHH4
	 uH/8xNT7A0QyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C2E80A61;
	Mon, 10 Aug 2026 18:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8186C24E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67B1F4016B
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NlICzHDObPo for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 18:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6441F4006F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6441F4006F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6441F4006F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:40:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 95BC82003A4;
 Mon, 10 Aug 2026 20:40:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Aug 2026 20:40:25 +0200
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 20:40:25 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260810084351.22262-1-nicolas.cavallari@green-communications.fr>
References: <20260810084351.22262-1-nicolas.cavallari@green-communications.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <d00b2d769247f012b62efa9e7318a4be@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786387226;
 bh=gwi3nQjF0e5kJAgrKAHgHU1uYxstGL1rGBKzv0JqPnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iAZIyvTUrPV33X5Rng9fPFyiW2evyZbNBl/Cdr/Inh3/hfN/ANETeznvXEJ+cm3DH
 H63iifl6YJvJnEXdmPnhfyoNsNZAyZg0q40wqVvR6z+mnoYkPMDGbGiFu0UwPBkjXk
 5iWmLm6UeZmYUZXnkqo5kv9w6QB6jUyrAROUHzOTC8TCpAQfTAmUHXprTWTBfmt9U2
 SoipAyqQQb+UtHJmmRwsmfGtgTBDaOVsCRr0xA+hut53O/qS01EqY8oxX8I5n6qOUG
 +rRbzpXsNrbSiVRBF9StBemaJWnoyts0YRnNIM/fPestQPuwOfo0yW9vbQtd/OI066
 oZ/bSUztg+cwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iAZIyvTU
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: security bump version
 to 1.9.6
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

On 10/08/2026 10:43, Nicolas Cavallari wrote:
> v1.9.5 fixes CVE-2026-53586, CVE-2026-53587, CVE-2026-53585,
> CVE-2026-53584, CVE-2026-53583.  v1.9.6 fixes other non-security 
> issues.
> 
> Release notes:
> https://github.com/libgit2/libgit2/releases/tag/v1.9.5
> https://github.com/libgit2/libgit2/releases/tag/v1.9.6
> 
> v1.9.5 also replaces a bundled vulnerable libpcre with libpcre2 and
> updated the PCRE license in COPYING as a result.  This is mostly useful
> on Windows; On POSIX systems, libgit2 can use regcomp() and Buildroot
> already asks for it.
> 
> Signed-off-by: Nicolas Cavallari 
> <nicolas.cavallari@green-communications.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
