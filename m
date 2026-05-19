Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF7ACD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 23:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A2460DC4;
	Tue, 19 May 2026 23:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV9tB4MyWH-z; Tue, 19 May 2026 23:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4429260DC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779233493;
	bh=s/gVFn38Ln2VCbyCvBhmv8r+sAraOXNbj0tsVzhOY28=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZLCKAvAgR4JJIvKbtqqNx5FbnT45OcFRVSx5YgYcaqr8OvGFqr12D7rS/xD1WORY+
	 O1vbqQIYdfWbZt8YWOqlRLx1O4q8kR27kj5tcZ1ZUCEkj15uajv1iAdTFtKJAYD1Dj
	 RHHhezZuJ9pxRX+eSTTzu71mrRzXvG+ZfNEo7z0Ok6vG8Q4XGKfHhtkSxXEgaOcAFZ
	 pJNKQpMJpTqafB7YfhcHWsbChJwr2y7k0s8Ucvcv82t83zkMsj4pSIdM/RiyIiqxlh
	 2f94iHCJAofVxAxlsBZWcA5Cdc0M9UKKjd5gzxTFtWgIq3EgEYHPBCJR2En2oWyUzM
	 t06N+kOJGW59A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4429260DC1;
	Tue, 19 May 2026 23:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0AAD282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 23:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D92D140625
 for <buildroot@buildroot.org>; Tue, 19 May 2026 23:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdwb1sTm-m3O for <buildroot@buildroot.org>;
 Tue, 19 May 2026 23:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF01F40600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF01F40600
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF01F40600
 for <buildroot@buildroot.org>; Tue, 19 May 2026 23:31:30 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-47c6f914617so1999204b6e.1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 16:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779233489; x=1779838289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXjdPBFD7fWMTRRvV6PAWJJ+u/QP8u/h7TzUVFylvqM=;
 b=lrYwxuMhKtVtHSHT5kJbQpwERiXyfzXYwVLLXXsQOTuCeVKUCVfXAEssbCQn606xln
 G6V7pLpCH8mYH5H2ZrBX0sxc8bxyQbOSveBN+hED/j+Yuwo52fXlsU4uIJXdUfVbQpe3
 8Z+hM4ob4p8Perqo03OtrTSx44EsfShoMAL9GTqI4E3rQKg8eHjNGoX6Hj2oLglo8nZv
 vJ/gKdLg7Df4GT/OlYP4eRPvVG8T6Ub4qpcMk4m2OBFhZMmVUE9pKAUUAqfQS3qO6O+N
 /BTfkigq/XrOUkI4nYrZVZgCceLrQjLVORuHdElDhTHBN+Am9oGocNh2D2uYA8fHRm/G
 /Mpw==
X-Gm-Message-State: AOJu0YwAU7BleWMJcdq1j5rzaVhnMwcTHuN3kIqpS/r7mq1V84dOJR/a
 XEKHUI/+ASr2LuxdqlvcT4zmZdeIagpi9Dfw+TwNCi+T0ewaXz+m9X+E6RJCRhTQ
X-Gm-Gg: Acq92OEd4PE3prD7xHrJIpek8ltQcihnplRJUenl8pKfecGusvl6z/UWHJyxnOiRnfZ
 qzXTtWNKDQxTGnhdyOQMYilS3Q4YF+CWX8bptSJJb7wOfGQ0GBhGegOlJ1WAF/ws6vbzwFzihoW
 dDqvVdUeRwKUCV4/QVLW3/D68J2ge67DbUZ/hhW0CqfnmtUHwkIPm7woULBJmveASKsEQOxabjY
 lxaL5uyLYtkmdFV6B4FA80hGmneqqbBZBMXAMV/4SKiZNbrQO2AXsLxnFZY1IPkxxaLQG7mvu2s
 HHMMn5hr8XCNHJahOyYbdpD8xuTFTeQ7/TDkh+RsFT81ngb7MVuUXsL9E91K29V5wZhUbD+6SNr
 zJFPbmFkBNHaN5ZLrIjIszuuJtigOe0OP9dxaTPCioqjcYNpnsQB0uI3x2GLZZf7x2OyBdymvc3
 sqG/XxnV1KeT4gWZS96PKnRh4LTgzF9QagM8jhSbF0SZ6ZVRKVVu2uul0/xBU3oIT5vQH2qua5P
 T9lyeYgM8RdK+89jx/50ZnfXeRuUZvnQ0T65NYCcVjw3ITyVc8cCuB4uLAfIvtCG8L0ZQ==
X-Received: by 2002:a05:6808:2388:b0:482:a7bf:dcc with SMTP id
 5614622812f47-482e577a8e5mr13883296b6e.30.1779233489460; 
 Tue, 19 May 2026 16:31:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-146-19.hlrn.qwest.net.
 [184.96.146.19]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e55bbd0be3sm11000036a34.15.2026.05.19.16.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 16:31:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 19 May 2026 17:31:21 -0600
Message-ID: <20260519233121.1497219-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779233489; x=1779838289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QXjdPBFD7fWMTRRvV6PAWJJ+u/QP8u/h7TzUVFylvqM=;
 b=BrwE1Xv2s+88gan9WZ58UwB/bpMqHYJ7nmfsgOU/WSIS6np0l1zVJfjIJdsaNhOfaA
 +9GSuF4G2YeN0JW3oqzoXWFzwro4jVClWvcU5WPmfrrlyhMpwlSUeUDyZebG3CHAO2uQ
 My6hpNtin17JjPR3fo1DBVFMz5hH1pEIO0uDldd6vDr2Y1ctuRts4avVB4u0i9te7kVk
 4oyroRSnZGu4dp749Js61YjfihIumWC3ZxclJCwLPv+1jsAG3Y+06ZF+ObXRjVkRJn4c
 D3ose6/jAVvP6yn+P1mZQ5ks551Ismej0C1zL/93aWDZaURhb4xDmqem3s6k8koZHP8O
 c1Iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BrwE1Xv2
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: fix missing const
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

