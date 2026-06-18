Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D237CD98FA
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 14:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F682606CF;
	Thu, 18 Jun 2026 14:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NErHAhGlVS0d; Thu, 18 Jun 2026 14:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 419C961169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781794182;
	bh=c2IzhO7W8llJBd3B8hVQvMYok0EmW2FwnfguLrqW+FI=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QJPm+SsDjBLLZGq/nsQW30wo0C6lpTtv8WyJ9BNtgttnRzuw5A1ULzcYsl1KwuR7i
	 iH7gnk6hYOSpSBTkix7Ar27/Lh3RTh/ShHU+saRHE9QQ6vTqWwEeXLJNKgkXRC6zQf
	 SjtSsbh0+Gl/XIVpScVVD8Ur/9bvYhJYGXy9bKbHDLoM6I2nUha3IFQhs3fSed0iaC
	 RFr4vmX0jDpJRf7K9d6lmmWwKYcNfFvkObb11wxSZf56iD9BUYJkjGAsI0ABRPplNP
	 cHwelbqZT18GzphDTiDLeeOLd/fGMmAHjwelGJUWkytNAVakCSoHWelI2OhT2EeIVF
	 j/RiCETFI9+Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 419C961169;
	Thu, 18 Jun 2026 14:49:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7C891F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99AE461169
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiAeY5vtjs-U for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 14:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B2CE606CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2CE606CF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B2CE606CF
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:49:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2FE9CC06CD2;
 Thu, 18 Jun 2026 14:49:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA19B5FF03;
 Thu, 18 Jun 2026 14:49:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68AAD106C81A3; 
 Thu, 18 Jun 2026 16:49:33 +0200 (CEST)
Date: Thu, 18 Jun 2026 16:49:27 +0200
MIME-Version: 1.0
Message-Id: <20260618-libgpg-error-gawk-v1-1-d6ac9f962f1f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ7CIBBA4as0s+4k0KSIXqXpgsKIo4Y2g38J4
 e5iXX6L9wpkEqYMp66A0Iszr6lB9x34i0uRkEMzDGowymiLd17iFpFEVsHo3jc82oMevQrk9Ai
 t24TO/Nmf0/x3fi5X8o/fCGr9AiAZGDF1AAAA
X-Change-ID: 20260618-libgpg-error-gawk-98715c0dea15
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernard Gautier <bernard.gautier@nav-timing.safrangroup.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781794176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Pdy9W2ggyPAWkPYCKz6dXG4EiAYruHw32zk2cFNZPT4=;
 b=uq0r8qb6rA0IHcX9TC0kFDbKi5pkLozraLPGLnaZXp1R5wO/CwEA6G2kIotpgYt/U4EOr6
 DjyQ4rN6qL9ZC3CnaoFwnIszTORfLrmVSLwlD2P7VtOkZZojTKcaUjndY9iPU/ct5DA/Ti
 vVxTNtD4r0VJk7d4hGZfefOkqV3nwEMvP3RucFj5JNZOgUmSDX1u5/Osj6ljVdSavSBsW8
 qWyhWkAM/iHTDugyzjFBn+vBkAw8OXFKEp13AuFa4K1ZdQBv56wfPgMB4YpLp9dV0suM4q
 10TA9ikcWYnXlJOIA055W4wmBRAL3i8dYuKKipUQVRml/42di0bu48QEV3O3cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uq0r8qb6
Subject: [Buildroot] [PATCH] package: libgpg-error: make sure to use
 host-gawk
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

