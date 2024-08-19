Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0820C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C15D605B0;
	Mon, 19 Aug 2024 22:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLvnUD5og9u1; Mon, 19 Aug 2024 22:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CAB5605F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CAB5605F8;
	Mon, 19 Aug 2024 22:05:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 268F81BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14469605F8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBcMWkXV3dct for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABBAC605B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABBAC605B0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABBAC605B0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:05:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 09A9E1BF206;
 Mon, 19 Aug 2024 22:04:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 00:04:55 +0200
Message-ID: <20240819220456.1894189-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724105100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aXNEaUmOJIpwA1D5jmkynnPA0FVnmp/GBZnw+P7YQC4=;
 b=WcFx+VaGLU+LkKoVh1Lk7sKmdNZQVFTGwnGrRQeZ356/xINvjuGtUskUVOtHNwyl4Kjh8m
 3rBNPtWkHG6ZWVKbJXyO6XXUvdTEdvBPiEvZ9IBRe85cTmcoZzWiz2d3PWrZrlIyAx8qzD
 U0h/xUi19stgu/vz7c+Og1F/zWXY6DfGGRLxQDbmNgwMixq61WFw8dkDV33+WLusIGyEe5
 liij9bcEBNoXAuIrdjTxgVS9wXALcwTPc8ZQlEMqv2LL4Y3uOHccajtQmqZat5eRQ39dOt
 hB2DbbXfC0QhjykpAj8GFKwOWViZrm27ulp5r08kQaqQFte0wLiA0iJ78ykKiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WcFx+VaG
