Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC46C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C82340B11;
	Wed,  4 Jun 2025 18:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJUpxkI5NlQH; Wed,  4 Jun 2025 18:25:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B26340B23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B26340B23;
	Wed,  4 Jun 2025 18:25:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE541A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43EBA60C14
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj0xZXREtuGi for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:25:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E89960C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E89960C06
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E89960C06
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6307D1C010A; Wed,  4 Jun 2025 20:25:11 +0200 (CEST)
Message-ID: <591f6fdf-1027-4668-8361-3d6ae2ab59b4@rnout.be>
Date: Wed, 4 Jun 2025 20:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
References: <20250520174435.1385934-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250520174435.1385934-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BWbttYfdVnmVSaKF+nyffdf3DzkKihjjRqB4rMXFaQw=;
 b=aN3WAtu4UzgQD1juJ0CxW6phaCVbxelIelSZt/Ep8wTu2IzCR44GBDXE+YfEV+v8MtiH4Y
 KV8z6V68WJatjTiVZ+aEjXaKQOQebOU808JHKpRwoN+ear6uSvq9hOk1os6PgVqgLyObYR
 mPk40HW8hCnZTHVFi2gRzvIA+1ZDip0ve0Ua9Y9Q9WuKKty4qRFRxbKV4qC2Cxi9eQMsfM
 d+q9XuTQ4PCwJ6Ks2epJKeqBnYusx+8EyOd7eSGfRnJ9XAMxJEh0pHhlH43LP35yeZpJWg
 PLKFCVHXCI2/3CIJo9VsOQdE7FTg+H6Fdi1GrMsBM8do0dqRMXv85l9xYK/xDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aN3WAtu4
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_xen: fix runtime
 test
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

