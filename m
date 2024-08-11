Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939BEC3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 10:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3006540129;
	Sun, 11 Aug 2024 10:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dlLWz7nGM7T; Sun, 11 Aug 2024 10:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7BBF4027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7BBF4027D;
	Sun, 11 Aug 2024 10:01:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D285A1BF2AA
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF79340BB7
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTftxJSRmJ2w for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 10:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F4A640B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F4A640B7B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F4A640B7B
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:01:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDysm-1sVQPA1npE-00D3K0; Sun, 11
 Aug 2024 12:01:16 +0200
Date: Sun, 11 Aug 2024 12:01:10 +0200
Message-Id: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOaLuGYC/1XMQQqDMBCF4avIrJsyBk2wq95DXCRmqgNRS5KKR
 bx7U7vq8n/wvh0iBaYIt2KHQCtHXuYc8lJAP5p5IMEuN0iUFSosRVRievnEvfFeSG3Q1pqqxhL
 kyzPQg7eTa7vcI8e0hPepr+V3/UEaq39oLQUKq4yz0jpssL4P03adKUF3HMcH+rgvi6YAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723370475; l=1594;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=H6nQAZ20fkq0QcO/L6W9q6RepQm50Q1ciOdhd3BW9IE=;
 b=9q6IyUOHDxQeQiGA4OQPxuhgyhW41WEwr7p6rA/cR1ya0JiZoVoCzQ9sM+3JPs4v+/xUvVfUt
 Hnn8bkP8cvNDPu8Svp3ao4q2YIB/PDycGyTV/8qezIGeylH1UA/d50k
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:f03HwJVlcficm5Q5Y1wLtTC+VmlE7kv9nB0ft3k/YTw4bGE3we7
 kXVL4Gw66X7/n7kOG0Vyye0LLJIgu03KTaW2F0wOvlPCONcrPzjhbSVlABBCx26Mn0eCg00
 30kSQya14R7cQiAOQIRQOPQ96rfl4NyxTCjk9aHTzlJD7RqTEye0AKiOZSixEMPUWFDKEk0
 CqW/ECv7SZZIsdUX77Rew==
UI-OutboundReport: notjunk:1;M01:P0:Tgm0Qu0Jm6U=;19nMI9iKcSQBdGoy27YiDM323TL
 NPqbosH6EoP/9rl2KGxAWLctUOrkxaNHLlT8/XoE4pv/U2Q0SALkmvfvWvNqw0LcLwfacCU6v
 SEoOFbfNHdxSufRPd4v7Pj3pF+9Vhcs8A8UIUSEACiJZjA5W5V2lJjgJBfF2zb84/jRAha3/F
 +4zqrqCdpmfsOsHXNz9yzRSgc4TQxq5ta6G1AV7Jzp5YJDQ0qEBKwA0wm5wslIRgOG/t+LDHO
 w7N9D81+4u7pR14/FjiOCPGtxytEhG14VB6OhdLv32645EBMJXSnL8XlJDSGQhnm0tVxUEKKa
 omf1Avp2t2wxHlg4rcwb8BqRfoaI3wbYne9awi7U7yyKoH/6q+Y/1YL5D5LZ4ARLvh43HnBaR
 OD0Ehyfk3OrWT6qYGTYRFUEZyP5lNRF61srqZsXoy7r12/7iFACVvJQY9xRyLvGYF993JWyYb
 MBzotonGv01TJ8L86ACpKmJCE/zAmkXwK3Y7tcj2QfWeHLtfctmk9ciS04uIDTXgoBZAJbqNT
 XyM7RMA4Y6tTu1in2k+0UkbY/kIZBNRy5IFSdrCr1sq0KbAsHp/LxwYmoXezZYgMR0s/t6fsZ
 j6fIXi+lXJ5s+cEoYwO0LwxoDBT6cE4IrsQeQ918O9n/EX4lPvJM18ZQSYRMApgu6gYzyBodn
 vvnr1ieHEu9GYgBVhVEdQsL8OQb6ecg5HNjX77yrkvxgEyajV78pYPVm2tVMy8m7cwDTDDCA7
 5eOJ7idEdv5q1BC7NVcJ8169XFs8//ESZIUex/3lGT42ILOnilJRtMghvoblSV0X+1DE201Yo
 2i8YKGZNhnxBH0PFkAjDx2yw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723370476; x=1723975276; i=j.neuschaefer@gmx.net;
 bh=HKri+z2yWh5hSIg5pEKZsnQoV5SghSDG99NzQ42XTg0=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DSd4965V2/Xxq4IuLnnJ7EEaPdXpSKaomwKqwirBsv66RicGOqmZcvhIIxMC04oR
 Oaan0fb43oJFH4UvbpOUbeVIq+IqSrGlPoebb5jdloeVprrJ0P1jD3Ek9a+PQflX9
 qcjzm5lVCmtJkVDEJ9HLRp3wfHpABZIPy2nbLPg2/XU85F/nkRRyORYCUoSI9Tmo7
 ABK+6M3quIBt8P93wF+BYQy7LRXTx+8EgGijprF3MtMlz0mLFkuzsedsl2xy94j83
 D2GveeaF3MLlE10FaQyk7z3oIz7i2BOUGI1Bg2rxZCvdnCx43V5/H4uwhEbzRLzcV
 9RTAvgaceTKOnT7oRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=DSd4965V
