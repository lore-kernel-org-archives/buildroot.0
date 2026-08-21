Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34135C5DF8E
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 08:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A6AB810AC;
	Fri, 21 Aug 2026 08:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gWqCcBAgskd; Fri, 21 Aug 2026 08:59:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787302756;
	bh=MdKRhzx0T0HEFyEv0/7lMkiCevcDNLEgow/ctui4Q7w=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=scDVKxbaymEOJ7QW3XfMwXmSxVw7nBgV1ZytEjL4G+2+HYLluV8/Lc/dt1v/kJIwG
	 zCy9SmtOKyQ2+IgSDsI+JpCAgsRXrwuIRbKZ+fy/XWzLpqeepbJDT9Hg34llVGylq/
	 c/2IIfTBrD2YlR8ZNovRpZIw8cY4Uk3PJeJSo+NwJ2iZsZdrraU+R60Npvum47HITp
	 KEU5G6hYRJK55ZWtoTxLGi60LIR5RQHPK79hiqTIf6u2XnBL57r2a93dNb+nn+JraB
	 K/uN/qAMetP6tvzEw8Yk4W39qkPdHqf1BCLEmvNOkU8J5lAO7khC928oafSJvna6pV
	 k8+WRDWla+oHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF65810AD;
	Fri, 21 Aug 2026 08:59:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85DBB279
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8331560662
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id howVfxL0pmS4 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 08:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9363E60661
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:59:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4FA961A171E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 08:59:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1706B604AA;
 Fri, 21 Aug 2026 08:59:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E067211C76D8F; 
 Fri, 21 Aug 2026 10:59:09 +0200 (CEST)
Date: Fri, 21 Aug 2026 10:58:59 +0200
MIME-Version: 1.0
Message-Id: <20260821-qt5_allow_other_openssl_implementations-v1-1-be1438707393@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBCF4VcpszYQU1rUVxEJMU7tSJrETLxA6
 bs7touz+Db/mYGxEDKcmhkKvokpRcF+14AfXbyjopsYjDa9PhitnrWzLoT0samOWGzKGJmDpSk
 HnDBWVyXBqjetH9pO5o4gtVxwoO/6dL5s5tf1gb7+87AsP6vG2wSLAAAA
X-Change-ID: 20260820-qt5_allow_other_openssl_implementations-623cf35cf3a9
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/qt5: relax openssl constraint to allow
 compatible implementations
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

