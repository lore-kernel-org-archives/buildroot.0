Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD468C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79F5341358;
	Sun, 19 Jan 2025 12:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjnEqSGIpGil; Sun, 19 Jan 2025 12:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA0B41456
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA0B41456;
	Sun, 19 Jan 2025 12:25:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3230ED7
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FE7C41358
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gC3RmuHBq0hw for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC55D40B25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC55D40B25
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC55D40B25
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:25:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C213F780372;
 Sun, 19 Jan 2025 13:25:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48406])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 13:25:32 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 13:25:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119084511.2816892-4-thomas.petazzoni@bootlin.com>
References: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
 <20250119084511.2816892-4-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <cdac8d91b8056cdcb045168e5b22e289@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737289533;
 bh=ilaxGERjKM3b+gPUHDK6I6hMu5vqWaEnW3oj3M7cq/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QhQJAxtOy2FetSPc7p5+DFd+oUCeahkmpvPjCmzuq6/02S9egrmQC3K70fz1WkKHo
 crXMhqXrHUk1RyuyMLHWTr4JUlT4hZjz8tqUvSLCbrCFYIC8qc/84G8lgWAUt93j4W
 n9RU4An1aHrjVK9x4GwwWBsg8TA+Q0DQVwgqjTWqc37gyx7o0ALxmFf8NP7Jv4zyss
 ZUVemSqQDtmhmKKklL+641d1gamPxxsSjBz96gc1ugbslVGm1gAZKokg+9khsjOeWD
 sdLV3wMEUJJZ1U9kOIqXgCr2LgX7U4JNKsvBWIlJrL58k81h/Blewt2R62omQy0Z5J
 znsViY3QJLKbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QhQJAxtO
Subject: Re: [Buildroot] [PATCH 3/4] package/gnu-efi: fix build due to
 short-wchar
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

T24gMTkvMDEvMjAyNSAwOTo0NSwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFRoZSBnbnUtZWZpIGNvZGUgYmFzZSBpcyBzbyBmYXIgYnVpbHQgd2l0aCAtZnNob3J0LXdj
aGFyOgo+IAo+IOKAmC1mc2hvcnQtd2NoYXLigJkKPiAgICAgIE92ZXJyaWRlIHRoZSB1bmRlcmx5
aW5nIHR5cGUgZm9yIOKAmHdjaGFyX3TigJkgdG8gYmUg4oCYc2hvcnQgdW5zaWduZWQKPiAgICAg
IGludOKAmSBpbnN0ZWFkIG9mIHRoZSBkZWZhdWx0IGZvciB0aGUgdGFyZ2V0LiAgVGhpcyBvcHRp
b24gaXMgdXNlZnVsCj4gICAgICBmb3IgYnVpbGRpbmcgcHJvZ3JhbXMgdG8gcnVuIHVuZGVyIFdJ
TkUuCj4gCj4gICAgICAqV2FybmluZzoqIHRoZSDigJgtZnNob3J0LXdjaGFy4oCZIHN3aXRjaCBj
YXVzZXMgR0NDIHRvIGdlbmVyYXRlIGNvZGUKPiAgICAgIHRoYXQgaXMgbm90IGJpbmFyeSBjb21w
YXRpYmxlIHdpdGggY29kZSBnZW5lcmF0ZWQgd2l0aG91dCB0aGF0Cj4gICAgICBzd2l0Y2guICBV
c2UgaXQgdG8gY29uZm9ybSB0byBhIG5vbi1kZWZhdWx0IGFwcGxpY2F0aW9uIGJpbmFyeQo+ICAg
ICAgaW50ZXJmYWNlLgo+IAo+IEhvd2V2ZXIsIHRoaXMgaXMgaGlnaGx5IGluY29tcGF0aWJsZSB3
aXRoIHRoZSBkZWZpbml0aW9ucyBvZiB3Y2hhcl90Cj4gYnkgbXVzbCwgY2F1c2luZyBidWlsZCBp
c3N1ZXM6Cj4gCj4gL3dvcmtkaXIvaW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC9nbnUtZWZpLTMu
MC4xOC8vbGliL2NvbnNvbGUuYzo4NDo2ODogCj4gZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBv
ZiAnQ29uT3V0LT5PdXRwdXRTdHJpbmcnIGZyb20gaW5jb21wYXRpYmxlIAo+IHBvaW50ZXIgdHlw
ZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KPiBbLi4uXQo+IC93b3JrZGly
L2luc3RhbmNlLTAvb3V0cHV0LTEvYnVpbGQvZ251LWVmaS0zLjAuMTgvL2xpYi9jb25zb2xlLmM6
ODQ6Njg6IAo+IG5vdGU6IGV4cGVjdGVkICdDSEFSMTYgKicge2FrYSAnaW50IConfSBidXQgYXJn
dW1lbnQgaXMgb2YgdHlwZSAnc2hvcnQgCj4gdW5zaWduZWQgaW50IConCj4gCj4gVGhlc2UgaGF2
ZSBiZWVuIGFkZHJlc3NlZCB1cHN0cmVhbSBieSBzaW1wbHkgbm90IHVzaW5nIC1mc2hvcnQtd2No
YXIKPiBhbnltb3JlLCBzbyB3ZSBiYWNrcG9ydCB0aGUgcmVsZXZhbnQgcGF0Y2hlcy4KPiAKPiBU
aGUgcGF0Y2ggMDAwMy1Vc2UtY2hhcjE2X3QtbGl0ZXJhbHMucGF0Y2ggd2FzIGRpcmVjdGx5IGJh
Y2twb3J0ZWQsIGl0Cj4gd2FzICJyZWRvbmUiIChpdCdzIGEgdmVyeSBtZWNoYW5pY2FsIHBhdGNo
KSBhcyBiYWNrcG9ydGluZyB0aGUgcGF0Y2gKPiBhbmQgZml4aW5nIHRoZSBjb25mbGljdHMgd2Fz
IG1vcmUgZWZmb3J0IHRoYW4gcmVkb2luZyB0aGUgcGF0Y2ggZnJvbQo+IHNjcmF0Y2guIEJ1dCBp
biBlc3NlbmNlLCBpdCBpcyB0aGUgc2FtZSBwYXRjaCBhcyB3aGF0IGlzIHVwc3RyZWFtLgo+IAo+
IEZpeGVzOgo+IAo+ICAgCj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
OGIyZjViMzgyODRlNzBkZGU4YzU2MTllNTA1MGU3ZjIwMWEwYmNjMy8KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
