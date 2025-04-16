Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4989FC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA41A61AD1;
	Wed, 16 Apr 2025 21:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRl01n9_eGvz; Wed, 16 Apr 2025 21:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9BD761B09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BD761B09;
	Wed, 16 Apr 2025 21:07:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8F2159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FA6860A3F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JV6aF8Qiq9qX for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DE1F60810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE1F60810
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DE1F60810
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:07:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D5E81C00DD; Wed, 16 Apr 2025 23:07:44 +0200 (CEST)
Message-ID: <d0e6a206-46ed-4266-9987-1106eb27ab9e@rnout.be>
Date: Wed, 16 Apr 2025 23:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
 <d16d5f276345efd9a9abf3d177da8bd7341bd5e6.1742068624.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <d16d5f276345efd9a9abf3d177da8bd7341bd5e6.1742068624.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Wj0/+wpKG8xUEbVIVSxHAEgsNxzw2+Df3gi1mnQ8zhQ=;
 b=bh59Q+MDX/rLbgZE30C+JZp67Kat4+MLbnUvKwWpYLgv2Hdb9OhthVH71yEQvCYmSuT1o1
 cb5F6R3JKHTYng9rH2qgcS9llHjsi5vY5WEKYKUFc5d+4oj17cf/gZizYOd4uAZfOeIt8u
 JSxbUO7mXMblhNHGjmVs3mAy7Y4j5vaVp9jq+dlsSi6n8KYpnzKp1S2jpGZYAJmvwq92aA
 6ss1m5ZCR0U0KVvNLg0dQOE2Pjyr7WW34bq4kyGIY6xAGyjR0WPqJvYbKhI3ugDMHIYmBk
 iu6YDaowqRqi0L1v9uLODIkSGJGXGrlvEtJBs4P/WcfVISAnQWBjVtw5w3kZMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 01/14 v4] support/testing: set date in
 emulated machine
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE1LzAzLzIwMjUgMjA6NTYsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gV2hlbiB0aW1lIGNv
bWVzIHRvIGNoZWNrIGNlcnRpZmljYXRlcywgdGhlIGRhdGUgYW5kIHRpbWUgaW4gdGhlIGVtdWxh
dGVkCj4gbWFjaGluZSBzaG91bGQgYmUgY2xvc2UgZW5vdWdoIHRvIHRoZSBhY3R1YWwgdmFsdWVz
LCBzbyB0aGF0IGNlcnRpZmljYXRlCj4gdmFsaWRpdHkgY2FuIGJlIGNoZWNrZWQuCj4KPiBTb21l
IFFlbXUgbWFjaGluZXMgaGF2ZSBhbiBSVEMgKGUuZy4gYXJtIHZleHByZXNzLWE5IGhhcyBhIHBs
MDMxKSwgYW5kCj4gdGhlIGtlcm5lbCBuZWVkcyBhIGRyaXZlciBmb3IgdGhvc2UgUlRDLiBJdCBp
cyBub3QgZ3VhcmFudGVlZCB0aGF0IHRoZQo+IG1hY2hpbmUgdXNlZCBmb3IgYSB0ZXN0IG1lZXRz
IHRob3NlIHR3byBjb25kaXRpb25zOyBpbiBzdWNoIGEgY2FzZSwgdGhlCj4gdGltZSBpbiB0aGUg
bWFjaGluZSBzdGFydHMgd2F5IGJhY2sgaW4gdGhlIHBhc3QgKDE5NzAtMDEtMDFUMDA6MDA6MDBa
IG9uCj4gc3lzdiwgb3IgdGhlIHJlbGVhc2UgZGF0ZSBvZiBzeXN0ZW1kKS4gVGhpcyBpcyB0aGUg
Y2FzZSB3aXRoIHRoZSBkZWZhdWx0Cj4ga2VybmVsLCBzbyBzdWNoIHRlc3RzIGRvIG5vdCBoYXZl
IHRoZSBwcm9wZXIgdGltZS4KPgo+IFNldCB0aGUgZGF0ZSB0byB0aGUgZGF0ZSBvZiB0aGUgaG9z
dCBzeXN0ZW0uIFRoaXMgaXMgZ29pbmcgdG8gYmUgYWNjdXJhdGUKPiB0byB0aGUgc2Vjb25kLCB3
aGljaCBpcywgYnkgZmFyLCBlbm91Z2ggZm9yIG91ciBwdXJwb3NlLgo+Cj4gVG8gYXZvaWQgaGF2
aW5nIHRvIGNvbnNpZGVyIHdoYXQgY29tYmluYXRpb24gb2YgZW11bGF0ZWQgbWFjaGluZSBhbmQg
a2VybmVsCj4gY29uZmlndXJhdGlvbiBhcmUgYmVpbmcgdXNlZCwgd2UgYWx3YXlzIHNldCB0aGUg
ZGF0ZSwgYXMgdGhpcyBpcyBhCj4gZ2VuZXJpYyBzdGVwIHRoYXQgc2hvdWxkIGJlIGRvbmUgYnkg
dGhlIGluZnJhIChsaWtlIGxvZ2luIGluIGFzIHJvb3QgaXMpLgo+Cj4gVGhlIEVtdWxhdG9yKCkg
Y2xhc3MgZG9lc24ndCBpbmhlcml0IGZyb20gdW5pdHRlc3QuVGVzdENhc2UsIHNvIHdlIGNhbid0
Cj4gY2FsbCBhbnkgb2YgdGhlIHVzdWFsIHNlbGYuYXNzZXJ0WFhYKCkgbWV0aG9kczsgaW5zdGVh
ZCwgd2UganVzdCByYWlzZQo+IGEgc3RhbmRhcmQgZXhjZXB0aW9uLCBsaWtlIGlzIGRvbmUgYSBm
ZXcgbGluZXMgYWJvdmUgdG8gZGV0ZWN0IHRoZSBsb2dpbgo+IHByb21wdC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENjOiBSaWNh
cmRvIE1hcnRpbmNvc2tpIDxyaWNhcmRvLm1hcnRpbmNvc2tpQGRhdGFjb20uY29tLmJyPgo+IENj
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKIMKgQXBw
bGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPgo+IC0t
LQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAgLSBjYXRjaCBmYWlsdXJlIHRvIHNldCB0aGUgZGF0
ZQo+Cj4gQ2hhbmdlcyB2MyAtPiB2NDoKPiAgICAtIGV4dGVuZCB0aGUgcmF0aW9uYWxlIGluIHRo
ZSBjb21taXQgbG9nICAoSnVsaWVuKQo+IC0tLQo+ICAgc3VwcG9ydC90ZXN0aW5nL2luZnJhL2Vt
dWxhdG9yLnB5IHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSBiL3N1cHBv
cnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQo+IGluZGV4IGVmNWJlMmExOWUuLjliZTExNDM5
NDQgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5Cj4gKysr
IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5Cj4gQEAgLTUsNiArNSw3IEBAIGlt
cG9ydCBvcwo+ICAgCj4gICBpbXBvcnQgcGV4cGVjdAo+ICAgaW1wb3J0IHBleHBlY3QucmVwbHdy
YXAKPiAraW1wb3J0IHRpbWUKPiAgIAo+ICAgaW1wb3J0IGluZnJhCj4gICAKPiBAQCAtMTUyLDYg
KzE1MywxMCBAQCBjbGFzcyBFbXVsYXRvcihvYmplY3QpOgo+ICAgCj4gICAgICAgICAgIHNlbGYu
Y29ubmVjdF9zaGVsbCgpCj4gICAKPiArICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNlbGYu
cnVuKGYiZGF0ZSBAe2ludCh0aW1lLnRpbWUoKSl9IikKPiArICAgICAgICBpZiBleGl0X2NvZGU6
Cj4gKyAgICAgICAgICAgIHJhaXNlIFN5c3RlbUVycm9yKCJDYW5ub3Qgc2V0IGRhdGUgaW4gdmly
dHVhbCBtYWNoaW5lIikKPiArCj4gICAgICAgZGVmIGNvbm5lY3Rfc2hlbGwoc2VsZik6Cj4gICAg
ICAgICAgIGV4dHJhX2luaXRfY21kID0gIiAmJiAiLmpvaW4oWwo+ICAgICAgICAgICAgICAgJ2V4
cG9ydCBQQUdFUj1jYXQnLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
