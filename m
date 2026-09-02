Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7255C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 07:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A27260849;
	Wed,  2 Sep 2026 07:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXGn3YH7yr6E; Wed,  2 Sep 2026 07:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788334482;
	bh=eWng8NowItQm88kx8SydDFc32EIgwrlV0vHnKp+VH7E=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZRrUfLbMIfX9WaduMVnGoj6JU99LIeH6omamxM8jfXL25A1fWJRtXQXx8r3RGM7nd
	 X1LBM5ziXDhZ0WvHXNHrIsbnOdUZQpkEHZLQgMXm70ymnA0d5Q58FhxumhTj0HUrHo
	 hy6ON3gZsq86/AIbz8+GGFttMfRmkkl85lmjkMeniiJU1Zd1KMraAeRnRsN1leKajf
	 diGtnY7McLdlQnV2wwIFDrlAkRcmdwLmBcbKhYrFB7gSn4+Qr9OqD9os9CQgzSUNRT
	 YgESxWvZdbRB2kEmUPJJMrCcIfILZ3uiMSTwC5ZnF3Ekj57TgmSGvkUCJz1djJKxgT
	 LZwbBmydDPYuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A69AA60824;
	Wed,  2 Sep 2026 07:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3BE498
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 07:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBBB160824
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 07:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sks1WbPMIQYv for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 07:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AF5C6080F
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 07:34:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 691E31A0EFC
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 07:34:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E7996053C
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 07:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6847E11C78CB6; 
 Wed,  2 Sep 2026 09:34:32 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 02 Sep 2026 09:34:31 +0200
Message-Id: <DL4NNUSAJ2HE.2VFU26KTNWJI0@bootlin.com>
Cc: <buildroot@buildroot.org>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814-openscap_musl_dbus-v1-1-cd42c1c3e0e2@bootlin.com>
 <apNMFCS2K3W1coCX@windsurf> <DL2Z0LY54M31.2D5J3ISTOPNK5@bootlin.com>
In-Reply-To: <DL2Z0LY54M31.2D5J3ISTOPNK5@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/openscap: fix build failure with
 dbus and musl
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uIEF1ZyAzMSwgMjAyNiBhdCAxMDowMyBBTSBDRVNULCBBbGV4aXMgTG90aG9yw6kgd3Jv
dGU6Cj4gT24gU2F0IEF1ZyAyOSwgMjAyNiBhdCAxMToxNiBQTSBDRVNULCBUaG9tYXMgUGV0YXp6
b25pIHdyb3RlOgo+PiBPbiBGcmksIEF1ZyAxNCwgMjAyNiBhdCAwMjowNjoxM1BNICswMjAwLCBB
bGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4KPj4+IEZpeGVzOiBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTg3NGQ0ZjM0ZDM2ZmE5Zjg1NjZiZTkw
YWQyZDVmYWNiOTlhZWMyNC8KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxl
eGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4+PiAtLS0KPj4+IFRoZSBpc3N1ZSBhZmZlY3RzIG1h
c3RlciwgMjAyNi4wNS54IGFuZCAyMDI1LjAyLngKPj4KPj4gV2FpdCwgaG93IGNhbiB0aGlzIGlz
c3VlIGFmZmVjdHMgMjAyNS4wMi54LCBzaW5jZSBvcGVuc2NhcCBmaXJzdAo+PiBhcHBlYXJlZCBp
biAyMDI2LjAyID8KPgo+IEFoLCBnb29kIGNhdGNoLCBJIGZvcmdvdCB0aGF0IHRoYXQgdGhlIDIw
MjUuMDIgdHJlZSBvbiB3aGljaCBJIHdhcwo+IHdvcmtpbmcgaGFkIE9wZW5zY2FwIGJlY2F1c2Ug
SSBtYW51YWxseSBiYWNrcG9ydGVkIHRoZSBwYXRjaGVzCj4gaW50cm9kdWNpbmcgaXQuIFRvbyBt
dWNoIGNvdXBsaW5nIGJldHdlZW4gbXkgZGlmZmVyZW50IEJSIHNlcmllcywgbXkgYmFkCj4gIQoK
U28gbXkgbWlzdGFrZSBnb2VzIGV2ZW4gZnVydGhlcjogb3BlbnNjYXAgbm93IGZhaWxzIHRvIGJ1
aWxkLCBiZWNhdXNlIGl0CmZhaWxzIHRvIGFwcGx5IHRoZSBwYXRjaC4gSXQgZmFpbHMgdG8gYXBw
bHkgdGhlIHBhdGNoIGJlY2F1c2UgdGhlIGlzc3VlCmlzIGFscmVhZHkgZml4ZWQgaW4gMS40LjQg
KHRoZSBvcmlnaW5hbCBhdXRvYnVpbGRlciBpc3N1ZSB3YXMgcmFpc2VkIG9uCmJyYW5jaCAyMDI2
LjAyKSwgYnV0IHRoZSB2ZXJzaW9uIGJ1bXAgb2NjdXJlZCBsYXRlci4gU28gdGhpcyBwYXRjaApt
dXN0IGJlIHJldmVydGVkIG9uIG1hc3Rlci4gSSdsbCBzZW5kIHRoZSByZXZlcnQsIG15IGJhZCBm
b3IgdGhlIG5vaXNlLgoKPiBBbGV4aXMKPgo+PiBUaG9tYXMKCgoKCi0tIApBbGV4aXMgTG90aG9y
w6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
