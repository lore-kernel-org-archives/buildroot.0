Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93063C04FF0
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 13:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14DFC401ED;
	Thu, 11 Apr 2024 13:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVIP_tSN0yOt; Thu, 11 Apr 2024 13:35:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2AE405EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D2AE405EE;
	Thu, 11 Apr 2024 13:35:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72A951BF3DB
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F1A0612A3
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTafObUQ-7HQ for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 13:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39E046129E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E046129E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39E046129E
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 13:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F19F324000F;
 Thu, 11 Apr 2024 13:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 15:35:04 +0200
Message-ID: <20240411133507.82781-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712842512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vTxvj7bOvHLY3xQXUQBwqd/C6JZU9BX+Y7n4vUH4f4U=;
 b=LhUjZqxQfMEfyFgCqETf6YWBuvVedwqgwLdwo4KgkfPrFXL7sIeKUsvDXJ3Rg9XrHCRSv3
 6Ov/aZj/DiqCwSkWTbtyAOJsoD0vcilTE8hKTtLAbft7U5Pg43azhPhuJK/03Ag29YLBHf
 FnS/kJG2r19Nn2t84LTPcRl10azyQSw3Gi5R2ZYu7hkls8vx6zGrF5Xj+XDOlrv/Z5VUtz
 LTY3UdfakKIXGcbp1BEVuYKxf6EiGYD9+bN8pM8NO7JdPfO+S1UDGSivY7F8HEs5f3H79t
 NKXvw0s1ADUZprMA/+1rZTIMLlZURS+e1pR0WwPxveHwJYvxq27P6F3eszgYag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LhUjZqxQ
Subject: [Buildroot] [PATCH v2 0/3] package/pppd: fix pppd startup with
 upstream patches
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnBwcGQgZmFpbHMgdG8gc3RhcnQgb24gYSBzeXN0ZW1zIHdpdGggYnVpbGRyb290IDIw
MjQuMDIueCBiZWNhdXNlIG9mCm1pc3NpbmcgcHBwZCBkaXJlY3RvcnkgaW4gL3Zhci9ydW4uIFRo
ZXJlIGFyZSBzb21lIGxvZ3MgaGludGluZyBhdCB0aGlzCmlzc3VlOgpXYXJuaW5nOiBjb3VsZG4n
dCBvcGVuIHBwcCBkYXRhYmFzZSAvdmFyL3J1bi9wcHBkL3BwcGQyLnRkYgpDYW4ndCBjcmVhdGUg
bG9jayBmaWxlIC92YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkKQ2FuJ3QgY3JlYXRlIGxvY2sgZmlsZSAvdmFyL3J1bi9wcHBkL2xv
Y2svTENLLi5wcHAtdHR5LWZpZm8xOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CkNhbid0IGNy
ZWF0ZSBsb2NrIGZpbGUgL3Zhci9ydW4vcHBwZC9sb2NrL0xDSy4ucHBwLXR0eS1maWZvMTogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQpDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3Bw
cGQvbG9jay9MQ0suLnBwcC10dHktZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKQ2Fu
J3QgY3JlYXRlIGxvY2sgZmlsZSAvdmFyL3J1bi9wcHBkL2xvY2svTENLLi5wcHAtdHR5LWZpZm8x
OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CkNhbid0IGNyZWF0ZSBsb2NrIGZpbGUgL3Zhci9y
dW4vcHBwZC9sb2NrL0xDSy4ucHBwLXR0eS1maWZvMTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQpDYW4ndCBjcmVhdGUgbG9jayBmaWxlIC92YXIvcnVuL3BwcGQvbG9jay9MQ0suLnBwcC10dHkt
ZmlmbzE6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKClRoZSBpc3N1ZSBoYXMgYWxyZWFkeSBi
ZWVuIGRldGVjdGVkIGFuZCBmaXhlZCB1cHN0cmVhbSAoc2VlIFsxXSkgYW5kIGlzCmV4cGVjdGVk
IHRvIGJlIHJlbGVhc2VkIG9uIGEgdjIuNS4xLCBidXQgdGhpcyByZWxlYXNlIHNlZW1zIHRvIGJl
IHN0YWxsZWQKZm9yIG5vdyAoc2VlIFsyXSkuIEEgbWVyZSBidW1wIG9mIHRoZSBwYWNrYWdlIGlz
IHRoZW4gbm90IGN1cnJlbnRseQpwb3NzaWJsZSwgc28gSSBhbSBwcm9wb3NpbmcgYSBwaWNrIG9m
IHRoZSAzIHJlbGV2YW50IHBhdGNoZXMgdG8gZml4IHRoaXMKc3RhcnR1cCBpc3N1ZSwgYm90aCBm
b3IgbWFzdGVyIGFuZCAyMDI0LjAyLngKClRlc3RlZCBvbiBBUk0gQ29ydGV4IEE5CgpDaGFuZ2Vz
IGluIHYyOgotIHJlLWdlbmVyYXRlZCBjb3JyZWN0bHkgcGF0Y2hlcyB0byBwcmVzZXJ2ZSBvcmln
aW5hbCBhdXRob3IKLSBhZGRlZCBtaXNzaW5nIFNvQgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9w
cHAtcHJvamVjdC9wcHAvaXNzdWVzLzQxOQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3BwcC1wcm9q
ZWN0L3BwcC9pc3N1ZXMvNDYwCgpBbGV4aXMgTG90aG9yw6kgKDMpOgogIHBhY2thZ2UvcHBwZDog
cmV2ZXJ0IGxvY2sgcGF0aAogIHBhY2thZ2UvcHBwZDogYWRkIG1rZGlyIHJlY3Vyc2l2ZQogIHBh
Y2thZ2UvcHBwZDogY3JlYXRlIHJ1bmRpciB3aGVuIGl0IGlzIG1pc3NpbmcKCiAuLi4wMDUtUmV2
ZXJ0LWxvY2stcGF0aC10by12YXItbG9jay00MzUucGF0Y2ggfCAgNjYgKysrKwogLi4uL3BwcGQv
MDAwNi11dGlscy1hZGQtbWtkaXJfcmVjdXJzaXZlLnBhdGNoIHwgMjk0ICsrKysrKysrKysrKysr
KysrKwogLi4uMDAwNy10cnktdG8tY3JlYXRlLXJ1bmRpci1pZi1taXNzaW5nLnBhdGNoIHwgIDUy
ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDEyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3BwcGQvMDAwNS1SZXZlcnQtbG9jay1wYXRoLXRvLXZhci1sb2NrLTQzNS5w
YXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHBwZC8wMDA2LXV0aWxzLWFkZC1ta2Rp
cl9yZWN1cnNpdmUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BwcGQvMDAwNy10
cnktdG8tY3JlYXRlLXJ1bmRpci1pZi1taXNzaW5nLnBhdGNoCgotLSAKMi40NC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
