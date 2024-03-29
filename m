Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8C9CD11DD
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 14:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BDFD4167F;
	Fri, 29 Mar 2024 14:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCbkYDxzNRqV; Fri, 29 Mar 2024 14:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8782741761
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8782741761;
	Fri, 29 Mar 2024 14:39:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B380E1BF99A
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A14C46063A
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPg3W_W1zumH for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 14:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5171F6062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5171F6062F
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5171F6062F
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 14:39:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 313F5C403E
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 14:33:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2776A240006;
 Fri, 29 Mar 2024 14:33:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Mar 2024 15:31:35 +0100
Message-ID: <20240329143138.214780-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711722781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H4pG9L0jvIqvLLxTnE1BZk68HFHzWGKJTD9BzLPprVQ=;
 b=VNI//p3E9ByFUIl/piNj2HF1JXFpmo9VMANBSmYF7O5B/qtM7/v3ohlvuOVMNB9NMUw3X/
 atDBC0nMq6rZyA0s8Mvb+NXRnq8FF6Jms8MCXgF4MtdnIBCsVMEFvbvgUg9h/oIK51qnhC
 BMl2l1ASyY5D97OiFm7Egou1TQ/v2lP0upvBEYHOashEQnDn4BInj3Z5+TqHNp2QUz3ZSz
 Sq7hwQaCI9GjBVDmrrrZ+xos1sADGM/xGeKCBIcFiGrzabsj3i6VLm/7ncgI4AQBvca5SB
 UBl1xQaXIMAUjiCANLTa9lRXeQaFLAyxAGkg5evyQeGrozFE7z0FFvfHnaqK2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VNI//p3E
Subject: [Buildroot] [PATCH 0/3] package/pppd: fix pppd startup with
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
b3IgbWFzdGVyIGFuZCAyMDI0LjAyLngKClRlc3RlZCBvbiBBUk0gQ29ydGV4IEE5CgpbMV0gaHR0
cHM6Ly9naXRodWIuY29tL3BwcC1wcm9qZWN0L3BwcC9pc3N1ZXMvNDE5ClsyXSBodHRwczovL2dp
dGh1Yi5jb20vcHBwLXByb2plY3QvcHBwL2lzc3Vlcy80NjAKCkFsZXhpcyBMb3Rob3LDqSAoMyk6
CiAgcGFja2FnZS9wcHBkOiByZXZlcnQgbG9jayBwYXRoCiAgcGFja2FnZS9wcHBkOiBhZGQgbWtk
aXIgcmVjdXJzaXZlCiAgcGFja2FnZS9wcHBkOiBjcmVhdGUgcnVuZGlyIHdoZW4gaXQgaXMgbWlz
c2luZwoKIC4uLjAwNS1SZXZlcnQtbG9jay1wYXRoLXRvLXZhci1sb2NrLTQzNS5wYXRjaCB8ICA2
NCArKysrCiAuLi4vcHBwZC8wMDA2LXV0aWxzLWFkZC1ta2Rpcl9yZWN1cnNpdmUucGF0Y2ggfCAy
OTIgKysrKysrKysrKysrKysrKysrCiAuLi4wMDA3LXRyeS10by1jcmVhdGUtcnVuZGlyLWlmLW1p
c3NpbmcucGF0Y2ggfCAgNTAgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQwNiBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wcHBkLzAwMDUtUmV2ZXJ0LWxvY2stcGF0aC10
by12YXItbG9jay00MzUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BwcGQvMDAw
Ni11dGlscy1hZGQtbWtkaXJfcmVjdXJzaXZlLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9wcHBkLzAwMDctdHJ5LXRvLWNyZWF0ZS1ydW5kaXItaWYtbWlzc2luZy5wYXRjaAoKLS0g
CjIuNDMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
