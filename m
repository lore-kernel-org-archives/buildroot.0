Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9812AC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410FD605DC;
	Mon, 12 Aug 2024 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkNPuokr9r2N; Mon, 12 Aug 2024 20:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C5D060793
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5D060793;
	Mon, 12 Aug 2024 20:03:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7611BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49D2980E00
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdFihA1vmy26 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1249080DB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1249080DB6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1249080DB6
 for <buildroot@busybox.net>; Mon, 12 Aug 2024 20:03:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5FC4240002;
 Mon, 12 Aug 2024 20:03:41 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:03:41 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240812220341.02fc74ae@windsurf>
In-Reply-To: <20240811080755.2588426-1-francois.perrad@gadz.org>
References: <20240811080755.2588426-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723493022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaVBdzuXjMerSlVkdmomcRey27XxXbfdbfT4r5NjVZM=;
 b=PzJkPRYozWXph5hoECmbpiUe3Gay5DbHBcqVYq3YPOh2uTg62LsByVg6M2dXYA9/Ro/eL0
 uCFEQDcVEFeUvD8cKX8sHndKdVM4ciibMyALpaohAgcx+Eq7UCRIl1ye9Zm7CCwTYTvp5r
 AbrSN9dFLy8nDswluZLY8fmIvvdzxsM55esrGL7P+2Xy+sDhoX3O5L9j9zrxcmK2GYdhK3
 uGt1v2LFmtONOcMTzLmVCfT1katAiFVVQfKamRQK53P+fvP/RVM38bPL/9WcCq2pHa5cds
 M5GE9CjDMP2HV+6PPfizlUzojsTwJrQ/QCnt6NsL6zLJvGfDSvuIea1Eey19/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PzJkPRYo
Subject: Re: [Buildroot] [PATCH] package/graphene: needs a toolchain with
 threads
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gU3VuLCAxMSBBdWcgMjAyNCAxMDowNzo1NSArMDIwMApGcmFu
Y29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4gd3JvdGU6Cgo+IC9ob21lL2F1
dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtOS9vdXRwdXQtMS9ob3N0L2FhcmNoNjQtYnVpbGRy
b290LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1cmVzLmg6MjIwOjU6IHdh
cm5pbmc6ICN3YXJuaW5nIHJlcXVlc3RlZCByZWVudHJhbnQgY29kZSwgYnV0IHRocmVhZCBzdXBw
b3J0IHdhcyBkaXNhYmxlZCBbLVdjcHBdCj4gCj4gZml4IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy9yZXN1bHRzLzliMy85YjM1N2IxZWYyZWNjZDMxMTBkMGVjYWFmZjFhZTQ4ODNkZmY5
MjgwCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRA
Z2Fkei5vcmc+Cj4gLS0tCj4gIHBhY2thZ2UvZ3JhcGhlbmUvQ29uZmlnLmluIHwgNCArKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKClRoYW5rcyBhIGxvdCwgYnV0IEkgYmVs
aWV2ZSB0aGlzIGlzIHBhcGVyaW5nIG92ZXIgdGhlIHJlYWwgaXNzdWUuCkluZGVlZCB0aGUgY29k
ZSBoYXMgc29tZSBuaWNlOgoKI2lmZGVmIEhBVkVfUFRIUkVBRAouLi4KI2VuZGlmCgphcm91bmQg
YWxsIHRocmVhZCByZWxhdGVkIGNvZGUuIEhvd2V2ZXIsIHRoZToKCnRocmVhZGxpYiA9IGRlcGVu
ZGVuY3koInRocmVhZHMiKQoKaW4gbWVzb24uYnVpbGQgYWRkcyAtcHRocmVhZCB0byB0aGUgYnVp
bGQgY29tbWFuZCBsaW5lLCBjYXVzaW5nIHRoaXMKaXNzdWUuIEkgYW0gbm90IGFuIGV4cGVydCBp
biBNZXNvbiBzbyBJJ20gbm90IDEwMCUgc3VyZSBob3cgdG8gZml4CnRoaXMsIGFuZCB0byB1bmRl
cnN0YW5kIDEwMCUgd2hhdCBpcyB0aGUgc2VtYW50aWMgb2YKZGVwZW5kZW5jeSgidGhyZWFkcyIp
LCBidXQgdGhpcyBpcyB3aGF0IG5lZWRzIHRvIGJlIGZpeGVkIChvcgphbHRlcm5hdGl2ZWx5IHJl
cG9ydGVkIHVwc3RyZWFtKS4gTWF5YmUgbWVzb24uYnVpbGQgbmVlZHMgdG8gYmUgY2hhbmdlZCB0
aGlzIHdheToKCnRlc3QgaWYgcHRocmVhZC5oIGlzIGhlcmUsIGFuZCBpZiBpdCBpczoKIHNldCBI
QVZFX1BIVEhSRUFECiB0aHJlYWRsaWIgPSBkZXBlbmRlbmN5KCJ0aHJlYWRzIikKCnNvbWV0aGlu
ZyBhbG9uZyB0aG9zZSBsaW5lcy4gQ291bGQgeW91IGhhdmUgYSBsb29rPwoKVGhvbWFzCi0tIApU
aG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
