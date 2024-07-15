Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96519C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5368F81240;
	Mon, 15 Jul 2024 13:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThnqjeazNDrh; Mon, 15 Jul 2024 13:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40E9D8114C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40E9D8114C;
	Mon, 15 Jul 2024 13:53:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0A311BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B088E60873
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZQeNCtCHEd6 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C00B60831
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C00B60831
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C00B60831
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 13:53:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2D6620007;
 Mon, 15 Jul 2024 13:53:06 +0000 (UTC)
Date: Mon, 15 Jul 2024 15:51:33 +0200
MIME-Version: 1.0
Message-Id: <20240715-uboot-default-env-v2-1-8a585679ba0a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGQplWYC/32NQQ6CMBBFr0Jm7RjaIBRX3sOwKGUqk2BLWmg0h
 LtbOIDL9/P/+xtECkwR7sUGgRJH9i6DvBRgRu1ehDxkBlnKqqxFg2vv/YIDWb1OC5JLWNW1Ujc
 pbK8J8m4OZPlzOp9d5pHj4sP3vEjiSP/ZkkCBrTZK2ZJEo9rHUZnYXY1/Q7fv+w8YvVQxtAAAA
 A==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721051587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3+QT9kFqQtfkWIcyMtOjRmG49HJxQJCVI4nNLngrqsI=;
 b=F0SemKLD51fCnisfgH+/a6IWs6BERmB1QIZhp9kwtkXyA/8lrVgM8vLJorngsTiMaSRVGw
 vFidbxNcjH4HEhKkgdTpmeYq+c3EVvPmzKR98QiYEMwzuJD35l31CAtsXejdfHeM6zI77z
 5CDE3XTjqMWlSaBiGrlrf1LnNhEwpu6WETh9jAbcJzu+hz/h0jtd4n66fWaxcNLwpYtxJe
 8oKNGXUoC/9jO2is/5kmFt/XrxFd0P1NbVzpoC1b6hTsWSnYnWDi0e7NeSXwD4uSZ1Oy+x
 UV1cvde74SgmddHBNbsqkodih2X2qn6WnlDJi/mnH2fI7znujuDvx761F/02yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F0SemKLD