RnJvbTogQmVybmFyZCBHYXV0aWVyIDxiZXJuYXJkLmdhdXRpZXJAbmF2LXRpbWluZy5zYWZyYW5n
cm91cC5jb20+CgpEdXJpbmcgaXRzIGNvbmZpZ3VyZSBzdGVwLCBsaWJncGctZXJyb3IgbmVlZHMg
YXdrOgoKICBjb25maWd1cmUgLT4gc3JjL2dlbi1sb2NrLW9iai5zaCAtPiBvYmpkdW1wICsgYXdr
IG9uIHRlc3QgYmluYXJ5CgpUaGlzIGNhbGwgaXMgdXNlZCBvbiB0aGUgb3V0cHV0IGZyb20gb2Jq
ZHVtcCBvbiBhIHRlc3QgYmluYXJ5IHRvCnJldHJpZXZlIHRoZSBzaXplIG9mIHNvbWUgZGF0YSBz
dHJ1Y3R1cmUsIGFuZCBnZW5lcmF0ZSBhY2NvcmRpbmdseSBhbgppbnRlcm5hbCBoZWFkZXIgKGxv
Y2stb2JqLXB1Yi5uYXRpdmUuaCkuIEhvd2V2ZXIsIGxpYmdwZy1lcnJvciBidWlsZHJvb3QKcGFj
a2FnZSBkb2VzIG5vdCBkZXBlbmQgZXhwbGljaXRlbHkgb24gaG9zdC1nYXdrOiBpZiBob3N0LWdh
d2sgaXMgbm90CnBhcnQgb2YgdGhlIGJ1aWxkLCBvciBpZiBpdCBpcyBidWlsdCBsYXRlciB0aGFu
IGxpYmdwZy1lcnJvciwKbGliZ3BnLWVycm9yIGF1dG90b29sIHRvb2xpbmcgd2lsbCBldmVudHVh
bGx5IHBpY2sgdGhlIGJ1aWxkIG1hY2hpbmUKYXdrLiBPbiB0b3Agb2YgdGhpcyBpc3N1ZSwgZGVz
cGl0ZSB0aGUgY29uZmlndXJlLmFjIHN1Z2dlc3RpbmcgdGhhdCBpdApzdXBwb3J0cyBkaWZmZXJl
bnQgaW1wbGVtZW50YXRpb25zIG9mIGF3aywgbGliZ3BnLWVycm9yIGNvbmZpZ3VyZSBzdGVwCndp
bGwgbm90IHBhcnNlIGNvcnJlY3RseSB0aGUgb3V0cHV0IGZyb20gb2JqZHVtcCB3aGVuIHVzaW5n
IG1hd2ssCmxlYWRpbmcgdG8gYSB3cm9uZyBsb2NrLW9iai1wdWIubmF0aXZlLmggaGVhZGVyIGJl
aW5nIGdlbmVyYXRlZDoKCldpdGggZ2F3azoKCiAgdHlwZWRlZiBzdHJ1Y3QKICB7CiAgICBsb25n
IF92ZXJzOwogICAgdW5pb24gewogICAgICB2b2xhdGlsZSBjaGFyIF9wcml2WzI0XTsKICAgICAg
bG9uZyBfeF9hbGlnbjsKICAgICAgbG9uZyAqX3hwX2FsaWduOwogICAgfSB1OwogIH0gZ3BncnRf
bG9ja190OwoKICAjZGVmaW5lIEdQR1JUX0xPQ0tfSU5JVElBTElaRVIgezEse3swLDAsMCwwLDAs
MCwwLDAsIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDAsMCwwLDAs
MCwwLDAsIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLDAsMCwwLDAs
MCwwLDB9fX0KCldpdGggbWF3azoKCiAgdHlwZWRlZiBzdHJ1Y3QKICB7CiAgICBsb25nIF92ZXJz
OwogICAgdW5pb24gewogICAgICB2b2xhdGlsZSBjaGFyIF9wcml2WzBdOwogICAgICBsb25nIF94
X2FsaWduOwogICAgICBsb25nICpfeHBfYWxpZ247CiAgICB9IHU7CiAgfSBncGdydF9sb2NrX3Q7
CgogICNkZWZpbmUgR1BHUlRfTE9DS19JTklUSUFMSVpFUiB7MSx7e319fQoKVGhpcyBpc3N1ZSBo
YXMgYmVlbiBvYnNlcnZlZCBmb3IgZXhhbXBsZSBvbiBEZWJpYW4gMTMgd2l0aCBtYXdrCmluc3Rh
bGxlZDogaXQgZmFpbHMgdG8gcGFyc2UgbXR4X3NpemUsIGxlYWRpbmcgdG8gYSBzaXplIDAsIGFu
ZCBzbwpnZW5lcmF0aW5nIGNyYXNoZXMgYXQgcnVudGltZSBiZWNhdXNlIG9mIHRoZSBpbnZhbGlk
IHNpemUgZW1iZWRkZWQgaW4KbGliZ3BnLWVycm9yLgoKbGliZ3BnLWVycm9yIHNob3VsZCBiZSBm
aXhlZCB1cHN0cmVhbSB0byBwcm9wZXJseSBoYW5kbGUgdGhpcyBkYXRhCnN0cnVjdHVyZSBzaXpl
IGd1ZXNzaW5nIGV2ZW4gd2hlbiB1c2luZyBtYXdrLCBidXQgYW55d2F5IHRoZQpjb3JyZXNwb25k
aW5nIGJ1aWxkcm9vdCBwYWNrYWdlIHNob3VsZCBub3QgcmFuZG9tbHkgdXNlIHRoZSBidWlsZApt
YWNoaW5lIGhvc3QgdG9vbGluZyBvciBidWlsZHJvb3QtcHJvdmlkZWQgaG9zdCB0b29saW5nIGRl
cGVuZGluZyBvbgp3aGV0aGVyIGhvc3QtZ2F3ayBoYXMgYmVlbiBzZWxlY3RlZCBhbmQgYnVpbHQg
YmVmb3JlIGl0LgoKRW5mb3JjZSBhbiBleHBsaWNpdCBkZXBlbmRlbmN5IG9uIGhvc3QtZ2F3ayBm
b3IgbGliZ3BnLWVycm9yIHRvIG1ha2UKc3VyZSB0aGF0IGl0IHN5c3RlbWF0aWNhbGx5IHVzZXMg
dGhlIGJ1aWxkcm9vdC1wcm92aWRlZCBhd2suCgpDby1kZXZlbG9wcGVkLWJ5OiBCZXJuYXJkIEdh
dXRpZXIgPGJlcm5hcmQuZ2F1dGllckBuYXYtdGltaW5nLnNhZnJhbmdyb3VwLmNvbT4KU2lnbmVk
LW9mZi1ieTogQmVybmFyZCBHYXV0aWVyIDxiZXJuYXJkLmdhdXRpZXJAbmF2LXRpbWluZy5zYWZy
YW5ncm91cC5jb20+CkNvLWRldmVsb3BwZWQtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxv
dGhvcmVAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9saWJncGctZXJyb3IvbGliZ3BnLWVy
cm9yLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLm1rIGIv
cGFja2FnZS9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLm1rCmluZGV4IGRmOTVlNWZlMGMxNC4u
MzFmZmNlZTc0MzJmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmdwZy1lcnJvci9saWJncGctZXJy
b3IubWsKKysrIGIvcGFja2FnZS9saWJncGctZXJyb3IvbGliZ3BnLWVycm9yLm1rCkBAIC0xMiw3
ICsxMiw3IEBAIExJQkdQR19FUlJPUl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBDT1BZSU5HLkxJ
QgogTElCR1BHX0VSUk9SX0NQRV9JRF9WRU5ET1IgPSBnbnVwZwogTElCR1BHX0VSUk9SX0lOU1RB
TExfU1RBR0lORyA9IFlFUwogTElCR1BHX0VSUk9SX0NPTkZJR19TQ1JJUFRTID0gZ3BnLWVycm9y
LWNvbmZpZwotTElCR1BHX0VSUk9SX0RFUEVOREVOQ0lFUyA9ICQoVEFSR0VUX05MU19ERVBFTkRF
TkNJRVMpCitMSUJHUEdfRVJST1JfREVQRU5ERU5DSUVTID0gJChUQVJHRVRfTkxTX0RFUEVOREVO
Q0lFUykgaG9zdC1nYXdrCiBMSUJHUEdfRVJST1JfQ09ORl9PUFRTID0gXAogCWNyb3NzX2NvbXBp
bGluZz15ZXMgXAogCS0taG9zdD0kKEJSMl9QQUNLQUdFX0xJQkdQR19FUlJPUl9TWVNDRkcpIFwK
Ci0tLQpiYXNlLWNvbW1pdDogNjc0NDkxMzBlOWZkZDcxYTM4Y2EyNjUzOWRkZGZhOGM4ODJiMTk3
NwpjaGFuZ2UtaWQ6IDIwMjYwNjE4LWxpYmdwZy1lcnJvci1nYXdrLTk4NzE1YzBkZWExNQoKQmVz
dCByZWdhcmRzLAotLSAgCkFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
