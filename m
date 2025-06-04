Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15848C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 19:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C26BF60D59;
	Wed,  4 Jun 2025 19:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TPam1IRbwhw; Wed,  4 Jun 2025 19:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD10360BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD10360BA4;
	Wed,  4 Jun 2025 19:29:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3ACE1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFD240B4D
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIcgNdoGru7G for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 19:29:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18CEE40B2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CEE40B2B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18CEE40B2B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 19:29:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F31FF1C0EF3; Wed,  4 Jun 2025 21:29:32 +0200 (CEST)
Message-ID: <2345bdd4-08d4-485e-b2db-8e497717ca05@rnout.be>
Date: Wed, 4 Jun 2025 21:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20250603063844.194753-1-raphael.melotte@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250603063844.194753-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749065373; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uSlpi2Ec4Bqf+OH0/szilOluVQb46A+3W4EH9ld7CWc=;
 b=FRjgC+VVrZn0ZztoBk8mZ9wjPHeZWcUhKmhCjTwD745HacX5EUI6SFLMLzx/+8q4qHSe6B
 CkZOQn3kFI2IERNx3jAbIIXsdc1CUQ1K7pPka9B98hjEePZF3vxuJjrMUyY8xfLop7a5tJ
 rX/Q3EiQQU/C2c7OaEzxw8MNsHa0YG6BAOIaEHhjjqaxvgR1Hs6zJqu//40BxD2hJ0/h18
 3m6kQqDyW0TFqykfgEYqPJXbjL/YluAZgC4J41jswDLqUrL+kU+2u+Fl231XFyVBdWrBAW
 k7fgtFhSkf/b+H3LvLgUe2LTrytREfm7tA1kA7VKPyfvio8HUYxkoSA6WTYZOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FRjgC+VV
Subject: Re: [Buildroot] [PATCH 1/1] utils/get-developers: add option to
 list packages matching developers
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

