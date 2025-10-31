Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C508CCF9FE
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 15:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CCD484832;
	Fri, 31 Oct 2025 15:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPpcW4_FFNIw; Fri, 31 Oct 2025 15:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF128482C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF128482C;
	Fri, 31 Oct 2025 15:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A53160
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C25C461733
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7xAHhy6TJnv for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 15:40:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 156CC61735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 156CC61735
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 156CC61735
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:40:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D1EBB4E41440
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:40:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 99DFE60704;
 Fri, 31 Oct 2025 15:40:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC91211818023; Fri, 31 Oct 2025 16:39:58 +0100 (CET)
Mime-Version: 1.0
Date: Fri, 31 Oct 2025 16:39:57 +0100
Message-Id: <DDWMCTTEL0E6.2MZJ9IJABBCA2@bootlin.com>
Cc: "Romain Naour" <romain.naour@smile.fr>
To: "Thomas Perale" <thomas.perale@mind.be>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, "Baruch Siach" <baruch@tkos.co.il>, "Thomas
 Perale via buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250906162551.3715975-2-romain.naour@smile.fr>
 <20250911192608.2672637-1-thomas.perale@mind.be> <87ldmjesxl.fsf@tarshish>
 <DDWEX0A8U40C.1J7DHEPBK82OY@bootlin.com>
 <8cc5e53c-edaf-4fc6-806e-e834e12190a2@mind.be>