CgpPbiAyMC8wNS8yMDI1IDE5OjQ0LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBUaGUgdGVzdF94
ZW4ucHkgcnVudGltZSB0ZXN0LCBpbnRyb2R1Y2VkIGluIFsxXSBhbmQgaW1wcm92ZWQgaW4gWzJd
LAo+IGlzIGNhbGxpbmcgYSAic3R0eSByYXciIGNvbW1hbmQsIGp1c3QgYWZ0ZXIgdGhlIGVtdWxh
dGVkIG1hY2hpbmUKPiBsb2dpbiwgdG8gYXZvaWQgZG91YmxlLWNvb2tpbmcgdGhlIGNvbnNvbGVz
LiBUaGlzIGRvdWJsZS1jb29raW5nCj4gcHJldmVudHMgdGhlIHRlc3QgY29udHJvbGxlciB0byBj
b3JyZWN0bHkgZ2V0IHRoZSBjb21tYW5kIGVycm9yIGNvZGVzLgo+IAo+IEJ1aWxkcm9vdCBjb21t
aXQgWzNdICJzdXBwb3J0L3Rlc3Rpbmc6IHNldCBkYXRlIGluIGVtdWxhdGVkIG1hY2hpbmUiCj4g
aW50cm9kdWNlZCBhbiBpbnZvY2F0aW9uIG9mIHRoZSBkYXRlIGNvbW1hbmQgdG8gc2V0IHRpbWUg
b24gdGhlCj4gZW11bGF0ZWQgbWFjaGluZSwganVzdCBhZnRlciB0aGUgbG9naW4uIFRoZSByZXR1
cm5lZCBlcnJvciBjb2RlIGlzIGFsc28KPiBjaGVja2VkLiBTaW5jZSB0aGlzIGNvbW1pdCBbM10s
IHRoZSB0ZXN0X3hlbiBydW50aW1lIHRlc3QgaXMgZmFpbGluZwo+IHdoaWxlIGF0dGVtcHRpbmcg
dG8gc2V0IHRoZSBkYXRlLiBUaGlzIGlzIGJlY2F1c2UgaXQgaXMgaW52b2tlZCBiZWZvcmUKPiB0
aGUgdGVzdCBzY3JpcHQgZXhlY3V0ZXMgdGhpcyAic3R0eSByYXciIGNvbW1hbmQuCj4gCj4gVGhl
IG5lZWQgb2YgZXhlY3V0aW5nIGEgY29tbWFuZCBqdXN0IGFmdGVyIHRoZSBsb2dpbiwgYW5kIGp1
c3QKPiBiZWZvcmUgd2Ugc2V0IHRoZSBlbXVsYXRlZCBtYWNoaW5lIGRhdGUgaXMgdmVyeSBsaW1p
dGVkLiBJdCBpcyBhbG1vc3QKPiBzcGVjaWZpYyB0byB0aGlzIHRlc3QuIFNvLCByYXRoZXIgdGhh
biBjaGFuZ2luZyB0aGUgdGVzdAo+IGluZnJhc3RydWN0dXJlLCB0aGlzIGNvbW1pdCBzaW1wbHkg
bW92ZXMgdGhpcyAic3R0eSByYXciIGludm9jYXRpb24KPiBmcm9tIHRoZSBydW50aW1lIHRlc3Qg
c2NyaXB0IHRvIGEgY3VzdG9tIC9ldGMvcHJvZmlsZS5kL3N0dHktcmF3LnNoCj4gZmlsZSBvbiB0
YXJnZXQgcm9vdGZzIG92ZXJsYXksIHRvIGRvIHRoaXMgY2FsbCBqdXN0IGF0IHRoZSBsb2dpbi4K
PiAKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzEwMDAwMDExMzUwCj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8wNTVmODJlYmJkMDdiNTgyYzk5MmVlZDMwZWY1MTkxZjE4
ODczYmE0Cj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2NvbW1pdC9jZDBmZmQ1OThjZjk0YjlkMTVjNDg5ZjI0Mjk2MDI4MjVhMTg3NTNjCj4gWzNdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9jZjg2NDFi
NzNlN2YxNTc3NjM3YmZlZjBlY2U3OGRkNTE5YjI1ZDE5Cj4gCj4gQ2M6IFZpbmNlbnQgU3RlaGzD
qSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KCiAgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiAg
UmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gUGF0Y2ggdGVzdGVkIGluOgo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2JzLzEwMDkwMjYzMzYyCj4gLS0tCj4gICBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi5weSAgICAgICAgICAgICAgICAg
IHwgNyAtLS0tLS0tCj4gICAuLi4vcGFja2FnZS90ZXN0X3hlbi9vdmVybGF5L2V0Yy9wcm9maWxl
LmQvc3R0eS1yYXcuc2ggICAgIHwgMyArKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL3Byb2ZpbGUuZC9zdHR5LXJh
dy5zaAo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3hlbi5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuLnB5Cj4gaW5k
ZXggZjY4MDE4N2RiMC4uZTVlYWYzYzExNSAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3hlbi5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfeGVuLnB5Cj4gQEAgLTczLDEwICs3Myw2IEBAIGNsYXNzIFRlc3RYZW4oaW5m
cmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9
ImFhcmNoNjQiLCBvcHRpb25zPXFlbXVfb3B0cykKPiAgICAgICAgICAgc2VsZi5lbXVsYXRvci5s
b2dpbigpCj4gICAKPiAtICAgICAgICAjIEF2b2lkIGRvdWJsZS1jb29raW5nIHRoZSB0ZXJtaW5h
bCwgb3RoZXJ3aXNlIHRoZSB0ZXN0IGluZnJhc3RydWN0dXJlCj4gLSAgICAgICAgIyB3b3VsZCBu
b3QgYmUgYWJsZSB0byByZXRyaWV2ZSBlLmcuIHJldHVybiBjb2RlcyBwcm9wZXJseS4KPiAtICAg
ICAgICBzZWxmLmFzc2VydFJ1bk9rKCJzdHR5IHJhdyIpCj4gLQo+ICAgICAgICAgICAjIFZlcmlm
eSB0aGF0IHdlIGFyZSBpbmRlZWQgcnVubmluZyB1bmRlciBYZW4uCj4gICAgICAgICAgIHNlbGYu
YXNzZXJ0UnVuT2soInhsIGluZm8iKQo+ICAgCj4gQEAgLTkyLDkgKzg4LDYgQEAgY2xhc3MgVGVz
dFhlbihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgICBzZWxmLmVtdWxhdG9yLnFl
bXUuc2VuZGxpbmUoInhsIGNyZWF0ZSAtYyAvZXRjL3hlbi9kb20xLmNmZyIpCj4gICAgICAgICAg
IHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICAgCj4gLSAgICAgICAgIyBBdm9pZCBkb3VibGUtY29v
a2luZyB0aGUgdGVybWluYWwgZm9yIGRvbTEsIHRvby4KPiAtICAgICAgICBzZWxmLmFzc2VydFJ1
bk9rKCJzdHR5IHJhdyIpCj4gLQo+ICAgICAgICAgICAjIENoZWNrIHRoYXQgd2UgYXJlIG5vdCB0
YWxraW5nIHRvIGRvbTAgYW55bW9yZS4KPiAgICAgICAgICAgdXVpZCA9IHNlbGYuZ2V0X2RvbV91
dWlkKCkKPiAgICAgICAgICAgc2VsZi5hc3NlcnROb3RFcXVhbCh1dWlkLCBkb20wX3V1aWQsICJV
bmV4cGVjdGVkIGRvbTAgVVVJRCIpCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL3Byb2ZpbGUuZC9zdHR5LXJhdy5zaCBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL3Byb2ZpbGUu
ZC9zdHR5LXJhdy5zaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
MzUwMjU3OWQ4MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X3hlbi9vdmVybGF5L2V0Yy9wcm9maWxlLmQvc3R0eS1yYXcuc2gKPiBAQCAt
MCwwICsxLDMgQEAKPiArIyBBdm9pZCBkb3VibGUtY29va2luZyB0aGUgdGVybWluYWwsIG90aGVy
d2lzZSB0aGUgdGVzdCBpbmZyYXN0cnVjdHVyZQo+ICsjIHdvdWxkIG5vdCBiZSBhYmxlIHRvIHJl
dHJpZXZlIHJldHVybiBjb2RlcyBwcm9wZXJseS4KPiArc3R0eSByYXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