Subject: [Buildroot] [PATCH v2] uboot: allow taking the entire default
 environment from a text file
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnkgZGVmYXVsdCBVLUJvb3QgYnVpbGRzIGEgZGVmYXVsdCBlbnZpcm9ubWVudCBmcm9tIGl0cyBv
d24gY29uZmlndXJhdGlvbgphbmQgYSBib2FyZC1zcGVjaWZpYyBzZXQgb2YgdmFyaWFibGVzLiBI
b3dldmVyIGl0IGFsc28gYWxsb3dzIHRvIGJ5cGFzcwp0aGlzIGVudGlyZWx5IGFuZCBkZWZpbmUg
dGhlIGVudGlyZSBkZWZhdWx0IGVudmlyb25tZW50IGZyb20gYSB0ZXh0IGZpbGUuCgpFeHBvc2Ug
dGhpcyBmZWF0dXJlIHRvIEJ1aWxkcm9vdC4gVGhpcyBhbGxvd3MgdG8gaGF2ZSBhIGZpbGUgZS5n
LiBpbgpib2FyZC8uLi4vdWJvb3QuZW52IHdoaWNoIGNvbnRhaW5zIGFuIGVhc3kgdG8gbWFpbnRh
aW4gdGV4dCBmaWxlIHdpdGggdGhlCndhbnRlZCBkZWZhdWx0IGVudmlyb25tZW50LCB3aXRob3V0
IHBhdGNoaW5nIHRoZSBVLUJvb3Qgc291cmNlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhIENl
cmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBV
c2Ugb25seSBvbmUgc3RyaW5nIHZhcmlhYmxlIChlbXB0eSA9IGRpc2FibGVkKSBhbmQgbWVyZ2Ug
aGVscCB0ZXh0cyAoQXJub3V0KQotIFdyYXAgaGVscCBsaW5lcyBhdCA2MiBjaGFycyAoS8O2cnkp
Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYxNy11Ym9vdC1k
ZWZhdWx0LWVudi12MS0xLTlhYzg4ZjBlMTc4OUBib290bGluLmNvbQotLS0KCkNoYW5nZWQgaW4g
djI6CiAtIFVzZSBvbmx5IG9uZSBzdHJpbmcgdmFyaWFibGUgKGVtcHR5ID0gZGlzYWJsZWQpIGFu
ZCBtZXJnZSBoZWxwIHRleHRzIChBcm5vdXQpCiAtIFdyYXAgaGVscCBsaW5lcyBhdCA2MiBjaGFy
cyAoS8O2cnkpCi0tLQogYm9vdC91Ym9vdC9Db25maWcuaW4gfCAyOSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogYm9vdC91Ym9vdC91Ym9vdC5tayAgfCAgOSArKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvQ29u
ZmlnLmluIGIvYm9vdC91Ym9vdC9Db25maWcuaW4KaW5kZXggZjM3MDQwYTI4YTk3Li42YjdmOWQ2
NzcxYWMgMTAwNjQ0Ci0tLSBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluCisrKyBiL2Jvb3QvdWJvb3Qv
Q29uZmlnLmluCkBAIC0xMzYsNiArMTM2LDM1IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX0NP
TkZJR19GUkFHTUVOVF9GSUxFUwogCSAgdGhhdCB3aWxsIGJlIG1lcmdlZCB0byB0aGUgbWFpbiBV
LUJvb3QgY29uZmlndXJhdGlvbiBmaWxlLgogZW5kaWYKIAorY29uZmlnIEJSMl9UQVJHRVRfVUJP
T1RfREVGQVVMVF9FTlZfRklMRQorCXN0cmluZyAiVGV4dCBmaWxlIHdpdGggZGVmYXVsdCBlbnZp
cm9ubWVudCIKKwlzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19YWEQKKwloZWxwCisJICBU
ZXh0IGZpbGUgY29udGFpbmluZyB0aGUgdmFyaWFibGVzIHRvIGJlIHVzZWQgYXMgdGhlIGRlZmF1
bHQKKwkgIGVudmlyb25tZW50IGluIFUtQm9vdC4KKworCSAgSWYgZW1wdHksIGxldCBVLUJvb3Qg
Z2VuZXJhdGUgdGhlIGRlZmF1bHQgZW52aXJvbW5lbnQgZnJvbSB0aGUKKwkgIHNvdXJjZSBjb2Rl
IGFuZCBvdGhlciBVLUJvb3QgY29uZmlndXJhdGlvbiB2YWx1ZXMsIHdoaWNoIGlzCisJICB0aGUg
ZGVmYXVsdCBiZWhhdmlvdXIuCisKKwkgIElmIHNldCB0byB0aGUgcGF0aCB0byBhIGZpbGUsIGlu
c3RydWN0cyBVLUJvb3QgdG8gZGVmaW5lIHRoZQorCSAgZW50aXJlIFUtQm9vdCBkZWZhdWx0IGVu
dmlyb25tZW50IGZyb20gdGhlIHByb3ZpZGVkIGZpbGUsCisJICBkaXNhYmxpbmcgYWxsIHRoZSBk
ZWZhdWx0IGJlaGF2aW91ci4KKworCSAgRnJvbSB0aGUgVS1Cb290IGRvY3VtZW50YXRpb246CisK
KwkgICAgVGhlIGZvcm1hdCBpcyB0aGUgc2FtZSBhcyBhY2NlcHRlZCBieSB0aGUgbWtlbnZpbWFn
ZSB0b29sLAorCSAgICB3aXRoIGxpbmVzIGNvbnRhaW5pbmcga2V5PXZhbHVlIHBhaXJzLiBCbGFu
ayBsaW5lcyBhbmQKKwkgICAgbGluZXMgYmVnaW5uaW5nIHdpdGggJyMnIGFyZSBpZ25vcmVkLgor
CisJICBCYXNlZCBvbiB0aGUgVVNFX0RFRkFVTFRfRU5WX0ZJTEUgYW5kIERFRkFVTFRfRU5WX0ZJ
TEUgVS1Cb290CisJICBjb25maWd1cmF0aW9uIHZhcmlhYmxlcy4KKworCSAgRm9yIG1vcmUgaW5m
byBzZWU6CisJICBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRlc3QvdXNhZ2UvZW52aXJv
bm1lbnQuaHRtbCNleHRlcm5hbC1lbnZpcm9ubWVudC1maWxlCisKKwkgIFJlcXVpcmVzIFUtQm9v
dCA+PSB2MjAxOC4wNS4KKwogY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDCiAJYm9v
bCAiVS1Cb290IG5lZWRzIGR0YyIKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9EVEMKZGlmZiAt
LWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9ib290L3Vib290L3Vib290Lm1rCmluZGV4IDE5
ZjRjZGI1NTdlNi4uNmNjODdiMzVkM2Q2IDEwMDY0NAotLS0gYS9ib290L3Vib290L3Vib290Lm1r
CisrKyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKQEAgLTM5MCw2ICszOTAsMTQgQEAgVUJPT1RfS0NP
TkZJR19FRElUT1JTID0gbWVudWNvbmZpZyB4Y29uZmlnIGdjb25maWcgbmNvbmZpZwogIyBvdmVy
cmlkZSBhZ2Fpbi4gSW4gYWRkaXRpb24sIGhvc3QtY2NhY2hlIGlzIG5vdCByZWFkeSBhdCBrY29u
ZmlnCiAjIHRpbWUsIHNvIHVzZSBIT1NUQ0NfTk9DQ0FDSEUuCiBVQk9PVF9LQ09ORklHX09QVFMg
PSAkKFVCT09UX01BS0VfT1BUUykgSE9TVENDPSIkKEhPU1RDQ19OT0NDQUNIRSkiIEhPU1RMREZM
QUdTPSIiCisKK1VCT09UX0RFRkFVTFRfRU5WX0ZJTEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RB
UkdFVF9VQk9PVF9ERUZBVUxUX0VOVl9GSUxFKSkKK2lmbmVxICgkKFVCT09UX0RFRkFVTFRfRU5W
X0ZJTEUpLCkKK2RlZmluZSBVQk9PVF9LQ09ORklHX0RFRkFVTFRfRU5WX0ZJTEUKKwkkKGNhbGwg
S0NPTkZJR19TRVRfT1BULENPTkZJR19VU0VfREVGQVVMVF9FTlZfRklMRSx5KQorCSQoY2FsbCBL
Q09ORklHX1NFVF9PUFQsQ09ORklHX0RFRkFVTFRfRU5WX0ZJTEUsIiQoc2hlbGwgcmVhZGxpbmsg
LWYgJChVQk9PVF9ERUZBVUxUX0VOVl9GSUxFKSkiKQorZW5kZWYKK2VuZGlmCiBlbmRpZiAjIEJS
Ml9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0xFR0FDWQogCiBVQk9PVF9DVVNUT01fRFRTX1BB
VEggPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fRFRTX1BBVEgpKQpA
QCAtNTMwLDYgKzUzOCw3IEBAIGRlZmluZSBVQk9PVF9LQ09ORklHX0ZJWFVQX0NNRFMKIAkkKFVC
T09UX1pZTlFNUF9LQ09ORklHX1BNVUZXKQogCSQoVUJPT1RfWllOUU1QX0tDT05GSUdfUE1fQ0ZH
KQogCSQoVUJPT1RfWllOUU1QX0tDT05GSUdfUFNVX0lOSVQpCisJJChVQk9PVF9LQ09ORklHX0RF
RkFVTFRfRU5WX0ZJTEUpCiBlbmRlZgogCiBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1QpJChCUl9C
VUlMRElORykseXkpCgotLS0KYmFzZS1jb21taXQ6IDdiZmVhOTM3MmYxODQyMjc5YThmNTdiNWZj
NDQyOGJiYWU4MjJlOTEKY2hhbmdlLWlkOiAyMDI0MDYxNy11Ym9vdC1kZWZhdWx0LWVudi00NjY4
ODUyMWZiYWUKCkJlc3QgcmVnYXJkcywKLS0gCkx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlA
Ym9vdGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
