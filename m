Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1966ECCD183
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 15:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C67E983CA9;
	Thu,  9 Oct 2025 15:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTKhzvz_yXlt; Thu,  9 Oct 2025 15:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A594480E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A594480E17;
	Thu,  9 Oct 2025 15:28:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69AC821B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BEAF410BE
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZDZtdJhtvy3 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 15:28:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69396410B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69396410B2
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69396410B2
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 15:28:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C7691688;
 Thu,  9 Oct 2025 08:28:08 -0700 (PDT)
Received: from debian (MacBookPro.nice.arm.com [10.34.124.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8013A3F59E;
 Thu,  9 Oct 2025 08:28:15 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  9 Oct 2025 17:28:13 +0200
Message-ID: <20251009152813.1690704-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] utils/brmake: filter output for parallel build
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

V2hlbiBidWlsZGluZyBpbiBwYXJhbGxlbCB3aXRoIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzCihC
UjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eSksIGJybWFrZSBvdXRwdXQgaXMgb2Z0ZW4gZ2Fy
YmxlZDoKCiAgMjAyNS0xMC0wOFQxODozOToxMCA+Pj4gaG9zdC1kdGMgMS43LjIgQnVpbGRpbmcK
ICAyMDI1LTEwLTA4VDE4OjM5OjExIGNoZWNraW5nIGZvciBzdGRpbnQuaC4uLiA+Pj4gaG9zdC1k
dGMgMS43LjIgSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9yeQogIDIwMjUtMTAtMDhUMTg6Mzk6
MTIgY2hlY2tpbmcgZm9yIGxpbWl0cy5oLi4uID4+PiBob3N0LWdtcCA2LjMuMCBJbnN0YWxsaW5n
IHRvIGhvc3QgZGlyZWN0b3J5CgpSZW1vdmUgdGhlIHNwdXJpb3VzIHN0cmluZyBiZXR3ZWVuIHRo
ZSB0aW1lc3RhbXAgYW5kIHRoZSAiPj4+IiBtYXJrZXIgdG8KZml4IHRoaXMuCldlIG5lZWQgc29t
ZSBleHRyYSBjYXJlIHRvIHByZXNlcnZlIHRoZSBwcmVjZWRpbmcgInRlcm0gYm9sZCIgc3BlY2lh
bApjaGFyYWN0ZXJzIHNlcXVlbmNlLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2
aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4
QGZyZWUuZnI+Ci0tLQogdXRpbHMvYnJtYWtlIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS91dGlscy9icm1ha2UgYi91
dGlscy9icm1ha2UKaW5kZXggYTRiOWU3ZmE3MS4uMmE3NGQ1ODE2NyAxMDA3NTUKLS0tIGEvdXRp
bHMvYnJtYWtlCisrKyBiL3V0aWxzL2JybWFrZQpAQCAtMTIsNyArMTIsOCBAQCBtYWluKCkgewog
ICAgICAgICAgICAgIHByaW50ZiAiJSglWS0lbS0lZFQlSDolTTolUylUICVzXG4iIC0xICIke2xp
bmV9IgogICAgICAgICAgZG9uZSBcCiAgICAgICAgICB8dGVlIC1hIGJyLmxvZyBcCi0gICAgICAg
ICB8Z3JlcCAtLWNvbG91cj1uZXZlciAtRSAnPj4+JworICAgICAgICAgfGdyZXAgLS1saW5lLWJ1
ZmZlcmVkIC0tY29sb3VyPW5ldmVyIC1FICc+Pj4nIFwKKyAgICAgICAgIHxzZWQgLUUgJ3MvXihb
MC05VDotXXsxOX0pIFtbOnByaW50Ol1dKiguKj4+PiApL1wxIFwyLycKICAgICAgICApCiAgICAg
cmV0PSR7P30KIAotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
