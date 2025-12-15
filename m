Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3251FD5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC4660F2B;
	Mon, 15 Dec 2025 22:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GIrkPa4H02q; Mon, 15 Dec 2025 22:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C5C960F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839005;
	bh=nOIukPSVVliZnaPcC+9ESZSzm6oi8qhmwnXL01oI6+s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HHN4VbevSmpeWUS+OAlNSWTIttVT+lBXVd3YhDYlQEqQwZK7QpSEnxA3jIByDStUE
	 YzZM3uZsih9AxktB9JPP+5XNse2lY7ufIY7qiHSFoGqqQM+Wi0/7G4qcPzufB6yLXI
	 8s5wDZYeKd0n8Jg9st21NMNSp0cKcH46340kuDrz+F3SVA1vslETRD7xCqcYFWN3C0
	 16jdDZa6iXKnLGoVEBFs0UR0QNm7utXSFAajppwqEijSrluZY90E89A/AfKmixQcnw
	 PUsQARptFswiLmY8WvyJreDuh39JGAFdca9nLwB658uqEb+j+wjUm/uwZkPPOwXKHp
	 Dmkfp8HEbRtNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C5C960F2D;
	Mon, 15 Dec 2025 22:50:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4A54219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB0FA60F2C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nj7ndVhR_ew5 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E94560F25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E94560F25
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E94560F25
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 80C884E41C18;
 Mon, 15 Dec 2025 22:50:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 513C160664;
 Mon, 15 Dec 2025 22:50:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 41E9111942975; Mon, 15 Dec 2025 23:49:55 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
Date: Mon, 15 Dec 2025 23:49:33 +0100
Message-ID: <20251215224952.1253359-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765838996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tkBkzmgrkFwkPKc0w9rYJHvpQ5Tdc/SRNcTiGHQ79TY=;
 b=nVyGDT2i30oyTcmQGad1Vm13phxUMt4SgnMbk3p3kF5f7IEKmrG1TOkszw3cNgVfQBi9oI
 CNXDv4Y0J0kfqYG6DFGK95dATMFJIB05uZnJlE+RW5HxAJg6yHldsntpAK6xA0EEPYVMwG
 7jfFlXBep/SQYuJT8VFIv9sxbExMh36zu+6YkozXq0N/+XoFJ15RwNfRL7EqLlDEIjBk5o
 qX8IK58v/T6h8TT64gnA2dYlaYO+VYY8JLY5iCGmrRlsAEequwxzPIfusdjco2ryvhieO3
 wq56XhMyj8GXQLyWdCRVXyczFrjuSbFtOD0ziPaso1DrOUw5j4heUjE7T3Lh0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=nVyGDT2i
