Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FD9C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11281810A4;
	Mon, 22 Jul 2024 20:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJuGMppkEEx6; Mon, 22 Jul 2024 20:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 034B2810AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 034B2810AC;
	Mon, 22 Jul 2024 20:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDD81BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 856C040277
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIz3bVO0sl5A for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 265CF401AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 265CF401AF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 265CF401AF
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:19:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 611E0C0003;
 Mon, 22 Jul 2024 20:19:21 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:19:20 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20240722221920.088e521a@windsurf>
In-Reply-To: <20240722165715.3549-2-salvador.joseluis@gmail.com>
References: <20240722182312.1500234b@windsurf>
 <20240722165715.3549-2-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721679561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3O+3QSAqWXYVTu+BAGQogsDfbkynJ1U3ucPaMuSXeY=;
 b=plrIzt2T2ZwTNdaLfc0I0foDY9GOWhuArbssEAqRwDxYqcSn6BwuGOaGUvJfinLNp6p19U
 kueB95QPOCgKncbe2GO3gcJdfqkKx5qPDzrJu2ch4mRQfEFMFEZk1+7xKja20zGKhbg2O4
 oC9dpcYcAlmwwe/nsB+2mdVrIagLQ1ygtM5gxF4zo4oScE0HAbA09Zlwdk4nZGrHIRB7dz
 0y+6QPzBujGSgKKxe8VhBXOQb/rSLqEjdCNDa+NGqZPzneuMz4z11uD4glGBPHV0uUllIc
 uUQLvK+pipIWOmjCv+EPJttSBHNY23ZLoyafttCLwyeaHVbZg+ZK+AfzTfqSUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=plrIzt2T
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zfs: fix uClibc support
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMiBKdWwgMjAyNCAxODo1NzoxNiArMDIwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFRoaXMgdXBkYXRlIGFk
ZHJlc3NlcyB0aGUgaXNzdWUgb2YgdUNsaWJjIHN1cHBvcnQgYnkgc2tpcHBpbmcgWkZTIHRlc3Rz
Cj4gdGhhdCByZXF1aXJlIFNFRUtfREFUQSBzdXBwb3J0Lgo+IAo+IFRoaXMgaXMgYSB3b3JrLWlu
LXByb2dyZXNzIHBhdGNoIHdoaWxlIHdlIHdhaXQgZm9yIGFuIHVwc3RyZWFtIGZpeC4KPiBDdXJy
ZW50IHVwc3RyZWFtIGVmZm9ydHMgY2FuIGJlIGZvbGxvd2VkIGhlcmU6Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW56ZnMvemZzL3B1bGwvMTYxNjkKPiAKPiBDb250ZXh0Ogo+IC0gT3BlblpGUyBp
bmNsdWRlcyBhIHRlc3QgZm9yIGEgYnVnIHRoYXQgb2NjdXJzIHdoZW4gY29weWluZyBhIGxhcmdl
Cj4gICBudW1iZXIgb2YgUFVOQ0hFRCBmaWxlcy4KPiAtIE9wZW5aRlMgaGFzIGJhY2twb3J0ZWQg
dGhpcyB0ZXN0IHRvIHYyLjIueC4KPiAtIHVDbGliYyBkb2VzIG5vdCBzdXBwb3J0IFNFRUtfREFU
QSBhbmQgU0VFS19IT0xFLgo+IC0gVGhlIFpGUyB0ZXN0IGBjcF9zdHJlc3NgIGNhbiBub3QgYmUg
Y29tcGlsZWQgdXNpbmcgdUNsaWJjLgo+IAo+IFRoaXMgY29tbWl0IGZpeDoKPiAtIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNzM5MTc5MzIyNgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1
aXNAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAtIHJlbW92ZWQgcGF0
Y2ggaGFzaCAgKHN1Z2dlc3RlZCBieSBUaG9tYXMgUGV0YXp6b25pKQo+ICAgLSBmaXggY29tbWVu
dCBmb3IgcmVhc29uIGFib3V0IFpGU19BVVRPUkVDT05GICAoc3VnZ2VzdGVkIGJ5IFRob21hcyBQ
ZXRhenpvbmkpCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMg
UGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
