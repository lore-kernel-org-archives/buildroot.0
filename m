Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339DDC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13BD80EA5;
	Sun, 18 May 2025 12:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uhmFZkrJNDE; Sun, 18 May 2025 12:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF2A810AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BF2A810AD;
	Sun, 18 May 2025 12:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBAE71BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F6880DA6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYd7bCLKiMOb for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:11:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19E0880CD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E0880CD2
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19E0880CD2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:11:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 934C91C0FE3; Sun, 18 May 2025 14:11:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Sun, 18 May 2025 14:11:31 +0200
Message-ID: <20250518121131.2821530-4-arnout@rnout.be>
In-Reply-To: <20250518121131.2821530-1-arnout@rnout.be>
References: <20250518121131.2821530-1-arnout@rnout.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747570298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=n3C87TcEOB/w+Rg9IedoVEA1OOJLgDwXzhQTm5dV57E=;
 b=QfT1ZMnM9Z6BGxrkNMzRY52ADwbCf2u+QD5ai3QrLuSugjwxSRD92IPzEjYkMo5PdhVSCC
 Qtkj89LFuHMR9kwUvCVFYMGbOgeVh0uMfQOSYiRmALomk+SKmDCtzV1eX4UhzWfw2254H1
 +7//+DfnqFe9lKFnSY7O46s8JedlHN1rOJen53ald3krtWBUw6Xn9ILY6q2Ic7/3C64kD3
 1MrlrwNoIxkGyN0SryaBGM+NDj1wkeK0vEV3RmNHWb5mZcy5VBofDTTitfXyU+5YppEmn+
 zLppOvmMHJrRlpRZlJkaFqiizhERwHmr3FQWx0B8N3JFqlEeqkWUeN3IPPg5vQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=QfT1ZMnM
