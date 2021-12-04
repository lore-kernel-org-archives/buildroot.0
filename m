Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C73C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 23:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F24760A4E;
	Sat,  4 Dec 2021 23:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmx1S3KS8kEc; Sat,  4 Dec 2021 23:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A73060093;
	Sat,  4 Dec 2021 23:13:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6381BF34F
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59E03400EF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PrHs80mhk9L for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 23:13:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D183400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 23:13:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d24so14032190wra.0
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 15:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eGv/fzlo8tPDqI9VFqSWKGnL+rR4IupbDYlDZChpagw=;
 b=GCIy88+lsLJnhEw2noa3R4E7rmiFSNv5doStzmgfF6GQRUGhlTFH/KAp3ifSA9D9x7
 DpU+kYoUPN6U3yuMX3doinIf5QAsPrlVdK9aQRh+hZmU4s5NLz9DuW5xz4CtR8WE42kU
 1k+aIMCjfvUgOtcB2w/dZi16XmY8iItqOgeMfBo6zRnPM/3V3V8UNPpSVgGqBXEtxdDU
 o2vh7E6THy4mrYHYAqcxpeUs6hDvNMltjwP3Vb67SD9mNfQYXTISwk9gOqzGTYzkbW/p
 dmm7kCWO6+WQVGjiQZ6Feqdh/YIVdWXBqGVu2jVCSr3VQm4z03bzCDSwKH2Om5gT16mR
 4B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eGv/fzlo8tPDqI9VFqSWKGnL+rR4IupbDYlDZChpagw=;
 b=7pgvjzXWSup0cfjsmAfsIP/pAM6OeAMFqL6Q1+2SqDF5LLSmfHNHn5tDErJqUS4kOu
 113NitwIhZB6lYW5JvFVV4aixXIgh0nXecmQ66xpATaSTPLDWYoYX6uJa8zr+L7EYBRr
 lIEVS5rLIjS18WPqWcPOh8TamRdTcPNkfutM8QV8rjKQFnU8rNr87oMgr8ls3BgLUl+n
 T72M3plY850fgRt8LCEUW7CODhiB3jh6hWI+6y/xXDUVm5kbbi6a/O5Byra3hPj3rSqg
 HkeuQqW/dZwEpdnrahxL8z8fVF5RhGUngg2nleAKER617cF4CbEJg3KjrZDQtBvAwZbB
 kq+w==
X-Gm-Message-State: AOAM531jiijHof/+aFlBEOfg0JA92sWwJXXZq9paW1aiaGpesuDzIT7N
 ZFGO1KtIHySY6KfAsZWQSOdJXeDYbuE=
X-Google-Smtp-Source: ABdhPJyKwVyZeipiD5fJEsz7xa/a7jfbtWiTGg50wGTS44oQLkSr1FL0nW50XjrPXVbQHpnNssLvAA==
X-Received: by 2002:adf:e68f:: with SMTP id r15mr31100070wrm.359.1638659610669; 
 Sat, 04 Dec 2021 15:13:30 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 by smtp.gmail.com with ESMTPSA id d9sm6637201wre.52.2021.12.04.15.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 15:13:30 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 00:13:25 +0100
