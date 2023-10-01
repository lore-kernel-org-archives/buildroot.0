Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC93E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA9242124;
	Sun,  1 Oct 2023 14:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDA9242124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PwMoGD9dZQI; Sun,  1 Oct 2023 14:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EA1E42D4F;
	Sun,  1 Oct 2023 14:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EA1E42D4F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95FF71BF59E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F99560DC2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F99560DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9Sh745Hg-0z for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:52:15 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA3C60D90
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA3C60D90
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3232be274a0so1309801f8f.1
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 07:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696171932; x=1696776732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrBPWkXBKlMJpCzN4USRRyAMKBkO5Dj9r5B//TO1kDs=;
 b=m0eUsE0+Wj4hGaeZxfl6p9hGP5HSuFukGUyI0hDM34BrtxAasF87cZGht4L2Tkn3ia
 HvVfQGBujbD/Z96OzBkhjZ8VR4Rw0D1wDAHEjmXMM6eoErJeRPlOc/MpH9SRC+yl2ywH
 wT6S9MvZC1t2xBWutQnlHawll7/91RXjow//jSpVLdSyLgHLALV749gclBO+nQOmb8pq
 nklyr+AqOdPCp/FQIMAmTLBLOHZrST9yHIIQP3qh4CXXnhKaijdvzQRgPKGiERuh/Gxo
 StfrC+5dUcJgpc8CO6pW0GSN5Rbbgu1VwSgIlbl611B8JNCGlbpV9NrNNjb6HC3xKp3f
 /vrg==
X-Gm-Message-State: AOJu0Yyq5mAryuR8zI/K6vcA/9Tc8jovkqxcWir80mOjEcjYjgVPhlT5
 NBsPbv9feG+N41LxNnd0dbZ5thTFqAA=
X-Google-Smtp-Source: AGHT+IG4nluY9C8MxrXlqG86ztrFFCEnHKg0/5nlqFQkCMVFDO008LlrBNXvlKT1dgdbDdryQcXunA==
X-Received: by 2002:a5d:5265:0:b0:314:314e:fdda with SMTP id
 l5-20020a5d5265000000b00314314efddamr8577155wrc.23.1696171932477; 
 Sun, 01 Oct 2023 07:52:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k13-20020adfb34d000000b0031ae8d86af4sm13554903wrd.103.2023.10.01.07.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 07:52:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 16:52:04 +0200
Message-Id: <20231001145204.994189-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696171932; x=1696776732; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrBPWkXBKlMJpCzN4USRRyAMKBkO5Dj9r5B//TO1kDs=;
 b=S3aIweclw7ZG2Z92c4zEC/wxggu1om+DVr/N8OgEx9k96c8rUyZW3J39MjC6S0Rg7f
 6Qy2mjmZz4Y6w/eHLFMz10lStvmO4XKDRE6fFpQwD71HjZG9tgcx0Pj1BydZnveHn7ck
 cckIlyJbxV2MT18y4YvMK9rwto5blhBuVwJ/wD+TXMt2h3El0sHJIVDIocB2oxm5VGVh
 KvDcCX3CzuVNRdKF73wuepcRTrPDr0Kq0ELBdZ7IM8g7YcLai2yCrRjG+EQlfboP3Wyn
 QitghSgnDuuklfItFWNHCKMx1a8oJhLEu//Jd0mV0YlQUnLbPT/hD5f6FXFDF6sQ71Pm
 qJzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S3aIwecl
