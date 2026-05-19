Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD1CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 18:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1500360B79;
	Tue, 19 May 2026 18:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tM05rqxHqJ6h; Tue, 19 May 2026 18:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2158360B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779217057;
	bh=XeY6UvaCiw2PLqnY3I/nSarJX5gyb6XAaZKsg/DrFO8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KbHQWTTAFWZ/KaLPGPVFbcALEXKRchNSOsq2DXLQzEPhAeaRDOY8q17gVF+oh2wKv
	 3bheuxy2/DDHFlDT0W3BE3NGketohcRsG/8irNXOxrMxHUDYYx+JhCxaJyOnTJ4NxO
	 TSVc23lKjEUtUaNMISaiZ08EsLSykVHIKptoqlrTn+d8q0j7AlcjOcd1+HJVDyLRpm
	 dA4/ckTIueyN7wg8Yn7J/JgidnH5Aa+d9MVp5FR0pTzX9U6LxTMMVn1E+TzD4PpQNj
	 8vj8Nc8EojbPu9jvcuXvaC23F5m3yurjmKmwktXK2+K/fl8u9qCsiXyrql7E10QyEp
	 7x7jSaTFmIrtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2158360B7B;
	Tue, 19 May 2026 18:57:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 857161B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A48D404C8
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zILCFuRTU-HI for <buildroot@buildroot.org>;
 Tue, 19 May 2026 18:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E8104030C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E8104030C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E8104030C
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:57:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46AEBA4C2CEC;
 Tue, 19 May 2026 20:57:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42010)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPPdF-000000003Ly-0BHp;
 Tue, 19 May 2026 18:57:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 19 May 2026 20:57:32 +0200
Message-ID: <20260519185732.1029402-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779217053;
 bh=KrLX2uaATeYPshQ2/1Q0xwTQIYZW0zqPJ5U272kBC/8=;
 h=From:To:Cc:Subject:Date:From;
 b=vOFM4+zgboPLYbYKX03u/mZEmExK0gzB8lZyh3BML8rMsvEf7FqdeXnhtBqugjqs8
 VtEvRMHmfZOhuEGhQM/RBgyDeHiphw7lg9zpgUMlA3OUxyEVDUQvyevzkkkrRr3uW0
 bYnN50g90A6/b13xhvG0MCKzHFuJSK+fA35o9JEBpkyOKOPNmis2pCFvvkZORkPn8P
 RsLu2ccp+0CumMXEpxz1g/9zGorw7oobUX6LKFiKOGsO2KUJzs2LcKfp7o98Ap+xh1
 wslBKpHrprZPASwxFRC3Whg/HQSy+ILnhrROKsOIER0ix2/f/QkOoMi32lFnq3Fgx6
 Rv9A+rthoRJbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vOFM4+zg
