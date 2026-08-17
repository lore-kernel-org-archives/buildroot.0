Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00663C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA1380E45;
	Mon, 17 Aug 2026 17:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lK6NlxGF9qXz; Mon, 17 Aug 2026 17:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB1F80E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786989058;
	bh=SDoAJYSddCR6S76w4zSXk+sF0dIDeYgfkAJjSShw2lQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ma343Sv9CNYSSgTPzT+9wEpeaWRByR3UbQxcHso1Vw2ljOhIF3j7I/jiGX8E0yD41
	 mUUQzhfAZFQBCDFyH5eniCP9hrK8SR0vle+mHuGnk95Xk4e/bh9abDHGS52AkH9HAX
	 orKAI78dzV7/0eNLzRtFxjsKAxtISbQOZqnHUuMR2pKERKEjZpXXWqRSFixVC3TIwf
	 Q5OgIhLllkEET2e0ka9uz3QcDyAjEP0Lt5sbU698lP54KghkOyoC10JXudvzs52PHi
	 bjap9rUGzKqj/lKx94qkm4qSoSfydOaDGhEB8X60Lv82ZliLOaR39h3I5V1EYTcXxg
	 gCooSMw6Q/WPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB1F80E4D;
	Mon, 17 Aug 2026 17:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C603194
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AD4F80E4D
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9sK0CrcaruP for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4115D80E45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4115D80E45
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4115D80E45
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1BAA319F5C2;
 Mon, 17 Aug 2026 19:50:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Aug 2026 19:50:51 +0200
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 19:50:51 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20260817153641.736799-1-peter@korsgaard.com>
References: <20260817153641.736799-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <aca3155e78202eda49481db4b7722667@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.26.6
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

On 17/08/2026 17:36, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
>  - x/mod/sumdb/tlog: fix transparency log tile verification bypass
> 
>    A malicious GOPROXY was previously capable of forging up to two 
> sumdb
>    tiles that allow for a requested module to bypass the GOSUMDB check 
> and
>    persist attacker-controlled module content to a local Go module 
> cache.
> 
>    This attack allows for a malicious GOPROXY to serve malicious module
>    content that cannot be detected by evaluating the transparency log.
> 
>    All tiles are now correctly verified against their parents.
> 
>    In order to determine if you have been affected:
> 
>    rm -r go.sum go.work.sum vendor/ && go mod tidy
> 
>    Thanks to Filippo Valsorda (Geomys) for reporting this issue.
> 
>    This is CVE-2026-56865 and Go issue https://go.dev/issue/80744.
> 
>  - x/mod/sumdb: ignore unrelated, unauthenticated hashes in Lookup
> 
>    A malicious GOSUMDB was capable of serving arbitrary module content 
> not
>    contained within the transparency log.
> 
>    This attack allows for a coordinating GOPROXY and GOSUMDB to serve a
>    client malicious module content that cannot be detected by 
> evaluating
>    the transparency log.
> 
>    In order to determine if you have been affected:
> 
>    rm -r go.sum go.work.sum vendor/ && go mod tidy
> 
>    Thanks to mundur for reporting this issue.
> 
>    This is CVE-2026-56864 and Go issue https://go.dev/issue/80745.
> 
>  - encoding/xml: add recursion depth guard during decode
> 
>    Previously, DecodeElement would reset the depth counter causing it 
> to
>    never fire; this could lead to stack exhaustion.
> 
>    This is CVE-2026-56859 and Go issue https://go.dev/issue/80481.
> 
>  - net/http: apply ReadHeaderTimeout when doing unencrypted HTTP/2 
> check
> 
>    When a server is configured to support unencrypted HTTP/2, it reads 
> a few
>    bytes from each new connection to see if they contain the HTTP/2 
> client
>    preface.  Previously, this was being done with no timeout applied.
>    ReadHeaderTimeout is now applied for this.
> 
>    This is CVE-2026-56853 and Go issue https://go.dev/issue/80205.
> 
>  - net/url: avoid quadratic complexity in resolvePath
> 
>    Previously, resolving relative paths containing parent directory 
> (..)
>    segments performed string conversions and buffer rewrites on each 
> step,
>    resulting in quadratic time complexity and high memory allocation
>    overhead.
> 
>    Now, path resolution operates on a byte buffer using index-based
>    backtracking for ..  segments, eliminating the quadratic time 
> complexity
>    and significantly reducing memory allocations.
> 
>    This is CVE-2026-56860 and Go issue https://go.dev/issue/80494.
> 
>  - golang.org/x/net/dns/dnsmessage: panic when parsing invalid SVCB 
> record
> 
>    Parsing an invalid SVCB or HTTPS RR can panic when the size of a
>    parameter value overflows the message buffer.
> 
>    Thanks to Mundur (https://github.com/M0nd0R) for reporting this 
> issue.
> 
>    This is CVE-2026-46600 and Go issue https://go.dev/issue/79795.
> 
>  - crypto/tls: limit handshake messages we are willing to accept 
> post-handshake
> 
>    Previously, we always counted handshake messages, such as KeyUpdate, 
> as
>    state-advancing, regardless of whether a handshake has been 
> completed or
>    not.  As a result, a malicious client can keep sending KeyUpdate 
> messages
>    to force the server to keep performing key derivation operations
>    indefinitely.
> 
>    Thanks to Qi Deng of Aurascape.ai for reporting this issue.
> 
>    This is CVE-2026-56862 and Go issue https://go.dev/issue/80528.
> 
>  - html/template: fix Javascript regexp context tracking
> 
>    Previously, pathological inputs could close an unescaped / early,
>    allowing for attack-controlled data to inject arbitrary content,
>    potentially leading to XSS.
> 
>    Thanks to Ali Sherif for reporting this issue.
> 
>    This is CVE-2026-56858 and Go issue https://go.dev/issue/80435.
> 
>  - x/net/idna: failure to reject ASCII-only Punycode-encoded labels
> 
>    The ToASCII and ToUnicode functions incorrectly accepted 
> Punycode-encoded
>    labels that decode to an ASCII-only label.  For example,
>    ToUnicode("xn--example-.com") incorrectly returned the name 
> "example.com"
>    rather than an error.
> 
>    The idna package implements the processing algorithm from UTS 46.  
> Older
>    versions of UTS 46 included a specification bug which permitted 
> multiple
>    ASCII labels to decode to the same Unicode label.  UTS 46 revision 
> 33
>    fixed the specification bug.  The idna package now implements the 
> updated
>    specification.
> 
>    This behavior can lead to privilege escalation in programs using the 
> idna
>    package.  For example, a program which performs privilege checks on 
> the
>    ASCII hostname may reject "example.com" but permit 
> "xn--example-.com".
>    If that program subsequently converts the ASCII hostname to Unicode, 
> it
>    will inadvertently permits access to the Unicode name "example.com".
> 
>    Thanks to KC1zs4 (https://github.com/KC1zs4) for reporting this 
> issue.
> 
>    This is CVE-2026-39821 and Go issue https://go.dev/issue/78760.
> 
>  - encoding/asn1: enforce maximum recursion depth
> 
>    Enforce a recursion limit in Unmarshal to prevent stack exhaustion 
> when
>    parsing deeply-nested, recursive structures.
> 
>    Thanks to Marwan Atia (marwansamir688@gmail.com) for reporting this 
> issue.
> 
>    This is CVE-2026-33818 and Go issue https://go.dev/issue/80405.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