Rml4ZXM6Cm91dHB1dC9idWlsZC9zaGFkb3dzb2Nrcy1saWJldi12My4zLjYvc3JjL25ldHV0aWxz
LmM6Mjc4OjI4OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gZGlzY2FyZHMg4oCYY29uc3TigJkgcXVh
bGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlm
aWVyc10KICAyNzggfCAgICAgICAgIGNoYXIgKm5leHRfZG90ICAgPSBzdHJjaHIobGFiZWwsICcu
Jyk7CgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KLS0tCiAuLi4vMDAwMS1GaXgtYnVpbGQtd2l0aC1nY2MxMy5wYXRjaCAgICAgICAgICAg
fCA0MSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc2hhZG93c29ja3MtbGliZXYvMDAwMS1GaXgt
YnVpbGQtd2l0aC1nY2MxMy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2hhZG93c29ja3Mt
bGliZXYvMDAwMS1GaXgtYnVpbGQtd2l0aC1nY2MxMy5wYXRjaCBiL3BhY2thZ2Uvc2hhZG93c29j
a3MtbGliZXYvMDAwMS1GaXgtYnVpbGQtd2l0aC1nY2MxMy5wYXRjaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi42YmFlODE0MzRhCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9zaGFkb3dzb2Nrcy1saWJldi8wMDAxLUZpeC1idWlsZC13aXRoLWdjYzEzLnBhdGNoCkBA
IC0wLDAgKzEsNDEgQEAKK0Zyb20gNTlhNmFjYTc1OTdjNDZjZDFkMDc5NjMxZDMwNjFkOTUyZmJk
MGQ2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEhpbGx3b29kIFlhbmcgPGhpbGx3
b29kQG9wZW5zdXNlLm9yZz4KK0RhdGU6IFR1ZSwgNSBNYXkgMjAyNiAxNDozOToxMCArMDgwMAor
U3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgd2l0aCBnY2MxMworCitTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KK1Vwc3RyZWFtOiBodHRw
czovL2dpdGh1Yi5jb20vc2hhZG93c29ja3Mvc2hhZG93c29ja3MtbGliZXYvcHVsbC8zMDM4Cist
LS0KKyBzcmMvYWNsLmMgICAgICB8IDIgKy0KKyBzcmMvbmV0dXRpbHMuYyB8IDIgKy0KKyAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdp
dCBhL3NyYy9hY2wuYyBiL3NyYy9hY2wuYworaW5kZXggMWVmYzFhYS4uYzc3YmJkNyAxMDA2NDQK
Ky0tLSBhL3NyYy9hY2wuYworKysrIGIvc3JjL2FjbC5jCitAQCAtNTcsNyArNTcsNyBAQCBzdGF0
aWMgdm9pZAorIHBhcnNlX2FkZHJfY2lkcihjb25zdCBjaGFyICpzdHIsIGNoYXIgKmhvc3QsIGlu
dCAqY2lkcikKKyB7CisgICAgIGludCByZXQgPSAtMTsKKy0gICAgY2hhciAqcGNoOworKyAgICBj
b25zdCBjaGFyICpwY2g7CisgCisgICAgIHBjaCA9IHN0cmNocihzdHIsICcvJyk7CisgICAgIHdo
aWxlIChwY2ggIT0gTlVMTCkgeworZGlmZiAtLWdpdCBhL3NyYy9uZXR1dGlscy5jIGIvc3JjL25l
dHV0aWxzLmMKK2luZGV4IDhjNzMyOWEuLjM1YjJkYzEgMTAwNjQ0CistLS0gYS9zcmMvbmV0dXRp
bHMuYworKysrIGIvc3JjL25ldHV0aWxzLmMKK0BAIC0yNzUsNyArMjc1LDcgQEAgdmFsaWRhdGVf
aG9zdG5hbWUoY29uc3QgY2hhciAqaG9zdG5hbWUsIGNvbnN0IGludCBob3N0bmFtZV9sZW4pCisg
ICAgIGNvbnN0IGNoYXIgKmxhYmVsID0gaG9zdG5hbWU7CisgICAgIHdoaWxlIChsYWJlbCA8IGhv
c3RuYW1lICsgaG9zdG5hbWVfbGVuKSB7CisgICAgICAgICBzaXplX3QgbGFiZWxfbGVuID0gaG9z
dG5hbWVfbGVuIC0gKGxhYmVsIC0gaG9zdG5hbWUpOworLSAgICAgICAgY2hhciAqbmV4dF9kb3Qg
ICA9IHN0cmNocihsYWJlbCwgJy4nKTsKKysgICAgICAgIGNvbnN0IGNoYXIgKm5leHRfZG90ID0g
c3RyY2hyKGxhYmVsLCAnLicpOworICAgICAgICAgaWYgKG5leHRfZG90ICE9IE5VTEwpCisgICAg
ICAgICAgICAgbGFiZWxfbGVuID0gbmV4dF9kb3QgLSBsYWJlbDsKKyAKKy0tIAorMi41My4wCisK
LS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
