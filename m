Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897FFC021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 20:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B38D610F9;
	Wed, 19 Feb 2025 20:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeLB1YF0ra0Z; Wed, 19 Feb 2025 20:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0713E610EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0713E610EA;
	Wed, 19 Feb 2025 20:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4BDE0C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77A90404D1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9zJlGiaWpB3 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 20:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED2AD4017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2AD4017A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED2AD4017A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:43:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f5fc33602so140926f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 12:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739997790; x=1740602590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HppYpBFShGUq45sw0IXpu/3utoEfGb5+oWYWx4ObDbA=;
 b=GjV3+WCNcA+EII5Suf2DbTwzkoInqkIsAxBbgf2VgAZmkcaMv8Gh0ENVW17g76cXl4
 LTgdF6xCW/05N580tjrR7J2MubWsXgxD2TQDZeQh0dUnN3D+LXx83vTHAJTtsNFXSgil
 30G63qOEsPQ8T8Syn7F0VHI9anW9Hhcwxn0ruxZEBz8YQJDrkOF5sht39wM1uqd5r0p8
 8Pp4JnWhkSjpP3QqeGXaVjgbydsjAh2yoy7mr7y6nyV2Pu3COSwEjTQz+rBsTERaSvjq
 vb19Ft5VJw4bkQ1kk/XA2N/zRZ1M8oYALFE6te2vowyXO9vr/oI4jfwozUKqNzYN/Rfo
 A1Yg==
X-Gm-Message-State: AOJu0YwiatRUMGUKoANbQQvNmSORBKlUkxK6W0Z9kInqKJbBV05dsEAF
 l1OcnfiW/ilIHYszfzdrkGkOzH90dOvlTbfEZk41VBto/4VE1vdJja481lZ89r3SkzmCOahjgzh
 Kh9qCpw==
X-Gm-Gg: ASbGncvv8AZqJfzuVt6M9ACMuSQHD4fjxnaVjKyW6JmBM/so2uptCGOHWgvNLRNSY54
 eliOaltBO4Hnqpq6WbmJDpf0Ibnpvv9TRr4iD78QJIaiFJI8ey6/HyeZl7JHwx73BGj/DGl6l41
 E2WG/6KgqrDd75Co9beyhu6rmRLaFb7/LKeKt5doOYDtkTWeV/nhbFIilZ75/zxB2W5r3uTIySZ
 tdIRfsyz4OlYyhPQUzWiGJqKfIPV+v1ne04y97OXZlRGrEVHAAt/Csejq6/b5nR/YuwRXrIb1Cd
 zxM6I7Gs1zUebfzX+OcBZwzUW64p88CXZQ==
X-Google-Smtp-Source: AGHT+IExT9dpsGuAlIr/dye5NBoxpw0IrCnd+NnkkoOmt2OOrEPU6gtIqx9v2UItDKa/drxbsbsHFA==
X-Received: by 2002:a05:6000:1f8f:b0:38d:b8fd:591f with SMTP id
 ffacd0b85a97d-38f614991e7mr549961f8f.5.1739997790287; 
 Wed, 19 Feb 2025 12:43:10 -0800 (PST)
