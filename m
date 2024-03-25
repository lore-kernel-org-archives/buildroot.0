Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A9C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B2548193E;
	Mon, 25 Mar 2024 08:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEqMfwsCwLup; Mon, 25 Mar 2024 08:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D77D5818D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77D5818D7;
	Mon, 25 Mar 2024 08:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 695F81BF3DB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BC060845
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfggbgptuQID for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 08:40:14 +0000 (UTC)
X-Greylist: delayed 476 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Mar 2024 08:40:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B484B6073C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B484B6073C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B484B6073C
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 08:40:13 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id BDEB8C038F
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 09:32:10 +0100 (CET)
Message-ID: <3a03670a-7a1b-4fd9-a44a-b5ffff19dc94@grenoble.cnrs.fr>
Date: Mon, 25 Mar 2024 09:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1711355530;
 bh=btV5U4CgEXJjjXpJh+Hds9wjzTAEy8/7O3GGbb9BX7s=;
 h=Date:To:From:Subject:From;
 b=iAhbnv6LtLyqv9IHN0+y4a8HuZVaG0cMNk5yCs1Kxw6W6OkH9U/WIbpM/T30xCkwg
 renplgVXvtiPitbwwbDhvZGMlKp9+xOXboikxwQuz8LGK5fi1f8pifUVAlhxQIwFIl
 Jk4C37bSzRzTpHfm8aJrGj6E+97sHbNH1Zz7xcq9lKST1KXYKWIpn/4ZwnP4DdHqAc
 AwuCItfx2WSCpWM7HY9q0KwIe1bZvq09wG60/8AiSyGJipLso/PWYIWaNwgSmywqVr
 lpmy0uwDsBaDDqpovEuEoupFmhbqIspb7DYf/FfFwhUYNXSJno8SZStvVqAtbMQqQV
 O8jsGb9s/MKlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=iAhbnv6L
Subject: [Buildroot] Being kicked-off the mailing list
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gZXZlcnlib2R5IQoKVGhpcyBtdXN0IGJlIHRoZSB0aGlyZCB0aW1lIGl0IGhhcHBlbnMs
IGFuZCBJIGZpbmQgaXQgc29tZXdoYXQKYW5ub3lpbmcuLi4gVGhpcyBtb3JuaW5nIEkgcmVjZWl2
ZWQgYW4gZS1tYWlsIGZyb20gYnVpbGRyb290LXJlcXVlc3QKaW5mb3JtaW5nIG1lIHRoYXQgbXkg
bWVtYmVyc2hpcCB0byB0aGlzIG1haWxpbmcgbGlzdCBoYXMgYmVlbiBkaXNhYmxlZApkdWUgdG8g
4oCcZXhjZXNzaXZlIGJvdW5jZXPigJ0uCgpJIHRyaWVkIHRvIGludmVzdGlnYXRlIGFuZCBpdCB0
dXJucyBvdXQgdGhhdCDigJxleGNlc3NpdmUgYm91bmNlc+KAnQphY3R1YWxseSBtZWFucyB0aGF0
IGV4YWN0bHkgb25lIG1lc3NhZ2UgYm91bmNlZCwgbmFtZWx5IHRoZSBtZXNzYWdlCnRpdGxlZCDi
gJxZb3VyIG1haWxib3ggaXMgZnVsbOKAnSBmcm9tIFN0b3JhZ2UgQWNjb3VudHNbMV0uIEkgZGlz
Y3Vzc2VkIHRoZQppc3N1ZSB3aXRoIG15IGUtbWFpbCBwcm92aWRlciBhbmQgdGhleSBzYXkgdGhh
dCBib3VuY2luZyBtZXNzYWdlcyB0aGF0CmFyZSAxMDAlLWNlcnRhaW4gcGhpc2hpbmcgYXR0ZW1w
dHMgaXMgdGhlIGRlc2lyZWQgYmVoYXZpb3IsIGFuZCB0aGV5CndpbGwgbm90IGRpc2FibGUgdGhl
IGp1bmstbWFpbCBmaWx0ZXIsIHdoaWNoIGlzIGFscmVhZHkgdmVyeSBsYXguCgpXb3VsZCBpdCBi
ZSBwb3NzaWJsZSB0byBjb25maWd1cmUgQnVpbGRyb290J3MgbWFpbCBzZXJ2ZXIgdG8gYmUgYSBi
aXQKbW9yZSB0b2xlcmFudCB0byBib3VuY2VzPyBJIHVuZGVyc3RhbmQgdGhlIG5lZWQgdG8gdW5z
dWJzY3JpYmUgYWRkcmVzc2VzCnRoYXQgZ2VuZXJhdGUgdG9vIG1hbnkgZXJyb3JzLCBidXQgSSBm
aW5kIHRoaXMg4oCca2ljay1vdXQgb24gZmlyc3QKYm91bmNl4oCdIHBvbGljeSBhIGJpdCBleHRy
ZW1lLgoKUmVnYXJkcywKCkVkZ2FyIEJvbmV0LgoKWzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtTWFyY2gvNjg4MjY5Lmh0bWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
