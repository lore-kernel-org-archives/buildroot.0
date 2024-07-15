Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEE7C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9270F80BAD;
	Mon, 15 Jul 2024 09:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgY-KKT8BHDe; Mon, 15 Jul 2024 09:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 683E580BB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683E580BB9;
	Mon, 15 Jul 2024 09:29:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8A9A1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C691A605DC
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O737PbH557k5 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:29:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72A026059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A026059A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72A026059A
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:29:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E12A6000B;
 Mon, 15 Jul 2024 09:28:57 +0000 (UTC)
Date: Mon, 15 Jul 2024 11:28:55 +0200
To: Steffen Persvold <spersvold@gmail.com>
Message-ID: <20240715112855.03e937c4@windsurf>
In-Reply-To: <20240627103440.27982-1-spersvold@gmail.com>
References: <20240627103440.27982-1-spersvold@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721035738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCz35Bg7HJiP4JPhCBzlQ40shLLJy4Fymh2+T0FPAws=;
 b=hGXWiQ4DVJS8SL5Wc69sF7DnCGZEZ4YVZEbUl5I+caVF9tBZHYh0SrvEebuGFv3oPjf0a9
 MTvI5wD0A9MMIOZysWCAD1DvsNNuD2t2sZlu3LDcSgdkJMCJGMEsuI6WKNMuRuqkAHjxhV
 xn69deYz4FGDvxVm+7Df0uD1QefC2IBlZOh1xcnS7BReO9TXcxfviVR+ahuvKft7b6JF1v
 BvU/sHiaNDGhC9lh0s0oMbHu+8H3ft8wS8L2+ZZrEH9aMG1B2P2D6dwSeQUGe9hYMOLvvu
 NkXrmyrrUEctQv6VdJ4vdp3DWXZXPpXIq7+jPp3Dmun7DtcMniGGD6JA/DZQQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hGXWiQ4D
Subject: Re: [Buildroot] [PATCH] dhrystone: add patch with forward
 declarations for functions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDI3IEp1biAyMDI0IDEyOjM0OjQwICswMjAwClN0ZWZmZW4gUGVyc3Zv
bGQgPHNwZXJzdm9sZEBnbWFpbC5jb20+IHdyb3RlOgoKPiBHQ0MxNCB3aWxsIGdpdmUgZXJyb3Jz
IGZvciBtaXNzaW5nIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBhbmQKPiBtaXNzaW5nIHJldHVybiB0
eXBlcyA6Cj4gCj4gZGhyeV8xLmM6NzU6MTogZXJyb3I6IHJldHVybiB0eXBlIGRlZmF1bHRzIHRv
IOKAmGludOKAmSBbLVdpbXBsaWNpdC1pbnRdCj4gICAgNzUgfCBtYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pCj4gICAgICAgfCBefn5+Cj4gZGhyeV8xLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7i
gJk6Cj4gZGhyeV8xLmM6MTU5OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbiDigJhQcm9jXzXigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAx
NTkgfCAgICAgUHJvY181KCk7Cj4gICAgICAgfCAgICAgXn5+fn5+Cj4gCj4gU2lnbmVkLW9mZi1i
eTogU3RlZmZlbiBQZXJzdm9sZCA8c3BlcnN2b2xkQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9kaHJ5c3RvbmUvMDAwNi1md2QtZGVjbC5wYXRjaCB8IDEyMSArKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvZGhyeXN0b25lLzAwMDYtZndkLWRlY2wucGF0Y2gKClRoYW5rcyBm
b3IgeW91ciBjb250cmlidXRpb24hCgpUaGUgcGF0Y2ggYWRkZWQgYnkgeW91ciBwYXRjaCB3YXMg
bWlzc2luZyBhIFNpZ25lZC1vZmYtYnkgbGluZSBhbmQgYW4KVXBzdHJlYW0gdGFnLCBzbyBJJ3Zl
IGFkZGVkIHRoYXQuIEFsc28geW91ciBjb21taXQgbWVzc2FnZSB3YXMgbWlzc2luZwphIHJlZmVy
ZW5jZSB0byB0aGUgYXV0b2J1aWxkZXIgZmFpbHVyZSBiZWluZyBmaXhlZCBieSB0aGlzLiBJIGFk
ZHJlc3NlZApib3RoIGlzc3VlcyB3aGVuIGFwcGx5aW5nLgoKSSBkaWQgYSBwcmVwYXJhdGlvbiBw
YXRjaCB0byBjbGVhbi11cCB0aGUgZXhpc3RpbmcgcGF0Y2hlcyBhIGJpdDoKCiAgaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0Lzk1MDEzNzc3Y2Y5MzU0
OGVlZTdhYzMwMTBiNTEzZDM1NGU4YjBhMzAKCkFuZCB0aGVuIGFwcGxpZWQgeW91ciBwYXRjaCB3
aXRoIHRoZSBmaXhlcyBkZXNjcmliZWQgYWJvdmU6CgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8zODQ3YTE0NWMyMzIzNGIzYmRkYWUzYTljZWI5
ZDJkNGU2YTkwZmM1CgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgY29udHJpYnV0aW9uIQoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