Message-Id: <20211204231325.562144-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mender-grubenv: fix install for legacy
 BIOS or ARM U-Boot
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
Cc: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29tZSBsYXN0LW1pbnV0ZSBjaGFuZ2VzIHdlcmUgbWFkZSB3aGVuIGFwcGx5aW5nIGNvbW1pdHMg
N2E2ODk2MGI2ODJjMAooYm9vdC9ncnViMi9Db25maWcuaW46IGFkZCBzeW1ib2xzIHRvIHJlcHJl
c2VudCBsZWdhY3kgYW5kIEVGSSBib290KSBhbmQKNGQ1YjIwOTM4NGUwIChwYWNrYWdlL21lbmRl
ci1ncnViZW52OiBmaXggZ3J1YiBtb2R1bGUgY2hlY2tzKSwgYW5kIHRoZQpyZW5hbWluZyBvZiB0
aGUgQlIyX1RBUkdFVF9HUlVCX0xFR0FDWSB3YXMgbm90IGZ1bGx5IHByb3BhZ2F0ZWQuCgpUaGlz
IGNhdXNlZCB0aGUgcGF0aCB0byB0aGUgYm9vdCBmaWxlcyB0byBhbHdheXMgYmUgaW50ZXJwcmV0
ZWQgYXMgYmVpbmcKdGhlIEVGSSBvbmUsIGFuZCBuZXZlciB0aGUgbGVnYWN5IG9uZS4gSW4gcHJh
Y3RpY2UsIHRoYXQgd2FzIG5vdCBjYXVzaW5nCmFueSBidWlsZCBmYWlsdXJlLCBiZWNhdXNlIHRo
ZSBwYXRoIHdhcyBwYXNzZWQgYXQgYnVpbGQtdGltZSB0bwptZW5kZXItZ3J1YmVudiwgdGhhdCB3
b3VsZCB1c2UgaXQgYXMgdGhlIGxvY2F0aW9uIHdoZXJlIHRvIGluc3RhbGwgaXRzCmZpbGVzLCBh
bmQgZmluYWxseSBhcyB0aGUgbG9jYXRpb24gd2hlcmUgb3VyIGltYWdlLWlzbnRhbGwgY29tbWFu
ZHMKd291bGQgbG9vayBmb3IgdGhlbS4KClN0aWxsIHRoaXMgaXMgaW5jb3JyZWN0IGJlY2F1c2Ug
aXQgd291bGQgbm90IG1hdGNoIHdoZXJlIGdydWIyIHdvdWxkCmV2ZW50dWFsbHkgZW5kIHVwIGxv
b2tpZyBmb3IgaXRzIGZpbGVzIGF0IHJ1bnRpbWUuLi4KClRvIGF2b2lkIGZ1cnRoZXIgaXNzdWUs
IGRyb3AgdGhlIGNvbmRpdGlvbmFsIGJsb2NrIGRlZGljYXRlZCB0byBzZXR0aW5nCnRoZSBwYXRo
IHRvIHRoZSBib290IGZpbGVzLCBkcm9wIHRoZSBpbnRlcm1lZGlhdGUgdmFyaWFibGUsIGFuZCBt
b3ZlCnNldHRpbmcgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIGRvd24gaW50byB0aGUgZXhpc3Rp
bmcgY29uZGl0aW9uYWwKYmxvY2suCgpXZSBkbyBkcm9wIHRoZSBpbnRlcm1lZGlhdGUgdmFyaWFi
bGUsIGJlY2F1c2UgdGhlcmUgaXMgbm8gbG9uZ2VyIGFueQpnZW5lcmljaXR5IG5lZWRlZDogdGhl
IGluc3RhbGxhdGlvbiBjb21tYW5kcyBhcmUgYWxyZWFkeSBkdXBsaWNhdGVkIGZvcgp0aGUgdHdv
IGNhc2VzIGFueXdheS4KClJlcG9ydGVkLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNn
YWFyZC5jb20+ClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPgpDYzogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+CkNjOiBLw7ZyeSBN
YWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL21lbmRlci1n
cnViZW52L21lbmRlci1ncnViZW52Lm1rIHwgMjEgKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL21lbmRlci1ncnViZW52L21lbmRlci1ncnViZW52Lm1rIGIvcGFja2FnZS9tZW5k
ZXItZ3J1YmVudi9tZW5kZXItZ3J1YmVudi5tawppbmRleCA2Yjg4MDBlMWRlLi45ZDViZThkOGY0
IDEwMDY0NAotLS0gYS9wYWNrYWdlL21lbmRlci1ncnViZW52L21lbmRlci1ncnViZW52Lm1rCisr
KyBiL3BhY2thZ2UvbWVuZGVyLWdydWJlbnYvbWVuZGVyLWdydWJlbnYubWsKQEAgLTEzLDE2ICsx
Myw5IEBAIE1FTkRFUl9HUlVCRU5WX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCiBNRU5ERVJfR1JV
QkVOVl9ERVBFTkRFTkNJRVMgPSBncnViMgogTUVOREVSX0dSVUJFTlZfSU5TVEFMTF9JTUFHRVMg
PSBZRVMKIAotaWZlcSAoJChCUjJfVEFSR0VUX0dSVUJfTEVHQUNZKSx5KQotTUVOREVSX0dSVUJF
TlZfRU5WX0RJUiA9IC9ib290L2dydWIKLWVsc2UKLU1FTkRFUl9HUlVCRU5WX0VOVl9ESVIgPSAv
Ym9vdC9FRkkvQk9PVAotZW5kaWYKLQogTUVOREVSX0dSVUJFTlZfTUFLRV9FTlYgPSBcCiAJJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpIFwKLQkkKFRBUkdFVF9NQUtFX0VOVikgXAotCUVOVl9ESVI9
JChNRU5ERVJfR1JVQkVOVl9FTlZfRElSKQorCSQoVEFSR0VUX01BS0VfRU5WKQogCiBNRU5ERVJf
R1JVQkVOVl9ERUZJTkVTID0gXAogCSQob3IgJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX01F
TkRFUl9HUlVCRU5WX0RFRklORVMpKSxcCkBAIC0zNywxMCArMzAsMTIgQEAgTUVOREVSX0dSVUJF
TlZfTU9EVUxFU19NSVNTSU5HX1BDID0gXAogCSQoZmlsdGVyLW91dCAkKGNhbGwgcXN0cmlwLCQo
QlIyX1RBUkdFVF9HUlVCMl9CVUlMVElOX01PRFVMRVNfUEMpKSxcCiAJCSQoTUVOREVSX0dSVUJF
TlZfTUFOREFUT1JZX01PRFVMRVMpKQogCitNRU5ERVJfR1JVQkVOVl9NQUtFX0VOViArPSBFTlZf
RElSPS9ib290L2dydWIKKwogZGVmaW5lIE1FTkRFUl9HUlVCRU5WX0lOU1RBTExfSTM4Nl9DRkcK
IAlta2RpciAtcCAkKEJJTkFSSUVTX0RJUikvYm9vdC1wYXJ0L2dydWIKLQljcCAtZHBmciAkKFRB
UkdFVF9ESVIpJChNRU5ERVJfR1JVQkVOVl9FTlZfRElSKS9ncnViLmNmZyBcCi0JCSQoVEFSR0VU
X0RJUikkKE1FTkRFUl9HUlVCRU5WX0VOVl9ESVIpL21lbmRlcl9ncnViZW52KiBcCisJY3AgLWRw
ZnIgJChUQVJHRVRfRElSKS9ib290L2dydWIvZ3J1Yi5jZmcgXAorCQkkKFRBUkdFVF9ESVIpL2Jv
b3QvZ3J1Yi9tZW5kZXJfZ3J1YmVudiogXAogCQkkKEJJTkFSSUVTX0RJUikvYm9vdC1wYXJ0L2dy
dWIKIGVuZGVmCiBlbmRpZiAjIEJSMl9UQVJHRVRfR1JVQjJfSEFTX0xFR0FDWV9CT09UCkBAIC01
MCwxMCArNDUsMTIgQEAgTUVOREVSX0dSVUJFTlZfTU9EVUxFU19NSVNTSU5HX0VGSSA9IFwKIAkk
KGZpbHRlci1vdXQgJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9NT0RV
TEVTX0VGSSkpLFwKIAkJJChNRU5ERVJfR1JVQkVOVl9NQU5EQVRPUllfTU9EVUxFUykpCiAKK01F
TkRFUl9HUlVCRU5WX01BS0VfRU5WICs9IEVOVl9ESVI9L2Jvb3QvRUZJL0JPT1QKKwogZGVmaW5l
IE1FTkRFUl9HUlVCRU5WX0lOU1RBTExfRUZJX0NGRwogCW1rZGlyIC1wICQoQklOQVJJRVNfRElS
KS9lZmktcGFydC9FRkkvQk9PVAotCWNwIC1kcGZyICQoVEFSR0VUX0RJUikkKE1FTkRFUl9HUlVC
RU5WX0VOVl9ESVIpL2dydWIuY2ZnIFwKLQkJJChUQVJHRVRfRElSKSQoTUVOREVSX0dSVUJFTlZf
RU5WX0RJUikvbWVuZGVyX2dydWJlbnYqIFwKKwljcCAtZHBmciAkKFRBUkdFVF9ESVIpL2Jvb3Qv
RUZJL0JPT1QvZ3J1Yi5jZmcgXAorCQkkKFRBUkdFVF9ESVIpL2Jvb3QvRUZJL0JPT1QvbWVuZGVy
X2dydWJlbnYqIFwKIAkJJChCSU5BUklFU19ESVIpL2VmaS1wYXJ0L0VGSS9CT09UCiBlbmRlZgog
ZW5kaWYgIyBCUjJfVEFSR0VUX0dSVUIyX0hBU19FRklfQk9PVAotLSAKMi4yNS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
