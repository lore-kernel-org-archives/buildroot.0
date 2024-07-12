Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0414C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB9C410D7;
	Fri, 12 Jul 2024 13:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrCUskAwyu7J; Fri, 12 Jul 2024 13:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614B0416DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 614B0416DC;
	Fri, 12 Jul 2024 13:45:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 625261BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50850606AE
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7WpfBemL6jh for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:45:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 276B760654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 276B760654
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 276B760654
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:45:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44334C0002;
 Fri, 12 Jul 2024 13:45:16 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:45:15 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240712154515.43ac3d55@windsurf>
In-Reply-To: <20240313224610.2743219-3-alexis.lothore@bootlin.com>
References: <20240313224610.2743219-1-alexis.lothore@bootlin.com>
 <20240313224610.2743219-3-alexis.lothore@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720791916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WrXejmn4hxUoWu/iqnNn2RCoYVgg/SiXNZpPa0rumvc=;
 b=TenhOPNeFtJH1gpg/tlncnVtNw3TIYpFTrtC0tyuvffd+uUliBoczAjS0TnHqcOT/iZMWn
 mzbzOy5xX3Qgmw5E6KMtbESrGxO/2z25pFB7oraJGlraF+LkgN38mtBcO+U6WZgx8FVQFA
 rlMeCbBfZdiXem5VgEmvJf1H/UHInOYnnlzT5fuRHmKJ3f4sUhm56x3vV2kqpu/N7dPj0a
 J6XdesS8mqk0UscOD2c0f1QOmxpAGMiW37GZfKJkXBXzWqtKGPIeV/Ke2yGpFS7hulwnmR
 qpcHBUpN75Fj07x/iWF5C4WvRBMw7+ZIC4FRh7HNkFPoptkpzShjMsLLEOE+nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TenhOPNe
Subject: Re: [Buildroot] [PATCH 2/2] package/qt5/qt5webkit: fix WebCore
 compatibility issue with updated libxml2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxMyBNYXIgMjAyNCAyMzo0NjoxMCArMDEwMApBbGV4aXMgTG90aG9yw6kgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IAo+IHF0NXdlYmtpdCBidWls
ZCBjdXJyZW50bHkgYnJlYWtzIG9uIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gCj4gWFNMU3R5bGVT
aGVldExpYnhzbHQuY3BwOjE0ODoxMjk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNpb24gZnJvbSDi
gJh2b2lkICgqKSh2b2lkKiwgeG1sRXJyb3IqKeKAmSB7YWthIOKAmHZvaWQgKCopKHZvaWQqLCBf
eG1sRXJyb3IqKeKAmX0gdG8g4oCYeG1sU3RydWN0dXJlZEVycm9yRnVuY+KAmSB7YWthIOKAmHZv
aWQgKCopKHZvaWQqLCBjb25zdCBfeG1sRXJyb3IqKeKAmX0gWy1mcGVybWlzc2l2ZV0KPiAgIDE0
OCB8ICAgICBYTUxEb2N1bWVudFBhcnNlclNjb3BlIHNjb3BlKGNhY2hlZFJlc291cmNlTG9hZGVy
KCksIFhTTFRQcm9jZXNzb3I6OmdlbmVyaWNFcnJvckZ1bmMsIFhTTFRQcm9jZXNzb3I6OnBhcnNl
RXJyb3JGdW5jLCBjb25zb2xlKTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKCopKHZvaWQqLCB4
bWxFcnJvciopIHtha2Egdm9pZCAoKikodm9pZCosIF94bWxFcnJvciopfQo+IAo+IFRoaXMgZXJy
b3IgaXMgZHVlIHRvIGFuIEFQSSB1cGRhdGUgaW4gbGlieG1sMiwgZW5mb3JjaW5nIGNvbnN0IG9u
IG1vcmUKPiBzdHJ1Y3QgaW4gdmVyc2lvbiAyLjEyLjAgKHNlZSBbMV0pLiBCdWlsZHJvb3Qgbm93
IHRyYWNrcyB2Mi4xMi41Lgo+IFVwc3RyZWFtIFdlYmtpdCBwcm9qZWN0IGhhcyBhbHJlYWR5IGlz
c3VlZCB0aGUgY29ycmVzcG9uZGluZyBmaXggKFsyXSksCj4gd2hpY2ggdXBkYXRlcyBjb3JyZXNw
b25kaW5nIGludGVybmFsIHByb3RvdHlwZXMgZGVwZW5kaW5nIG9uIGxpYnhtbDIKPiB2ZXJzaW9u
LCBidXQgdGhlIHF0NXdlYmtpdCB2ZXJzaW9uIHRyYWNrZWQgaW4gYnVpbGRyb290IGRvZXMgbm90
IGludGVncmF0ZQo+IHRoZSBjb3JyZXNwb25kaW5nIFdlYmtpdCB2ZXJzaW9uLgo+IAo+IEZpeCB0
aGlzIGJ1aWxkIGlzc3VlIGJ5IGJyaW5naW5nIHRoZSB1cHN0cmVhbSBwYXRjaCAiYXMgaXMiIGZy
b20gV2Via2l0Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwy
Ly0vcmVsZWFzZXMvdjIuMTIuMAo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktp
dC9jb21taXQvMWJhZDE3NmIyNDk2NTc5ZDc2MDg1MmM4MGNmZjNhZDlmYjdjM2E0Ygo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Cj4gLS0tCj4gIC4uLi1saWJ4bWwyLXZlcnNpb24tMi4xMi4wLWR1ZS10by1BUEktYy5wYXRjaCB8
IDYxICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NXdlYmtpdC8wMDA4LUJ1aWxk
LWZhaWxzLXdpdGgtbGlieG1sMi12ZXJzaW9uLTIuMTIuMC1kdWUtdG8tQVBJLWMucGF0Y2gKCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuIEkgY291bGRuJ3QgYWRkIGFueSBhdXRvYnVpbGRlciBy
ZWZlcmVuY2UsCmJlY2F1c2UgdGhpcyBpc3N1ZSB3YXMgYXBwYXJlbnRseSAiaGlkZGVuIiBiZWhp
bmQgdGhlIGlzc3VlIGZpeGVkIGluClBBVENIIDEvMi4gVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
