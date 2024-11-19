Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15522D6C299
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C19849A0;
	Tue, 19 Nov 2024 21:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ByWz2FdU0TL; Tue, 19 Nov 2024 21:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD6C584C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD6C584C18;
	Tue, 19 Nov 2024 21:00:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E54A1DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4AB560A8F
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxLAKm-4KAid for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:00:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C008B60A8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C008B60A8A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C008B60A8A
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:00:37 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:e4f5:8dbb:490c:d591])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0B5382003D3;
 Tue, 19 Nov 2024 22:00:30 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Vincent Jardin <vjardin@free.fr>
Date: Tue, 19 Nov 2024 21:59:01 +0100
Message-ID: <20241119205901.58762-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732050034;
 bh=LfI1WkfO6DQ8ArV1lhv//j6wu0xu+2nEy6gG6rMIL7A=;
 h=From:To:Cc:Subject:Date:From;
 b=Cwd/H2AnIygxgvhNPc6CwdYqAzqBbuDsS+AHbbNNdT05XC4h/zuv7kgWwUxcE3Dox
 Lp3vF8EYiaiHYzQ5JVDW9AJKQi7OVtv9MkC53I1uXJC4Q8LumKcR4QvuxKBeQdpULa
 07DBUhFiHby0dGpoiLOzJqDcZc5dkR3wWgdcRQYlRrykkPP8ND+zAUEEi5+uFa46Dg
 D5OTpbF+PE7LwxARXL1qx16eH50MMMSdFwWnOCq0+s/XuDjrdMm1NbaCn+q0EEvhFW
 kcfTJmS9sQHlh2E9fn/nE2s3iplSkd9zF11ADderAyeRWXLRr1/k0Mhf3j5loWh/nK
 pO8aAo0S/XLhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cwd/H2An
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: h files only into sysroot
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

TWFueSBwYWNrYWdlcyBidWlsdCB3aXRoIEJ1aWxkcm9vdCBhbmQgbWVzb24gY3VycmVudGx5IGlu
c3RhbGwgaGVhZGVyCmZpbGVzIGludG8gYm90aDoKICAtIHRoZSB0YXJnZXTigJlzIC91c3IvaW5j
bHVkZSwgYW5kCiAgLSB0aGUgc3lzcm9vdOKAmXMgL3Vzci9pbmNsdWRlLgoKRW5zdXJlIHRoYXQg
aGVhZGVyIGZpbGVzIGFyZSBpbnN0YWxsZWQgZXhjbHVzaXZlbHkgaW4gdGhlIHN0YWdpbmcKKHN5
c3Jvb3QpIHRhcmdldCBkdXJpbmcgdGhlIGJ1aWxkIHByb2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVlLmZyPgpTdWdnZXN0ZWQtYnk6IFJvYmluIEphcnJ5
IDxyb2JpbkBqYXJyeS5jYz4KLS0tCiBwYWNrYWdlL3BrZy1tZXNvbi5tayB8IDYgKysrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcGtnLW1lc29uLm1rIGIvcGFja2FnZS9wa2ctbWVzb24ubWsKaW5kZXggYmM4
MDViNzk5Yy4uZDdiOGQ0NTZiOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctbWVzb24ubWsKKysr
IGIvcGFja2FnZS9wa2ctbWVzb24ubWsKQEAgLTIyMCw3ICsyMjAsNyBAQCBlbmRpZgogaWZuZGVm
ICQoMilfSU5TVEFMTF9DTURTCiBkZWZpbmUgJCgyKV9JTlNUQUxMX0NNRFMKIAkkJChIT1NUX01B
S0VfRU5WKSAkJCgkJChQS0cpX05JTkpBX0VOVikgXAotCQkkJChOSU5KQSkgJCQoTklOSkFfT1BU
UykgLUMgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkIGluc3RhbGwKKwkJJCQoTUVTT04pIGluc3Rh
bGwgLUMgJCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkCiBlbmRlZgogZW5kaWYKIApAQCAtMjMxLDcg
KzIzMSw3IEBAIGVuZGlmCiBpZm5kZWYgJCgyKV9JTlNUQUxMX1NUQUdJTkdfQ01EUwogZGVmaW5l
ICQoMilfSU5TVEFMTF9TVEFHSU5HX0NNRFMKIAkkJChUQVJHRVRfTUFLRV9FTlYpICQkKCQkKFBL
RylfTklOSkFfRU5WKSBERVNURElSPSQkKFNUQUdJTkdfRElSKSBcCi0JCSQkKE5JTkpBKSAkJChO
SU5KQV9PUFRTKSAtQyAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQgaW5zdGFsbAorCQkkJChNRVNP
TikgaW5zdGFsbCAtQyAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQgLS10YWdzPXJ1bnRpbWUsZGV2
ZWwKIGVuZGVmCiBlbmRpZgogCkBAIC0yNDIsNyArMjQyLDcgQEAgZW5kaWYKIGlmbmRlZiAkKDIp
X0lOU1RBTExfVEFSR0VUX0NNRFMKIGRlZmluZSAkKDIpX0lOU1RBTExfVEFSR0VUX0NNRFMKIAkk
JChUQVJHRVRfTUFLRV9FTlYpICQkKCQkKFBLRylfTklOSkFfRU5WKSBERVNURElSPSQkKFRBUkdF
VF9ESVIpIFwKLQkJJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQkKCQkKFBLRylfU1JDRElS
KS9idWlsZCBpbnN0YWxsCisJCSQkKE1FU09OKSBpbnN0YWxsIC1DICQkKCQkKFBLRylfU1JDRElS
KS9idWlsZCAtLXRhZ3M9cnVudGltZQogZW5kZWYKIGVuZGlmCiAKLS0gCjIuMzQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
