Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B59E92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819BD40510;
	Sat, 27 Dec 2025 22:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4CM-66zkbKQ; Sat, 27 Dec 2025 22:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A901A40535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766873279;
	bh=eGIirtPje5DTGNnRgSJiAk+FKaUpczw0hriK/qOnAl4=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=WmZcghoaiks8kLSftLf+cTPFiRQJD0t+KFhZneOwRxdoX8cZg1XSbwFgjFy1UhJIN
	 XgLlMaMcI7mP87sfEoPPS+jD5Qd0zPd78DQdMJ+Yk54OxbsDTQo9ofm+BcfUNOSLBW
	 0STCiQLvJtx2BboxLOXGIWV+/PeF74lOGxEbskR92eQGVZuM4N1bOMSMIoN0i+e5oP
	 kInZIORDiwQgyOhvTz8Nh0MiHYU7/kiCQQlDDFBVhabiR18dzWfMQBFsxlBjsx4HFN
	 JC2LC8TPSnMCBm+PRBdVg9ReL1/uvFwTIJ2Hv9mKgED2+7WbHmYGXZh/wo4OPunXVp
	 7HI5MVQBGSmUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A901A40535;
	Sat, 27 Dec 2025 22:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C69DB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DCBE60784
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0FrHriU-YCh for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D20C606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D20C606E6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D20C606E6
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:07:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7C0434E41E20
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:07:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B5D160725;
 Sat, 27 Dec 2025 22:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35E66119782E8; Sat, 27 Dec 2025 23:07:54 +0100 (CET)
Date: Sat, 27 Dec 2025 23:07:53 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20251227230753.750957d9@windsurf>
In-Reply-To: <20251220173412.433583-3-francois.perrad@gadz.org>
References: <20251220173412.433583-1-francois.perrad@gadz.org>
 <20251220173412.433583-3-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766873274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M9Kx6TgiH21V30QNvpxT+TwhHkJeR2REwKVe1Re4j3Y=;
 b=xDCIXIWzpLyK7hwC+fzc1fqptN1aEAUBT5U1p7BMlUtPiJhTLSWPCXM+wGcLXVaG7zWF66
 IjvbB66Bm09khCVkmvNl8ZWT8pOlPHXgoGtjlpqce7cVznIAoQrUoFQfzP/ROV5UvqY3Ye
 Ks+tgb4E6l4C33Afkztl3M1jrSLUZTX3gkdkU3aU8UbaMTnJMbYk5k5Si1V8xASrWAqYUi
 UImK/jdLCp32EKBGjkdumV/fYOFsMHyUtR5/u0swM8PGysrj+gCyTbn8I+R1zUtnNgiVXP
 Fks6IU5N7QOPkoEhOKmMlVUpJoWRuqiLOsY5EkjoaZJ607rG8WJmcKvTIMzhBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xDCIXIWz
Subject: Re: [Buildroot] [PATCH 3/4] package/janet: new infrastructure
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gU2F0LCAyMCBEZWMgMjAyNSAxODozNDoxMSArMDEwMApGcmFu
Y29pcyBQZXJyYWQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3Rl
OgoKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6
Lm9yZz4KCkhvdyBtYW55IEphbmV0IHBhY2thZ2VzIGRvIHlvdSBleHBlY3QgdG8gYWRkPyBXZSBu
b3JtYWxseSBhZGQgYSBwYWNrYWdlCmluZnJhIG9uY2Ugd2UgaGF2ZSAzLTUgcGFja2FnZXMgYXQg
bGVhc3QuIEFkZGluZyBvbmUgZm9yIGp1c3Qgb25lCnBhY2thZ2Ugc2VlbXMgZXhjZXNzaXZlLCBi
dXQgcGVyaGFwcyB5b3UgaGF2ZSBtYW55IG1vcmUgcGFja2FnZXMgdG8gYWRkCmluIHRoZSBmdXR1
cmU/CgoKPiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWphbmV0LmFk
b2MgYi9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtamFuZXQuYWRvYwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwLi4zYjM5ZGE3YmEKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWphbmV0LmFkb2MKPiBAQCAtMCwwICsx
LDU5IEBACj4gKy8vIC0qLSBtb2RlOmRvYzsgLSotCj4gKy8vIHZpbTogc2V0IHN5bnRheD1hc2Np
aWRvYzoKPiArCj4gKz09PSBJbmZyYXN0cnVjdHVyZSBmb3IgSmFuZXQgcGFja2FnZXMKPiArCgpQ
bGVhc2UgYWRkIHNvbWUgaW50cm8gYWJvdXQgSmFuZXQgaGVyZSwgd2hhdCBpdCBpcywgZXRjLiBD
bGVhcmx5IG5vdApvYnZpb3VzLgoKQnV0IGhvbmVzdGx5IGFzaWRlIGZvciB0aGF0IGl0IGxvb2tz
IGFsbCBnb29kIHRvIG1lLiBJIHNlZSB0aGV5IGhhdmUKLS1vZmZsaW5lIG9wdGlvbiwgd2hpY2gg
c2VlbXMgdG8gaW1wbHkgdGhhdCB0aGV5IHRob3VnaHQgYWJvdXQgb2ZmbGluZQpidWlsZHMsIHdo
aWNoIGlzIGdyZWF0LgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
