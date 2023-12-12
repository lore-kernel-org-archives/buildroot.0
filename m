Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64252C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 13:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C6B4097B;
	Tue, 12 Dec 2023 13:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C6B4097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9F_j1czfOHLs; Tue, 12 Dec 2023 13:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C3F040942;
	Tue, 12 Dec 2023 13:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3F040942
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 408861BF86B
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 13:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE7A4094B
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 13:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE7A4094B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tl50RXyraecc for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 13:56:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7D4C40935
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 13:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D4C40935
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so33344275e9.3
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 05:56:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702389405; x=1702994205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3Onw2A7dJ6JZuNR/0gd+WSRZiheGya0CK3aULSGHLQ=;
 b=DBbgH61xC+Dr+YRykPFqYz5PNxb2wD7cwAB740AqPKKPs+GDDOVOZvd06xaCYQZxU6
 ql3fSgddSstGnuVpdAFnzk5HafSw6eZhURH5nFMwNp8uSIG1jgkqgu3D3x3Mnt9Acqms
 Oz+R5OXrI64c1ZL6+UbgCE49/AE23gPh6kxyZbrZxcYLX4BfxCtLICpGhKZShUlQWAsE
 JKPXaOAUbwNzbQZEWwdMxwwrxNVzQWWShJtSuM5ySdR7DzGOcITNbR5haJwuSi+UHLZA
 bf/6fGNA3CnmKOAdRvVUmnwGB+qRAUIoTc62nXF7Y+Va4A743L4Pnjut6t1ODOQ1ACEF
 bDYA==
X-Gm-Message-State: AOJu0YwptwXGtfNN1H91M8j/oKAAOlCtTA3JOQiFku/gKMFTRoLdF+2U
 SEhzrG/Fc2D7GcZrdCIcEoZdwl7ol+6e0g==
X-Google-Smtp-Source: AGHT+IGetJlFnkDDRnGFj0jVO8t/tkqHFAypls2aKORcKKTQvTKuSCq2m5W/nW5KNvrkGTMU25MnBQ==
X-Received: by 2002:a05:600c:3c83:b0:40c:4a25:8cf9 with SMTP id
 bg3-20020a05600c3c8300b0040c4a258cf9mr1407994wmb.50.1702389404632; 
 Tue, 12 Dec 2023 05:56:44 -0800 (PST)
Received: from thomas-Precision-7670.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.gmail.com with ESMTPSA id
 bg16-20020a05600c3c9000b0040c517d090esm2261930wmb.15.2023.12.12.05.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 05:56:44 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 14:56:34 +0100