CgpPbiAwMy8wNi8yMDI1IDA4OjM4LCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEluIHNvbWUgY2FzZXMgaXQgY2FuIGJlIHVzZWZ1bCB0byBiZSBhYmxlIHRvIHJldHJp
ZXZlIHRoZSBsaXN0IG9mCj4gcGFja2FnZXMgcmVnaXN0ZXJlZCBpbiB0aGUgZGV2ZWxvcGVycyBm
aWxlIGZvciBjZXJ0YWluIHVzZXJzLgo+IEZvciBleGFtcGxlLCBvbmUgbWlnaHQgd2FudCB0byBy
ZXRyaWV2ZSBhbGwgdGhlIHBhY2thZ2VzIHJlbGF0ZWQgdG8gYQo+IHNwZWNpZmljIGRvbWFpbiBu
YW1lIChlLmcuIGEgY29tcGFueSkgdG8gdXNlIGl0IGVsc2V3aGVyZSAoZS5nLiBmZWVkCj4gaXQg
aW50byBwa2ctc3RhdHMpLgoKICBUaGF0IHVzZSBjYXNlIG9mICJhIGNvbXBhbnkiIG1ha2VzIHNl
bnNlIGZvciBicjItZXh0ZXJuYWwgcGFja2FnZXMsIGJ1dCB0aG9zZSAKZG9uJ3QgZW5kIHVwIGlu
IERFVkVMT1BFUlMuIEdpdmVuIHdoZXJlIHRoaXMgcGF0Y2ggaXMgY29taW5nIGZyb20sIEkgdGhp
bmsgdGhlIAppZGVhIGlzIHRvIHVzZSBERVZFTE9QRVJTIHRvIHRyYWNrIExUUyBwYWNrYWdlcz8g
VGhlbiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIApoYXZlIHNvbWV0aGluZyBzcGVjaWZpYyBmb3Ig
dGhhdCAoaS5lLiBub3QgREVWRUxPUEVSUykuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEFz
ICctZCcgaXMgYWxyZWFkeSB0YWtlbiwgdGhlIG5ldyBvcHRpb24gdXNlcyAnLXInIChmb3IgcmVn
ZXgpIGZvcgo+IGxhY2sgb2Ygc29tZXRoaW5nIGJldHRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
YXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gICB1dGls
cy9nZXQtZGV2ZWxvcGVycyB8IDE0ICsrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS91dGlscy9nZXQtZGV2ZWxvcGVycyBi
L3V0aWxzL2dldC1kZXZlbG9wZXJzCj4gaW5kZXggODNjNTczYmYyMy4uZWM5MDFlNGMwYyAxMDA3
NTUKPiAtLS0gYS91dGlscy9nZXQtZGV2ZWxvcGVycwo+ICsrKyBiL3V0aWxzL2dldC1kZXZlbG9w
ZXJzCj4gQEAgLTIsNiArMiw3IEBACj4gICAKPiAgIGltcG9ydCBhcmdwYXJzZQo+ICAgaW1wb3J0
IGdldGRldmVsb3BlcmxpYgo+ICtpbXBvcnQgcmUKPiAgIGltcG9ydCBzeXMKPiAgIAo+ICAgCj4g
QEAgLTEzLDYgKzE0LDggQEAgZGVmIF9fbWFpbl9fKCk6Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICBoZWxwPSdmaW5kIGRldmVsb3BlcnMgaW4gY2hhcmdlIG9mIHRoaXMgYXJjaGl0ZWN0dXJl
JykKPiAgICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctcCcsIGRlc3Q9J3BhY2thZ2UnLCBhY3Rp
b249J3N0b3JlJywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9J2ZpbmQgZGV2ZWxv
cGVycyBpbiBjaGFyZ2Ugb2YgdGhpcyBwYWNrYWdlJykKPiArICAgIHBhcnNlci5hZGRfYXJndW1l
bnQoJy1yJywgZGVzdD0nZGV2ZWxvcGVycycsIGFjdGlvbj0nc3RvcmUnLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICBoZWxwPSdmaW5kIHBhY2thZ2VzIGhhbmRsZWQgYnkgZGV2ZWxvcGVycyBt
YXRjaGluZyBhIHJlZ2V4JykKPiAgICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctZicsIGRlc3Q9
J2ZpbGVzJywgbmFyZ3M9JyonLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgaGVscD0nZmlu
ZCBkZXZlbG9wZXJzIGluIGNoYXJnZSBvZiB0aGVzZSBmaWxlcycpCj4gICAgICAgcGFyc2VyLmFk
ZF9hcmd1bWVudCgnLWMnLCBkZXN0PSdjaGVjaycsIGFjdGlvbj0nc3RvcmVfY29uc3QnLAo+IEBA
IC0zOSw2ICs0Miw4IEBAIGRlZiBfX21haW5fXygpOgo+ICAgICAgICAgICBhY3Rpb24gKz0gMQo+
ICAgICAgIGlmIGFyZ3MudmFsaWRhdGU6Cj4gICAgICAgICAgIGFjdGlvbiArPSAxCj4gKyAgICBp
ZiBhcmdzLmRldmVsb3BlcnM6Cj4gKyAgICAgICAgYWN0aW9uICs9IDEKPiAgICAgICBpZiBsZW4o
YXJncy5wYXRjaGVzKSAhPSAwOgo+ICAgICAgICAgICBhY3Rpb24gKz0gMQo+ICAgICAgIGlmIGFj
dGlvbiA+IDE6Cj4gQEAgLTg2LDYgKzkxLDE1IEBAIGRlZiBfX21haW5fXygpOgo+ICAgICAgICAg
ICAgICAgICAgICAgICBwcmludChkZXYubmFtZSkKPiAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWsKPiAgIAo+ICsgICAgIyBIYW5kbGUgdGhlIGRldmVsb3BlcnMgYWN0aW9uCj4gKyAgICBpZiBh
cmdzLmRldmVsb3BlcnMgaXMgbm90IE5vbmU6Cj4gKyAgICAgICAgZGV2ZWxvcGVyc19yZSA9IHJl
LmNvbXBpbGUoYXJncy5kZXZlbG9wZXJzKQo+ICsgICAgICAgIGZvciBkZXYgaW4gZGV2czoKPiAr
ICAgICAgICAgICAgaWYgZGV2ZWxvcGVyc19yZS5tYXRjaChkZXYubmFtZSk6Cj4gKyAgICAgICAg
ICAgICAgICBmb3IgcGFja2FnZSBpbiBkZXYucGFja2FnZXM6Cj4gKyAgICAgICAgICAgICAgICAg
ICAgcHJpbnQocGFja2FnZSkKPiArICAgICAgICByZXR1cm4KPiArCj4gICAgICAgIyBIYW5kbGUg
dGhlIHBhdGNoZXMgYWN0aW9uCj4gICAgICAgaWYgbGVuKGFyZ3MucGF0Y2hlcykgIT0gMDoKPiAg
ICAgICAgICAgKGZpbGVzLCBpbmZyYXMpID0gZ2V0ZGV2ZWxvcGVybGliLmFuYWx5emVfcGF0Y2hl
cyhhcmdzLnBhdGNoZXMpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