Subject: [Buildroot] [PATCH 01/13] package/rpi-firmware: drop support for
 vcdbg
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB0b29sIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB1cHN0cmVhbSBycGktZmlybXdhcmUsIHNv
IGRyb3AgdGhlCmNvcnJlc3BvbmRpbmcgb3B0aW9uIGFuZCBsb2dpYyBpbiBycGktZmlybXdhcmUu
bWsuCgpUaGUgdG9vbCBoYXMgYmVlbiByZW1vdmVkIGJ5IHVwc3RyZWFtIGNvbW1pdApkMWZjYzI2
MDM4MTg2YWVjYzE1MDFhMGI3NDk4MzMzMDBhZmJhODAxICgib3B0OiBSZW1vdmUgYnVpbGRzIG9m
CmRlcHJlY3RhdGVkIHVzZXJsYW5kIHRvb2xzIikuCgpJdCBpcyBCdWlsZG9yb3QgY29tbWl0CjI4
ZTY5NTNiYTg0ZDM5YTYwNzRhZWU0MzlhNjRlZjg2YjEwOWRjZjAgKCJwYWNrYWdlL3JwaS1maXJt
d2FyZTogYnVtcAp2ZXJzaW9uIHRvIDU0NzY3MjAiKSB0aGF0IGRpZCBhIGJ1bXAgdG8gYSB2ZXJz
aW9uIG9mIHJwaS1maXJtd2FyZSB0aGF0Cm5vIGxvbmdlciBwcm92aWRlZCB2Y2RiZy4KCkNjOiBL
w7ZyeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KQ2M6IEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLQogQ29uZmlnLmluLmxlZ2FjeSAgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKysrKysrCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9Db25maWcu
aW4gICAgICAgfCAxMiAtLS0tLS0tLS0tLS0KIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5tayB8IDIwIC0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2Fj
eSBiL0NvbmZpZy5pbi5sZWdhY3kKaW5kZXggZGE5MWI2ODA4Ny4uMjM5NTE5YWEwYyAxMDA2NDQK
LS0tIGEvQ29uZmlnLmluLmxlZ2FjeQorKysgYi9Db25maWcuaW4ubGVnYWN5CkBAIC0xNDYsNiAr
MTQ2LDEyIEBAIGVuZGlmCiAKIGNvbW1lbnQgIkxlZ2FjeSBvcHRpb25zIHJlbW92ZWQgaW4gMjAy
Ni4wMiIKIAorY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxMX1ZDREJHCisJ
Ym9vbCAicnBpLWZpcm13YXJlIHZjZGJnIG9wdGlvbiByZW1vdmVkIgorCXNlbGVjdCBCUjJfTEVH
QUNZCisJaGVscAorCSAgcnBpLWZpcm13YXJlIHVwc3RyZWFtIGhhcyBkcm9wcGVkIHRoZSB2Y2Ri
ZyB0b29sCisKIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVkRQQVUKIAlib29sICJtZXNhM2Qg
R2FsbGl1bSBWRFBBVSBzdGF0ZSB0cmFja2VyIHN1cHBvcnQgcmVtb3ZlZCIKIAlzZWxlY3QgQlIy
X0xFR0FDWQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluIGIvcGFj
a2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluCmluZGV4IGY5OWMxMTZjYTIuLjRkZGEzM2E3MTMg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L3JwaS1maXJtd2FyZS9Db25maWcuaW4KQEAgLTEwMCwxNiArMTAwLDQgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZUwogCSAgb3ZlcmxheXMsIHRv
IHN1cHBvcnQgSEFUcyAoSGFyZHdhcmUgQXR0YWNoZWQgb24gVG9wLCBhZGQtb24KIAkgIG1vZHVs
ZXMpLgogCi1jb25maWcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfVkNEQkcKLQli
b29sICJ2Y2RiZyIKLQlkZXBlbmRzIG9uIEJSMl9hcm0gIyBwcmVidWlsdCBhcm0gYmluYXJ5LCBy
cGktdXNlcmxhbmQKLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwotCWRlcGVu
ZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgcnBpLXVzZXJsYW5kCi0JaGVscAotCSAgSW5z
dGFsbCB2Y2RiZywgdG8gaGVscCBkZWJ1ZyBjb21tdW5pY2F0aW9uIHdpdGggdGhlIEdQVS4KLQot
Y29tbWVudCAidmNkYmcgbmVlZHMgYSBnbGliYyB0b29sY2hhaW4gdy8gQysrIgotCWRlcGVuZHMg
b24gQlIyX2FybQotCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyB8fCAhQlIy
X0lOU1RBTExfTElCU1REQ1BQCi0KIGVuZGlmICMgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgYi9wYWNrYWdl
L3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKaW5kZXggZDBiNmFiY2M2Zi4uZjY2ZjQyYTEw
YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rCisrKyBi
L3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawpAQCAtNjIsMjYgKzYyLDYgQEAg
ZGVmaW5lIFJQSV9GSVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZUwogZW5kZWYKIGVuZGlmCiAK
LSMgSW5zdGFsbCBwcmVidWlsdCBsaWJyYXJpZXMgaWYgUlBJX1VTRVJMQU5EIG5vdCBlbmFibGVk
Ci1pZm5lcSAoJChCUjJfUEFDS0FHRV9SUElfVVNFUkxBTkQpLHkpCi1kZWZpbmUgUlBJX0ZJUk1X
QVJFX0lOU1RBTExfVEFSR0VUX0xJQgotCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkKEBEKS8kKGlm
IEJSMl9BUk1fRUFCSUhGLGhhcmRmcC8pb3B0L3ZjL2xpYi9saWJ2Y29zLnNvIFwKLQkJJChUQVJH
RVRfRElSKS91c3IvbGliL2xpYnZjb3Muc28KLQkkKElOU1RBTEwpIC1EIC1tIDA2NDQgJChARCkv
JChpZiBCUjJfQVJNX0VBQklIRixoYXJkZnAvKW9wdC92Yy9saWIvbGliZGVidWdfc3ltLnNvIFwK
LQkJJChUQVJHRVRfRElSKS91c3IvbGliL2xpYmRlYnVnX3N5bS5zbwotZW5kZWYKLWVuZGlmCi0K
LWlmZXEgKCQoQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfVkNEQkcpLHkpCi1kZWZp
bmUgUlBJX0ZJUk1XQVJFX0lOU1RBTExfVEFSR0VUX0NNRFMKLQkkKElOU1RBTEwpIC1EIC1tIDA3
MDAgJChARCkvJChpZiBCUjJfQVJNX0VBQklIRixoYXJkZnAvKW9wdC92Yy9iaW4vdmNkYmcgXAot
CQkkKFRBUkdFVF9ESVIpL3Vzci9zYmluL3ZjZGJnCi0JJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQo
QEQpLyQoaWYgQlIyX0FSTV9FQUJJSEYsaGFyZGZwLylvcHQvdmMvbGliL2xpYmVsZnRvb2xjaGFp
bi5zbyBcCi0JCSQoVEFSR0VUX0RJUikvdXNyL2xpYi9saWJlbGZ0b29sY2hhaW4uc28KLQkkKFJQ
SV9GSVJNV0FSRV9JTlNUQUxMX1RBUkdFVF9MSUIpCi1lbmRlZgotZW5kaWYgIyBJTlNUQUxMX1ZD
REJHCi0KIGRlZmluZSBSUElfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVNfQ01EUwogCSQoUlBJX0ZJ
Uk1XQVJFX0lOU1RBTExfQklOKQogCSQoUlBJX0ZJUk1XQVJFX0lOU1RBTExfQ09ORklHKQotLSAK
Mi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
