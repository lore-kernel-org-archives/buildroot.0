Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249D6C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8951813F9;
	Fri,  2 May 2025 10:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cboQnqVsJLS4; Fri,  2 May 2025 10:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8250813FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8250813FB;
	Fri,  2 May 2025 10:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91CF5EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82AF68133D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ueuw6G41W0i for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A53908134B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A53908134B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A53908134B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 84FE91C0D57; Fri,  2 May 2025 12:51:50 +0200 (CEST)
Message-ID: <8f9024aa-36df-4b24-a9a1-4b19e5a12f1e@rnout.be>
Date: Fri, 2 May 2025 12:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20250417125251.301268-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250417125251.301268-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MlB1lI95RjzM6NG74f1TMfcxtWkMAN0lYi0R9/CwjTc=;
 b=YJHRrgPD5zTF2xtZMGvkEh6UciHhHE4t15ae3/52m5YAqSHdc/MBLJCk9AuG7G1mBffjNz
 1AabiV2/Fs3ipnwZQQLOb3o0F05xutPcfwHi2jwVV3MdDPCVavTeE0ydhz+xWdKfHTPmSu
 AJ6UnZz2Qrbnkav/UzC4HUD+rKjZR3G88I46JNEgHZtqAu80cALw3CUFaq0XJW8Ad1vWxX
 cMs9WIVzaCg0Mje6/3HvkX/2vAuXqd+aEOaaYzaPdj+hzEcbRnC6shvdrbdk09kODCHCVO
 LeaAm6hBqaejar7jtnPqiQKIf38cvhED1QiOUZeOOD5FYFtWfonvqo4yLqdCsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YJHRrgPD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sdbus: bump to version
 0.14.0
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

CgpPbiAxNy8wNC8yMDI1IDE0OjUyLCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IFRoZSB1cHN0cmVhbSBVUkwgaGFzIGNoYW5nZWQgc28gd2hpbGUgYXQgaXQgYWxzbyB1
cGRhdGUgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgo+IC0tLQo+ICAgcGFja2FnZS9weXRob24tc2RidXMvQ29uZmlnLmlu
ICAgICAgICAgfCAyICstCj4gICBwYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMuaGFz
aCB8IDQgKystLQo+ICAgcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLm1rICAgfCA0
ICsrLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9Db25maWcuaW4gYi9wYWNr
YWdlL3B5dGhvbi1zZGJ1cy9Db25maWcuaW4KPiBpbmRleCBiMmQzOTkwYWI0Li43NjY3NWU0YTI1
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZpZy5pbgo+ICsrKyBiL3Bh
Y2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZpZy5pbgo+IEBAIC01LDcgKzUsNyBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfUFlUSE9OX1NEQlVTCj4gICAJICBNb2Rlcm4gUHl0aG9uIEQtQnVzIGxpYnJhcnku
IEJhc2VkIG9uIHNkLWJ1cyBmcm9tCj4gICAJICBsaWJzeXN0ZW1kLgo+ICAgCj4gLQkgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pZ285NTg2Mi9weXRob24tc2RidXMKPiArCSAgaHR0cHM6Ly9naXRodWIu
Y29tL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMvCgoKICBBcHBsaWVkIHRoaXMgcGFydCB0byAy
MDI1LjAyLngsIHRoYW5rcy4gSXQgd291bGQgaGF2ZSBiZWVuIG5pY2UgaWYgdGhpcyBoYWQgCmJl
ZW4gYSBzZXBhcmF0ZSBjb21taXQuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICAgCj4gICBjb21t
ZW50ICJweXRob24tc2RidXMgbmVlZHMgc3lzdGVtZCIKPiAgIAlkZXBlbmRzIG9uICFCUjJfUEFD
S0FHRV9TWVNURU1ECj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1z
ZGJ1cy5oYXNoIGIvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9uLXNkYnVzLmhhc2gKPiBpbmRl
eCA2MmE0NTg3NjI4Li41NDQyNjJkNDhmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNk
YnVzL3B5dGhvbi1zZGJ1cy5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tc2RidXMvcHl0aG9u
LXNkYnVzLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRw
czovL3B5cGkub3JnL3B5cGkvc2RidXMvanNvbgo+IC1tZDUgIGVhNjNlYmZkMDQ5OTk0MGRjMzI4
NzhiMGZmYjk2MDFjICBzZGJ1cy0wLjEzLjAudGFyLmd6Cj4gLXNoYTI1NiAgODAxYmQ0NjYwOGVl
ODI2MTRkNDI5NjBjOGJhOGFlOTMwMGVkYjFiZjViYmViNTM0YmM4ZmQyMWYxM2QyYzIwZSAgc2Ri
dXMtMC4xMy4wLnRhci5nego+ICttZDUgIDY5YTI1NmVhMWMyNTEwNTQ2MWEzOTU1YWM2OGUzZWE3
ICBzZGJ1cy0wLjE0LjAudGFyLmd6Cj4gK3NoYTI1NiAgNDFkNjFiNzZjYzA1YTllYTQxZDEwZDcw
YTExZTlmOWE4NmVkOTVmNDBmNzEzNjMwYzVlMTgzNDBlMGU0Yzc2ZiAgc2RidXMtMC4xNC4wLnRh
ci5nego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiAgIHNoYTI1NiAg
ODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIx
Yjg4MDY0MyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRo
b24tc2RidXMubWsgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy9weXRob24tc2RidXMubWsKPiBpbmRl
eCAxMTFjNGJkNjQ4Li41NjBhNWYwMmFlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNk
YnVzL3B5dGhvbi1zZGJ1cy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNkYnVzL3B5dGhvbi1z
ZGJ1cy5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiAgIAo+IC1QWVRIT05fU0RCVVNfVkVSU0lPTiA9IDAuMTMuMAo+ICtQWVRIT05fU0RCVVNf
VkVSU0lPTiA9IDAuMTQuMAo+ICAgUFlUSE9OX1NEQlVTX1NPVVJDRSA9IHNkYnVzLSQoUFlUSE9O
X1NEQlVTX1ZFUlNJT04pLnRhci5nego+IC1QWVRIT05fU0RCVVNfU0lURSA9IGh0dHBzOi8vZmls
ZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy80Zi9jNy84NzQwZmY3OGU5ZmZkYmI5YTI4ZTc3
MjJlMTQ1Nzk1MDE1YzYyZWE3Y2U4MTIyNDJmNTk2ODA3MzUxMWMKPiArUFlUSE9OX1NEQlVTX1NJ
VEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMTcvOWEvMWRjMDEw
NDI4ZmExZjQ0NDgwOWQ5YWExYWRiM2NlMjMxZGFlODkxYjVmMzM2MzVkOGY0ZDdhOGUzM2ZkCj4g
ICBQWVRIT05fU0RCVVNfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgIFBZVEhPTl9TREJVU19M
SUNFTlNFID0gTEdQTC0yLjErCj4gICBQWVRIT05fU0RCVVNfTElDRU5TRV9GSUxFUyA9IENPUFlJ
TkcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
