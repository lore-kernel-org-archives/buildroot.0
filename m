Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09F3C87FCA
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 22:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BA0160BD7;
	Fri, 25 Jul 2025 22:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o45uxzBPjenc; Fri, 25 Jul 2025 22:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56F960A80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56F960A80;
	Fri, 25 Jul 2025 22:03:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF108177
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0E7960A80
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhvBvgDQnRCU for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 22:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43058608DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43058608DF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43058608DF
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 22:03:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4FF2B19F73B;
 Sat, 26 Jul 2025 00:03:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Jul 2025 00:03:14 +0200
MIME-Version: 1.0
Date: Sat, 26 Jul 2025 00:03:14 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250722133954.711112-2-vincent.stehle@arm.com>
References: <20250722133954.711112-1-vincent.stehle@arm.com>
 <20250722133954.711112-2-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a855d85785b91239635619f5d6c51e90@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753480995;
 bh=CDHIr9Jc7RhMAet/RwGkq+IcA2McpWbgauHG4aq36Xk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UgUA4B6AVX+W0OVf3X4rsjFRKcQBy+xT7QeH/BwNVpWx4VyN9xU1jWe5tNyKr2Y+9
 T9DvY0w96ztgGzksT3NRLkf2ME3PlqzMb0dZewxspLTS/AkLfvzIdqWJWPifk6+C0Q
 DBnraWCjS3gNHaynwWNyMve+ytQ0vcQzyNpokkvGkvE8OeRxJGfuqPHjw9S5TFSrE1
 a9CU+Yve5pagFjp33PeHEFOjn428QwTcN4zjDeigYs1WT429LCLE4VE5CVTHQlONhy
 3ec2VFv8G97tHrrI3ApSPXBbsawIwTl9aizxBm9SbAINVRQet9KFtpWLb7DPlGas3d
 nsgF7XBRZP0FQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UgUA4B6A
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_xen: add a base
 class
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

T24gMjIvMDcvMjAyNSAxNTozOSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IEluIHByZXBhcmF0
aW9uIG9mIGFkZGluZyBhIHRlc3QgZm9yIFhlbiBvbiAzMi1iaXQgQXJtIHY3Ogo+IC0gSW50cm9k
dWNlIGFuIGFyY2hpdGVjdHVyZS1hZ25vc3RpYyBUZXN0WGVuQmFzZSBjbGFzcyB3aGVyZSB3ZSBt
b3ZlCj4gICBtb3N0IG9mIHRoZSBYZW4gdGVzdCBzY2VuYXJpbyBhbmQgYml0cyBvZiB0aGUgY29u
ZmlndXJhdGlvbi4KPiAtIFJlLW9yZ2FuaXNlIHRoZSB0ZXN0X3hlbi8gZm9sZGVyIHdpdGggdGhl
IGFyY2hpdGVjdHVyZS1hZ25vc3RpYyBmaWxlcwo+ICAgdW5kZXIgY29tbW9uLyBhbmQgdGhlIDY0
LWJpdCBBcm0gc3BlY2lmaWMgZmlsZXMgdW5kZXIgYWFyY2g2NC8uCj4gCj4gTWFrZSB0aGUgNjQt
Yml0IEFybSBUZXN0WGVuIGNsYXNzIGluaGVyaXQgZnJvbSB0aGUgYmFzZSBjbGFzcyBhbmQgbGVh
dmUKPiBpbiB0aGVyZSBvbmx5IHRoZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgcGFydHM6Cj4gLSBU
aGUgNjQtYml0IEFybSBjb25maWd1cmF0aW9uIGJpdHMuCj4gLSBUaGUgdGVzdCBmdW5jdGlvbiwg
d2hpY2ggcGFzc2VzIHRoZSBwcm9wZXIgNjQtYml0IEFybSBzaW11bGF0b3IKPiAgIG9wdGlvbnMg
dG8gdGhlIGdlbmVyaWMgdGVzdCBmdW5jdGlvbi4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
bnRlbmRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGFybS5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
