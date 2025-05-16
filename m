Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B5CC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E42386111D;
	Fri, 16 May 2025 10:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeGCa3h0Jmtf; Fri, 16 May 2025 10:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 203F46105A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 203F46105A;
	Fri, 16 May 2025 10:50:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 681A913D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5990381F68
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFar_ychR8fj for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:50:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6058483CF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6058483CF7
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6058483CF7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A5BF1C0FE3; Fri, 16 May 2025 12:50:22 +0200 (CEST)
Message-ID: <9e9d6015-fd8d-4515-87d5-62b483d1c768@rnout.be>
Date: Fri, 16 May 2025 12:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>
References: <20250505075712.851378-1-salvador.joseluis@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250505075712.851378-1-salvador.joseluis@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vrPKxguESC/PH5oUvJlKu+okY3jCbaeP3Yna24cViyE=;
 b=eeaZZQEHYn5wSz7saHQPdfWoHC1yccdWpQ4+y/IkhCgXoA4aZy5jhxHU5sWVTedXvlGDHM
 kHxM5CZ9RYkBVBJcxN08fFzygxXZ2zO5HaB0vtnWXPRsxIvrCGomtMv6/G1B/LA1mDEXki
 AT+1VSDHVUN0cgknk5lHUIEmU7Xq8ZlyhMTg1CpQGHvvZeReXmidKCsqMj9mu65msKIQfm
 7k5i7pSEJFQGfseTEY94pmo1Z62lh2FSwU395NYE9+AUIX+sHDeY0EMECqzIGCea6Cc9/c
 gY50Jegfexe8ISWc5xfP6xeGJPCh2HOKXNXhXpBTJc0/DopPgRX2z/aJB217Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eeaZZQEH
Subject: Re: [Buildroot] [PATCH v2 1/2] package/zfs: bump version to 2.3.2
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

CgpPbiAwNS8wNS8yMDI1IDA5OjU3LCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gd3JvdGU6Cj4g
Rm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9y
ZWxlYXNlcy90YWcvemZzLTIuMy4yCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2
YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CgogIEFwcGxpZWQgYm90aCB0
byAyMDI1LjAyLngsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNr
YWdlL3pmcy96ZnMuaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS96ZnMvemZzLm1rICAgfCAyICst
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFz
aAo+IGluZGV4IDM2NDA5NjNiZGIuLjRjNjA3ZDg0YTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS96
ZnMvemZzLmhhc2gKPiArKysgYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAo+IEBAIC0xLDUgKzEsNSBA
QAo+IC0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25s
b2FkL3pmcy0yLjMuMS96ZnMtMi4zLjEuc2hhMjU2LmFzYwo+IC1zaGEyNTYgIDA1MzIzMzc5OTM4
NjkyMGJkYzYzNmUyMmQwZTE5YThjMmMzZTY0MmU4YmQ4NDdmZjg3ZTEwOGY4YmIxZjkwMDYgIHpm
cy0yLjMuMS50YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9y
ZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4zLjIvemZzLTIuMy4yLnNoYTI1Ni5hc2MKPiArc2hhMjU2
ICA4MGRhNjI4YTk1NDNlYzMzNTViZjQxMDYxNzQ1MGUxNjc3MDY5NDhjZWIyODc1NDE0NTVhMWI4
ZDg3Yjg3NThhICB6ZnMtMi4zLjIudGFyLmd6Cj4gICAKPiAgICMgSGFzaCBmb3IgbGljZW5zZSBm
aWxlczoKPiAgIHNoYTI1NiAgMWZmYjcwYzMzYzRmNzlmMDRlOTQ3ZmFjYzVjNzg1MWYyODk2MDky
NTZhYWNiNDdmYzExNWY3MDA0MjdkOTUyMCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKPiBpbmRleCBiMmVkZWIxMjY4Li5iZGQ3
YjJhM2IwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvemZzL3pmcy5tawo+ICsrKyBiL3BhY2thZ2Uv
emZzL3pmcy5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAgIAo+IC1aRlNfVkVSU0lPTiA9IDIuMy4xCj4gK1pGU19WRVJTSU9OID0gMi4zLjIK
PiAgIFpGU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rv
d25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQo+ICAgWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwo+
ICAgWkZTX0xJQ0VOU0UgPSBDRERMCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
