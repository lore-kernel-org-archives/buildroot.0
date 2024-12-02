Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73570D78332
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 15:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2D84061C;
	Mon,  2 Dec 2024 15:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX8IzenbmpE1; Mon,  2 Dec 2024 15:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07BF54067D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07BF54067D;
	Mon,  2 Dec 2024 15:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A8B61DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BB6C81206
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoJVQE0TuWfV for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 15:49:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0360E81415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0360E81415
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0360E81415
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:49:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2ddd:b692:571f:f1a1])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EF73613F899;
 Mon,  2 Dec 2024 16:48:56 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Mon,  2 Dec 2024 16:46:29 +0100
Message-ID: <20241202154630.76543-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241202154630.76543-1-vjardin@free.fr>
References: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
 <20241202154630.76543-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733154542;
 bh=o9k2QQfaXS8qjlKQp8g1NRVlAFdMMXeRDnYyzdfTNnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nCMgEC4xpkIlVF545o520d2UJo1FJsK6Lg+wrYws4BDAsDTI1ww1MqsLb0OYNzcJz
 yV8YNGYYA+qcjoHej58GoAmYN2VRFx40ewW/E+IiJZG/ZOK8iQH7wcI+GfyfCJ2m/s
 p2avkDSQkS/dSO1DjlsxEDARhxu8dG+OkwZzjrUGGSHDMwuYnkjWAS3zEwAp+jaIHR
 VfrF7fw4KHZHVOfdyuhMjtTxM0QW8iu4BPGozWuZFVAD6uq22eh5xAHbAXvDD5g0j3
 WWoHznEvBbZ4+MjNoxmQenYBd4ziFcxn0EVbaGb7DurNxkMqZyXwxD6zhPRAC8vWhG
 TF4v6sEUlqSzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nCMgEC4x
Subject: [Buildroot] [PATCH v3 1/2] package/pkg-meson: h files only into
 sysroot
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
bHVkZSwgYW5kCiAgLSB0aGUgc3lzcm9vdOKAmXMgL3Vzci9pbmNsdWRlLgoKV2hlbiBGT09fTUVT
T05fSU5TVEFMTF9UQUdTID0gWUVTLCBlbnN1cmUgdGhhdCBoZWFkZXIgZmlsZXMgYXJlCmluc3Rh
bGxlZCBleGNsdXNpdmVseSBpbiB0aGUgc3RhZ2luZyAoc3lzcm9vdCkgdGFyZ2V0IGR1cmluZyB0
aGUKYnVpbGQgcHJvY2Vzcy4KClRoZSBkZWZhdWx0IGlzIEZPT19NRVNPTl9JTlNUQUxMX1RBR1Mg
Pz0gTk8gaW4gb3JkZXIgdG8gYXZvaWQKY2hhbmdpbmcgdG8gdGhpcyBuZXcgYmVoYXZpb3VyIGZv
ciB0aGUgdGltZSBiZWluZy4KClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGlu
QGZyZWUuZnI+ClN1Z2dlc3RlZC1ieTogUm9iaW4gSmFycnkgPHJvYmluQGphcnJ5LmNjPgpTdWdn
ZXN0ZWQtYnk6IEJyYW5kb24gTWFpZXIgPGJyYW5kb24ubWFpZXJAZ21haWwuY29tPgotLS0KIHBh
Y2thZ2UvcGtnLW1lc29uLm1rIHwgMTEgKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctbWVz
b24ubWsgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawppbmRleCBiYzgwNWI3OTljLi42ZmRkNTJjZWIx
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3BrZy1tZXNvbi5taworKysgYi9wYWNrYWdlL3BrZy1tZXNv
bi5tawpAQCAtMjIwLDEwICsyMjAsMTMgQEAgZW5kaWYKIGlmbmRlZiAkKDIpX0lOU1RBTExfQ01E
UwogZGVmaW5lICQoMilfSU5TVEFMTF9DTURTCiAJJCQoSE9TVF9NQUtFX0VOVikgJCQoJCQoUEtH
KV9OSU5KQV9FTlYpIFwKLQkJJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQkKCQkKFBLRylf
U1JDRElSKS9idWlsZCBpbnN0YWxsCisJCSQkKE1FU09OKSBpbnN0YWxsIC1DICQkKCQkKFBLRylf
U1JDRElSKS9idWlsZAogZW5kZWYKIGVuZGlmCiAKKyMgRGVmYXVsdCB2YWx1ZXMgZm9yIFN0YWdp
bmcgaW5zdGFsbGF0aW9uIGFuZCBUYXJnZXQgaW5zdGFsbGF0aW9uCiskKDIpX01FU09OX0lOU1RB
TExfVEFHUyA/PSBOTworCiAjCiAjIFN0YWdpbmcgaW5zdGFsbGF0aW9uIHN0ZXAuIE9ubHkgZGVm
aW5lIGl0IGlmIG5vdCBhbHJlYWR5IGRlZmluZWQgYnkKICMgdGhlIHBhY2thZ2UgLm1rIGZpbGUu
CkBAIC0yMzEsNyArMjM0LDggQEAgZW5kaWYKIGlmbmRlZiAkKDIpX0lOU1RBTExfU1RBR0lOR19D
TURTCiBkZWZpbmUgJCgyKV9JTlNUQUxMX1NUQUdJTkdfQ01EUwogCSQkKFRBUkdFVF9NQUtFX0VO
VikgJCQoJCQoUEtHKV9OSU5KQV9FTlYpIERFU1RESVI9JCQoU1RBR0lOR19ESVIpIFwKLQkJJCQo
TklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxs
CisJCSQkKE1FU09OKSBpbnN0YWxsIC1DIFwKKwkJICAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQg
JChpZiAkKGZpbHRlciBZRVMsJCgkKFBLRylfTUVTT05fSU5TVEFMTF9UQUdTKSksLS10YWdzPXJ1
bnRpbWUkKGNvbW1hKWRldmVsKQogZW5kZWYKIGVuZGlmCiAKQEAgLTI0Miw3ICsyNDYsOCBAQCBl
bmRpZgogaWZuZGVmICQoMilfSU5TVEFMTF9UQVJHRVRfQ01EUwogZGVmaW5lICQoMilfSU5TVEFM
TF9UQVJHRVRfQ01EUwogCSQkKFRBUkdFVF9NQUtFX0VOVikgJCQoJCQoUEtHKV9OSU5KQV9FTlYp
IERFU1RESVI9JCQoVEFSR0VUX0RJUikgXAotCQkkJChOSU5KQSkgJCQoTklOSkFfT1BUUykgLUMg
JCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkIGluc3RhbGwKKwkJJCQoTUVTT04pIGluc3RhbGwgLUMg
XAorCQkgICQkKCQkKFBLRylfU1JDRElSKS9idWlsZCAkKGlmICQoZmlsdGVyIFlFUywkKCQoUEtH
KV9NRVNPTl9JTlNUQUxMX1RBR1MpKSwtLXRhZ3M9cnVudGltZSkKIGVuZGVmCiBlbmRpZgogCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
