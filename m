Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E62C531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 16:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE6640657;
	Fri, 24 Jul 2026 16:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-IdX5HZ7Ys7; Fri, 24 Jul 2026 16:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F3640B2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784911727;
	bh=+78YATrbtSiQHNKwGwaePm5VnXiNtnIJczVyOTOIeyo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMzeLAGFW4DDHH8N06RejxW65RwBulpwvY+TEYRzrDbGLzSnogAlRmNIgdVwROZ38
	 3PL93Jq2ZwDexp2Rnt1yovJ++AyKGrgt4k4UHlSgIXzvvoPSeQLpKPNQpIhljS7HuG
	 XwM88vrwJ5CtYvWvIELeW3qzZdNaqJAp4jINWgAU5BcnD03V1PLNvYGZIjZy8HAcdJ
	 rZVSBvriZP2wU809Ubt5MgofC7kIEREi35IbOhe4LreoOiqvN6cbAHMmUYyGsFmJLx
	 VoQKezqMPhj2SIpfbv1pRMDlra94wj6XmLSdX8U/1uoHLSR/B5QSCg748BxbptHWx0
	 8SmD7cE5fZLDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F3640B2E;
	Fri, 24 Jul 2026 16:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7628390
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDAD140B2E
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ct6FtBRMvv2R for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 16:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3A6E40657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A6E40657
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3A6E40657
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:48:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 346B1A4C3DC2
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 18:48:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36132)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJ4Y-000000007PN-0rrI
 for buildroot@buildroot.org; Fri, 24 Jul 2026 16:48:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 18:48:28 +0200
Message-ID: <20260724164829.304335-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724164829.304335-1-bernd@kuhls.net>
References: <20260724164829.304335-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784911710;
 bh=IbkAgFcoeaz5ogAujpbd0JPS8YJ7W0zSHVBX6ZrfwsY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=EzqyEZa1TBNBjrbVPi1/dh3oZHjP60j/NnIUO/k9rpkMc9dDsoVDALynl6/EJRPDz
 Te88dENMCXJbf2W7eHmBm9zryx8KKvzPBZ2EXEy7doiV/ooPfvlJyccG6KkjtNYN+n
 mh4RytcTkkubP7YeMfRxwVkKCcsfsnlKqlzD3LBqWb1cdMIghqEecrc8IyOKa78+ZH
 8INh7W971v8+MKbt/iCaqrWoXIxLsEPvtu55wrw8picbZ6YhotsG2OIvPM74rH5SKT
 +QKd7lP6e9veXs08DcKg3JRah+lgN2Cd491j/A+9Lu/hgr4iNCxs6aCBRyF3jhWMw2
 2WqqJqqNlVQqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EzqyEZa1
Subject: [Buildroot] [PATCH/RFC 2/3] package/taglib: needs gcc >= 7
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