UXQ1IGNhbiBiZSBidWlsdCB3aXRoIG9yIHdpdGhvdXQgb3BlbnNzbCBzdXBwb3J0LiBGb2xsb3dp
bmcgc29tZSBidWlsZApmYWlsdXJlcywgY29tbWl0IGE5NGQzOWQ2OTNkOCAoInBhY2thZ2UvcXQ1
OiBmaXggYnVpbGQgZmFpbHVyZSBkdWUgdG8KbGlicmVzc2wgdXNlIikgZW5mb3JjZWQgbGlib3Bl
bnNzbCBhcyB0aGUgb25seSB2YWxpZCBpbXBsZW1lbnRhdGlvbiBmb3IKUXQ1IG9wZW5zc2wgc3Vw
cG9ydC4KCldoaWxlIHRoaXMgc29sdXRpb24gaXMgZmluZSB0byBmaWx0ZXIgYmV0d2VlbiB0aGUg
dHdvIG9wZW5zc2wgdmFyaWFudHMKb2ZmaWNpYWxseSBzdXBwb3J0ZWQgYnkgQnVpbGRyb290LCBp
dCBwcmV2ZW50cyB1c2VycyBicmluZ2luZyB0aGVpciBvd24KT3BlblNTTCBpbXBsZW1lbnRhdGlv
bnMgKHRocm91Z2ggdGhlICJwcm92aWRlcyIgbWVjaGFuaXNtKSBmcm9tIGJ1aWxkaW5nClF0NSwg
ZXZlbiBpZiB0aGUgY3VzdG9tIGltcGxlbWVudGF0aW9uIG1hdGNoZXMgdGhlIE9wZW5TU0wgQVBJ
LgoKQWxsb3cgY29tcGF0aWJsZSBleHRlcm5hbCBpbXBsZW1lbnRhdGlvbnMgdG8gYmUgcHJvdmlk
ZWQgZm9yIFF0NSBvcGVuc3NsCnN1cHBvcnQuIFJlbGF4IHRoZSBjb25zdHJhaW50IGJ5IHBhcnRp
YWxseSByZXZlcnRpbmcgYTk0ZDM5ZDY5M2Q4IGFuZApjaGVja2luZyB0aGF0IHRoZSBzZWxlY3Rl
ZCBvcGVuc3NsIGltcGxlbWVudGF0aW9uIGlzbid0IGxpYnJlc3NsLiBJdAp0aGVuIGJlY29tZXMg
dXAgdG8gdXNlcnMgdG8gZW5zdXJlIHRoYXQgdGhlIGltcGxlbWVudGF0aW9uIHRoZXkgYXJlCnBy
b3ZpZGluZyBpcyBmdWxseSBjb21wYXRpYmxlIHdpdGggdGhlIGxpYm9wZW5zc2wgb25lLiBTb21l
IHF0NQpzdWItcGFja2FnZXMgZW5mb3JjZSBCUjJfUEFDS0FHRV9PUEVOU1NMX0ZPUkNFX0xJQk9Q
RU5TU0wsIHRoZXkgZG9uJ3QKbmVlZCB1cGRhdGUgYXMgaXQgZG9lcyBub3QgcmVhbGx5IHN0cmlj
dGx5IHNlbGVjdCBsaWJvcGVuc3NsLCBpdCByYXRoZXIKcHJldmVudHMgbGlicmVzc2wsIHNvIGl0
IHN0aWxsIGFsbG93cyBjdXN0b20gcHJvdmlkZXJzLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tClRoZSBpc3N1ZSBhZmZlY3Rz
IDIwMjUuMDIueCwgMjAyNi4wNS54LCAyMDI2LjA4LnggYW5kIG1hc3RlcgotLS0KIHBhY2thZ2Uv
cXQ1L3F0NWJhc2UvcXQ1YmFzZS5tayB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1
YmFzZS9xdDViYXNlLm1rIGIvcGFja2FnZS9xdDUvcXQ1YmFzZS9xdDViYXNlLm1rCmluZGV4IDE1
OWQ0MTFkZTg1Yi4uNTg5MTdmNmQ2YTE1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3F0NS9xdDViYXNl
L3F0NWJhc2UubWsKKysrIGIvcGFja2FnZS9xdDUvcXQ1YmFzZS9xdDViYXNlLm1rCkBAIC0yMzAs
OCArMjMwLDEyIEBAIGVsc2UKIFFUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gLW5vLWVnbGZzCiBl
bmRpZgogCi1RVDVCQVNFX0NPTkZJR1VSRV9PUFRTICs9ICQoaWYgJChCUjJfUEFDS0FHRV9MSUJP
UEVOU1NMKSwtb3BlbnNzbCwtbm8tb3BlbnNzbCkKLVFUNUJBU0VfREVQRU5ERU5DSUVTICAgKz0g
JChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wpLG9wZW5zc2wpCisjIFF0NSBvZmZpY2lhbGx5
IG9ubHkgc3VwcG9ydHMgT3BlblNTTC4gVXNlcnMgY2FuIGFsc28gcHJvdmlkZSB0aGVpciBvd24K
KyMgT3BlblNTTCB2YXJpYW50IHRocm91Z2ggdGhlICJwcm92aWRlcyIgbWVjaGFuaXNtLCBidXQg
aXQgaXMgdGhlbiB1cCB0bworIyB0aGVtIHRvIGVuc3VyZSB0aGF0IHRoZSBwcm92aWRlZCBBUEkg
aXMgZXhhY3RseSBjb21wYXRpYmxlIHdpdGggdGhlCisjIGxpYm9wZW5zc2wgb25lCitRVDVCQVNF
X0NPTkZJR1VSRV9PUFRTICs9ICQoaWYgJChCUjJfUEFDS0FHRV9PUEVOU1NMKSwkKGlmICQoQlIy
X1BBQ0tBR0VfTElCUkVTU0wpLC1uby1vcGVuc3NsLC1vcGVuc3NsKSwtbm8tb3BlbnNzbCkKK1FU
NUJBU0VfREVQRU5ERU5DSUVTICAgKz0gJChpZiAkKEJSMl9QQUNLQUdFX09QRU5TU0wpLCQoaWYg
JChCUjJfUEFDS0FHRV9MSUJSRVNTTCksLG9wZW5zc2wpKQogCiBRVDVCQVNFX0NPTkZJR1VSRV9P
UFRTICs9ICQoaWYgJChCUjJfUEFDS0FHRV9RVDVCQVNFX0ZPTlRDT05GSUcpLC1mb250Y29uZmln
LC1uby1mb250Y29uZmlnKQogUVQ1QkFTRV9ERVBFTkRFTkNJRVMgICArPSAkKGlmICQoQlIyX1BB
Q0tBR0VfUVQ1QkFTRV9GT05UQ09ORklHKSxmb250Y29uZmlnKQoKLS0tCmJhc2UtY29tbWl0OiA1
MjQ1YzQxNDQxYmFjY2EyOTJkMTI5ZDQzMzllNzllNTE3OWFmNzljCmNoYW5nZS1pZDogMjAyNjA4
MjAtcXQ1X2FsbG93X290aGVyX29wZW5zc2xfaW1wbGVtZW50YXRpb25zLTYyM2NmMzVjZjNhOQoK
QmVzdCByZWdhcmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
