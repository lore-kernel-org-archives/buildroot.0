Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD80E668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 16:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EAA60DD6;
	Sat, 20 Dec 2025 16:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atjLtsXrY0JN; Sat, 20 Dec 2025 16:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 741A460DC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766249369;
	bh=FnpDgKJBA+5IT39Vx8Z+SVrTLgowoCL/JMM1jeSkE2U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f3qu1lOzGBhmh2LID/VRVoblQxk+guthbe1F93nwnSu1MJ2XZ1jOjsd6buauvsPXo
	 SvF7xHKjMoykQr5YnMTejIsYQxKPHExVY+qap5mcj00t32jigj5R6orXItpyHa1nM6
	 NuMis1v0LytRg+8QbAYbe39fw1OHFivsCgh0jyPx4IYnehwuXIavzCKyOE3o+pr9Bg
	 LPtwpSo3iXAa7go4o1bCbLO6GDtdA1UrIpwwQNeKqPrOx0xWOeeonrq5kTy4IvAm4s
	 sZJqgsEE+qdia6tNphj9I2C9F66N0n/pStx57kDrI808RPoNNx4MXAF8p4jfCE7gLj
	 vGyV+gtseppeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 741A460DC9;
	Sat, 20 Dec 2025 16:49:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3487119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A30240640
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GSTCq6FEoDY for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 16:49:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B26F400D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B26F400D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B26F400D5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:49:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3ACC4A4C3720
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:49:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX08j-000000001Jn-2bck
 for buildroot@buildroot.org; Sat, 20 Dec 2025 16:49:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 17:49:07 +0100
Message-ID: <20251220164909.128665-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766249350;
 bh=xevHvid2UUusnqaJDzVkLypdfIU6M84HGWvPpRnOaBc=;
 h=From:To:Subject:Date:From;
 b=YjkWk2pr9423ptZEpbGqFY39SO4gI4QjGo5qZkB/R1hPIXx6XB7LAg2FCDjF19wHI
 cS603z379gSB/uF42rEU0GrIQNe8CwfutFszBbZKFqXW/jm72H0WXLLiIe3LsGvILC
 2/ZfurYtr3KTp7R+fExMvyC7ZheYwCRKyKyPZw5UA9hnXZqm7MsxzrKwlgrGvv3juu
 cfpzYlVo5rwma8m6GmgQVrRpLLG1t1gNRcoFfPbzlEd6CfkMvf4kWLOb3M8VC6bUqe
 l0j8cNOFTN0TjEaDnjaX2PwwwxtBO5LMrFpHS7DXX/JV6Zn+mpzFHnA48/7vQtsj+q
 YC8sXOUWMQdMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YjkWk2pr
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.15.1
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

