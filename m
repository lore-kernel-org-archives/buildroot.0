Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66358EA3F27
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 10:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FABD4054C;
	Wed, 11 Feb 2026 10:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSWtQoE7RF-M; Wed, 11 Feb 2026 10:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D8894053A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770805320;
	bh=LXYZYRT4kzpcq58k/O8PK3QQLCsAXb5Hn0BgaIzhp6c=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxSdoVMOicA0Uy4eBVz+JAs9MvXTPJ2rP+mnaH0QQHGerxl+aK8c5V+fU1okyGT5F
	 fIWhZfmzj+eNwNbxZu4PoJDJw6HfFwFMb7OU7rD1ngtZ1Z8urmpOlO4bAjDfc/UUqi
	 pKaAZX/dTrBosyzVJBO0hzNtEbKCrS5AkTR0nprtn6rhoZS/7of3kaBodX6y9v+qsK
	 2CVyjpskacbvww2ukpQtPVf/nml9eHtVqnEYl40y5v5TbkG/TFENgytGPilfPKdvB6
	 zuot2aNVRFwlR69jyPK8g/1ia5g9tyuxQUpYG1oAUPm0hUSKPJilSQFltGKAJCxCGs
	 DECZ3JSaFxWjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8894053A;
	Wed, 11 Feb 2026 10:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E198023F
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A9460C16
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXcg9TBNIXmQ for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 10:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6892060C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6892060C07
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6892060C07
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 10:21:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -135079335; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Feb 2026 10:21:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vq7Lz-00000004T2G-1nQB;
 Wed, 11 Feb 2026 11:21:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260210225042.1414C86BD1@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Tue, 10 Feb 2026 23:49:53 +0100")
References: <20260210225042.1414C86BD1@busybox.osuosl.org>
Date: Wed, 11 Feb 2026 11:21:51 +0100
Message-ID: <87jywjr35s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KIR9BRDzULpsN5H2apK6i8PzvQVhVLbiBkPH5r6VK3iWfDmYXFUzOtwC5WlFaLcIjIGYf15eEbuhlARd7I2S65Qs9r4XMs3W0yIXNgVWBHBLLfZT//m1S7jZN5kybMSMFFg9Ihnbcpsk0eQPUPZGxkwxkdMLt8BgDXz75x/DAYdF2kJ5fCpwTYaii3hGD7O1dWRdaw3FK2soiWcCZkwEmfq9ntKQ14PDcfcwLujdDNksInkMiHzfQ0zFVe5hOjuJ/eHLaVXUEkPV4GQYSntZmg4w8Ia26SamsV+iIr//IdtKXuoXk7MRwQjUATBC+1OQ0QhO8XhY5TLjN6/KpcnzgA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=DKKavrvVPDFSHNEqmFIexN3HdJbeIFtIZan+uUXWoQw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KIR9BRDz
Subject: Re: [Buildroot] [git commit] DEVELOPERS: add missing final slash
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gY29tbWl0OiBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZDhlM2MwNTEzMjMwYzFlYTcyMTBiMDAw
ZjIxMGJmOWFjNTljNGE1ZgogPiBicmFuY2g6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL3RyZWUvbWFzdGVyCgogPiBGaXhlczogMzk2M2MzYzA2ZTNhNDE2MWUw
ZWJiNTcwZGI4MGFiMGIyOTdjOWE2YSAoInBhY2thZ2UvcHl0aG9uLXNjcDogbmV3IHBhY2thZ2Ui
KQogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgogPiAtLS0KID4gIERFVkVMT1BFUlMgfCAyICstCiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCiA+IGRpZmYgLS1naXQgYS9ERVZFTE9Q
RVJTIGIvREVWRUxPUEVSUwogPiBpbmRleCA2Mzc0NGYzZjE0Li42NDc4Y2RhZDBiIDEwMDY0NAog
PiAtLS0gYS9ERVZFTE9QRVJTCiA+ICsrKyBiL0RFVkVMT1BFUlMKID4gQEAgLTE1Niw3ICsxNTYs
NyBAQCBGOglwYWNrYWdlL3phYmJpeC8KIAogPiAgTjogCUFsZXhpcyBMb3Rob3LDqSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+CiA+ICBGOglwYWNrYWdlL2xpYnhtbHNlYzEvCiA+IC1GOiAJ
cGFja2FnZS9weXRob24tc2NwCiA+ICtGOiAJcGFja2FnZS9weXRob24tc2NwLwoKQ291bGQgd2Ug
cGVyaGFwcyBleHRlbmQgY2hlY2stcGFja2FnZSB0byBjb21wbGFpbiBhYm91dCB0aGlzPwoKLS0g
CkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
