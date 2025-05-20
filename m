Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66648C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E446109F;
	Tue, 20 May 2025 17:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytsNis3LU9QW; Tue, 20 May 2025 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6021961035
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6021961035;
	Tue, 20 May 2025 17:44:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC104DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B205D61038
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKtQfYXLQnqt for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1AC061034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1AC061034
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1AC061034
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:44:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B577FB005A6;
 Tue, 20 May 2025 19:44:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 20 May 2025 19:44:35 +0200
Message-ID: <20250520174435.1385934-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747763090;
 bh=ETNsPj2P09lhBICRt4KPBipyLEl2bmT5efb/MLlBij0=;
 h=From:To:Cc:Subject:Date:From;
 b=tH0pZIvNpNoURg95G65WDZjzj5ETf9xpZTS4FIOjcZ2v2oYDLsgA9MrlInobAi3X6
 5eWzDFQqYprrWvYpun7bJTBeraSakgrlT8GMMrHTkfAjC7Cb8DVEACuAaFekwflAlp
 hT2IJVSHtl8LhH9zFK019D8Y5urg0/47qUOFd1ZhEgkBEnN52e1xUliZldKHKcO3tQ
 Oxz7YZ/OLQgD9YAHl7Jno8BmzdJMVyn9hTSxFxQGNchvj7yQAmXoxpfphxSphegQ3Z
 zo9QZ0IL/mLxDPOYVg8Qk2QxOVnoJM+FyUoOKxyiNXIdrXOezKY8/mX3+sIkOgFwaY
 heOAsoVkxdNkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tH0pZIvN
Subject: [Buildroot] [PATCH 1/1] support/testing: test_xen: fix runtime test
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