Subject: [Buildroot] [PATCH v2 0/4] Optionally build some skarnet.org
 packages as multicall binaries
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVjZW50IHllYXJzLCBleGVjbGluZSwgczYtcG9ydGFibGUtdXRpbHMsIGFuZCBzNi1saW51
eC11dGlscyBnYWluZWQKdGhlIGFiaWxpdHkgdG8gYmUgYnVpbHQgYXMgYSBtdWx0aWNhbGwgYmlu
YXJ5LCBqdXN0IGxpa2UgYnVzeWJveC4KVGhpcyBwYXRjaHNldCBleHBvc2VzIHRoZSBtdWx0aWNh
bGwgb3B0aW9uIGluIEJ1aWxkcm9vdC4KCkdpdmVuIHRoYXQgMjAyNC4wOC1yYzEgaGFzIGp1c3Qg
YmVlbiB0YWdnZWQsIGFuZCB0aGlzIGlzIG5vdCBhIGJ1Z2ZpeApzZXJpZXMsIGl0IHNob3VsZCBw
cm9iYWJseSBiZSBhcHBsaWVkIHRvIHRoZSBuZXh0IGJyYW5jaCBpbnN0ZWFkIG9mCm1hc3Rlci4K
ClRvOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpDYzogRXJpYyBMZSBCaWhhbiA8ZXJpYy5sZS5i
aWhhbi5kZXZAZnJlZS5mcj4KQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KU2lnbmVk
LW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCkNoYW5nZXMg
aW4gdjI6Ci0gQWRkIERFVkVMT1BFUlMgZW50cnkKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjQwNzA0LXM2LW11bHRpY2FsbC12MS0wLWI2YWRiMmJkMDkwNUBnbXgu
bmV0CgotLS0KSi4gTmV1c2Now6RmZXIgKDQpOgogICAgICBwYWNrYWdlL2V4ZWNsaW5lOiBBZGQg
b3B0aW9uIHRvIGJ1aWxkIG11bHRpY2FsbCBiaW5hcnkKICAgICAgcGFja2FnZS9zNi1wb3J0YWJs
ZS11dGlsczogQWRkIG9wdGlvbiB0byBidWlsZCBtdWx0aWNhbGwgYmluYXJ5CiAgICAgIHBhY2th
Z2UvczYtbGludXgtdXRpbHM6IEFkZCBvcHRpb24gdG8gYnVpbGQgbXVsdGljYWxsIGJpbmFyeQog
ICAgICBERVZFTE9QRVJTOiBBZGQgc2thcm5ldC5vcmcgcGFja2FnZXMgdG8gSi4gTmV1c2Now6Rm
ZXIncyBlbnRyeQoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMSArKysrKysrKysrLQogcGFja2FnZS9leGVjbGluZS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICB8ICA5ICsrKysrKysrKwogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvczYtbGludXgtdXRpbHMvQ29uZmlnLmlu
ICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKIHBhY2thZ2UvczYtbGludXgtdXRpbHMvczYt
bGludXgtdXRpbHMubWsgICAgICAgfCAgMSArCiBwYWNrYWdlL3M2LXBvcnRhYmxlLXV0aWxzL0Nv
bmZpZy5pbiAgICAgICAgICAgIHwgIDkgKysrKysrKysrCiBwYWNrYWdlL3M2LXBvcnRhYmxlLXV0
aWxzL3M2LXBvcnRhYmxlLXV0aWxzLm1rIHwgIDEgKwogNyBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogYWI5MmVhYTA0YmY4ZWMy
OWRjZWQwNDA2M2JhMWRjNjI2YjdkNTc4OQpjaGFuZ2UtaWQ6IDIwMjQwNjAxLXM2LW11bHRpY2Fs
bC0yN2EwYjU3ZTQ5YmUKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIgPGoubmV1c2No
YWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
