Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A548C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDE960A79;
	Mon, 17 Feb 2025 20:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dj4S8AguYcaR; Mon, 17 Feb 2025 20:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 350E660EC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 350E660EC2;
	Mon, 17 Feb 2025 20:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F4033DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E098340290
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rUw20S9mZY7 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 089BD40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 089BD40153
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 089BD40153
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:53:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 974D05FFB4;
 Mon, 17 Feb 2025 21:53:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 21:53:53 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 21:53:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250217023835.349770-1-fancp2007@gmail.com>
References: <20250217023835.349770-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <54b53b1070c7fb44b84eb60e49ba0dbc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739825636;
 bh=8S0M3KmBOCoD4nq+OZVRu2hFUDnk4FS9+VhdZ/+wA1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AYX5ui6lAAT8FWuOJJxJqZVwdQ0AtTrVAuv78WVIrahSQeAALSADgEqWFDs6TFM/7
 5nQxgA7ScbP5S787/sOzdm/Hax3EXQ+YPM7ZkmJZqoBn8ElbqLkHGX2/mvS6YErDtp
 M0syEhxY5rtEGSgKFKiYGZjgoO8lqXCTTPfbberyfxx6/7kM8JVt1u1Y9xC0z3G90D
 RhD22OMqAg5Lg5xLYYdO5pnESLoyjN+F1EM6jXAXDtwh4hOz3zDnZfIelkBqJ2htpR
 QRExP3XH1lYnaudfd+cjpNrI+gvJ6UdxTNoFK4lB7naOW9ky13YgV/8xuMg+x+XB4M
 qnhsuOvMAY8Tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AYX5ui6l
Subject: Re: [Buildroot] [PATCH 1/2] package/sqlite: fix configure options
 for readline/editline support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTcvMDIvMjAyNSAwMzozOCwgU2NvdHQgRmFuIHdyb3RlOgo+IFRoZSBhdXRvc2V0dXAgc2Ny
aXB0IHdpbGwgc2tpcCBjaGVja2luZyBmb3IgcmVhZGxpbmUuaCB3aGVuIAo+IGNyb3NzLWNvbXBp
bGluZywKPiB3aGljaCB3aWxsIGNhdXNlIGxpbmUtZWRpdGluZyBzdXBwb3J0IGZvciB0aGUgc3Fs
aXRlMyBzaGVsbCB0byBhbHdheXMgCj4gYmUgIm5vbmUiLgo+IAo+IEluIHRoaXMgY2FzZSwgaWYg
dGhlIC0tZWRpdGxpbmUgb3B0aW9uIGlzIHByb3ZpZGVkLCBhbiBlcnJvciB3aWxsIGJlIAo+IHJl
cG9ydGVkOgo+IEVSUk9SOiBFeHBsaWNpdCAtLWVkaXRsaW5lIGZhaWxlZCB0byBmaW5kIGEgbWF0
Y2hpbmcgbGlicmFyeS4KPiAKPiBIb3dldmVyLCB3ZSBjYW4gZW5hYmxlIHJlYWRsaW5lIG9yIGVk
aXRsaW5lIHN1cHBvcnQgYnkgc3BlY2lmeWluZyB0aGUgCj4gQ0ZMQUdTCj4gYW5kIExERkxBR1Mg
dmFsdWVzIOKAi+KAi2luc3RlYWQgb2YgaGF2aW5nIGl0IGhhbmRsZWQgYXV0b21hdGljYWxseSBi
eSB0aGUKPiBhdXRvc2V0dXAgY29uZmlndXJlIHNjcmlwdC4KPiAKPiBJbiBhZGRpdGlvbiwgdGhl
IGxpYmVkaXQgcGFja2FnZSBhY3R1YWxseSBkZXBlbmRzIG9uIHRoZSBuY3Vyc2VzIAo+IHBhY2th
Z2UsCj4ganVzdCBsaWtlIHRoZSByZWFkbGluZSBwYWNrYWdlLiBTbyB3aGVuIHVzaW5nIHRoZSBs
aWJlZGl0IHBhY2thZ2UsCj4gYWxzbyBhZGQgdGhlIG5jdXJzZXMgZGVwZW5kZW5jeS4KPiAKPiBU
ZXN0ZWQtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgoKU2VyaWVzIGFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
