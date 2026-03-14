Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF180106ACF9
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2581160F8B;
	Sat, 14 Mar 2026 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXfU30EZA3Jc; Sat, 14 Mar 2026 20:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF65460853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773520193;
	bh=ndTQz/MC6FyLCl4VYy/wCScNLxxeqSpNE6rgPCfsIjQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pf+rxgl4eTSFrDhjXUJEEVYcDiR2/9WgZjl9G0DrQPrBD5nYEJdn2CH3rn0MT0+gW
	 vzsQo30Y5bgVudiifiXGrevSMbUPVAM/OCNnp2bt9YNIq8IQMRRJriVZm5WMq679Wi
	 N/UQ7unfBMppAi7VorqDrlkdjC0iWCz5RGuclx/TOlhkPZj074QeHRFuU5rqbWzwS1
	 rjpC1B/cY2FtWNPjB0BgWWgU55y4JdIxjwIjJ6TMBWaNcZ5ADCiTIopPE/wkoL/wyy
	 jxxyQFNebZccp3uY1eYQCJYPYlMSVd1EoXRlwwPh0tsVNFrggUIYq8TumzyJ/rx5rZ
	 ii5En32fVtv4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF65460853;
	Sat, 14 Mar 2026 20:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A8FAA1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ED77823E2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIDJRKM3ZzwM for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4D92823DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D92823DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4D92823DD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:29:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 511065FFBA;
 Sat, 14 Mar 2026 21:29:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Mar 2026 21:29:45 +0100
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 21:29:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260314122326.600040-1-bernd@kuhls.net>
References: <20260314122326.600040-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <e0b8b426fe2141877328229b06fb298c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773520187;
 bh=IMlDfM3AgrUn+vzydXjHi8pm/x3r5EyId9/AMl9/Z2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VNLAdpCj6S9YbzDM8QcncCaRPWykhiTxrKm2PHS3BEZlQn4wvK6BAypNyIQVCyjnL
 joUfWR8QSqUUsJTZyQLd4f3QNDvVqRiCoqhV9qq/SCMv/A5GzzujVOnaIAA0Bh69Xa
 HuK2NKII9mPpY/rej7CibGW9UZeKr3RviRGC0oBg3l62+1txVDiUVbKzO1g7bYIgFB
 XkVq5oHms8W60hZRuEZ2jZVXDg1lNExjk1MwTW1ty0oRYYTXai9ggi3qGSTAP8Cx11
 y8SE8OkxyCiTxyPJ+1fCOLJfwsdMakTlahAizOniJh005gOm7LrIy2AlBsDwVaDdHn
 kxoUqy5bOKKQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VNLAdpCj
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: security bump version
 to 2.15.2
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

On 14/03/2026 13:23, Bernd Kuhls wrote:
> Release notes:
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.news
> 
> - CVE-2026-1757 fix: Memory leak in xmllint Shell - shell.c
> - CVE-2026-0990 fix: Prevent infinite recursion in
>   xmlCatalogListXMLResolve
> - CVE-2026-0992 fix: Exponential behavior when handling
> - parser: Fix infinite loop in xmlCtxtParseContent
> - CVE-2025-10911 libxslt related: Ignore next/prev of documents when
>   traversing XPath
> - CVE-2026-0989 fix: Add RelaxNG include limit
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
