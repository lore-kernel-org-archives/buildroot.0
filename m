Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E78EE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF12581160;
	Fri,  6 Dec 2024 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dn_BVM23w_Rq; Fri,  6 Dec 2024 21:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF30381164
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF30381164;
	Fri,  6 Dec 2024 21:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11553ED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E69C181160
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXCttDQCFo6U for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 21:31:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F39D181170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39D181170
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F39D181170
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:32 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:bca7:77f2:7ee8:6a7a])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3A328780333;
 Fri,  6 Dec 2024 22:31:26 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Fri,  6 Dec 2024 22:30:01 +0100
Message-ID: <20241206213002.24669-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241206213002.24669-1-vjardin@free.fr>
References: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
 <20241206213002.24669-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733520691;
 bh=555z6LQ2lOAHjg8UdgKhxfyAmLDbptJrRDZV287bqws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FObDJti037un1g9ZgL3eCJ5myvHFem3JMzPxbHhCnS55okf0yPHui3f9Sl185bsMt
 RV9m0qvrCLsITcNimfWSwejbNLgVR/oyXEio6okVADm7xMH3F21V7T4/2LQvuN3sMF
 2J5BHY/B7wUCP/t+G32VoDrN2DhrPDJSOiW5E+mPSjb9/AwvwotSMaQAUvHRJvzHEl
 4rWZdj3iAQMcG5P3JjsiSnrLpMtz5JM19zca7crvog5nGanSrOD3ugH8Y6q3ygVhXE
 em1U1SEPFeAZ/HDy//9iSWvmHisOkX3b3kK2rRCw7I5aMpqHPAu+WCPvhQtk9mSkif
 i/BT7tuD9kxIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FObDJti0
Subject: [Buildroot] [PATCH v5 1/2] package/pkg-meson: h files only into
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
b24ubWsgYi9wYWNrYWdlL3BrZy1tZXNvbi5tawppbmRleCBiYzgwNWI3OTljLi40NTY4Zjg2OTBl
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
JChpZiAkKGZpbHRlciBZRVMsJCgkKDIpX01FU09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1ydW50
aW1lJChjb21tYSlkZXZlbCkKIGVuZGVmCiBlbmRpZgogCkBAIC0yNDIsNyArMjQ2LDggQEAgZW5k
aWYKIGlmbmRlZiAkKDIpX0lOU1RBTExfVEFSR0VUX0NNRFMKIGRlZmluZSAkKDIpX0lOU1RBTExf
VEFSR0VUX0NNRFMKIAkkJChUQVJHRVRfTUFLRV9FTlYpICQkKCQkKFBLRylfTklOSkFfRU5WKSBE
RVNURElSPSQkKFRBUkdFVF9ESVIpIFwKLQkJJCQoTklOSkEpICQkKE5JTkpBX09QVFMpIC1DICQk
KCQkKFBLRylfU1JDRElSKS9idWlsZCBpbnN0YWxsCisJCSQkKE1FU09OKSBpbnN0YWxsIC1DIFwK
KwkJICAkJCgkJChQS0cpX1NSQ0RJUikvYnVpbGQgJChpZiAkKGZpbHRlciBZRVMsJCgkKDIpX01F
U09OX0lOU1RBTExfVEFHUykpLC0tdGFncz1ydW50aW1lKQogZW5kZWYKIGVuZGlmCiAKLS0gCjIu
MzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
