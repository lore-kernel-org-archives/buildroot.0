Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A73EED630
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 17:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED8F81FC9;
	Thu, 12 Sep 2024 17:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EUHsAK_nquZ; Thu, 12 Sep 2024 17:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF2D81F2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBF2D81F2B;
	Thu, 12 Sep 2024 17:33:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57F781BF2E3
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4704860D89
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 17:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfYD1ebS5mIF for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 17:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C146B60A49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C146B60A49
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C146B60A49
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 17:33:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0B2126013B;
 Thu, 12 Sep 2024 19:33:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 Sep 2024 19:33:16 +0200
Date: Thu, 12 Sep 2024 19:33:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <ZuMl3F2Wga2vO-mH@landeda>
References: <20240912162232.1588976-1-sairon@sairon.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240912162232.1588976-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726162399;
 bh=ZQwWQpGQaxQxVXF2yE2dzIpnvmK6ya0xJOIWf01XNDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDGjK7ON8F5ESlWZPsxKXhsT4b6pJm19chWiF2tmrr6rJlL22FuqNoEx6czYmQ7c1
 8OeLoR+kRfeK/xy3/4a9B8QDNZQQmIQosZ2iGPN5q3XdwJpRzRXsu72DglBOtf/JYh
 r1WGBAOvneSB6uP20x5AsYugAlMxoz7qWI2VHAYkD0T0rWyo4CiCpso/yimZQh52ur
 zmg3yOMChV02br9aT45e5vUZ5aDpuNXhwwiQL3xbhwqOrTDd+T6XPr8fVRS11Uuxlf
 vXcOU2dPRVlSVwN28ixYSepd/ZRU/UiYJmHya/p2hW/VKDo79kEFd+znEXcfWxGnda
 XmC7hFyQX/G3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pDGjK7ON
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: fix build with
 BR2_PACKAGE_SYSTEMD enabled
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFuLCBBbGwsCgpPbiAyMDI0LTA5LTEyIDE4OjIyICswMjAwLCBKYW4gxIxlcm3DoWsgc3Bha2Ug
dGh1c2x5Ogo+IEFmdGVyIHVwZGF0ZSB0byB2NC4wLjQsIHByb3BzLW5nIGJ1aWxkIGZhaWxzIG9u
IGxpbmtlciBlcnJvciBpZgo+IEJSMl9QQUNLQUdFX1NZU1RFTUQgaXMgZW5hYmxlZDoKPiAKPiAv
YnVpbGRyb290L291dHB1dC9ob3N0L2xpYi9nY2MveDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUv
MTMuMy4wLy4uLy4uLy4uLy4uL3g4Nl82NC1idWlsZHJvb3QtbGludXgtZ251L2Jpbi9sZDogc3Jj
L3cubzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBzeW1ib2wgJ3NkX3Nlc3Npb25fZ2V0X3VpZEBA
TElCU1lTVEVNRF8yMDknCj4gL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL3g4Nl82NC1i
dWlsZHJvb3QtbGludXgtZ251LzEzLjMuMC8uLi8uLi8uLi8uLi94ODZfNjQtYnVpbGRyb290LWxp
bnV4LWdudS9iaW4vbGQ6IC9idWlsZHJvb3Qvb3V0cHV0L2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1s
aW51eC1nbnUvc3lzcm9vdC91c3IvbGliNjQvbGlic3lzdGVtZC5zby4wOiBlcnJvciBhZGRpbmcg
c3ltYm9sczogRFNPIG1pc3NpbmcgZnJvbSBjb21tYW5kIGxpbmUKPiBjb2xsZWN0MjogZXJyb3I6
IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKPiAKPiBBZGQgbHN5c3RlbWQgdG8gY29uZmlndXJl
IGFyZ3VtZW50cyBpZiBzeXN0ZW1kIGlzIGVuYWJsZWQgdG8gZml4IHRoaXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6Pgo+IC0tLQo+ICBwYWNrYWdl
L3Byb2Nwcy1uZy9wcm9jcHMtbmcubWsgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Byb2Nw
cy1uZy9wcm9jcHMtbmcubWsgYi9wYWNrYWdlL3Byb2Nwcy1uZy9wcm9jcHMtbmcubWsKPiBpbmRl
eCAyZjI4ZTM1NzFlLi5jZmY0ZTIxYzVlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHJvY3BzLW5n
L3Byb2Nwcy1uZy5tawo+ICsrKyBiL3BhY2thZ2UvcHJvY3BzLW5nL3Byb2Nwcy1uZy5tawo+IEBA
IC0xMiwxMSArMTIsMTMgQEAgUFJPQ1BTX05HX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJ
TkcuTElCCj4gIFBST0NQU19OR19DUEVfSURfVkFMSUQgPSBZRVMKPiAgUFJPQ1BTX05HX0lOU1RB
TExfU1RBR0lORyA9IFlFUwo+ICBQUk9DUFNfTkdfREVQRU5ERU5DSUVTID0gbmN1cnNlcyBob3N0
LXBrZ2NvbmYgJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykKPiAtUFJPQ1BTX05HX0NPTkZfT1BU
UyA9IExJQlM9JChUQVJHRVRfTkxTX0xJQlMpCj4gK1BST0NQU19OR19DT05GX09QVFMgPSBMSUJT
PSIkKFBST0NQU19OR19MSUJTKSIKPiArUFJPQ1BTX05HX0xJQlM9JChUQVJHRVRfTkxTX0xJQlMp
Cj4gIAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX1NZU1RFTUQpLHkpCj4gIFBST0NQU19OR19ERVBF
TkRFTkNJRVMgKz0gc3lzdGVtZAo+ICBQUk9DUFNfTkdfQ09ORl9PUFRTICs9IC0td2l0aC1zeXN0
ZW1kCj4gK1BST0NQU19OR19MSUJTICs9IC1sc3lzdGVtZAoKVGhpcyBpcyB2ZXJ5IHdlaXJkIHRo
YXQgaHRpcyBzIG5lZWRlZCwgYW5kIHBvaW50cyB0byBhbiBpc3N1ZSBpbiB0aGUKcGFja2FnZSBp
dHNlbGYuIEluZGVlZCwgdGhlIGNvZGUgdG8gZGV0ZWN0IHN5c3RlbWQgaXMgYXMgZm9sbG93czoK
CiAgY29uZmlndXIuYWM6CiAgMjg1IEFDX0FSR19XSVRIKFtzeXN0ZW1kXSwKICAyODYgICBbQVNf
SEVMUF9TVFJJTkcoWy0td2l0aC1zeXN0ZW1kXSwgW2VuYWJsZSBzeXN0ZW1kIHN1cHBvcnRdKV0s
CiAgMjg3ICAgW10sIFt3aXRoX3N5c3RlbWQ9bm9dCiAgMjg4ICkKICAyODkgQVNfSUYoW3Rlc3Qg
Ingkd2l0aF9zeXN0ZW1kIiAhPSAieG5vIl0sIFsKICAyOTAgICBQS0dfQ0hFQ0tfTU9EVUxFUyhb
U1lTVEVNRF0sIFtsaWJzeXN0ZW1kXSwsCiAgMjkxICAgICBbUEtHX0NIRUNLX01PRFVMRVMoW1NZ
U1RFTURdLCBbbGlic3lzdGVtZC1sb2dpbl0pXQogIDI5MiAgICkKICAyOTMgICBBQ19ERUZJTkUo
V0lUSF9TWVNURU1ELCAxLCBbZW5hYmxlIHN5c3RlbWQgc3VwcG9ydF0pCiAgMjk0CiAgMjk1ICAg
IyBUaGUgZnVuY3Rpb25zIG5lZWRlZCB0byByZXBsYWNlIHV0bXAgd2l0aCBsb2dpbmQgYXJlIG9u
bHkgYXZhaWxhYmxlCiAgMjk2ICAgIyB3aXRoIHN5c3RlbWQgdjI1NCBvciBsYXRlci4KICAyOTcg
ICBvbGRfTElCUz0iJExJQlMiCiAgMjk4ICAgTElCUz0iJExJQlMgJFNZU1RFTURfTElCUyIKICAy
OTkgICBBQ19DSEVDS19GVU5DUyhbc2Rfc2Vzc2lvbl9nZXRfbGVhZGVyXSkKICAzMDAgICBMSUJT
PSIkb2xkX0xJQlMiCiAgMzAxIF0pCiAgMzAyIEFNX0NPTkRJVElPTkFMKFtXSVRIX1NZU1RFTURd
LCBbdGVzdCB4JHdpdGhfc3lzdGVtZCAhPSB4bm9dKQoKQ28gaXQgaXMgc2VhcmNoaW5nIGxpYnN5
c3RlbWQgd2l0aCBwa2ctY29uZmlnLCBhbmQgc28gdGhpcyBpcyBzaG91bGQKc2V0IFNZU1RFTURf
TElCUyB0byAtbHN5c3RlbWQgYW5kIHdlIHNob3VsZCBub3QgaGF2ZSB0byBkbyBpdCBvdXJzZWx2
ZXMuCkFuZCBpbmRlZWQsIGxpYnN5c3RlbWQucGMgY29udGFpbnM6CiAgICBMaWJzOiAtTCR7bGli
ZGlyfSAtbHN5c3RlbWQKClNvLCB0aGUgcmVhbCBpc3N1ZSBpcyB0aGF0IHRoZSBNYWtlZmlsZS5h
bSBvZiBwcm9jcHMtbmcgZm9yZ2V0cyB0bwpkZWNsYXJlIHRoYXQgc3JjL3cgKGEgcHJvZ3JhbSB0
byBiZSBidWlsdCkgc2hvdWxkIGJlIGxpbmtlZCB3aXRoCmxpYnN5c3RlbWQ6CgogIE1ha2VmaWxl
LmFtOgogIDE0MyBpZiBCVUlMRF9XCiAgMTQ0IGlmIENZR1dJTgogIDE0NSB1c3JiaW5fZXhlY19Q
Uk9HUkFNUyArPSBzcmMvdwogIDE0NiBlbHNlCiAgMTQ3IGJpbl9QUk9HUkFNUyArPSBzcmMvdwog
IDE0OCBlbmRpZgogIDE0OQogIDE1MCBkaXN0X21hbl9NQU5TICs9IG1hbi93LjEKICAxNTEgc3Jj
X3dfU09VUkNFUyA9IHNyYy93LmMgbG9jYWwvZmlsZXV0aWxzLmMKICAxNTIgZWxzZQogIDE1MyAg
IEVYVFJBX0RJU1QgKz0gbWFuL3cuMQogIDE1NCBlbmRpZgoKSW4gb3RoZXIgd29yZHMsIHRoZXJl
IGlzIGFuIGlzc3VlIHRoYXQgbXVzdCBiZSBmaXhlZCBpbiB0aGUgcGFja2FnZSwgbm90CmluIEJ1
aWxkcm9vdC4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICBlbHNlCj4gIFBST0NQU19OR19D
T05GX09QVFMgKz0gLS13aXRob3V0LXN5c3RlbWQKPiAgZW5kaWYKPiAtLSAKPiAyLjQ2LjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
