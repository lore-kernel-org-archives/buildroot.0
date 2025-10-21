Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81194CCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 16:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B216060D;
	Tue, 21 Oct 2025 16:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgABRuwsqU_Y; Tue, 21 Oct 2025 16:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F8F605F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F8F605F9;
	Tue, 21 Oct 2025 16:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 537C243F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A02A81154
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBLfcQ0ngoqP for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 16:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3837A80DE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3837A80DE8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3837A80DE8
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:27:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 67AD56012D;
 Tue, 21 Oct 2025 18:27:54 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 21 Oct 2025 18:27:46 +0200
Message-ID: <20251021162746.121353-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761064076;
 bh=TiZwUTCvb6EFHlRgwP02KLQ1pTzO36tNKdMCS2U1Feo=;
 h=From:To:Cc:Subject:Date:From;
 b=j+n0PBqh1pdt8rCERFoopFt6x/RAgxLVaor9rUhWbVnUa1sCFaoWzhrKRSZsA6UUl
 aGug1spEH3Nk5pqmk5OaZiJRqdwoUcdMfuEEbdWTHRmIwHWRu9km9PCutHKBUk5+34
 cADt702NRl1CPDWCtswIVqrSYOe+V4CSH5j2D+QsLe/nY61OAKE26cPOoyeJIQycld
 l6MQLASNglWffMuRZx7XLCoihdwEaC+8bbBBhFw+wHvYtdOcPiVR7Dc2YL3gSyPoPB
 8czaQ0vFnBEaG/9NCwiZRszJqpHu+BhFS7XxateV27SnRYjawprGPUp20PvBaKgi6h
 r4Sc6Kb4zRq9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j+n0PBqh
Subject: [Buildroot] [PATCH 1/1] support/testing: python-scp: fix test
 sample script
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiB0aGUgdGVzdCB3YXMgaW50cm9kdWNlZCBpbiBbMV0sIGEgY29tcGFyaXNvbiBvZiB0aGUg
c291cmNlIGFuZAp0aGUgZGVzdGluYXRpb24gZmlsZSB3YXMgYWRkZWQsIHdpdGggYSB0eXBvICh0
aGUgbWV0aG9kICIuY21wIiBuYW1lIGlzCm1pc3NpbmcpLgoKVGhlIHRlc3QgaXMgZmFpbGluZyB3
aXRoIGVycm9yIHN1Y2ggYXMgaW4gWzJdOgoKICAgIFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2Fs
bCBsYXN0KToKICAgICAgRmlsZSAiL3Jvb3Qvc2FtcGxlX3B5dGhvbl9zY3AucHkiLCBsaW5lIDE1
LCBpbiA8bW9kdWxlPgogICAgICAgIGFzc2VydCBmaWxlY21wKCIvZXRjL2hvc3RuYW1lIiwgIi90
bXAvaG9zdG5hbWUiKQogICAgICAgICAgICAgICB+fn5+fn5+Xl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXgogICAgVHlwZUVycm9yOiAnbW9kdWxlJyBvYmplY3QgaXMgbm90IGNhbGxh
YmxlCgpUaGlzIGNvbW1pdCBmaXhlcyB0aGF0LgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC83NDcwNTg3Y2ZhOWEyNGQzYzQ5YWRjMGZiNmNj
NjA1MTI5MDdmMzFhClsyXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9qb2JzLzExNzgxMzc4NTEwCgpDYzogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5m
cj4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3NjcC5w
eSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25f
c2NwLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zY3Au
cHkKaW5kZXggYzk4NmEyN2YwYi4uNWRmM2FlMjRkOCAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zY3AucHkKKysrIGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zY3AucHkKQEAgLTEyLDQgKzEyLDQgQEAg
c3NoX2NsaWVudC5jb25uZWN0KCcxMjcuMC4wLjEnLCB1c2VybmFtZT0ncm9vdCcpCiBzY3BfY2xp
ZW50ID0gU0NQQ2xpZW50KHNzaF9jbGllbnQuZ2V0X3RyYW5zcG9ydCgpKQogc2NwX2NsaWVudC5n
ZXQoIi9ldGMvaG9zdG5hbWUiLCAiL3RtcC9ob3N0bmFtZSIpCiAKLWFzc2VydCBmaWxlY21wKCIv
ZXRjL2hvc3RuYW1lIiwgIi90bXAvaG9zdG5hbWUiKQorYXNzZXJ0IGZpbGVjbXAuY21wKCIvZXRj
L2hvc3RuYW1lIiwgIi90bXAvaG9zdG5hbWUiKQotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
