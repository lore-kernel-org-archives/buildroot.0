Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B54CEB271A
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C93782784;
	Tue, 10 Feb 2026 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aI3xWnCj2al; Tue, 10 Feb 2026 21:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F25A82792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770757330;
	bh=ggyDhwlj5URl3X75DBQJ1FDPWad9rwW8l5VpiccrwyE=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=O4WPxeOWxEdqaEEJiXhDrtMfjnORgYbJp68JRvN8SzKCZFGBgzEiB79RFoIKMD7ZH
	 NQRVufj4ol/3EhfF8gJis73NDU1HA7FZ6w6+DAn1UHUSXg/f5BRHduBGqJc8sipjUS
	 UQfs96UufU02JVJeTX8INpkNlznWRFXNDFsNrWpXkeFP14vXA1tZS6LStI76dj0cWn
	 u93bVEoASIC2wZHILV0IOxwR/Qgb0HFYmJV4lUmHRX4l7Id/IiMXIQirbj3aSs0zm/
	 k9MG6gT8F3YfR6Kqd9oJKbzWpEuLwCBVLXiTZiOwcFDsfFqYx4yE22Y3uTisNBvg4m
	 +wuvPmF0Joijw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F25A82792;
	Tue, 10 Feb 2026 21:02:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8370EF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 688FB82771
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 269k45mb1FsO for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58AC6826C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58AC6826C8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58AC6826C8
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2A4024E40C03
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0919606BD;
 Tue, 10 Feb 2026 21:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC2EC10B91A8A; Tue, 10 Feb 2026 22:02:03 +0100 (CET)
Date: Tue, 10 Feb 2026 22:01:55 +0100
MIME-Version: 1.0
Message-Id: <20260210-python-packages-v1-1-6153f56421d4@bootlin.com>
References: <20260210-python-packages-v1-0-6153f56421d4@bootlin.com>
In-Reply-To: <20260210-python-packages-v1-0-6153f56421d4@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770757324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EJ+8G4WYjYgx2nr8+eOHDovTV/AMeWN+NxjXfQ4tuTg=;
 b=GcV6HIm40RvTIxJ2sH+Jyxpn9pAh2niWIa+gDqStX7hHyNPI0Z94B5I5iuAnWR0vP95Hti
 5ECWaTPlWmoDEgAzxN/yEYKN8FALUxsfZjPmAmPXnL/+ZGOJHbYwd7qV8CG+aRVxO5nrK4
 Jl389myN/iKjWDv8ogvLa5nqUTgcZau/oWSI9K4Tw67FZ//AUMy1HYumcTLaOAxw54x7pQ
 g88eXnhPd+Gs/0WLvDOhHPAoWQyUREJp2MOZsY6gkf69je0q4BjPbAuf6BESoWML43FMC/
 KyUmXLKLOYkVQr8XNVg7MwB9hoQUfnc/vqCNnWerItXyy+v4jnEcWW82AO+Yhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GcV6HIm4