Subject: [Buildroot] [PATCH 3/3] package/qt5/qt5webengine: fix thumb
 detection logic
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcGF0Y2ggdGhhdCByZW1vdmVzIHBhcnQgb2YgdGhlIGxvZ2ljIHRoYXQgYXR0ZW1wdHMg
dG8gZGV0ZWN0IGlmCnRodW1iIGlzIHN1cHBvcnRlZC4gVGhpcyBsb2dpYyBzaW1wbHkgZG9lc24n
dCB3b3JrIGF0IGFsbCBpbiB0aGUKQnVpbGRyb290IGNvbnRleHQuIEluIGZhY3QsIHRodW1iIGlz
IHN1cHBvcnRlZCBvbiBhbGwgMzItYml0IEFSTSBvbgp3aGljaCB3ZSBjYW4gYnVpbGQgcXQ1d2Vi
ZW5naW5lLgoKRml4ZXM6CldBUk5JTkc6IFRodW1iIGluc3RydWN0aW9uIHNldCBpcyByZXF1aXJl
ZCB0byBidWlsZCBmZm1wZWcgZm9yIFF0V2ViRW5naW5lLgpbLi4uXQpGQUlMRUQ6IG9iai90aGly
ZF9wYXJ0eS9mZm1wZWcvZmZtcGVnX2ludGVybmFsL3ZwOC5vClsuLi5dIC1jIC4uLy4uLzNyZHBh
cnR5L2Nocm9taXVtL3RoaXJkX3BhcnR5L2ZmbXBlZy9saWJhdmNvZGVjL3ZwOC5jIC1vIG9iai90
aGlyZF9wYXJ0eS9mZm1wZWcvZmZtcGVnX2ludGVybmFsL3ZwOC5vCntzdGFuZGFyZCBpbnB1dH06
IEFzc2VtYmxlciBtZXNzYWdlczoKe3N0YW5kYXJkIGlucHV0fToxMTE5OiBFcnJvcjogYmFkIGlu
c3RydWN0aW9uIGBsZHJoY3MgcjAsW2lwXSwjMicKe3N0YW5kYXJkIGlucHV0fToxMTU2OiBFcnJv
cjogYmFkIGluc3RydWN0aW9uIGBsZHJoY3MgcjksW2lwXSwjMicKe3N0YW5kYXJkIGlucHV0fTox
MTkwOiBFcnJvcjogYmFkIGluc3RydWN0aW9uIGBsZHJoY3MgbHIsW2lwXSwjMicKe3N0YW5kYXJk
IGlucHV0fToxMjUzOiBFcnJvcjogYmFkIGluc3RydWN0aW9uIGBsZHJoY3MgcjksW3I3XSwjMicK
Wy4uLl0KClNpZ25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQu
YmU+CkNjOiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIC4uLm1vdmUt
c29tZS1vZi10aGUtdGh1bWItZGV0ZWN0aW9uLWxvZy5wYXRjaCB8IDY5ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLzAwMDMtY29uZmlndXJlLnByaS1yZW1vdmUtc29t
ZS1vZi10aGUtdGh1bWItZGV0ZWN0aW9uLWxvZy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cXQ1L3F0NXdlYmVuZ2luZS8wMDAzLWNvbmZpZ3VyZS5wcmktcmVtb3ZlLXNvbWUtb2YtdGhlLXRo
dW1iLWRldGVjdGlvbi1sb2cucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUvMDAwMy1j
b25maWd1cmUucHJpLXJlbW92ZS1zb21lLW9mLXRoZS10aHVtYi1kZXRlY3Rpb24tbG9nLnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwLi41N2VkMzU1OGJjOQotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS8wMDAzLWNvbmZpZ3VyZS5w
cmktcmVtb3ZlLXNvbWUtb2YtdGhlLXRodW1iLWRldGVjdGlvbi1sb2cucGF0Y2gKQEAgLTAsMCAr
MSw2OSBAQAorRnJvbSBiMDBmN2I0MWZmZGVlMDNmOTk4MjI4N2Q2MWMyZmEyMWViZWU1ZTZiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91
dEBybm91dC5iZT4KK0RhdGU6IFNhdCwgMTcgTWF5IDIwMjUgMjI6MDk6MzIgKzAyMDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gY29uZmlndXJlLnByaTogcmVtb3ZlIHNvbWUgb2YgdGhlIHRodW1iIGRldGVj
dGlvbiBsb2dpYworCitUaGUgaGFzVGh1bWJGbGFnIHRlc3QgaGFzIGEgcm91bmRhYm91dCB3YXkg
b2YgZGlzY292ZXJpbmcgd2hldGhlciB0aHVtYgoraXMgYXZhaWxhYmxlLiBJdCBsb29rcyBhdCB0
aGUgLW10aHVtYiBhbmQgLW1hcm0gZmxhZyAod2hpY2ggZG9lcyBtYWtlCitzb21lIHNlbnNlKSwg
YnV0IHRoZW4gaXQgdHJpZXMgdG8gbG9vayBhdCAtbWFyY2ggdG8gZGV0ZXJtaW5lIHdoaWNoIEFS
TQorYXJjaGl0ZWN0dXJlIHZlcnNpb24gaXMgdXNlZC4gVGhhdCB0ZXN0IGRvZXNuJ3Qgd29yayBp
ZiBHQ0MgaXMKK2NvbmZpZ3VyZWQgZm9yIGEgZGVmYXVsdCB0YXJnZXQgYXJjaGl0ZWN0dXJlIGFu
ZCBubyAtbWFyY2ggaXMgcGFzc2VkIG9uCit0aGUgY29tbWFuZCBsaW5lLgorCitJbiBCdWlsZHJv
b3QsIHdlIGRvbid0IHBhc3MgYW55IC1tdGh1bWIsIC1tYXJtIG9yIC1tYXJjaCBpbiBDRkxBR1MK
K2JlY2F1c2UgYWxsIG9mIHRoYXQgaXMgaW5jbHVkZWQgaW4gdGhlIHRvb2xjaGFpbiB3cmFwcGVy
LiBUaGVyZWZvcmUsIHRoZQorbG9naWMgaGFzIG5vdGhpbmcgdG8gZGV0ZXJtaW5lIHRoZSB0YXJn
ZXQgQVJNIElTQSB2ZXJzaW9uIGFuZCByZXR1cm5zCitmYWxzZS4KKworQXMgYSByZXN1bHQsIG5v
dGhpbmcgaXMgcGFzc2VkIGRvd24gdG8gZ24sIGFuZCBnbiBhZGRzIC1tYXJtIHRvIHRoZQorYnVp
bGQuIFRoZXJlIGlzIGluIGZhY3QgYSB3YXJuaW5nIGFib3V0IHRoaXM6CisKKyAgICBXQVJOSU5H
OiBUaHVtYiBpbnN0cnVjdGlvbiBzZXQgaXMgcmVxdWlyZWQgdG8gYnVpbGQgZmZtcGVnIGZvciBR
dFdlYkVuZ2luZS4KKworYnV0IHNpbmNlIGl0J3MganVzdCBhIHdhcm5pbmcsIGl0IGdldHMgaWdu
b3JlZC4KKworSW5kZWVkLCB0aGUgYnVpbGQgZG9lcyBmYWlsICh3aGVuIGZmbXBlZyBpcyBidWls
dCwgaS5lLiB3aGVuCitCUjJfUEFDS0FHRV9RVDVXRUJFTkdJTkVfUFJPUFJJRVRBUllfQ09ERUNT
IGlzIGVuYWJsZWQpIHdpdGg6CisKKyAgICBGQUlMRUQ6IG9iai90aGlyZF9wYXJ0eS9mZm1wZWcv
ZmZtcGVnX2ludGVybmFsL3ZwOC5vCisgICAgWy4uLl0KKyAgICB7c3RhbmRhcmQgaW5wdXR9OiBB
c3NlbWJsZXIgbWVzc2FnZXM6CisgICAge3N0YW5kYXJkIGlucHV0fToxMTE5OiBFcnJvcjogYmFk
IGluc3RydWN0aW9uIGBsZHJoY3MgcjAsW2lwXSwjMicKKyAgICB7c3RhbmRhcmQgaW5wdXR9OjEx
NTY6IEVycm9yOiBiYWQgaW5zdHJ1Y3Rpb24gYGxkcmhjcyByOSxbaXBdLCMyJworCitJbiBwcmFj
dGljZSwgdGhlIGFyY2hpdGVjdHVyZSB2ZXJzaW9uIGRvZXNuJ3QgcmVhbGx5IG1hdHRlciwgYmVj
YXVzZSBhbGwKK3RoZSBhcmNoaXRlY3R1cmVzIHN1cHBvcnRlZCBieSBKU0NvcmUgaGF2ZSB0aHVt
Yi4KKworVGhlcmVmb3JlLCByZW1vdmUgdGhlIGxvZ2ljIGZvciBkZXRlY3RpbmcgaWYgdGhlIENQ
VSBhcmNoaXRlY3R1cmUKK3N1cHBvcnRzIHRodW1iLiBEbyBrZWVwIHRoZSAtbWFybSBhbmQgLW10
aHVtYiBsb2dpYywgZXZlbiB0aG91Z2ggaW4KK0J1aWxkcm9vdCBpdCBkb2Vzbid0IGRvIGFueXRo
aW5nLCBhbmQgdGhlIHdhcm5pbmcgZ2V0cyBpZ25vcmVkLgorCitTaWduZWQtb2ZmLWJ5OiBBcm5v
dXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QHJub3V0LmJlPgorVXBzdHJlYW06IEl0J3Mgbm90IGNs
ZWFyIGlmIHRoZSBzYW1lIGxvZ2ljIGFib3V0IEpTQ29yZSBhcHBsaWVzIGluCit1cHN0cmVhbSwg
c28gbm90IHNlbnQuCistLS0KKyBjb25maWd1cmUucHJpIHwgOCAtLS0tLS0tLQorIDEgZmlsZSBj
aGFuZ2VkLCA4IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvY29uZmlndXJlLnByaSBiL2Nv
bmZpZ3VyZS5wcmkKK2luZGV4IDhkYTMzNGM4My4uM2ZmMjk4ZTlmIDEwMDY0NAorLS0tIGEvY29u
ZmlndXJlLnByaQorKysrIGIvY29uZmlndXJlLnByaQorQEAgLTM3MCwxNCArMzcwLDYgQEAgZGVm
aW5lVGVzdChxdENvbmZUZXN0X2hhc1RodW1iRmxhZykgeworICAgICAhaXNFbXB0eShGTEFHKTog
cmV0dXJuKHRydWUpCisgICAgIEZMQUcgPSAkJHF0d2ViZW5naW5lX2V4dHJhY3RDRmxhZygiLW1h
cm0iKQorICAgICAhaXNFbXB0eShGTEFHKTogcmV0dXJuKGZhbHNlKQorLQorLSAgICBNQVJDSCA9
ICQkcXR3ZWJlbmdpbmVfZXh0cmFjdENGbGFnKCItbWFyY2g9LioiKQorLSAgICBNQVJNViA9ICQk
cmVwbGFjZShNQVJDSCwgImFybXYiLCkKKy0gICAgIWlzRW1wdHkoTUFSTVYpIHsKKy0gICAgICAg
IE1BUk1WID0gJCRzcGxpdChNQVJNViwpCistICAgICAgICBNQVJNViA9ICQkbWVtYmVyKE1BUk1W
LCAwKQorLSAgICB9CistICAgIGlmIChpc0VtcHR5KE1BUk1WKSB8IGxlc3NUaGFuKE1BUk1WLCA3
KSk6IHJldHVybihmYWxzZSkKKyAgICAgIyBubyBmbGFnIGFzc3VtZSBtdGh1bWIKKyAgICAgcmV0
dXJuKHRydWUpCisgfQorLS0gCisyLjQ5LjAKKwotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