In-Reply-To: <8cc5e53c-edaf-4fc6-806e-e834e12190a2@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761925201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fIWu15wSHYhek5cJFx/lIPEAwkrJxnzkkS/cTKsusq0=;
 b=HeKnsC0R7GbJrNAvgwq00JfmGpn9M0qTxM9SnMCwWTQ0LH8j4kJJf8dbyFHhHNriB7teHy
 u8pwqEXJnRRpCnMBNbUFJNg7v2mVbNj6xs3i1ncNGbzvwfZPAdmnZPrUrgH7T9RXIm6lNw
 gmc4Ym5rKn+iyE03Z7SORvYLz8rCAA4uanKa2h7LGHjp0j7te+HcH66IjhIzJbolD9T0NN
 LW5UFLBoFcbhAa1cW9EFODuVNgwD6hMvIT+XFTLpTBFT22FkDEOQXGvHmXRFOXZKFHqJG2
 /H8ihlmhA1GtIVa9b1GpOwz3ugo16zb7x9wkCqBgaGNMlabQY0KVAr4usxVQ3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HeKnsC0R
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gRnJpIE9jdCAzMSwgMjAyNSBhdCA0OjAwIFBNIENFVCwgVGhvbWFz
IFBlcmFsZSB3cm90ZToKPiBIaSBBbGV4aXMsCj4KPiBPbiAxMC8zMS8yNSAxMDo1MCBBTSwgQWxl
eGlzIExvdGhvcsOpIHdyb3RlOgo+PiBIZWxsbywKPj4KPj4gT24gRnJpIFNlcCAxMiwgMjAyNSBh
dCAyOjUwIFBNIENFU1QsIEJhcnVjaCBTaWFjaCB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4gSGkg
VGhvbWFzLAo+Pj4KPj4+IE9uIFRodSwgU2VwIDExIDIwMjUsIFRob21hcyBQZXJhbGUgdmlhIGJ1
aWxkcm9vdCB3cm90ZToKPj4+PiBJbiByZXBseSBvZjoKPj4+Pj4gQXBwbHkgYSBwYXRjaCBmcm9t
IG1ldGEtb3BlbmVtYmVkZGVkIGZpeGluZyBhIGNyb3NzLWJ1aWxkIGlzc3VlIFsxXS4KPj4+Pj4K
Pj4+Pj4gWzFdCj4+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvbWV0YS1vcGVu
ZW1iZWRkZWQvYmxvYi93YWxuYXNjYXIvbWV0YS1vZS9yZWNpcGVzLWJlbmNobWFyay9pb3pvbmUz
L2lvem9uZTMvcGFyYWxsZWxpc20ucGF0Y2gKPj4+Pj4KPj4+Pj4gRml4ZXM6Cj4+Pj4+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTExNzY3NzQ0MDUg
KFRlc3RJb3pvbmUpCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9t
YWluLm5hb3VyQHNtaWxlLmZyPgo+Pj4+IEFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNS4wNS54
LiBUaGFua3MKPj4+IE5vdCBpbiAyMDI1LjAyLnggb3IgMjAyNS4wNS54IGFzIG9mIGE0YWM0MmY0
ZTdhNzQgKCJSZXZlcnQKPj4+ICJwYWNrYWdlL2ZpcmV3YWxsZDogYWRkIG1pc3NpbmcgbmZ0YWJs
ZXMganNvbiBydW50aW1lIGRlcGVuZGVuY3kiIikgYW5kCj4+PiAwMmY0ZDYyYmJmOTUgKCJwYWNr
YWdlL3B5dGhvbjM6IGRvIGJ1aWxkLXRpbWUgZGV0ZWN0aW9uIG9mIG5vbi13b3JraW5nCj4+PiB0
b29sY2hhaW4iKSwgcmVzcGVjdGl2ZWx5Lgo+PiBJIHdhcyBpbnZlc3RpZ2F0aW5nIGEgYnVpbGQg
ZmFpbHVyZSBvbiB0aGUgaW96b25lIHBhY2thZ2Ugb24gYnVpbGRyb290Cj4+IDIwMjUuMDIueCwg
YW5kIGV2ZW50dWFsbHkgZm91bmQgdGhpcyBzZXJpZXMgd2hpY2ggaW5kZWVkIGZpeGVzIHRoZSBp
c3N1ZXMKPj4gb2JzZXJ2ZWQgbG9jYWxseS4gQXMgQmFydWNoIHN0YXRlZCwgaXQgZG9lcyBub3Qg
c2VlbSB0byBiZSBhcHBsaWVkIG9uCj4+IDIwMjUuMDIueCwgZGVzcGl0ZSBUaG9tYXMncyBub3Rp
ZmljYXRpb24uCj4+Cj4+IEFueSBwbGFuIHRvIGV2ZW50dWFsbHkgYXBwbHkgaXQgb24gMjAyNS4w
Mi54ID8KPj4KPj4gVGhhbmtzLAo+Pgo+PiBBbGV4aXMKPgo+IEFyZSB5b3UgdGFsa2luZyBhYm91
dCB0aGUgcGFyYWxsZWxpc20gaXNzdWUgPyBXZSBkaWRuJ3QgZW5kZWQgdXAgcGlja2luZyAKPiBp
dCBiZWNhdXNlIHRoZSBmaXggY2FtZSBhZnRlciB0aGUgdmVyc2lvbiBidW1wIHdoaWNoIGNvdWxk
IGltcGx5IHRoaXMgCj4gZXJyb3Igb25seSBoYXBwZW5zIGFmdGVyIHRoZSB2ZXJzaW9uIGJ1bXAu
CgpNeSBiYWQsIEkgZGlkIG1ha2UgdGhpbmdzIGNvbmZ1c2luZyBieSByZXBseWluZyB0byB0aGUg
dGhyZWFkIGludm9sdmluZyB0aGUKcGFyYWxsZWwgYnVpbGQgZml4LCBidXQgSSBhbSBpbmRlZWQg
cmVmZXJyaW5nIHRvIHRoZSBidW1wIHRvIGdldCBidWlsZApmaXhlcyByZWxhdGVkIHRvIEdDQyBy
YWlzaW5nIGVycm9ycyBpbnN0ZWFkIG9mIHdhcm5pbmdzLgoKPiBGb3IgdGhlIGJ1bXAgYW5kIHRo
ZSBnY2MgZml4ZXMsIGlmIGkgcmVtZW1iZXIgY29ycmVjdGx5IEkgdHJpZWQgdG8gYnVpbGQgCj4g
aXQgbG9jYWxseSBhbmQgaXQgZGlkbid0IGZhaWwuIFNpbmNlIHRoZSBjb21taXQgbWVzc2FnZSB3
YXMgbm90IHNwZWNpZmljIAo+IGVub3VnaCBhYm91dCB0aGUgZXJyb3IgSSBkaWRuJ3QgaW5jbHVk
ZSBpdC4gQnV0IEkgbWF5IGhhdmUgZG9uZSAKPiBzb21ldGhpbmcgd3JvbmcuCj4KPiBXaGF0J3Mg
dGhlIGVycm9yIHlvdSBhcmUgcnVubmluZyBpbnRvID8gVGhlIGJ1bXAgbG9va3MgdG8gYmUgc21h
bGwgc28gd2UgCj4gbWlnaHQgaW5jbHVkZSBpdCBhcyB3ZWxsIG5leHQgd2Vlay4KCkhlcmUgYXJl
IHRoZSBlcnJvcnMgSSBhbSBzZWVpbmc6CgpsaWJiaWYuYzoyMDU6MTogZXJyb3I6IHJldHVybiB0
eXBlIGRlZmF1bHRzIHRvICdpbnQnIFstV2ltcGxpY2l0LWludF0KICAyMDUgfCBjcmVhdGVfeGxz
KG5hbWUpCiAgICAgIHwgXn5+fn5+fn5+fgptYWtlWzJdOiAqKiogWzxidWlsdGluPjogbGliYmlm
Lm9dIEVycm9yIDEKbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4K
bGliYXN5bmMuYzogSW4gZnVuY3Rpb24gJ2VuZF9hc3luYyc6CmxpYmFzeW5jLmM6MzAyOjk6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZGVsX2NhY2hlJyBbLVdpbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAzMDIgfCAgICAgICAgIGRlbF9jYWNoZShteWdj
KTsKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fgpsaWJhc3luYy5jOiBJbiBmdW5jdGlvbiAnYXN5
bmNfcmVhZCc6CmxpYmFzeW5jLmM6NDMyOjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24gJ3Rha2VvZmZfY2FjaGUnOyBkaWQgeW91IG1lYW4gJ2FsbG9jX2NhY2hlJz8g
Wy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgNDMyIHwgICAgICAgICAgICAgICAg
IHRha2VvZmZfY2FjaGUoZ2MsY2UpOwogICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn5+CiAgICAgIHwgICAgICAgICAgICAgICAgIGFsbG9jX2NhY2hlCmxpYmFzeW5jLmM6IEF0IHRv
cCBsZXZlbDoKbGliYXN5bmMuYzo2MTg6MTogd2FybmluZzogY29uZmxpY3RpbmcgdHlwZXMgZm9y
ICd0YWtlb2ZmX2NhY2hlJzsgaGF2ZSAndm9pZChzdHJ1Y3QgY2FjaGUgKiwgc3RydWN0IGNhY2hl
X2VudCAqKScKICA2MTggfCB0YWtlb2ZmX2NhY2hlKHN0cnVjdCBjYWNoZSAqZ2MsIHN0cnVjdCBj
YWNoZV9lbnQgKmNlKQogICAgICB8IF5+fn5+fn5+fn5+fn4KbGliYXN5bmMuYzo0MzI6MTc6IG5v
dGU6IHByZXZpb3VzIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mICd0YWtlb2ZmX2NhY2hlJyB3aXRo
IHR5cGUgJ3ZvaWQoc3RydWN0IGNhY2hlICosIHN0cnVjdCBjYWNoZV9lbnQgKiknCiAgNDMyIHwg
ICAgICAgICAgICAgICAgIHRha2VvZmZfY2FjaGUoZ2MsY2UpOwogICAgICB8ICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+CmxpYmFzeW5jLmM6NjkyOjE6IHdhcm5pbmc6IGNvbmZsaWN0aW5n
IHR5cGVzIGZvciAnZGVsX2NhY2hlJzsgaGF2ZSAndm9pZCgpJwogIDY5MiB8IGRlbF9jYWNoZShn
YykKICAgICAgfCBefn5+fn5+fn4KbGliYXN5bmMuYzozMDI6OTogbm90ZTogcHJldmlvdXMgaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgJ2RlbF9jYWNoZScgd2l0aCB0eXBlICd2b2lkKCknCiAgMzAy
IHwgICAgICAgICBkZWxfY2FjaGUobXlnYyk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn4KbGli
YXN5bmMuYzogSW4gZnVuY3Rpb24gJ2FzeW5jX3JlYWRfbm9fY29weSc6CmxpYmFzeW5jLmM6ODE1
OjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3B1dG9uaW51c2Un
IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDgxNSB8ICAgICAgICAgICAgICAg
ICBwdXRvbmludXNlKGdjLGNlKTsKICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgps
aWJhc3luYy5jOiBJbiBmdW5jdGlvbiAnYXN5bmNfcmVsZWFzZSc6CmxpYmFzeW5jLmM6OTgyOjk6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAndGFrZW9mZmludXNlJyBb
LVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICA5ODIgfCAgICAgICAgIHRha2VvZmZp
bnVzZShnYyk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4KbGliYXN5bmMuYzogQXQgdG9w
IGxldmVsOgpsaWJhc3luYy5jOjk5NjoxOiB3YXJuaW5nOiBjb25mbGljdGluZyB0eXBlcyBmb3Ig
J3B1dG9uaW51c2UnOyBoYXZlICd2b2lkKCknCiAgOTk2IHwgcHV0b25pbnVzZShnYyxlbnRyeSkK
ICAgICAgfCBefn5+fn5+fn5+CmxpYmFzeW5jLmM6ODE1OjE3OiBub3RlOiBwcmV2aW91cyBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiAncHV0b25pbnVzZScgd2l0aCB0eXBlICd2b2lkKCknCiAgODE1
IHwgICAgICAgICAgICAgICAgIHB1dG9uaW51c2UoZ2MsY2UpOwogICAgICB8ICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+CmxpYmFzeW5jLmM6MTAxNzoxOiB3YXJuaW5nOiBjb25mbGljdGluZyB0
eXBlcyBmb3IgJ3Rha2VvZmZpbnVzZSc7IGhhdmUgJ3ZvaWQoKScKIDEwMTcgfCB0YWtlb2ZmaW51
c2UoZ2MpCiAgICAgIHwgXn5+fn5+fn5+fn5+CmxpYmFzeW5jLmM6OTgyOjk6IG5vdGU6IHByZXZp
b3VzIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mICd0YWtlb2ZmaW51c2UnIHdpdGggdHlwZSAndm9p
ZCgpJwogIDk4MiB8ICAgICAgICAgdGFrZW9mZmludXNlKGdjKTsKICAgICAgfCAgICAgICAgIF5+
fn5+fn5+fn5+fgptYWtlWzJdOiAqKiogWzxidWlsdGluPjogbGliYXN5bmMub10gRXJyb3IgMQpt
YWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3dvcmtzcGFjZS9idWlsZC9vdXQvb3V0cHV0LWRp
YW1vbmQvYnVpbGQvaW96b25lLTMuNTA2L3NyYy9jdXJyZW50JwptYWtlWzFdOiAqKiogW3BhY2th
Z2UvcGtnLWdlbmVyaWMubWs6MjczOiAvd29ya3NwYWNlL2J1aWxkL291dC9vdXRwdXQtZGlhbW9u
ZC9idWlsZC9pb3pvbmUtMy41MDYvLnN0YW1wX2J1aWx0XSBFcnJvciAyCm1ha2VbMV06IExlYXZp
bmcgZGlyZWN0b3J5ICcvd29ya3NwYWNlL2J1aWxkL2J1aWxkL2J1aWxkcm9vdCcKbWFrZTogKioq
IFsvd29ya3NwYWNlL2J1aWxkL2J1aWxkL21hdGNoYm94L2J1aWxkcm9vdC5tazo0ODogaW96b25l
XSBFcnJvciAyCgpJIG1hbmFnZWQgdG8gcmVwcm9kdWNlIHRoZSBidWlsZCBpc3N1ZSB3aXRoIHRo
ZSBmb2xsb3dpbmcgbWluaW1hbApkZWZjb25maWcgb24gMjAyNS4wMi54CgpCUjJfYXJtPXkKQlIy
X2NvcnRleF9hOT15CkJSMl9BUk1fRU5BQkxFX05FT049eQpCUjJfQVJNX0VOQUJMRV9WRlA9eQpC
UjJfQVJNX0ZQVV9ORU9OPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfQk9PVExJTj15CkJSMl9QQUNLQUdFX0lPWk9ORT15CgpJZiBpdCBoZWxwcywgd291
bGQgeW91IGxpa2UgbWUgdG8gcmVzZW5kIHRoZSBvcmlnaW5hbCBwYXRjaCBhbmQgZW5yaWNoIGl0
CndpdGggdGhvc2UgaW5mbyA/CgpBbGV4aXMKPgo+IFRoYW5rcyBmb3IgdGhlIG1lc3NhZ2UsCj4g
UEVSQUxFIFRob21hcwoKCgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
