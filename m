Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C5DD5CC8D
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CF860C29;
	Tue, 16 Dec 2025 09:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPCL0iF-a4Oo; Tue, 16 Dec 2025 09:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5062C60EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765876257;
	bh=XOihjGcSWNzI57Io1iBmM2grEQ1f8MS8wmoqJP80CHc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QuLXZD4MfqVJaZHG1yDGB1PO6teMCDi5KFEv4ujWv5usZy+DH0DumamMhkx3ua6nZ
	 Py1/OVx6Oo4Xhv7Jxkf0XBzitaKQnhhD1T15KX9remW4iRjpX5OabULIg4wUkZLOFJ
	 uKajGXmDwOCNt0LWV6tvN+qy0inJ35FJT7b9B+aUrtJRPB/kziDHE06Oj5d8SjGDji
	 qK3YXynudCY1ofW/bhsrI5rqU4nTYHt+J55H7Q7s+33qsIDzFquUahSjpFhdFoY4Hl
	 WOEwxYta+DVDbcBNRhdVBShDQzND1GAXoqzMdSzQvQeyQWhiiKC9UN4AsFUeSiQ+UW
	 XN2wjYihlV/5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5062C60EC2;
	Tue, 16 Dec 2025 09:10:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04431151
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF2F540448
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvzAPDOdqBzZ for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA781402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA781402BC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA781402BC
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:10:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DD3311A2221;
 Tue, 16 Dec 2025 09:10:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC6E96071C;
 Tue, 16 Dec 2025 09:10:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FC9111943232; Tue, 16 Dec 2025 10:10:43 +0100 (CET)
Date: Tue, 16 Dec 2025 10:10:42 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251216101042.3d80033c@windsurf>
In-Reply-To: <d262cfa36721ca631b4c5ff0cb875a8c8c295ab7.camel@gmail.com>
References: <20251215223050.2231782-1-troglobit@gmail.com>
 <20251215223050.2231782-2-troglobit@gmail.com>
 <20251216084256.1652f63f@windsurf>
 <d262cfa36721ca631b4c5ff0cb875a8c8c295ab7.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765876247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EH0bLF/IYkZ8ZxED4eJf1hhJYk6T72b9kNZ+E8SNIz0=;
 b=VyUqBOOOGilhowgp7XDcREWnPpE+qe0DldYAx+SRlK2ycT3bS7ELTMtb0Nu8Fli/4Y12Vb
 9Y9EHH6+r3OPHCbZtvzr0J5DYnbN4FqqA5J/ZZafFCrzkWTYNFLThGD/fD8TzeNC0bPCdV
 +bo3QOlQU1f0Ntp0m7sThTTDow/Q8jh/ExZRRL28OL0o4mWQwE/Zew/RAKSEK2BiW6B3nI
 uPbs5HRZyJx3aZoq1M8FjoKZNl4S77G5w9+xTOze5Bv6W9QLg2SWA4IoYwiBF6Yijc290X
 YhDkxGR1kr7XI+x89u+LaAemnWlRwhYzQZs2tlDfJR+zYkqdW/BuR7ru2Cp3xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VyUqBOOO
Subject: Re: [Buildroot] [PATCH 2/2] package/libite: update deps,
 requires fork()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9hY2hpbSwKCk9uIFR1ZSwgMTYgRGVjIDIwMjUgMTA6MDQ6MDIgKzAxMDAKSm9hY2hp
bSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+IHdyb3RlOgoKPiBHb3QgaXQhICBJdCBpcywg
c28gSSdsbCBzZW5kIGEgdjIgdG8gZml4IHRoaXMgYW5kIGNsYXJpZnkuCgpUaGFua3MhCgo+ID4g
aHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzZjNmZkMmFlNDEwYTgyYzQ0
ZGE1NGVlMTNhMDlhMzhhN2FiMjIwYzEvICAKPiAKPiBBaGEsIGRpZG4ndCBldmVuIHJlYWxpemUg
dGhlcmUgd2VyZSBmYWlsdXJlcyBhbHJlYWR5IHJlcG9ydGVkIGZvciB0aGlzLgo+IEkganVzdCBz
dHVtYmxlZCB1cG9uIGl0IGJhc2ljYWxseSDwn5mCCgpTaW5jZSB5b3UgYXJlIGxpc3RlZCBpbiB0
aGUgREVWRUxPUEVSUyBmaWxlIGZvciBwYWNrYWdlL2xpYml0ZSwgeW91CnNob3VsZCBiZSByZWNl
aXZpbmcgZXZlcnkgZGF5IGEgcmVwb3J0IHdpdGggdGhlIGJ1aWxkIGZhaWx1cmVzIHRoYXQKb2Nj
dXJyZWQgZm9yIHlvdXIgcGFja2FnZShzKS4gU29tZXRoaW5nIGxpa2U6CgpTdWJqZWN0OiBbYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmddIFlvdXIgZGFpbHkgcmVzdWx0cyBmb3IgMjAyNS0xMi0xNQoK
KE9mIGNvdXJzZSB0aGUgbWFpbCBpcyBvbmx5IHNlbnQgaWYgc29tZSBidWlsZCBmYWlsdXJlcyBo
YXBwZW5lZCBmb3IKb25lIG9mIHlvdXIgcGFja2FnZXMsIGlmIG5vdCwgbm8gbWFpbCBpcyBzZW50
KQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
