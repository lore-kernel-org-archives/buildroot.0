Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A460D711C8
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 23:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320FA4030F;
	Thu, 18 Dec 2025 23:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhTnnAj1eQzr; Thu, 18 Dec 2025 23:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 415C640317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766101244;
	bh=5w8ukGc2OJloSLN2nf0lAlop9cv/RpT2IiGQ+4z2oqQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nJVKtURbYtIjXgfqXyRd+7Z5DdgAaq0KteG8iO9F1RhoboQmXIEG4CHp0HHu2grz3
	 9Aho2lhX4rsfWt904+Bo+V9YF/PdB7pTpdXI1tV3hkzf0iXquep/xFuVbJCmoNyQ1/
	 KFSHweyopgUQ08QtD7MPtHB8b7x3XMhR3YrfqM0aSaiZA4FYmNOMtZz7YP9fWQcY2F
	 5NWTtisMIfPy2K6uJDys0Hlx0sdZtK5B4v+Y80xE0nqxOCbZSOQPliXFfBISFydy3b
	 5PP0bvl1Q8pr04B8fobWiQHSml9IjE2jf+J50CKSUev4BErnonZPdIL+GfkXEPZNjo
	 6f8ZgnpqYE9xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415C640317;
	Thu, 18 Dec 2025 23:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 889461A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 23:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A0AD83F46
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 23:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3ebKi8K_VfQ for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 23:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E608683F45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E608683F45
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E608683F45
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 23:40:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so12152745e9.3
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 15:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766101239; x=1766706039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mxBCgyoZfZSDXqMBE5RMgMS4VRfpRXc4EHB3+o6aIs=;
 b=PaNMqHfI72irpC9ankTIAvWS3n3kpwwZOohqnCTHVdGkG4dUbPyXyZNDK+kZmW1vkd
 rVrm3K44TWobVxVa4JNAqAJedjtnp2BX2q4et/XfH++b1xoZvt8JnGsRDetG/RqXjDkB
 p6qWk8qy6sGTeSSZqg58tf5fO4HUVg9hsSGvgrioTfES0Ap/C6GmAzTrLBvwIYDUznAe
 +0XfQT2QQayikGmDB4Y48vCkJqRedrrLEDDiHGvlDWH3HJi+KHF3GhgfEro+b891kl2V
 ZWELSAOrPEvo6yfiNMzHb22woxGvh5aayrAKm31FYH4xOULnPZmSYIvALB4fkU/XFt7D
 ycVw==
X-Gm-Message-State: AOJu0YxvcJNc7Q/4CvzA5tBMuiHVyp0pp6p06x0cB+UvDs2iQ6ooZ672
 ku2TwlyXNdK7X3cLU7FEBuSs7g2uISokKPqvlZbgZZ9uF+2Nohe7XfsOrBPZlrkl
X-Gm-Gg: AY/fxX5nGwXMKYOZF3KrjeHtvpJPU1eBToyHCS2xVAyxee7snDIrEZ0parW61dh4zQU
 LemN/aZ4rQ3LeR+kHoblBMt9AfW5ViqR6ti/ls1SOKAyP+cRnC8ITqPGwiMLXlS3icKkG5oSaaS
 EE4bLGsqwc1W63ym7fr8ujQEZoSmav3U+uscaRZ3N3Ma/Ne2/BoMewNrzgWpYYETOy19DIVfcWS
 e9BW7Sa70TTPCOcIzG/eQiSYNR7+9F/F4pkab0LEqdvyLn4Cg5oY6R70TgGcUqFxqvWRAnzr84p
 JZS+vwh7WTJnruH6+dxUnKU5b0hHUIPdwxIJswtxD8+Y26KYOJPmHaKCVH55L069BWCGISiLuMS
 viNt5ZYiLGoiuy5bEdxDsknPVSaKd798sHG7kckRpiPDCKscmVIVuUmtisM8SfLKBUAwmwRcgZd
 g98nbVj78KvBpgdOgkLA29HSmrTiTvkbmKhWdnEQLSppKIHGnGhRHUbFVtVI+KCjlTzb8RxV7ys
 ERk0egkznrFFaiQU4s4Wsz5HyQ=
