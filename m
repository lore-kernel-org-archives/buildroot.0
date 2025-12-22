Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1341E67803
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 18:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C0A405F0;
	Mon, 22 Dec 2025 18:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzyvdWxa84wA; Mon, 22 Dec 2025 18:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2A9403BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766426895;
	bh=t4xQioXSg4ek9E9DHBjZ/cShkP1e66aqUoxzdfPuzoo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Njj4A9XyZ9cX9m41h23LR/3TQNOnBpBfV3lMVzppnP0ldH/HAHf3z4syKIhBqC+ae
	 9vMlt0AotS0ntaw06auMKv3ASRzi6S+yFxWKb+YU6xv1KRdsUEVtJGAbaPuWHg+8iZ
	 jXbran/CwegiUZC28tt1mSQrUHa7zMJ1a9udIS7n864qPSH0Ebg6E2XCAofYQVZV68
	 wKTlGZbg/8m2Krwxv50azjC7JkSpiWGIjm3LgxGNQbjb6V7R1OUXcYCpvpGQczjL2Q
	 0jrLsvryrnG+j3z/Gjafkrgu0MXiybdIxG0TAJHmQ3L9HbetqtBrCxBhcY8MKVbdNt
	 kYT4DCtz46lAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2A9403BB;
	Mon, 22 Dec 2025 18:08:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D11A119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F35E60724
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fb6MxQhOgTXR for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 18:08:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1BCE60716
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1BCE60716
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1BCE60716
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:08:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id CF88613F88E;
 Mon, 22 Dec 2025 19:08:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Dec 2025 19:08:05 +0100
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 19:08:05 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, Oli
 Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251222145428.440712-1-buildroot@bubu1.eu>
References: <20251222145428.440712-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <639f760f4bb9064ec67cace2aa11a660@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766426890;
 bh=41AK/PJthcYWGu3UMjylv6KKpzQdbQav2fwRd7pQnY4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dqmr7VXSZz0hve2uXjZS4gb/Hmj9eBOoHY/EExJ6SWSWWSmc4mP6XtRQ6fZGvbRfo
 6IDLkMuH6BVgd9lQe462JI1/nrkdFxhCI3MkZuHLyq0est5NR/tHJ9gG5oXynjAkO6
 C1L6L1499Rvdxvt9ja44HbttZBeJ9FsQOGRi7h4oEITjPTHq+NJcAnpv6AlGCCPB8G
 0AHRykOURxqeDsebMVmPnw/lmhBnjbAdtzvqRchrfWjCKZZrEOQedPRKXs1y6mui1E
 UZDuJq8xigXOu7xgP81OBoUpO18/czbTaafYr1T8Eb+qG6fRucg63btZdX9xHiwQt2
 eOjBVPj1LSRqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Dqmr7VXS
Subject: Re: [Buildroot] [PATCH 1/2] package/python-django: security bump to
 5.2.9
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjIvMTIvMjAyNSAxNTo1NCwgTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gRml4ZXM6Cj4gKiBDVkUtMjAyNS0xMzM3MjogUG90ZW50aWFsIFNRTCBpbmplY3Rpb24gaW4g
RmlsdGVyZWRSZWxhdGlvbiBjb2x1bW4gCj4gYWxpYXNlcyBvbiBQb3N0Z3JlU1FMwrYKPiAqIENW
RS0yMDI1LTY0NDYwOiBQb3RlbnRpYWwgZGVuaWFsLW9mLXNlcnZpY2UgdnVsbmVyYWJpbGl0eSBp
biBYTUwgCj4gRGVzZXJpYWxpemVyCj4gCj4gRnVsbCByZWxlYXNlIG5vdGVzOiAKPiBodHRwczov
L2RvY3MuZGphbmdvcHJvamVjdC5jb20vZW4vNi4wL3JlbGVhc2VzLzUuMi45Lwo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PgoKU2VyaWVzIGFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
