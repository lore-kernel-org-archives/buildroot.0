Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FF3E8FDCC
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61901607A6;
	Sat, 27 Dec 2025 14:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jpq6nAqx48q; Sat, 27 Dec 2025 14:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B691C60768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847155;
	bh=uo795PtnsOilGFgU7ksxUt6xBBysNB0xAHwAkSYMQfY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GP8sjqUEgAid0ek3pdqkv2AvkQZZ4/LEuKbUnMwh1ULHq0eMXEOEaf8jwAN0rpyD7
	 cxLT9ZxUEYPoyj/8koeBzTdC7uJ4QlPuFOouJXEDSazrPCv9EE9Pv6Fpt4X/zxPmzR
	 1kdovRvw0a2UNiWsCCM9KquEbziEeqgd51KOiIKMstoy6U+fOzX/J8A5GiVnOfqkqb
	 3sTzGK+F//ZDS5WeVtpCD83YJ9NgzDZbN+7/YKL1euIvvyfvxV7vQTp1z2MRxbJVtr
	 eMeACyqG2UzO0J0k8UM1KyU3lrXkjeENNUhKDrx989xnrnwFqKclRpyKU59RCi1vnO
	 HDnF5jpSlnXYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B691C60768;
	Sat, 27 Dec 2025 14:52:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE9DB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91D0C4039D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NUwEdGkjWhp for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66D9540395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D9540395
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66D9540395
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:52:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 94B48780333;
 Sat, 27 Dec 2025 15:52:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 15:52:30 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 15:52:30 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251227130610.163006-1-thomas.perale@mind.be>
References: <20251227130610.163006-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <cc24a711ff4c3dec32164bada13cb688@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766847151;
 bh=t7QmkthKsUuH/nf6VHu2KPLlud0H1GlNd538Hjpz704=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MfkVI2oCJ7ZIXKntGpBnUjAYAhcJ4eMTS6K8leMh0UTMee+AxxfFqXUNqkWPdF1jj
 CPEvAFU3ToJZdX4zOPzzvKduamVBhvMPslk+diQ6fl45wHtVMHd7ORM50M9kOJ0QUF
 7sJ5pcRGTiG/ZXZYiqXxh/l1RzQ65ZMs3VN5NXS50LU8wgBVNiNU5lKdiPyljRfoOb
 1KeIFWY6W18hAuk3qgGH0idul6D2uqOTsdZhufwx9FtsgilTqmtMAkocWEXrrgmvlj
 tDwSkF3mENyRmVz1PK+qHpeZZjfN8pCqBr9y/CbRKGHdiJsYHpG4ENJ+P6qmjWG9UV
 gL0lrh0vd8Y5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MfkVI2oC
Subject: Re: [Buildroot] [PATCH 1/1] package/linenoise: add CPE
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

On 27/12/2025 14:06, Thomas Perale via buildroot wrote:
> The CPE 'cpe:2.3:a:antirez:linenoise:1.0:*:*:*:*:*:*:*' is valid for 
> the
> package linenoise [1].
> 
> Since the latest version is '1.0' since 2015 the CPE_ID_VERSION is set
> to that version.
> 
> The CVE that applies on version 1.0 were checked with the 'cve-check'
> script:
> 
> ```
> echo '{"components": [{"bom-ref": "linenoise", "name": "linenoise", 
> "version": "1.0", "cpe": 
> "cpe:2.3:a:antirez:linenoise:1.0:-:*:*:*:*:*:*"}]}' | 
> support/scripts/cve-check | jq -r '.vulnerabilities[].id'
> ```
> 
> Only the CVE-2025-9810 exists and that was fixed in [2].
> 
> [1] 
> https://nvd.nist.gov/products/cpe/detail/10423C23-6AAA-439E-B723-1FCDEB3A769F
> [2] 3c7cbf97d7 package/linenoise: security bump to version e26268de5e
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