Rml4ZXMgYSBidWlsZCBlcnJvciBjYXVnaHQgYnkgdGhlIEdpdGxhYiBwaXBlbGluZXM6CgovYnVp
bGRzL2JrdWhscy9idWlsZHJvb3QvYnItdGVzdC1wa2cvYm9vdGxpbi1hYXJjaDY0LWdsaWJjLW9s
ZC9idWlsZC90YWdsaWItMi4zL3RhZ2xpYi9tcGVnL21wZWdmaWxlLmNwcDoxMTM6MTA6CiBlcnJv
cjogZXhwZWN0ZWQgcHJpbWFyeS1leHByZXNzaW9uIGJlZm9yZSDigJhjb25zdOKAmQogICAgICAg
aWYoY29uc3QgSGVhZGVyIGhlYWRlcigmZmlsZSwgaGVhZGVyT2Zmc2V0ICsgaSwgdHJ1ZSk7IGhl
YWRlci5pc1ZhbGlkKCkpIHsKCndoaWNoIHdhcyBpbnRyb2R1Y2VkIGJ5IGNvZGUgZm9ybWF0IGNo
YW5nZXMgaW4gdXBzdHJlYW0gY29tbWl0Cmh0dHBzOi8vZ2l0aHViLmNvbS90YWdsaWIvdGFnbGli
L2NvbW1pdC9kZmUyYWE1MjUzMmZjOWY3M2E2NzQ5OWRkMTdmYjUyN2E4NTZhMjJmCgp3aGljaCB3
YXMgZmlyc3QgcmVsZWFzZWQgd2l0aCB0YWdsaWIgMi4wLCBhZGRlZCB0byBidWlsZHJvb3Qgd2l0
aCBjb21taXQKOWNkMzQ2NGFmYTEzZmQwMTkwZmIzZTk0ZmQ4NTBjYzgwNjNjZjI5Ny4KClNpZ25l
ZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpJIGhhdmUgbm8gaWRl
YSBpZiB0aGlzIHBhdGNoIGlzIGNvcnJlY3QsIGF0IGxlYXN0IGJsb2NraW5nIGdjYyA2IG1ha2Vz
CnRoZSBHaXRsYWIgcGlwZWxpbmVzIGhhcHB5LiBJdCBzZWVtcyB0byBtZSB0aGF0IHRoZSB1cHN0
cmVhbSBjb21taXQgdXNlcwpuZXdlciBsYW5ndWFnZSBmZWF0dXJlcyBub3Qgc3VwcG9ydGVkIGJ5
IGdjYyA2LCBidXQgd2l0aCBteSBsaW1pdGVkCmtub3dsZWRnZSBhYm91dCBDKysgSSBjb3VsZCBu
b3QgZmluZCBldmlkZW5jZSB0byBzdXBwb3J0IG15IHRoZW9yeS4KCiBwYWNrYWdlL2dzdHJlYW1l
cjEvZ3N0MS1wbHVnaW5zLWdvb2QvQ29uZmlnLmluIHwgNiArKysrLS0KIHBhY2thZ2UvdGFnbGli
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKystLQogMiBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1nb29kL0NvbmZpZy5pbiBiL3BhY2thZ2UvZ3N0cmVh
bWVyMS9nc3QxLXBsdWdpbnMtZ29vZC9Db25maWcuaW4KaW5kZXggNmE3MzhmYWEwMC4uYzRlYjRl
ZmI2NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1nb29kL0Nv
bmZpZy5pbgorKysgYi9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWdvb2QvQ29uZmln
LmluCkBAIC00MDMsMTMgKzQwMywxNSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5T
X0dPT0RfUExVR0lOX1NQRUVYCiBjb25maWcgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0dPT0Rf
UExVR0lOX1RBR0xJQgogCWJvb2wgInRhZ2xpYiIKIAlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJ
QlNURENQUAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjIEMrKzE3
CiAJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1RBR0xJQgog
CWhlbHAKIAkgIFRhZ2xpYiB0YWdnaW5nIHBsdWdpbiBsaWJyYXJ5CiAKLWNvbW1lbnQgInRhZ2xp
YiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHdjaGFyIgotCWRlcGVuZHMgb24gIUJSMl9JTlNU
QUxMX0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hBUgorY29tbWVudCAidGFnbGliIG5lZWRzIGEg
dG9vbGNoYWluIHcvIEMrKywgd2NoYXIsIGdjYyA+PSA3IgorCWRlcGVuZHMgb24gIUJSMl9JTlNU
QUxMX0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hBUiBcCisJCXx8ICFCUjJfVE9PTENIQUlOX0dD
Q19BVF9MRUFTVF83CiAKIGNvbmZpZyBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfR09PRF9QTFVH
SU5fVFdPTEFNRQogCWJvb2wgInR3b2xhbWUiCmRpZmYgLS1naXQgYS9wYWNrYWdlL3RhZ2xpYi9D
b25maWcuaW4gYi9wYWNrYWdlL3RhZ2xpYi9Db25maWcuaW4KaW5kZXggNWI2NDFhOTY1My4uOWE0
M2M4MmE1ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS90YWdsaWIvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2UvdGFnbGliL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDcgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9U
QUdMSUIKIAlib29sICJ0YWdsaWIiCiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAK
KwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBDKysxNwogCWRlcGVu
ZHMgb24gQlIyX1VTRV9XQ0hBUgogCXNlbGVjdCBCUjJfUEFDS0FHRV9VVEZDUFAKIAloZWxwCkBA
IC0xMiw1ICsxMyw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9UQUdMSUIKIAogCSAgaHR0cDovL3Rh
Z2xpYi5vcmcvCiAKLWNvbW1lbnQgInRhZ2xpYiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIHdj
aGFyIgotCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hB
UgorY29tbWVudCAidGFnbGliIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgd2NoYXIsIGdjYyA+
PSA3IgorCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hB
UiBcCisJCXx8ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83Ci0tIAoyLjQ3LjMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