Received: from debian-hp-1.my-cloud.eu ([91.26.90.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d65bcsm18894822f8f.65.2025.02.19.12.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 12:43:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 19 Feb 2025 21:42:54 +0100
Message-ID: <20250219204255.202762-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739997790; x=1740602590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HppYpBFShGUq45sw0IXpu/3utoEfGb5+oWYWx4ObDbA=;
 b=YsOlNgr+ghd4NQJospmRRa1OhNDKszX6GI47kipzVpgLQRUNxP61/Cr8r9ckbHTdux
 45KnFzhmFmM1Ts0iwyy2znC1kY1GqaopQGsE9hcGKUlcsjv8UFDdFhTQkblGDjYp8Lio
 4Dsfr1bvPPZnV9N5awJLIbFZvDjRL4q7YYFfSIrFdZmyfbQm7mLBzTxCS7fP/vzmIImB
 BYVlDGDgB/OGaQ3R0YeZvCtvvZZod9Xa/V09Du0VWtsLOTS+B9kdYfrzVipGB3Dj/1yf
 A80b45PrdfdlFKSHAGjJahm5qgOCTunkVZe33y11fcoFhPdZQkyJX7z63oG+W+pTq/N+
 qDNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YsOlNgr+
Subject: [Buildroot] [PATCH 1/1] package/libfreeglut: add upstream security
 fix for CVE-2024-2425{8, 9}
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6CgotIENWRS0yMDI0LTI0MjU4OiBm
cmVlZ2x1dCAzLjQuMCB3YXMgZGlzY292ZXJlZCB0byBjb250YWluIGEgbWVtb3J5IGxlYWsKdmlh
IHRoZSBtZW51RW50cnkgdmFyaWFibGUgaW4gdGhlIGdsdXRBZGRTdWJNZW51IGZ1bmN0aW9uLgot
IENWRS0yMDI0LTI0MjU5OiBmcmVlZ2x1dCB0aHJvdWdoIDMuNC4wIHdhcyBkaXNjb3ZlcmVkIHRv
IGNvbnRhaW4gYQptZW1vcnkgbGVhayB2aWEgdGhlIG1lbnVFbnRyeSB2YXJpYWJsZSBpbiB0aGUg
Z2x1dEFkZE1lbnVFbnRyeQpmdW5jdGlvbi4KCmh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0
YWlsL0NWRS0yMDI0LTI0MjU4Cmh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0y
MDI0LTI0MjU5CgpUaGUgQ1ZFcyBhcmUgbm90IHRlY2huaWNhbGx5IHJlcG9ydGVkIGZvciB0aGUg
bGliZnJlZWdsdXQgcGFja2FnZQppdHNlbGYgKHdoaWNoIGRvZXNuJ3QgaGF2ZSBhIENQRSBpZGVu
dGlmaWVyKSBidXQgZm9yIG11cGRmLgoKTm90ZSB0aGF0IG11ZHBmIHByb3ZpZGVzIGl0cyBvd24g
KG9sZCkgdmVyc2lvbiBvZiBmcmVlZ2x1dCwgYnV0IG91cgptdXBkZiBwYWNrYWdlIHVzZXMgdGhl
IEJ1aWxkcm9vdC1wcm92aWRlZCBmcmVlZ2x1dCAod2hpY2ggbm93IGNvbnRhaW5zCnRoZSBmaXgp
LgoKSXQgYWxzbyBoYXMgdG8gYmUgbm90ZWQgdGhhdCBhIG1vcmUgcmVjZW50IHJlbGVhc2Ugb2Yg
bGliZnJlZWdsdXQKZXhpc3RzIHVwc3RyZWFtLCBhbmQgaXQgZml4ZXMgdGhlIHNhbWUgQ1ZFcy4g
IEJ1bXBpbmcgb3VyIHBhY2thZ2UKdmVyc2lvbiBob3dldmVyIHJlcXVpcmVzIG1vcmUgd29yayB0
aGF0IGNhbiBiZSBkb25lIHNlcGFyYXRlbHkuCkluY2x1ZGluZyB0aGlzIHBhdGNoIGZpcnN0IGFs
c28gaGFzIHRoZSBhZHZhbnRhZ2UgdGhhdCBpdCBjYW4gZWFzaWx5CmJlIGJhY2twb3J0ZWQgd2hl
cmV2ZXIgaXQncyBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogLi4uLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVucy11
cG9uLWVycm9yLnBhdGNoIHwgNTQgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9tdXBkZi9t
dXBkZi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKIDIgZmlsZXMgY2hhbmdlZCwg
NTkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnJlZWdsdXQv
MDAwMS1QbHVnLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVucy11cG9uLWVycm9yLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJmcmVlZ2x1dC8wMDAxLVBsdWctbWVtb3J5LWxlYWstdGhhdC1o
YXBwZW5zLXVwb24tZXJyb3IucGF0Y2ggYi9wYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEtUGx1Zy1t
ZW1vcnktbGVhay10aGF0LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRjaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5kMDllOWJlZmIzCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9saWJmcmVlZ2x1dC8wMDAxLVBsdWctbWVtb3J5LWxlYWstdGhhdC1oYXBwZW5zLXVwb24t
ZXJyb3IucGF0Y2gKQEAgLTAsMCArMSw1NCBAQAorRnJvbSA5YWQzMjBjMWFkMWEyNTU1ODk5OGRk
ZmU0NzY3NDUxMTU2N2ZlYzU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogU2ViYXN0
aWFuIFJhc211c3NlbiA8c2VicmFzQGdtYWlsLmNvbT4KK0RhdGU6IE1vbiwgMTIgRmViIDIwMjQg
MTQ6NDY6MjIgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gUGx1ZyBtZW1vcnkgbGVhayB0aGF0IGhh
cHBlbnMgdXBvbiBlcnJvci4KKworSWYgZmdTdHJ1Y3R1cmUuQ3VycmVudE1lbnUgaXMgc2V0IHdo
ZW4gZ2x1dEFkZE1lbnVFbnRyeSgpIG9yCitnbHV0QWRkU3ViTWVudSgpIGlzIGNhbGxlZCB0aGUg
YWxsb2NhdGVkIG1lbnVFbnRyeSB2YXJpYWJsZSB3aWxsCitsZWFrLiBUaGlzIGNvbW1pdCBwb3N0
cG9uZXMgYWxsb2NhdGluZyBtZW51RW50cnkgdW50aWwgYWZ0ZXIgdGhlCitlcnJvciBjaGVja3Ms
IHRoZXJlYnkgcGx1Z2dpbmcgdGhlIG1lbW9yeSBsZWFrLgorCitUaGlzIGZpeGVzIENWRS0yMDI0
LTI0MjU4IGFuZCBDVkUtMjAyNC0yNDI1OS4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
ZnJlZWdsdXQvZnJlZWdsdXQvY29tbWl0LzlhZDMyMGMxYWQxYTI1NTU4OTk4ZGRmZTQ3Njc0NTEx
NTY3ZmVjNTcKK1NpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90
dGVAbWluZC5iZT4KKy0tLQorIHNyYy9mZ19tZW51LmMgfCA0ICsrLS0KKyAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2Zn
X21lbnUuYyBiL3NyYy9mZ19tZW51LmMKK2luZGV4IDUzMTEyZGMyLi4wZGE4ODkwMSAxMDA2NDQK
Ky0tLSBhL3NyYy9mZ19tZW51LmMKKysrKyBiL3NyYy9mZ19tZW51LmMKK0BAIC04NjQsMTIgKzg2
NCwxMiBAQCB2b2lkIEZHQVBJRU5UUlkgZ2x1dEFkZE1lbnVFbnRyeSggY29uc3QgY2hhciogbGFi
ZWwsIGludCB2YWx1ZSApCisgeworICAgICBTRkdfTWVudUVudHJ5KiBtZW51RW50cnk7CisgICAg
IEZSRUVHTFVUX0VYSVRfSUZfTk9UX0lOSVRJQUxJU0VEICggImdsdXRBZGRNZW51RW50cnkiICk7
CistICAgIG1lbnVFbnRyeSA9IChTRkdfTWVudUVudHJ5ICopY2FsbG9jKCBzaXplb2YoU0ZHX01l
bnVFbnRyeSksIDEgKTsKKyAKKyAgICAgZnJlZWdsdXRfcmV0dXJuX2lmX2ZhaWwoIGZnU3RydWN0
dXJlLkN1cnJlbnRNZW51ICk7CisgICAgIGlmIChmZ1N0YXRlLkFjdGl2ZU1lbnVzKQorICAgICAg
ICAgZmdFcnJvcigiTWVudSBtYW5pcHVsYXRpb24gbm90IGFsbG93ZWQgd2hpbGUgbWVudXMgaW4g
dXNlLiIpOworIAorKyAgICBtZW51RW50cnkgPSAoU0ZHX01lbnVFbnRyeSAqKWNhbGxvYyggc2l6
ZW9mKFNGR19NZW51RW50cnkpLCAxICk7CisgICAgIG1lbnVFbnRyeS0+VGV4dCA9IHN0cmR1cCgg
bGFiZWwgKTsKKyAgICAgbWVudUVudHJ5LT5JRCAgID0gdmFsdWU7CisgCitAQCAtODg4LDcgKzg4
OCw2IEBAIHZvaWQgRkdBUElFTlRSWSBnbHV0QWRkU3ViTWVudSggY29uc3QgY2hhciAqbGFiZWws
IGludCBzdWJNZW51SUQgKQorICAgICBTRkdfTWVudSAqc3ViTWVudTsKKyAKKyAgICAgRlJFRUdM
VVRfRVhJVF9JRl9OT1RfSU5JVElBTElTRUQgKCAiZ2x1dEFkZFN1Yk1lbnUiICk7CistICAgIG1l
bnVFbnRyeSA9ICggU0ZHX01lbnVFbnRyeSAqICljYWxsb2MoIHNpemVvZiggU0ZHX01lbnVFbnRy
eSApLCAxICk7CisgICAgIHN1Yk1lbnUgPSBmZ01lbnVCeUlEKCBzdWJNZW51SUQgKTsKKyAKKyAg
ICAgZnJlZWdsdXRfcmV0dXJuX2lmX2ZhaWwoIGZnU3RydWN0dXJlLkN1cnJlbnRNZW51ICk7CitA
QCAtODk3LDYgKzg5Niw3IEBAIHZvaWQgRkdBUElFTlRSWSBnbHV0QWRkU3ViTWVudSggY29uc3Qg
Y2hhciAqbGFiZWwsIGludCBzdWJNZW51SUQgKQorIAorICAgICBmcmVlZ2x1dF9yZXR1cm5faWZf
ZmFpbCggc3ViTWVudSApOworIAorKyAgICBtZW51RW50cnkgPSAoIFNGR19NZW51RW50cnkgKiAp
Y2FsbG9jKCBzaXplb2YoIFNGR19NZW51RW50cnkgKSwgMSApOworICAgICBtZW51RW50cnktPlRl
eHQgICAgPSBzdHJkdXAoIGxhYmVsICk7CisgICAgIG1lbnVFbnRyeS0+U3ViTWVudSA9IHN1Yk1l
bnU7CisgICAgIG1lbnVFbnRyeS0+SUQgICAgICA9IC0xOworLS0gCisyLjQ4LjEKKwpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tayBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKaW5k
ZXggOWVlY2I4NDIzMi4uZDI4MjlkOGI3MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9tdXBkZi9tdXBk
Zi5taworKysgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCkBAIC0yMSw2ICsyMSwxMSBAQCBNVVBE
Rl9ERVBFTkRFTkNJRVMgPSBcCiAJbGNtczIgb3BlbmpwZWcgXAogCXpsaWIKIAorIyBsaWJmcmVl
Z2x1dC8wMDAxLVBsdWctbWVtb3J5LWxlYWstdGhhdC1oYXBwZW5zLXVwb24tZXJyb3IucGF0Y2gK
K01VUERGX0lHTk9SRV9DVkVTID0gXAorCUNWRS0yMDI0LTI0MjU4IFwKKwlDVkUtMjAyNC0yNDI1
OQorCiAjIG11cGRmIGRvZXNuJ3QgdXNlIENGTEFHUyBhbmQgTElCUyBidXQgWENGTEFHUyBhbmQg
WExJQlMgaW5zdGVhZC4KICMgd2l0aCBVU0VfU1lTVEVNX0xJQlMgaXQgd2lsbCB0cnkgdG8gdXNl
IHN5c3RlbSBsaWJyYXJpZXMgaW5zdGVhZCBvZiB0aGUgYnVuZGxlZCBvbmVzLgogTVVQREZfTUFL
RV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpIFwKLS0g
CjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