VGhlIHRlc3RfeGVuLnB5IHJ1bnRpbWUgdGVzdCwgaW50cm9kdWNlZCBpbiBbMV0gYW5kIGltcHJv
dmVkIGluIFsyXSwKaXMgY2FsbGluZyBhICJzdHR5IHJhdyIgY29tbWFuZCwganVzdCBhZnRlciB0
aGUgZW11bGF0ZWQgbWFjaGluZQpsb2dpbiwgdG8gYXZvaWQgZG91YmxlLWNvb2tpbmcgdGhlIGNv
bnNvbGVzLiBUaGlzIGRvdWJsZS1jb29raW5nCnByZXZlbnRzIHRoZSB0ZXN0IGNvbnRyb2xsZXIg
dG8gY29ycmVjdGx5IGdldCB0aGUgY29tbWFuZCBlcnJvciBjb2Rlcy4KCkJ1aWxkcm9vdCBjb21t
aXQgWzNdICJzdXBwb3J0L3Rlc3Rpbmc6IHNldCBkYXRlIGluIGVtdWxhdGVkIG1hY2hpbmUiCmlu
dHJvZHVjZWQgYW4gaW52b2NhdGlvbiBvZiB0aGUgZGF0ZSBjb21tYW5kIHRvIHNldCB0aW1lIG9u
IHRoZQplbXVsYXRlZCBtYWNoaW5lLCBqdXN0IGFmdGVyIHRoZSBsb2dpbi4gVGhlIHJldHVybmVk
IGVycm9yIGNvZGUgaXMgYWxzbwpjaGVja2VkLiBTaW5jZSB0aGlzIGNvbW1pdCBbM10sIHRoZSB0
ZXN0X3hlbiBydW50aW1lIHRlc3QgaXMgZmFpbGluZwp3aGlsZSBhdHRlbXB0aW5nIHRvIHNldCB0
aGUgZGF0ZS4gVGhpcyBpcyBiZWNhdXNlIGl0IGlzIGludm9rZWQgYmVmb3JlCnRoZSB0ZXN0IHNj
cmlwdCBleGVjdXRlcyB0aGlzICJzdHR5IHJhdyIgY29tbWFuZC4KClRoZSBuZWVkIG9mIGV4ZWN1
dGluZyBhIGNvbW1hbmQganVzdCBhZnRlciB0aGUgbG9naW4sIGFuZCBqdXN0CmJlZm9yZSB3ZSBz
ZXQgdGhlIGVtdWxhdGVkIG1hY2hpbmUgZGF0ZSBpcyB2ZXJ5IGxpbWl0ZWQuIEl0IGlzIGFsbW9z
dApzcGVjaWZpYyB0byB0aGlzIHRlc3QuIFNvLCByYXRoZXIgdGhhbiBjaGFuZ2luZyB0aGUgdGVz
dAppbmZyYXN0cnVjdHVyZSwgdGhpcyBjb21taXQgc2ltcGx5IG1vdmVzIHRoaXMgInN0dHkgcmF3
IiBpbnZvY2F0aW9uCmZyb20gdGhlIHJ1bnRpbWUgdGVzdCBzY3JpcHQgdG8gYSBjdXN0b20gL2V0
Yy9wcm9maWxlLmQvc3R0eS1yYXcuc2gKZmlsZSBvbiB0YXJnZXQgcm9vdGZzIG92ZXJsYXksIHRv
IGRvIHRoaXMgY2FsbCBqdXN0IGF0IHRoZSBsb2dpbi4KCkZpeGVzOgpodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzEwMDAwMDExMzUwCgpbMV0gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzA1NWY4MmViYmQw
N2I1ODJjOTkyZWVkMzBlZjUxOTFmMTg4NzNiYTQKWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9jZDBmZmQ1OThjZjk0YjlkMTVjNDg5ZjI0Mjk2
MDI4MjVhMTg3NTNjClszXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9jb21taXQvY2Y4NjQxYjczZTdmMTU3NzYzN2JmZWYwZWNlNzhkZDUxOWIyNWQxOQoKQ2M6
IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+ClNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQpQYXRjaCB0ZXN0ZWQgaW46Cmh0
dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2JzLzEwMDkwMjYzMzYyCi0t
LQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkgICAgICAgICAgICAg
ICAgICB8IDcgLS0tLS0tLQogLi4uL3BhY2thZ2UvdGVzdF94ZW4vb3ZlcmxheS9ldGMvcHJvZmls
ZS5kL3N0dHktcmF3LnNoICAgICB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3hlbi9vdmVybGF5L2V0Yy9wcm9maWxlLmQvc3R0eS1yYXcuc2gK
CmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi5weSBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuLnB5CmluZGV4IGY2ODAxODdk
YjAuLmU1ZWFmM2MxMTUgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfeGVuLnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVu
LnB5CkBAIC03MywxMCArNzMsNiBAQCBjbGFzcyBUZXN0WGVuKGluZnJhLmJhc2V0ZXN0LkJSVGVz
dCk6CiAgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhYXJjaDY0Iiwgb3B0aW9ucz1x
ZW11X29wdHMpCiAgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQogCi0gICAgICAgICMgQXZv
aWQgZG91YmxlLWNvb2tpbmcgdGhlIHRlcm1pbmFsLCBvdGhlcndpc2UgdGhlIHRlc3QgaW5mcmFz
dHJ1Y3R1cmUKLSAgICAgICAgIyB3b3VsZCBub3QgYmUgYWJsZSB0byByZXRyaWV2ZSBlLmcuIHJl
dHVybiBjb2RlcyBwcm9wZXJseS4KLSAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygic3R0eSByYXci
KQotCiAgICAgICAgICMgVmVyaWZ5IHRoYXQgd2UgYXJlIGluZGVlZCBydW5uaW5nIHVuZGVyIFhl
bi4KICAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygieGwgaW5mbyIpCiAKQEAgLTkyLDkgKzg4LDYg
QEAgY2xhc3MgVGVzdFhlbihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICBzZWxmLmVt
dWxhdG9yLnFlbXUuc2VuZGxpbmUoInhsIGNyZWF0ZSAtYyAvZXRjL3hlbi9kb20xLmNmZyIpCiAg
ICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQogCi0gICAgICAgICMgQXZvaWQgZG91YmxlLWNv
b2tpbmcgdGhlIHRlcm1pbmFsIGZvciBkb20xLCB0b28uCi0gICAgICAgIHNlbGYuYXNzZXJ0UnVu
T2soInN0dHkgcmF3IikKLQogICAgICAgICAjIENoZWNrIHRoYXQgd2UgYXJlIG5vdCB0YWxraW5n
IHRvIGRvbTAgYW55bW9yZS4KICAgICAgICAgdXVpZCA9IHNlbGYuZ2V0X2RvbV91dWlkKCkKICAg
ICAgICAgc2VsZi5hc3NlcnROb3RFcXVhbCh1dWlkLCBkb20wX3V1aWQsICJVbmV4cGVjdGVkIGRv
bTAgVVVJRCIpCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3hlbi9vdmVybGF5L2V0Yy9wcm9maWxlLmQvc3R0eS1yYXcuc2ggYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3hlbi9vdmVybGF5L2V0Yy9wcm9maWxlLmQvc3R0eS1yYXcuc2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzUwMjU3OWQ4MAotLS0gL2Rl
di9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJs
YXkvZXRjL3Byb2ZpbGUuZC9zdHR5LXJhdy5zaApAQCAtMCwwICsxLDMgQEAKKyMgQXZvaWQgZG91
YmxlLWNvb2tpbmcgdGhlIHRlcm1pbmFsLCBvdGhlcndpc2UgdGhlIHRlc3QgaW5mcmFzdHJ1Y3R1
cmUKKyMgd291bGQgbm90IGJlIGFibGUgdG8gcmV0cmlldmUgcmV0dXJuIGNvZGVzIHByb3Blcmx5
Lgorc3R0eSByYXcKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