Subject: [Buildroot] [PATCH 1/1] package/libnfs: bump to version 5.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBVcGRhdGUgcGF0Y2gKLSBIYW5kbGUgcHRocmVhZCBzdXBwb3J0IGFkZGVkIHdpdGgKICBodHRw
czovL2dpdGh1Yi5jb20vc2FobGJlcmcvbGlibmZzL2NvbW1pdC9mNTU2Mzc2MTllY2JlYjdjN2Ji
ZDQxNDM3NjhiNmI0NTEwMGJlODZjCgpodHRwczovL2dpdGh1Yi5jb20vc2FobGJlcmcvbGlibmZz
L2Jsb2IvbGlibmZzLTUuMC4yL0NIQU5HRUxPRwoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogLmNoZWNrcGFja2FnZWlnbm9y
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiBwYWNrYWdlL2xpYm5mcy8wMDAx
LUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0Y2ggfCA5ICsrKysrLS0tLQogcGFja2FnZS9saWJu
ZnMvbGlibmZzLmhhc2ggICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogcGFja2FnZS9saWJu
ZnMvbGlibmZzLm1rICAgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrKysrLQogNCBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
Ly5jaGVja3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCmluZGV4IDk1Njk1ZmEy
NDMuLjQ0NWJkNjM4MjcgMTAwNjQ0Ci0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKKysrIGIvLmNo
ZWNrcGFja2FnZWlnbm9yZQpAQCAtNzE2LDcgKzcxNiw2IEBAIHBhY2thZ2UvbGlibXBlZzIvMDAw
NC1maXgtc3BhcmMucGF0Y2ggVXBzdHJlYW0KIHBhY2thZ2UvbGlibmV0LzAwMDEtVXNlLXN0YW5k
YXJkLWludDY0X3QtaW5zdGVhZC1vZi1fX2ludDY0X3QtZm9yLW1pbmd3LWNyb3NzLWJ1aWxkLnBh
dGNoIFVwc3RyZWFtCiBwYWNrYWdlL2xpYm5ldGZpbHRlcl9jb25udHJhY2svMDAwMS1jb25udHJh
Y2stZml4LWJ1aWxkLXdpdGgta2VybmVsLTUtMTUtYW5kLW11c2wucGF0Y2ggVXBzdHJlYW0KIHBh
Y2thZ2UvbGlibmZjLzAwMDEtYXV0b3Rvb2xzLW1ha2UtZXhhbXBsZS1idWlsZC1vcHRpb25hbC5w
YXRjaCBVcHN0cmVhbQotcGFja2FnZS9saWJuZnMvMDAwMS1GaXgtaW5jbHVkZS1zeXMtdGltZS5o
LnBhdGNoIFVwc3RyZWFtCiBwYWNrYWdlL2xpYm5pZHMvMDAwMS1saWJwY2FwLXVzZS1wa2ctY29u
ZmlnLnBhdGNoIFVwc3RyZWFtCiBwYWNrYWdlL2xpYm5sLzAwMDEtQWRkLW11c2wtd29ya2Fyb3Vu
ZC10by10aGUtbGliYy1jb21wYXQuaC1jb3B5LnBhdGNoIFVwc3RyZWFtCiBwYWNrYWdlL2xpYm5z
cy8wMDAxLUJ1Zy0xODAxMTgyLUFsbG93LW92ZXJyaWRpbmctT1NfQVJDSC1PU19URVNULWFuZC1P
U18ucGF0Y2ggVXBzdHJlYW0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibmZzLzAwMDEtRml4LWlu
Y2x1ZGUtc3lzLXRpbWUuaC5wYXRjaCBiL3BhY2thZ2UvbGlibmZzLzAwMDEtRml4LWluY2x1ZGUt
c3lzLXRpbWUuaC5wYXRjaAppbmRleCAxNWIyODE2NzJhLi5jMzc3OWYxM2EyIDEwMDY0NAotLS0g
YS9wYWNrYWdlL2xpYm5mcy8wMDAxLUZpeC1pbmNsdWRlLXN5cy10aW1lLmgucGF0Y2gKKysrIGIv
cGFja2FnZS9saWJuZnMvMDAwMS1GaXgtaW5jbHVkZS1zeXMtdGltZS5oLnBhdGNoCkBAIC0xMSwx
MCArMTEsMTEgQEAgUE9TSVggc2F5cyBgc3RydWN0IHRpbWV2YWxgIGlzIGRlZmluZWQgaWYgPHN5
cy90aW1lLmg+IGlzIGluY2x1ZGVkLgogSW5zdGVhZCBvZiB0aGUgbWVzcyB0aGF0IGlzIGN1cnJl
bnRseSBkb25lIGJhc2VkIG9uIHRoZSBzeXN0ZW0gb24gd2hpY2gKIHRoZSBzdHVmZiBpcyBiZWlu
ZyBjb21waWxlZCwgaW5jbHVkZSBpdCB1bmNvbmRpdGlvbmFsbHkuCiAKLVJlcG9ydGVkIHVwc3Ry
ZWFtOgotaHR0cHM6Ly9naXRodWIuY29tL3NhaGxiZXJnL2xpYm5mcy9pc3N1ZXMvMjcyCitVcHN0
cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3NhaGxiZXJnL2xpYm5mcy9pc3N1ZXMvMjcyCiAKIFNp
Z25lZC1vZmYtYnk6IErDtnJnIEtyYXVzZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgor
W0ZhYnJpY2U6IHVwZGF0ZSBmb3IgNS4wLjJdCitTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KIC0tLQogIGluY2x1ZGUvbmZzYy9saWJu
ZnMuaCB8IDUgLS0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKQEAgLTI3LDgg
KzI4LDggQEAgaW5kZXggMDlkY2YxYy4uYjZkYjU4YyAxMDA3NTUKICAjZGVmaW5lIF9MSUJORlNf
SF8KICAKICAjaW5jbHVkZSA8c3RkaW50Lmg+Ci0tI2lmIGRlZmluZWQoX19BTkRST0lEX18pIHx8
IGRlZmluZWQoQVJPUykgXAotLSB8fCAoIGRlZmluZWQoX19BUFBMRV9fKSAmJiBkZWZpbmVkKF9f
TUFDSF9fKSApCistI2lmIGRlZmluZWQoX19BTkRST0lEX18pIHx8IGRlZmluZWQoQVJPUykgfHwg
ZGVmaW5lZChfX1BQVV9fKSBcCistIHx8ICggZGVmaW5lZChfX0FQUExFX18pICYmIGRlZmluZWQo
X19NQUNIX18pICkgfHwgZGVmaW5lZChfX0ZyZWVCU0RfXykgfHwgZGVmaW5lZChfX09wZW5CU0Rf
XykKICAjaW5jbHVkZSA8c3lzL3RpbWUuaD4KIC0jZWxzZQogLSNpbmNsdWRlIDx0aW1lLmg+CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2xpYm5mcy9saWJuZnMuaGFzaCBiL3BhY2thZ2UvbGlibmZzL2xp
Ym5mcy5oYXNoCmluZGV4IGZmYjZjNjIwNzMuLmI2N2E1ZDJlZGEgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvbGlibmZzL2xpYm5mcy5oYXNoCisrKyBiL3BhY2thZ2UvbGlibmZzL2xpYm5mcy5oYXNoCkBA
IC0xLDUgKzEsNSBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNmVlNzdlOWZlMjIw
ZTJkM2UzYjFmNTNjZmVhMDRmYjMxOTgyOGNjN2RiYjk3ZGQ5ZGYwOWU0NmU5MDFkNzk3ZCAgbGli
bmZzLTQuMC4wLnRhci5negorc2hhMjU2ICA2MzdlNTY2NDNiMTlkYTlmYmE5OGYwNjg0Nzc4OGM0
ZGFkMzA4YjcyMzE1NmE2NDc0ODA0MTAzNWRjZGY5YmQzICBsaWJuZnMtNS4wLjIudGFyLmd6CiBz
aGEyNTYgIGVkZDk2MGMwMTQyYjhhZGE5OGI0M2I2Mzk2Yjc4ZjRlNTU3YjBiYzcwYWM2MDFhNTFl
Mzk3YWQwNDA3MGUyYzUgIENPUFlJTkcKIHNoYTI1NiAgZDk0MDZjZWQ5NTQ1Nzk0MTAzMmFhMTFk
MDQ2MjNiOGFiNzFmMjgyN2EzMzk1ZWJlZjEzN2FlYzQ3NWJlMzViMSAgTElDRU5DRS1CU0QudHh0
CiBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIw
NjM3OTlkOGFiMDMyZmU1NTEgIExJQ0VOQ0UtTEdQTC0yLjEudHh0CmRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYm5mcy9saWJuZnMubWsgYi9wYWNrYWdlL2xpYm5mcy9saWJuZnMubWsKaW5kZXggMTcz
YjJjNWIwNi4uOGRjNGQ4ZjU0NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJuZnMvbGlibmZzLm1r
CisrKyBiL3BhY2thZ2UvbGlibmZzL2xpYm5mcy5tawpAQCAtNCwxMSArNCwxNyBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTkZTX1ZFUlNJT04gPSA0LjAuMAorTElCTkZTX1ZF
UlNJT04gPSA1LjAuMgogTElCTkZTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHNhaGxiZXJnLGxpYm5m
cyxsaWJuZnMtJChMSUJORlNfVkVSU0lPTikpCiBMSUJORlNfSU5TVEFMTF9TVEFHSU5HID0gWUVT
CiBMSUJORlNfQVVUT1JFQ09ORiA9IFlFUwogTElCTkZTX0xJQ0VOU0UgPSBMR1BMLTIuMSsgKGxp
YnJhcnkpLCBCU0QtMi1DbGF1c2UgKHByb3RvY29sLCAueCBmaWxlcyksIEdQTC0zLjArIChleGFt
cGxlcykKIExJQk5GU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBMSUNFTkNFLUJTRC50eHQgTElD
RU5DRS1MR1BMLTIuMS50eHQgTElDRU5DRS1HUEwtMy50eHQKIAoraWZlcSAoJChCUjJfVE9PTENI
QUlOX0hBU19USFJFQURTKSx5KQorTElCTkZTX0NPTkZfT1BUUyArPSAtLWVuYWJsZS10aHJlYWRz
CitlbHNlCitMSUJORlNfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS10aHJlYWRzCitlbmRpZgorCiAk
KGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCi0tIAoyLjQwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
