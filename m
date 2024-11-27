Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AECD66BA3
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 01:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FF944033B;
	Wed, 27 Nov 2024 01:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RG1fPACFCYv; Wed, 27 Nov 2024 01:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DE5C4034A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE5C4034A;
	Wed, 27 Nov 2024 01:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 638A8712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 510F34034A
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmy_q_bb5FKv for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 01:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CA3940300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CA3940300
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CA3940300
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:36 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4ced:2fb9:908c:7bdc])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E888FB0054E;
 Wed, 27 Nov 2024 02:31:28 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Wed, 27 Nov 2024 02:30:00 +0100
Message-ID: <20241127013001.24122-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241127013001.24122-1-vjardin@free.fr>
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
 <20241127013001.24122-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732671094;
 bh=79EqzbdpkfPnrv4Q7LDk2xXR4+wKl5/pn88Jfo9+u5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vHfoKPWMnFyJEHd9jr4MB43TF6h986GSapgUHaRC4b8KADd5PMpAV0/hqNfxtUJht
 /tNOlW3/k8jhA8SI/qD0x4Tlbbk+ThKJugTEWGKDcBTEPVCoVQgK5kKswKYf2h3DQW
 IZFPBzvUnGD1vp9RiwY1U14G/Wlym4Unt61ujBqVS0EhUfXid34jacKeQX8ZgLhyXu
 ukMgPqrXmozLn16ZpLz7kdDe+FgnhRl1p/Ws2lENU2WqdLGVP6Yj1lp4b8PvJGQq+B
 KKX1ZbD4cbhT41P9HE3tab8aouAVHKR2g4v8xAbyhnE8MVJ68ePwzwm1yi4sqWdtEi
 YrjgNDKADHU1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vHfoKPWM
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-meson: h files only into
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
b24ubWsgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawppbmRleCBiYzgwNWI3OTljLi5hYTJhZDUzODlh
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
bnRpbWUsZGV2ZWwpCiBlbmRlZgogZW5kaWYKIApAQCAtMjQyLDcgKzI0Niw4IEBAIGVuZGlmCiBp
Zm5kZWYgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCiBkZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdF
VF9DTURTCiAJJCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkJChQS0cpX05JTkpBX0VOVikgREVTVERJ
Uj0kJChUQVJHRVRfRElSKSBcCi0JCSQkKE5JTkpBKSAkJChOSU5KQV9PUFRTKSAtQyAkJCgkJChQ
S0cpX1NSQ0RJUikvYnVpbGQgaW5zdGFsbAorCQkkJChNRVNPTikgaW5zdGFsbCAtQyBcCisJCSAg
JCQoJCQoUEtHKV9TUkNESVIpL2J1aWxkICQoaWYgJChmaWx0ZXIgWUVTLCQoJChQS0cpX01FU09O
X0lOU1RBTExfVEFHUykpLC0tdGFncz1ydW50aW1lKQogZW5kZWYKIGVuZGlmCiAKLS0gCjIuMzQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