Subject: [Buildroot] [PATCH 1/2] package/python-gevent: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnJpbmcgcHl0aG9uLWdldmVudCBtb2R1bGUgYXMgYSBzdGFuZGFsb25lIHBhY2thZ2UuCgpTZXQg
R0VWRU5UU0VUVVBfRU1CRUQ9MCB0byBwcmV2ZW50IHB5dGhvbi1nZXZlbnQgZnJvbSB1c2luZyBp
dHMgZW1iZWRkZWQKbGlidXYsIGxpYmV2IGFuZCBjLWFyZXMgYW5kIHJhdGhlciB1c2UgdGhvc2Ug
cGFja2FnZWQgd2l0aCBidWlsZHJvb3QuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kg
PGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3B5dGhv
bi1nZXZlbnQvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysr
KysrKysrKysKIHBhY2thZ2UvcHl0aG9uLWdldmVudC9weXRob24tZ2V2ZW50Lmhhc2ggICAgICAg
ICAgICAgIHwgIDUgKysrKysKIHBhY2thZ2UvcHl0aG9uLWdldmVudC9weXRob24tZ2V2ZW50Lm1r
ICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwogc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9nZXZlbnQucHkgfCAgNyArKysrKysrCiBzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9nZXZlbnQucHkgICB8IDEyICsrKysr
KysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMjI1ZDFhYzkxN2RjLi5jYzdjMzhjMzE4NzMg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTU1LDYgKzE1NSw3
IEBAIE46CUFsZXhleSBMdWt5YW5jaHVrIDxza2lmQHNraWYtd2ViLnJ1PgogRjoJcGFja2FnZS96
YWJiaXgvCiAKIE46IAlBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29t
PgorRjogCXBhY2thZ2UvcHl0aG9uLWdldmVudAogRjogCXBhY2thZ2UvcHl0aG9uLXNjcAogCiBO
OglBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA2Mjg0YmVhN2Y0YWQu
Ljc2YzJhNDM2NTUxMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KQEAgLTExMjcsNiArMTEyNyw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBt
b2R1bGVzIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tZm9udHRvb2xzL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvcHl0aG9uLWZyb3plbmxpc3QvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9weXRob24tZnV0dXJlL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWdl
dmVudC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1naXQvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS9weXRob24tZ2l0ZGIyL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLWdudXBnL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWdl
dmVudC9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1nZXZlbnQvQ29uZmlnLmluCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYWY3YTk3YTQ5Y2UzCi0tLSAvZGV2L251
bGwKKysrIGIvcGFja2FnZS9weXRob24tZ2V2ZW50L0NvbmZpZy5pbgpAQCAtMCwwICsxLDE5IEBA
Citjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0dFVkVOVAorCWJvb2wgInB5dGhvbi1nZXZlbnQi
CisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84ICMgQysrMjAKKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfQ19BUkVTICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJF
ViAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVVYgIyBydW50aW1lCisJc2VsZWN0
IEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OX0NZVEhPTiAjIGJ1aWxkIHRpbWUKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfSE9TVF9QWVRIT05fR1JFRU5MRVQgIyBidWlsZCB0aW1lCisJc2VsZWN0IEJSMl9Q
QUNLQUdFX0hPU1RfUFlUSE9OX0NGRkkgIyBidWlsZCB0aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdF
X1BZVEhPTl9HUkVFTkxFVCAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1pP
UEVFVkVOVCAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1pPUEVfSU5URVJG
QUNFICMgcnVudGltZQorCWhlbHAKKwkgIENvcm91dGluZS1iYXNlZCBuZXR3b3JrIGxpYnJhcnku
CisKKwkgIGh0dHA6Ly93d3cuZ2V2ZW50Lm9yZy8KKworY29tbWVudCAicHl0aG9uLWdldmVudCBu
ZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIGdjYyA+PSA4IgorCWRlcGVuZHMgb24gIUJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzgKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWdldmVudC9w
eXRob24tZ2V2ZW50Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1nZXZlbnQvcHl0aG9uLWdldmVudC5o
YXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDM1Njk3MmRkZDUw
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tZ2V2ZW50L3B5dGhvbi1nZXZlbnQu
aGFzaApAQCAtMCwwICsxLDUgQEAKKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3Jn
L3B5cGkvZ2V2ZW50L2pzb24KK21kNSAgYTQxNTY5MzAxM2U3OWRmNGM4OGE5ZTVmYzkwMjU0YmMg
IGdldmVudC0yNS45LjEudGFyLmd6CitzaGEyNTYgIGFkZjljZDU1MmRlNDRhNGU2NzU0YzUxZmYy
ZTc4ZDkxOTNiN2ZhNmVhYjEyM2RiOTU3OGEyMTBlNjU3MjM1ZGQgIGdldmVudC0yNS45LjEudGFy
Lmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2ICA0ZDQ2YmMx
MWQxOWUzODUzZDU0MzI1OTczYjhlMmM1MzA5MGY1NjM4YTdiZjI3ZmExZjVmMTIzMmM3ODkwMWY3
ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1nZXZlbnQvcHl0aG9uLWdldmVu
dC5tayBiL3BhY2thZ2UvcHl0aG9uLWdldmVudC9weXRob24tZ2V2ZW50Lm1rCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMTBkZGM4OTVmNzRiCi0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9weXRob24tZ2V2ZW50L3B5dGhvbi1nZXZlbnQubWsKQEAgLTAsMCArMSwx
NiBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgcHl0aG9uLWdldmVudAorIworIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUFlUSE9OX0dFVkVOVF9WRVJTSU9OID0gMjUuOS4xCitQ
WVRIT05fR0VWRU5UX1NPVVJDRSA9IGdldmVudC0kKFBZVEhPTl9HRVZFTlRfVkVSU0lPTikudGFy
Lmd6CitQWVRIT05fR0VWRU5UX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvOWUvNDgvYjNlZjI2NzNmZmI5NDBmOTgwOTY2Njk0ZTQwZDZkMzI1NjBmM2ZmYTI4
NGVjYWViNWVhM2E5MGE2ZDNmCitQWVRIT05fR0VWRU5UX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xz
CitQWVRIT05fR0VWRU5UX0RFUEVOREVOQ0lFUyA9IGxpYmV2IGxpYnV2IGhvc3QtcHl0aG9uLWdy
ZWVubGV0IGhvc3QtcHl0aG9uLWNmZmkgaG9zdC1weXRob24tY3l0aG9uCitQWVRIT05fR0VWRU5U
X0xJQ0VOU0UgPSBNSVQKK1BZVEhPTl9HRVZFTlRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKK1BZ
VEhPTl9HRVZFTlRfRU5WID0gR0VWRU5UU0VUVVBfRU1CRUQ9MAorCiskKGV2YWwgJChweXRob24t
cGFja2FnZSkpCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1w
bGVfcHl0aG9uX2dldmVudC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBs
ZV9weXRob25fZ2V2ZW50LnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAw
MC4uZThmMDY1YzE3ZTg4Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9nZXZlbnQucHkKQEAgLTAsMCArMSw3IEBACisjIEV4YW1w
bGUgdGFrZW4gZnJvbSB0aGUgb2ZmaWNpYWwgZG9jdW1lbnRhdGlvbgoraW1wb3J0IGdldmVudAor
ZnJvbSBnZXZlbnQgaW1wb3J0IHNvY2tldAorCit1cmxzID0gWyd3d3cuZ29vZ2xlLmNvbScsICd3
d3cuZXhhbXBsZS5jb20nLCAnd3d3LnB5dGhvbi5vcmcnXQoram9icyA9IFtnZXZlbnQuc3Bhd24o
c29ja2V0LmdldGhvc3RieW5hbWUsIHVybCkgZm9yIHVybCBpbiB1cmxzXQorXyA9IGdldmVudC5q
b2luYWxsKGpvYnMsIHRpbWVvdXQ9MikKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2dldmVudC5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfcHl0aG9uX2dldmVudC5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjU2N2NhZTE4MmQyYgotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2dldmVudC5weQpAQCAtMCwwICsxLDEyIEBA
Citmcm9tIHRlc3RzLnBhY2thZ2UudGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdl
QmFzZQorCisKK2NsYXNzIFRlc3RQeXRob25HZXZlbnQoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToK
KyAgICBfX3Rlc3RfXyA9IFRydWUKKyAgICBjb25maWcgPSBUZXN0UHl0aG9uUGFja2FnZUJhc2Uu
Y29uZmlnICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15Cisg
ICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9HRVZFTlQ9eQorICAgICAgICAiIiIKKyAgICBzYW1w
bGVfc2NyaXB0cyA9IFsidGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2dldmVudC5weSJdCisg
ICAgdGltZW91dCA9IDMwCgotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