Subject: [Buildroot] [PATCH/next v2 1/1] package/libxmlsec1: bump version to
 1.3.11
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMvcmVsZWFzZXMvdGFnLzEuMy4xMQpodHRw
czovL2dpdGh1Yi5jb20vbHNoMTIzL3htbHNlYy9yZWxlYXNlcy90YWcvMS4zLjEwCgpTd2l0Y2hl
ZCB0byB0YXJiYWxsIGhhc2ggcHJvdmlkZWQgYnkgdXBzdHJlYW0uCgpEaXNhYmxlIHRoZSBidWls
ZCBvZiB1bml0X3Rlc3RzL3RyYW5zZm9ybV9oZWxwZXJzX3VuaXRfdGVzdHMgdG8gZml4CmEgYnVp
bGQgZXJyb3Igd2hpY2ggd291bGQgYmUgaW50cm9kdWNlZCBieSB0aGlzIGJ1bXA6CgogIHVuaXRf
dGVzdHMvdHJhbnNmb3JtX2hlbHBlcnNfdW5pdF90ZXN0cy5jOjI5MTo5OiBlcnJvcjogaW1wbGlj
aXQKICBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh4bWxEZWJ1Z0R1bXBEb2N1bWVudOKAmQog
IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKVGhlIGJ1aWxkIGVycm9yIG9jY3Vy
cyBkdWUgdG8gdXBzdHJlYW0gY29tbWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS9sc2gxMjMveG1sc2Vj
L2NvbW1pdC82MzNjMDZlNzU2YTM3NzBiNDQxNDc3MWQ3NjkyYzNmMjkyMzViNDljCgp3aGljaCBh
ZGRlZCB1bml0X3Rlc3RzL3RyYW5zZm9ybV9oZWxwZXJzX3VuaXRfdGVzdHMuYyB0byB2ZXJzaW9u
IDEuMy4xMAphbmQgbWFrZXMgdXNlIG9mIHhtbERlYnVnRHVtcERvY3VtZW50KCkgd2hpY2ggaXMg
cGFydCBvZiBsaWJ4bWwyOgpodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbGlieG1sMi8t
L2Jsb2IvdjIuMTUuMy9pbmNsdWRlL2xpYnhtbC9kZWJ1Z1hNTC5oP3JlZl90eXBlPXRhZ3MjTDU4
CgpidXQgb25seSB3aGVuIGxpYnhtbDIgd2FzIGJ1aWxkIHdpdGggLS13aXRoLWRlYnVnOgpodHRw
czovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbGlieG1sMi8tL2Jsb2IvdjIuMTUuMy9pbmNsdWRl
L2xpYnhtbC9kZWJ1Z1hNTC5oP3JlZl90eXBlPXRhZ3MjTDIwCgpCdWlsZHJvb3QgYnVpbGRzIHRo
ZSB0YXJnZXQgcGFja2FnZSBvZiBsaWJ4bWwyIHdpdGggLS13aXRob3V0LWRlYnVnOgpodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL2MxN2QxMTBiMTBkNDQ2
MjgyMmQ3MTJlMzI3ZWUwNTc5Y2Y0NWFmMTAvcGFja2FnZS9saWJ4bWwyL2xpYnhtbDIubWsjTDI1
CnNvIHdlIG5lZWQgdG8gZGlzYWJsZSB0aGUgYnVpbGQgb2YgeG1sc2VjX3VuaXRfdGVzdHMuCgpU
aGUgaG9zdC1saWJ4bWxzZWMxIHBhY2thZ2UgaXMgbm90IGFmZmVjdGVkIGJlY2F1c2UgaG9zdC1s
aWJ4bWwyIGRvZXMKbm90IG1ha2UgdXNlIG9mIC0td2l0aG91dC1kZWJ1Zy4KClNpZ25lZC1vZmYt
Ynk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQp2MjogZml4ZWQgbGlieG1sMi1y
ZWxhdGVkIGJ1aWxkIGVycm9yIChKdWxpZW4pCgogcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNl
YzEuaGFzaCB8IDUgKysrLS0KIHBhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rICAgfCA5
ICsrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2ggYi9w
YWNrYWdlL2xpYnhtbHNlYzEvbGlieG1sc2VjMS5oYXNoCmluZGV4IDllMGU2N2U3MzIuLmRiNmU2
NDU3ZTkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLmhhc2gKKysr
IGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEuaGFzaApAQCAtMSwzICsxLDQgQEAKKyMg
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vbHNoMTIzL3htbHNlYy9yZWxlYXNlcy90YWcvMS4zLjEx
CitzaGEyNTYgIDUzNjc1ZTk4ZmE4M2I0ODIwMWQyNGY3YmZiY2FlYWExYjUxNDk2YjhiMTlmZjk2
OTc4NTg1NmJkZWIxOTZhZjMgIHhtbHNlYzEtMS4zLjExLnRhci5negogIyBMb2NhbGx5IGNvbXB1
dGVkCi1zaGEyNTYgIGE2MzFjOGNkN2E2Yjg2ZTZhZGI5ZjViOTM1ZDQ1YTljZjk3NjhiM2NiMDkw
ZDQ2MWU4ZWI5ZDA0M2NmOWI2MmYgIHhtbHNlYzEtMS4zLjkudGFyLmd6Ci1zaGEyNTYgIGQ1ZTkz
ODg1MzQyNTYzNjBjNmEwMDlkNGYxOWFiMmI4ZDZlYzBhYTdmZjMyYTUxZTIyZDg5OWVkN2JlYjVj
NDggIENvcHlyaWdodAorc2hhMjU2ICBhNmQyMTcxNTFmM2Q0MjNlMDY2MzljMDc1YmFkOGU0NDJl
YTE5MzY4MjhkM2E2NjAxMDUxMjJlZjc4ZWNkOTZkICBDb3B5cmlnaHQKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnht
bHNlYzEubWsKaW5kZXggMjkyMjJiYzE2Zi4uNjI1ODU0MDFlYSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsKKysrIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnht
bHNlYzEubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1M
SUJYTUxTRUMxX1ZFUlNJT04gPSAxLjMuOQorTElCWE1MU0VDMV9WRVJTSU9OID0gMS4zLjExCiBM
SUJYTUxTRUMxX1NPVVJDRSA9IHhtbHNlYzEtJChMSUJYTUxTRUMxX1ZFUlNJT04pLnRhci5negog
TElCWE1MU0VDMV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMvcmVsZWFz
ZXMvZG93bmxvYWQvJChMSUJYTUxTRUMxX1ZFUlNJT04pCiBMSUJYTUxTRUMxX0xJQ0VOU0UgPSBN
SVQKQEAgLTE0LDYgKzE0LDEzIEBAIExJQlhNTFNFQzFfREVQRU5ERU5DSUVTID0gbGlieG1sMiBv
cGVuc3NsCiBIT1NUX0xJQlhNTFNFQzFfREVQRU5ERU5DSUVTID0gaG9zdC1saWJ4bWwyIGhvc3Qt
b3BlbnNzbAogTElCWE1MU0VDMV9BVVRPUkVDT05GID0gWUVTCiAKKyMgeG1sc2VjX3VuaXRfdGVz
dHMgbmVlZHMgeG1sRGVidWdEdW1wRG9jdW1lbnQoKSBmcm9tIGxpYnhtbDIgd2hpY2ggaXMKKyMg
bm90IHByZXNlbnQgaW4gYnVpbGRyb290IGJlY2F1c2UgbGlieG1sMiBpcyBidWlsZCB3aXRoIC0t
d2l0aG91dC1kZWJ1ZworZGVmaW5lIExJQlhNTFNFQzFfRElTQUJMRV9VTklUX1RFU1RTCisJJChT
RUQpICdzL25vaW5zdF9QUk9HUkFNUyA9IHhtbHNlY191bml0X3Rlc3RzL25vaW5zdF9QUk9HUkFN
UyA9LycgJChARCkvYXBwcy9NYWtlZmlsZS5hbQorZW5kZWYKK0xJQlhNTFNFQzFfUE9TVF9QQVRD
SF9IT09LUyArPSBMSUJYTUxTRUMxX0RJU0FCTEVfVU5JVF9URVNUUworCiBMSUJYTUxTRUMxX0NP
TkZfT1BUUyA9IFwKIAktLWVuYWJsZS1jcnlwdG8tZGw9bm8gXAogCS0td2l0aC1vcGVuc3NsIFwK
LS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