Message-Id: <20231212135634.225795-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1] package/mesa3d: add compile patch for linux
 < 3.5
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGtjbXAoKSBzeXN0ZW0gY2FsbCBmaXJzdCBhcHBlYXJlZCBpbiBsaW51eCAzLjUsCmFuZCB3
YXMgYWxzbyBub3QgdGhlcmUgYmVmb3JlIGxpbnV4IDUuMTIgaWYKQ09ORklHX0NIRUNLUE9JTlRf
UkVTVE9SRSB3YXMgbm90IHNldC4KClNlZTogaHR0cHM6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFn
ZXMvbWFuMi9rY21wLjIuaHRtbAoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9t
YXNAZGV2b29nZHQuY29tPgotLS0KIC4uLmVfZGVzY3JpcHRpb24tZml4LXVua25vd24tbGludXgt
My41LS5wYXRjaCB8IDcwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MCBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tZXNhM2QvMDAwNS11dGls
LW9zX3NhbWVfZmlsZV9kZXNjcmlwdGlvbi1maXgtdW5rbm93bi1saW51eC0zLjUtLnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvMDAwNS11dGlsLW9zX3NhbWVfZmlsZV9kZXNjcmlw
dGlvbi1maXgtdW5rbm93bi1saW51eC0zLjUtLnBhdGNoIGIvcGFja2FnZS9tZXNhM2QvMDAwNS11
dGlsLW9zX3NhbWVfZmlsZV9kZXNjcmlwdGlvbi1maXgtdW5rbm93bi1saW51eC0zLjUtLnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQ2NmE1MGFhZjUKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL21lc2EzZC8wMDA1LXV0aWwtb3Nfc2FtZV9maWxlX2Rlc2Ny
aXB0aW9uLWZpeC11bmtub3duLWxpbnV4LTMuNS0ucGF0Y2gKQEAgLTAsMCArMSw3MCBAQAorRnJv
bSBiNjA5NzRmYWM4YTJmNGM4NWNiYjJjYTc4OGZjNGVjM2U4MTk5OGY5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28u
Y29tPgorRGF0ZTogVHVlLCAxNyBBdWcgMjAyMSAxMTo1NDo0OSArMDIwMAorU3ViamVjdDogW1BB
VENIXSB1dGlsOiBvc19zYW1lX2ZpbGVfZGVzY3JpcHRpb246IGZpeCB1bmtub3duIGxpbnV4IDwg
My41Cisgc3lzY2FsbCBTWVNfa2NtcAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTog
dGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAorCitodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW4yL2tjbXAuMi5odG1sCisK
K1RoZSBrY21wKCkgc3lzdGVtIGNhbGwgZmlyc3QgYXBwZWFyZWQgaW4gTGludXggMy41LgorCitC
dXQgd2FzIHByb2JhYmx5IGFsc28gbm90IHN1cHBvcnRlZCBieSBhbGwgbWFqb3IgcGxhdGZvcm1z
CithdCB0aGF0IHRpbWUuIFNvIGZhbGxiYWNrIHRvIHRoZSBjaGVjayB0aGF0IGlzIGRvbmUgZm9y
IHdpbmRvd3MuCisKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9v
Z2R0QGJhcmNvLmNvbT4KK0Fja2VkLWJ5OiBZb25nZ2FuZyBMdW8gPGx1b3lvbmdnYW5nQGdtYWls
LmNvbT4KK0Fja2VkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KK1Bh
cnQtb2Y6IDxodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVyZ2Vf
cmVxdWVzdHMvMTg1MTc+CisoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAzZWY1MTQ5ODI0NDFj
ZTQ5NmFhMTI3NjExZWRkMjZiOTg2N2Y0Yjk1KQorVXBzdHJlYW06IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8xODUxNworU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPgorLS0tCisgc3JjL3V0
aWwvb3NfZmlsZS5jIHwgMTggKysrKysrLS0tLS0tLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvdXRpbC9v
c19maWxlLmMgYi9zcmMvdXRpbC9vc19maWxlLmMKK2luZGV4IDVmYjMwZjJkOTA4Li40NjQ0MjVh
OWI4NyAxMDA2NDQKKy0tLSBhL3NyYy91dGlsL29zX2ZpbGUuYworKysrIGIvc3JjL3V0aWwvb3Nf
ZmlsZS5jCitAQCAtMjAyLDI5ICsyMDIsMjMgQEAgb3NfcmVhZF9maWxlKGNvbnN0IGNoYXIgKmZp
bGVuYW1lLCBzaXplX3QgKnNpemUpCisgLyogY29waWVkIGZyb20gPGxpbnV4L2tjbXAuaD4gKi8K
KyAjZGVmaW5lIEtDTVBfRklMRSAwCisgCisrI2VuZGlmCisrCisgaW50Cisgb3Nfc2FtZV9maWxl
X2Rlc2NyaXB0aW9uKGludCBmZDEsIGludCBmZDIpCisgeworKyNpZmRlZiBTWVNfa2NtcAorICAg
IHBpZF90IHBpZCA9IGdldHBpZCgpOworKyNlbmRpZgorIAorICAgIC8qIFNhbWUgZmlsZSBkZXNj
cmlwdG9yIHRyaXZpYWxseSBpbXBsaWVzIHNhbWUgZmlsZSBkZXNjcmlwdGlvbiAqLworICAgIGlm
IChmZDEgPT0gZmQyKQorICAgICAgIHJldHVybiAwOworIAorKyNpZmRlZiBTWVNfa2NtcAorICAg
IHJldHVybiBzeXNjYWxsKFNZU19rY21wLCBwaWQsIHBpZCwgS0NNUF9GSUxFLCBmZDEsIGZkMik7
CistfQorLQorICNlbHNlCistCistaW50Cistb3Nfc2FtZV9maWxlX2Rlc2NyaXB0aW9uKGludCBm
ZDEsIGludCBmZDIpCisteworLSAgIC8qIFNhbWUgZmlsZSBkZXNjcmlwdG9yIHRyaXZpYWxseSBp
bXBsaWVzIHNhbWUgZmlsZSBkZXNjcmlwdGlvbiAqLworLSAgIGlmIChmZDEgPT0gZmQyKQorLSAg
ICAgIHJldHVybiAwOworLQorICAgIC8qIE90aGVyd2lzZSB3ZSBjYW4ndCB0ZWxsICovCisgICAg
cmV0dXJuIC0xOworLX0KKy0KKyAjZW5kaWYKKyt9CistLSAKKzIuMzQuMQorCi0tIAoyLjM0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