X-Google-Smtp-Source: AGHT+IFrxPvnu3r3B2JKSYbTjwpttNRnZJ8JTCL4Tu9adWLWzY88v2+rvOx9CDIGnGGOcuvnavEjpw==
X-Received: by 2002:a05:600c:1914:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-47d1955b79amr6744855e9.7.1766101238538; 
 Thu, 18 Dec 2025 15:40:38 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online
 (151.85-87-136.dynamic.clientes.euskaltel.es. [85.87.136.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b0d5asm66972795e9.13.2025.12.18.15.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 15:40:37 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Fri, 19 Dec 2025 00:40:22 +0100
Message-ID: <20251218234022.3289212-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766101239; x=1766706039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3mxBCgyoZfZSDXqMBE5RMgMS4VRfpRXc4EHB3+o6aIs=;
 b=LSItnhuu50kX3tS+aFVe8P2zcR17WpLvismh/3/7zBEbqMpL50ocCkO41HjYOyaG37
 qd9PeQOmeXKw3fwKOd5SuYcdQVaIW6a07pYq7T7J451uwwNzpnRGW+WuDstt0pdAAd9n
 DU4aOggJTglvPAFaYM128Zw+8GM4cwcvx2+kJAEwiTJ283WtAZzRUraAzNK94/0Fukf9
 eRCOIkzpsOJ0yRwco065Dulz7OX9C+yl7jLHaWoBd8e6f7EgsLcAL86OXIj9YiklyQKw
 Qv6zmyuLf2qgg+20vQy4wQ44F2zFHSF393QqH4Fo8HgWzkuqriYEdLocXuWTz3y4/1Zf
 x6qQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LSItnhuu
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.0
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

UmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgogLSAwMDAxLXVzZS1zeXNfc3RhdGgtaW5zdGVhZC1v
Zi1saW51eF9zdGF0aC5wYXRjaApNZXJnZWQgdXBzdHJlYW0gaW46Cmh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuemZzL3pmcy9jb21taXQvNjM0YzE3MmVlODlmNTMwMzQ5M2E3NWRjN2ZmNTVlMGEzNTVi
NTAzYQoKRm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96
ZnMvcmVsZWFzZXMvdGFnL3pmcy0yLjQuMAoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2
YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogLi4udXNlLXN5c19z
dGF0aC1pbnN0ZWFkLW9mLWxpbnV4X3N0YXRoLnBhdGNoIHwgODIgLS0tLS0tLS0tLS0tLS0tLS0t
LQogcGFja2FnZS96ZnMvemZzLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0K
IHBhY2thZ2UvemZzL3pmcy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSAgICAgfCAgMiArLQogNCBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvemZzLzAwMDEtdXNlLXN5c19zdGF0aC1pbnN0ZWFkLW9mLWxpbnV4
X3N0YXRoLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvMDAwMS11c2Utc3lzX3N0YXRo
LWluc3RlYWQtb2YtbGludXhfc3RhdGgucGF0Y2ggYi9wYWNrYWdlL3pmcy8wMDAxLXVzZS1zeXNf
c3RhdGgtaW5zdGVhZC1vZi1saW51eF9zdGF0aC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggNWU1ZDIxZWM1Mi4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL3pmcy8wMDAxLXVz
ZS1zeXNfc3RhdGgtaW5zdGVhZC1vZi1saW51eF9zdGF0aC5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDgyICswLDAgQEAKLUZyb20gY2NmNWE4YTZmY2ZkZmJkYWEyZjBmZGNhNWQ3ODc5NTgyMjRi
ZjA2ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IGNsYXNzYWJieWFtcCA8NTM2Njgy
OCtjbGFzc2FiYnlhbXBAdXNlcnMubm9yZXBseS5naXRodWIuY29tPgotRGF0ZTogV2VkLCAyNyBB
dWcgMjAyNSAxNzo0MjozMiAtMDQwMAotU3ViamVjdDogW1BBVENIXSBsaW51eDogdXNlIHN5cy9z
dGF0LmggaW5zdGVhZCBvZiBsaW51eC9zdGF0LmgKLQotZ2xpYmMgaW5jbHVkZXMgbGludXgvc3Rh
dC5oIGZvciBzdGF0eCwgYnV0IG11c2wgZGVmaW5lcyBpdHMgb3duIHN0YXR4Ci1zdHJ1Y3QgYW5k
IGFzc29jaWF0ZWQgY29uc3RhbnRzLCB3aGljaCBkb2VzIG5vdCBpbmNsdWRlIFNUQVRYX01OVF9J
RAoteWV0LiBUaHVzLCBpbmNsdWRpbmcgbGludXgvc3RhdC5oIGRpcmVjdGx5IHNob3VsZCBiZSBh
dm9pZGVkIGZvcgotbWF4aW11bSBsaWJjIGNvbXBhdGliaWxpdHkuCi0KLVRlc3RlZCBvbjoKLSAg
LSBnbGliYzogeDg2XzY0LCBpNjg2LCBhYXJjaDY0LCBhcm12N2wsIGFybXY2bAotICAtIG11c2w6
IHg4Nl82NCwgYWFyY2g2NCwgYXJtdjdsLCBhcm12NmwKLQotUmV2aWV3ZWQtYnk6IEJyaWFuIEJl
aGxlbmRvcmYgPGJlaGxlbmRvcmYxQGxsbmwuZ292PgotVGVzdGVkLUJ5OiBBY2hpbGwgR2lsZ2Vu
YXN0IDxhY2hpbGxAYWNoaWxsLm9yZz4KLVNpZ25lZC1vZmYtYnk6IGNsYXNzYWJieWFtcCA8ZGV2
QHBsYWNldmlvbGV0dGUubmV0PgotQ2xvc2VzICMxNzY3NQotCi1VcHN0cmVhbTogaHR0cHM6Ly9n
aXRodWIuY29tL29wZW56ZnMvemZzL2NvbW1pdC9jY2Y1YThhNmZjZmRmYmRhYTJmMGZkY2E1ZDc4
Nzk1ODIyNGJmMDZkCi1TaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNh
bHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KLS0tLQotIGNvbmZpZy91c2VyLXN0YXR4Lm00ICAg
ICAgICAgICAgICAgICAgIHwgNiArKystLS0KLSBpbmNsdWRlL29zL2xpbnV4L3NwbC9zeXMvc3Rh
dC5oICAgICAgICB8IDIgKy0KLSBsaWIvbGlic3BsL2luY2x1ZGUvb3MvbGludXgvc3lzL3N0YXQu
aCB8IDIgKy0KLSAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZy91c2VyLXN0YXR4Lm00IGIvY29uZmlnL3VzZXItc3Rh
dHgubTQKLWluZGV4IDAzMTVmOTNlMGMyMC4uMWJhNzRhNDBlOWI4IDEwMDY0NAotLS0tIGEvY29u
ZmlnL3VzZXItc3RhdHgubTQKLSsrKyBiL2NvbmZpZy91c2VyLXN0YXR4Lm00Ci1AQCAtMiw3ICsy
LDcgQEAgZG5sICMKLSBkbmwgIyBDaGVjayBmb3Igc3RhdHgoKSBmdW5jdGlvbiBhbmQgU1RBVFhf
TU5UX0lEIGF2YWlsYWJpbGl0eQotIGRubCAjCi0gQUNfREVGVU4oW1pGU19BQ19DT05GSUdfVVNF
Ul9TVEFUWF0sIFsKLS0JQUNfQ0hFQ0tfSEVBREVSUyhbbGludXgvc3RhdC5oXSwKLSsJQUNfQ0hF
Q0tfSEVBREVSUyhbc3lzL3N0YXQuaF0sCi0gCQlbaGF2ZV9zdGF0X2hlYWRlcnM9eWVzXSwKLSAJ
CVtoYXZlX3N0YXRfaGVhZGVycz1ub10pCi0gCi1AQCAtMTQsNyArMTQsNyBAQCBBQ19ERUZVTihb
WkZTX0FDX0NPTkZJR19VU0VSX1NUQVRYXSwgWwotIAkJCUFDX01TR19DSEVDS0lORyhbZm9yIFNU
QVRYX01OVF9JRF0pCi0gCQkJQUNfQ09NUElMRV9JRkVMU0UoWwotIAkJCQlBQ19MQU5HX1BST0dS
QU0oW1sKLS0JCQkJCSNpbmNsdWRlIDxsaW51eC9zdGF0Lmg+Ci0rCQkJCQkjaW5jbHVkZSA8c3lz
L3N0YXQuaD4KLSAJCQkJXV0sIFtbCi0gCQkJCQlzdHJ1Y3Qgc3RhdHggc3R4OwotIAkJCQkJaW50
IG1hc2sgPSBTVEFUWF9NTlRfSUQ7Ci1AQCAtMjksNiArMjksNiBAQCBBQ19ERUZVTihbWkZTX0FD
X0NPTkZJR19VU0VSX1NUQVRYXSwgWwotIAkJCV0pCi0gCQldKQotIAldLCBbCi0tCQlBQ19NU0df
V0FSTihbbGludXgvc3RhdC5oIG5vdCBmb3VuZDsgc2tpcHBpbmcgc3RhdHggc3VwcG9ydF0pCi0r
CQlBQ19NU0dfV0FSTihbc3lzL3N0YXQuaCBub3QgZm91bmQ7IHNraXBwaW5nIHN0YXR4IHN1cHBv
cnRdKQotIAldKQotIF0pICBkbmwgZW5kIEFDX0RFRlVOCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9v
cy9saW51eC9zcGwvc3lzL3N0YXQuaCBiL2luY2x1ZGUvb3MvbGludXgvc3BsL3N5cy9zdGF0LmgK
LWluZGV4IDA4NzM4OWI1N2IzNC4uYWQyODE1ZTQ2Mzk0IDEwMDY0NAotLS0tIGEvaW5jbHVkZS9v
cy9saW51eC9zcGwvc3lzL3N0YXQuaAotKysrIGIvaW5jbHVkZS9vcy9saW51eC9zcGwvc3lzL3N0
YXQuaAotQEAgLTI1LDYgKzI1LDYgQEAKLSAjaWZuZGVmIF9TUExfU1RBVF9ICi0gI2RlZmluZQlf
U1BMX1NUQVRfSAotIAotLSNpbmNsdWRlIDxsaW51eC9zdGF0Lmg+Ci0rI2luY2x1ZGUgPHN5cy9z
dGF0Lmg+Ci0gCi0gI2VuZGlmIC8qIFNQTF9TVEFUX0ggKi8KLWRpZmYgLS1naXQgYS9saWIvbGli
c3BsL2luY2x1ZGUvb3MvbGludXgvc3lzL3N0YXQuaCBiL2xpYi9saWJzcGwvaW5jbHVkZS9vcy9s
aW51eC9zeXMvc3RhdC5oCi1pbmRleCBhNjA1YWY5NjJhNmQuLjEzY2MwYjQ2YWM5MyAxMDA2NDQK
LS0tLSBhL2xpYi9saWJzcGwvaW5jbHVkZS9vcy9saW51eC9zeXMvc3RhdC5oCi0rKysgYi9saWIv
bGlic3BsL2luY2x1ZGUvb3MvbGludXgvc3lzL3N0YXQuaAotQEAgLTMzLDcgKzMzLDcgQEAKLSAK
LSAjaWZkZWYgSEFWRV9TVEFUWAotICNpbmNsdWRlIDxmY250bC5oPgotLSNpbmNsdWRlIDxsaW51
eC9zdGF0Lmg+Ci0rI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Ci0gI2VuZGlmCi0gCi0gLyoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKaW5kZXgg
NmViY2ZiN2EzZC4uODdmNGU0NjJmMSAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLmhhc2gK
KysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6
Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0yLjMuNS96ZnMt
Mi4zLjUuc2hhMjU2LmFzYwotc2hhMjU2ICAzMjZhZTBjYmE4YTYxNWFmYTQyYzY4OTE2NDBlNzZh
Y2M0YmQyMzBmNmQ2ZGRlYzEyMGMxMWUzMGIxMzkyMDY3ICB6ZnMtMi4zLjUudGFyLmd6CisjIEZy
b20gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0y
LjQuMC96ZnMtMi40LjAuc2hhMjU2LmFzYworc2hhMjU2ICA3YmRmMTNkZTBhNzFkOTU1NTRjMGUz
ZTQ3ZDVlOGY1MDc4NmMzMGQ0ZjRiNjNiN2M1OTNiMWQxMWFmNzVjOWVlICB6ZnMtMi40LjAudGFy
Lmd6CiAKICMgSGFzaCBmb3IgbGljZW5zZSBmaWxlczoKIHNoYTI1NiAgMWZmYjcwYzMzYzRmNzlm
MDRlOTQ3ZmFjYzVjNzg1MWYyODk2MDkyNTZhYWNiNDdmYzExNWY3MDA0MjdkOTUyMCAgTElDRU5T
RQpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLm1rIGIvcGFja2FnZS96ZnMvemZzLm1rCmlu
ZGV4IDcxMmYyYWZiNTQuLjMwMjA3ZjdjZjcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL3pmcy5t
aworKysgYi9wYWNrYWdlL3pmcy96ZnMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogCi1aRlNfVkVSU0lPTiA9IDIuMy41CitaRlNfVkVSU0lPTiA9IDIuNC4w
CiBaRlNfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3du
bG9hZC96ZnMtJChaRlNfVkVSU0lPTikKIFpGU19TRUxJTlVYX01PRFVMRVMgPSB6ZnMKIFpGU19M
SUNFTlNFID0gQ0RETApkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF96ZnMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQpp
bmRleCA2OThkOGQ4YmJkLi4zODRmYWQ3ZTMzIDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3pmcy5weQpAQCAtNTcsNyArNTcsNyBAQCBjbGFzcyBUZXN0WmZzQmFzZShpbmZy
YS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICAgICAgInNoYTI1NnN1bSAtYyAvdG1wL3VyYW5k
b20uc2hhMjU2IiwKICAgICAgICAgICAgICJ6cG9vbCBzdGF0dXMgLXYiLAogICAgICAgICAgICAg
IyBDaGVjayBQeVpGUwotICAgICAgICAgICAgImFyY19zdW1tYXJ5IiwKKyAgICAgICAgICAgICJ6
YXJjc3VtbWFyeSIsCiAgICAgICAgIF0KICAgICAgICAgZm9yIGNtZCBpbiBjbWRzOgogICAgICAg
ICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQsIHRpbWVvdXQ9c2VsZi50aW1lb3V0KQotLSAKMi41
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