Subject: [Buildroot] [PATCH] package/systemd: now needs target and host gcc
 >= 8
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
Cc: Sen Hastings <sen@hastings.org>, James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdGhlIGJ1bXAgb2Ygc3lzdGVtZCBmcm9tIDI1NC4xMyB0byAyNTYuNCwgc3lzdGVtZCBu
byBsb25nZXIKYnVpbGRzIHdpdGggZ2NjIDw9IDc6CgouLi9zcmMvYmFzaWMvbW91bnRwb2ludC11
dGlsLmM6IEluIGZ1bmN0aW9uIOKAmGZzdHlwZV9pc19hcGlfdmZz4oCZOgouLi9zcmMvYmFzaWMv
bWFjcm8uaDozODU6Nzk6IGVycm9yOiBleHBlY3RlZCDigJh94oCZIGJlZm9yZSDigJhfX1ZBX09Q
VF9f4oCZCiAgICAgICAgIGZvciAodHlwZW9mKGVudHJ5KSBfdmFfc2VudGluZWxfWzFdID0ge30s
IF9lbnRyaWVzX1tdID0geyBfX1ZBX0FSR1NfXyBfX1ZBX09QVF9fKCwpIF92YV9zZW50aW5lbF9b
MF0gfSwgKl9jdXJyZW50XyA9IF9lbnRyaWVzXzsgXAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoK
VGhpcyBmaXJzdCBlcnJvciBpcyBkdWUgdG8gdXBzdHJlYW0gY29tbWl0CmRjNTcxY2NjZDc1ZGI3
YmU0OWIyYWFkYTY0YmFmOTJlM2E0OThjMzkgKCJtYWNybzogdGVybWluYXRlIHRoZQp0ZW1wb3Jh
cnkgVkFfQVJHU19GT1JFQUNIKCkgYXJyYXkgd2l0aCBhIHNlbnRpbmVsIiksIHdoaWNoIHdhcyBt
YWRlIHRvCnN1cHBvcnQgR0NDIDE0LnguIElmIHdlIHJldmVydCB0aGlzIGNvbW1pdCwgdGhlbiB0
aGlzIHBhcnRpY3VsYXIgaXNzdWUKZ29lcyBhd2F5IHdpdGggR0NDIDcueCwgYnV0IHRoZW4gaXQg
ZmFpbHMgd2l0aCBhbm90aGVyIGZhaXJseSBzaW1pbGFyCmlzc3VlIGVsc2V3aGVyZToKCi4uL3Ny
Yy9zaGFyZWQvdmFybGluay1pZGwuaDoxMTA6NDE6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiDigJhfX1ZBX09QVF9f4oCZOyBkaWQgeW91IG1lYW4g4oCYX19UQV9JQklU
X1/igJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlYwpsYXJhdGlvbl0KICAgICAgICAg
ICAgICAgICAuZmllbGRzID0geyBfX1ZBX0FSR1NfXyBfX1ZBX09QVF9fKCwpIHt9fSwgICAgICAg
ICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpUaGlz
IGNvZGUgd2FzIGFkZGVkIGJ5IHVwc3RyZWFtIGNvbW1pdAplNTBiMmE5M2Q2NmVmZjliNDE5OTlk
MzhiOGVkNWViNjQ3ZTJkNzRjICgidmFybGluazogYWRkCklETC9pbnRyb3NwZWN0aW9uIGxvZ2lj
IikuCgpVcHN0cmVhbSBjb21taXQgZGM1NzFjY2NkNzVkYjdiZTQ5YjJhYWRhNjRiYWY5MmUzYTQ5
OGMzOSBmaXJzdAphcHBlYXJlZCBpbiB2MjU2LCB3aGlsZSBlNTBiMmE5M2Q2NmVmZjliNDE5OTlk
MzhiOGVkNWViNjQ3ZTJkNzRjIGZpcnN0CmFwcGVhcmVkIGluIHYyNTUuCgpDb25zaWRlcmluZyBz
eXN0ZW1kIHVzdWFsIHBvbGljaWVzIHdpdGggdGhlIHN1cHBvcnQgb2YgIm9sZCIgdGhpbmdzLApp
dCdzIGZhaXJseSB1bmxpa2VseSB0aGF0IHRoZXkgd2lsbCBjYXJlIGFib3V0IGJ1aWxkaW5nIHdp
dGggb2xkZXIgZ2NjCnZlcnNpb25zLiBUaGV5IGV2ZW4gZG9jdW1lbnQgaW4KaHR0cHM6Ly9naXRo
dWIuY29tL3N5c3RlbWQvc3lzdGVtZC9ibG9iL21haW4vUkVBRE1FIHRoYXQgdGhleSBuZWVkIGdj
Ywo+PSA4LjQsIHNvIGxldCdzIGZvbGxvdyB0aGF0LgoKRml4ZXM6CgogIGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzUzYzFhNzljMzkxZTNjYzdjMjMwMDE3ODUzYmE5MzUy
MDJjOGQyMGQvCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPgotLS0KIHBhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4gICAgICB8ICA0
ICsrLS0KIHBhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4uaG9zdCB8ICAyICstCiBzeXN0ZW0vQ29u
ZmlnLmluICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3Rl
bWQvQ29uZmlnLmluIGIvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbgppbmRleCAxMTNhODA5M2M0
Li4zNDVmMDg1OTBlIDEwMDY0NAotLS0gYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluCisrKyBi
L3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4KQEAgLTIzLDggKzIzLDggQEAgbWVudWNvbmZpZyBC
UjJfUEFDS0FHRV9TWVNURU1ECiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMK
IAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NTUAogCWRlcGVuZHMgb24gQlIyX1RPT0xD
SEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTUKLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0ND
X0FUX0xFQVNUXzUKLQlkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9MRUFTVF81ICMgaG9zdC1z
eXN0ZW1kCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84CisJZGVwZW5k
cyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfOCAjIGhvc3Qtc3lzdGVtZAogCXNlbGVjdCBCUjJf
UEFDS0FHRV9IQVNfVURFVgogCXNlbGVjdCBCUjJfUEFDS0FHRV9EQlVTIGlmICFCUjJfUEFDS0FH
RV9EQlVTX0JST0tFUiAjIHJ1bnRpbWUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ0FQCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3N5c3RlbWQv
Q29uZmlnLmluLmhvc3QKaW5kZXggOGUwMGJjZjVjMS4uZmRiZWJhZWU3YSAxMDA2NDQKLS0tIGEv
cGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbi5ob3N0CisrKyBiL3BhY2thZ2Uvc3lzdGVtZC9Db25m
aWcuaW4uaG9zdApAQCAtMSw0ICsxLDQgQEAKICMgU2VsZWN0IHRoaXMgaWYgeW91IG5lZWQgaG9z
dCBzeXN0ZW1kIHRvb2xzIChlLmcuIHN5c3RlbWN0bCkKIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NU
X1NZU1RFTUQKIAlib29sCi0JZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfNQorCWRl
cGVuZHMgb24gQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzgKZGlmZiAtLWdpdCBhL3N5c3RlbS9Db25m
aWcuaW4gYi9zeXN0ZW0vQ29uZmlnLmluCmluZGV4IGJjMGM2ZWI2YmMuLjMxOGM1MzhlZjEgMTAw
NjQ0Ci0tLSBhL3N5c3RlbS9Db25maWcuaW4KKysrIGIvc3lzdGVtL0NvbmZpZy5pbgpAQCAtMTI2
LDIwICsxMjYsMjAgQEAgY29uZmlnIEJSMl9JTklUX1NZU1RFTUQKIAlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fSEFTX1NTUAogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwog
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTUKLQlkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzUKLQlkZXBlbmRzIG9uIEJSMl9IT1NUX0dD
Q19BVF9MRUFTVF81CisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84CisJ
ZGVwZW5kcyBvbiBCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfOAogCXNlbGVjdCBCUjJfUk9PVEZTX01F
UkdFRF9VU1IKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfU1lTVEVNRAogCXNlbGVjdCBCUjJfUEFDS0FH
RV9TS0VMRVRPTl9JTklUX1NZU1RFTUQgaWYgQlIyX1JPT1RGU19TS0VMRVRPTl9ERUZBVUxUCiAK
LWNvbW1lbnQgInN5c3RlbWQgbmVlZHMgYSBnbGliYyB0b29sY2hhaW4gdy8gU1NQLCBoZWFkZXJz
ID49IDMuMTUsIGhvc3QgYW5kIHRhcmdldCBnY2MgPj0gNSIKK2NvbW1lbnQgInN5c3RlbWQgbmVl
ZHMgYSBnbGliYyB0b29sY2hhaW4gdy8gU1NQLCBoZWFkZXJzID49IDMuMTUsIGhvc3QgYW5kIHRh
cmdldCBnY2MgPj0gOCIKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1NZU1RFTURfQVJDSF9TVVBQ
T1JUUwogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlO
X1VTRVNfR0xJQkMgfHwgXAogCQkhQlIyX1RPT0xDSEFJTl9IQVNfU1NQIHx8IFwKIAkJIUJSMl9U
T09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF8zXzE1IHx8IFwKLQkJIUJSMl9UT09MQ0hBSU5fR0ND
X0FUX0xFQVNUXzUgfHwgXAotCQkhQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzUKKwkJIUJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzggfHwgXAorCQkhQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzgKIAog
Y29tbWVudCAic3lzdGVtZCBoaWdobHkgcmVjb21tZW5kcyBMaW51eCA+PSA0LjE1IgogCWRlcGVu
ZHMgb24gQlIyX0lOSVRfU1lTVEVNRAotLSAKMi40Ni4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