aHR0cHM6Ly93d3cuYWxzYS1wcm9qZWN0Lm9yZy93aWtpL0NoYW5nZXNfdjEuMi4xNF92MS4yLjE1
I2Fsc2EtbGliCmh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvd2lraS9DaGFuZ2VzX3YxLjIu
MTVfdjEuMi4xNS4xI2Fsc2EtbGliCgpSZWJhc2VkIHBhdGNoIDAwMDEuCgpTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIC4uLi9hbHNhLWxpYi8wMDAxLURv
bi10LXVzZS1mb3JrLW9uLW5vTU1VLXBsYXRmb3Jtcy5wYXRjaCAgfCA3ICsrKy0tLS0KIHBhY2th
Z2UvYWxzYS1saWIvYWxzYS1saWIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCiBwYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLm1rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hbHNhLWxpYi8wMDAxLURvbi10LXVzZS1mb3Jr
LW9uLW5vTU1VLXBsYXRmb3Jtcy5wYXRjaCBiL3BhY2thZ2UvYWxzYS1saWIvMDAwMS1Eb24tdC11
c2UtZm9yay1vbi1ub01NVS1wbGF0Zm9ybXMucGF0Y2gKaW5kZXggODdhZGQ5ZmY1Ni4uNGU4NDU4
NTY4NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9hbHNhLWxpYi8wMDAxLURvbi10LXVzZS1mb3JrLW9u
LW5vTU1VLXBsYXRmb3Jtcy5wYXRjaAorKysgYi9wYWNrYWdlL2Fsc2EtbGliLzAwMDEtRG9uLXQt
dXNlLWZvcmstb24tbm9NTVUtcGxhdGZvcm1zLnBhdGNoCkBAIC0xMCwxMSArMTAsMTAgQEAgU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KIFtKw7ZyZzogdXBkYXRlIHBhdGNoIGZvciAxLjEuNl0KIFNpZ25lZC1vZmYtYnk6IErDtnJn
IEtyYXVzZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgogVXBzdHJlYW06IGh0dHA6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOC1Ob3ZlbWJl
ci8xNDEzNzYuaHRtbAotW0Jlcm5kOiB1cGRhdGUgcGF0Y2ggZm9yIDEuMi40ICYgMS4yLjddCi1T
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+CitbQmVy
bmQ6IHVwZGF0ZSBwYXRjaCBmb3IgMS4yLjE1LjFdCitTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgogW0RhcmlvOiBtYWtlIHRoZSBwYXRjaCB0byBiZSBhcHBsaWVk
IHdpdGggZnV6eiBmYWN0b3IgMF0KIFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KLQogLS0tCiAgY29uZmlndXJlLmFjICAg
ICAgICAgfCAgMiArKwogIHNyYy9wY20vcGNtX2RpcmVjdC5jIHwgMTAgKysrKysrKysrLQpAQCAt
NDEsNyArNDAsNyBAQCBpbmRleCBlNTNlNTkyMzgxMTkuLmNmOTRjN2MxZGJmMCAxMDA2NDQKICAJ
CWNsb3NlKGRtaXgtPnNlcnZlcl9mZCk7CiAgCQlyZXR1cm4gcmV0OwogIAl9Ci0tCQorLQogKwog
KyNpZmRlZiBIQVZFX0ZPUksKICAJcmV0ID0gZm9yaygpOwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9h
bHNhLWxpYi9hbHNhLWxpYi5oYXNoIGIvcGFja2FnZS9hbHNhLWxpYi9hbHNhLWxpYi5oYXNoCmlu
ZGV4IDI2ZDU0YjZlMWIuLjg4OTJlYmRiMGUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYWxzYS1saWIv
YWxzYS1saWIuaGFzaAorKysgYi9wYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLmhhc2gKQEAgLTEs
NCArMSw0IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBiZTljODhhMGIzNjA0MzY3
ZGQ3NDE2N2EyYjc1NGEzNWUxNDJmNjcwMjkyYWU0N2EyZmRlZjI3YTJlZTk3YTMyICBhbHNhLWxp
Yi0xLjIuMTQudGFyLmJ6Mgorc2hhMjU2ICA3Zjk4M2NhODljYTQyMDg3MmNhMTZlOGE5ZjhmOTdm
YjYzZGI2YzFjNmUyNTg1YjkxNzM3YTA4YmIwM2Y1NjZjICBhbHNhLWxpYi0xLjIuMTUuMS50YXIu
YnoyCiBzaGEyNTYgIDMyNDM0YWZjYzg2NjZiYTA2MGUxMTFkNzE1YmZkYjZjMmQ1ZGQ4YTM1ZmE0
ZDNhYjhhZDY3ZDhmODUwZDJmMmIgIENPUFlJTkcKIHNoYTI1NiAgYmZlMTZjZjgyM2JjZmYyNjFm
YzZhMDYyYzA3ZWU5NjY2MGUzYzM5Njc4ZjQyZjM5YTc4OGE2OGRiYzIzNGNlZCAgYXNlcnZlci9D
T1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLm1rIGIvcGFja2Fn
ZS9hbHNhLWxpYi9hbHNhLWxpYi5tawppbmRleCAzNGMxNjg4ZTk4Li5hNDcxM2VkZjBhIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLm1rCisrKyBiL3BhY2thZ2UvYWxzYS1s
aWIvYWxzYS1saWIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi1BTFNBX0xJQl9WRVJTSU9OID0gMS4yLjE0CitBTFNBX0xJQl9WRVJTSU9OID0gMS4yLjE1
LjEKIEFMU0FfTElCX1NPVVJDRSA9IGFsc2EtbGliLSQoQUxTQV9MSUJfVkVSU0lPTikudGFyLmJ6
MgogQUxTQV9MSUJfU0lURSA9IGh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHVi
L2xpYgogQUxTQV9MSUJfTElDRU5TRSA9IExHUEwtMi4xKyAobGlicmFyeSksIEdQTC0yLjArIChh
c2VydmVyKQotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
