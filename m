Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32E7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824A3610A0
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 824A3610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA8D60668;
	Sat, 13 Nov 2021 17:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXo8Qx3h0atu; Sat, 13 Nov 2021 17:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8199C60623;
	Sat, 13 Nov 2021 17:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC7A1BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7743760623
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7OzuSNH4B5s2 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCDDC605DD
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:27:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b12so21525641wrh.4
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oV12nuEllQYoWm66m5YlLZ09j+QpKeScqq+f/rIJKNQ=;
 b=OQPQ4EC+AvULHBmF0x63MSgPOcz0WOqXkMlaOXqtsEbalzs3IurVedM78GmIAQH875
 4Y9U2VNo086w29h4urQrUk++6ydUq15qvOX0OJrvjyKAcR3UVtM0ryNL46VO/usm5zGj
 6YZUuN6hVuOCoen2gzY71+aNcrZvNdZpTdrBqxQY5go6bcHH1ubCz+RnPfocFEzfS581
 z0RQKdGZYtcFbfqSLIF9Yf6VggYHX1ppv9wJ8CuDgw7z3f6faJEEpopuzvEISO35w1B3
 DFKKtl+7P3lsrED+ioBckzPyMtubkvhpjVeLazoeyvKSEBxxrRHhTR4GZOORa97C7l8l
 98HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oV12nuEllQYoWm66m5YlLZ09j+QpKeScqq+f/rIJKNQ=;
 b=kfIIgk3n2Atpfh62jVil8GptMLOY0bGMpKiv8ybIRG8j9hyGroVhO8UN+kZRLX09l3
 PMpfk3+s3f1fBiFZfyWrhhsVR+zUveFz2+h2lOQqyY8oDtdesAcEVpwa5PNAxNuHO/iT
 Idql8YxWePUywKlfdUlAk47OYJhzdC7DbnPTFwTZrqg9ewIYEK3JT3k66au77ZFkOaTd
 8sCTGTPnAO9TYKGhqFc3z3Vdk6XdKF0dN+EEz1MWpIKznrsSqnk0/thP9pdKLeXi/p3O
 J3e8mNy10JqGohM4NMksy99scg8GGMURF7WEZrdeoGXuZaXnagi3cghfL/KFimc+5bxE
 6dBA==
X-Gm-Message-State: AOAM5315q95plZFDLLOnxZcBDSAwHMlwA4zftQ1uUBas0Ik4KzIbNXUV
 ddWUEkPccOQtN4mjCujot54bZsw0gZ4=
X-Google-Smtp-Source: ABdhPJys351NkuT9K+aIUCeYx0/4CjWhZ3+gSe/I/oOJ9dRKkzbPKnER9mbPloID+JklsHuR5zTQgw==
X-Received: by 2002:a05:6000:1841:: with SMTP id
 c1mr29862154wri.425.1636824475786; 
 Sat, 13 Nov 2021 09:27:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q8sm8828522wrx.71.2021.11.13.09.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 09:27:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:25:54 +0100
Message-Id: <20211113172554.583637-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/squashfs: bump to version 4.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBEcm9wIHBhdGNoIChhbHJlYWR5IGluIHZlcnNpb24pCi0gVXBkYXRlIGluZGVudGF0aW9uIGlu
IGhhc2ggZmlsZSAodHdvIHNwYWNlcykKCmh0dHBzOi8vZ2l0aHViLmNvbS9wbG91Z2hlci9zcXVh
c2hmcy10b29scy9ibG9iLzQuNS9DSEFOR0VTCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi5vbHMtZml4LWJ1aWxkLWZh
aWx1cmUtYWdhaW5zdC1nY2MtMTAucGF0Y2ggfCA0OSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNr
YWdlL3NxdWFzaGZzL3NxdWFzaGZzLmhhc2ggICAgICAgICAgICAgICAgfCAgNCArLQogcGFja2Fn
ZS9zcXVhc2hmcy9zcXVhc2hmcy5tayAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3NxdWFzaGZzLzAwMDEtc3F1YXNoZnMtdG9vbHMtZml4LWJ1aWxkLWZhaWx1
cmUtYWdhaW5zdC1nY2MtMTAucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NxdWFzaGZzLzAw
MDEtc3F1YXNoZnMtdG9vbHMtZml4LWJ1aWxkLWZhaWx1cmUtYWdhaW5zdC1nY2MtMTAucGF0Y2gg
Yi9wYWNrYWdlL3NxdWFzaGZzLzAwMDEtc3F1YXNoZnMtdG9vbHMtZml4LWJ1aWxkLWZhaWx1cmUt
YWdhaW5zdC1nY2MtMTAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE1ZmM0
ODdhYWMuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9zcXVhc2hmcy8wMDAxLXNxdWFzaGZzLXRv
b2xzLWZpeC1idWlsZC1mYWlsdXJlLWFnYWluc3QtZ2NjLTEwLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsNDkgKzAsMCBAQAotRnJvbSBlMWNkY2ZkOTQxNzJhMGIxYmE0YzlkZjcwZjRkNjlhNDFj
Njg3NDA0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogU2VyZ2VpIFRyb2ZpbW92aWNo
IDxzbHlmb3hAZ2VudG9vLm9yZz4KLURhdGU6IFN1biwgMjYgSmFuIDIwMjAgMTg6MzU6MTMgKzAw
MDAKLVN1YmplY3Q6IFtQQVRDSF0gc3F1YXNoZnMtdG9vbHM6IGZpeCBidWlsZCBmYWlsdXJlIGFn
YWluc3QgZ2NjLTEwCi1NSU1FLVZlcnNpb246IDEuMAotQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Ci0KLU9uIGdj
Yy0xMCAoYW5kIGdjYy05IC1mbm8tY29tbW9uKSBidWlsZCBmYWlscyBhczoKLQotYGBgCi1jYyAu
Li4gLW8gbWtzcXVhc2hmcwotbGQ6IHJlYWRfZnMubzooLmJzcysweDApOgotICBtdWx0aXBsZSBk
ZWZpbml0aW9uIG9mIGBmd3JpdGVyX2J1ZmZlcic7IG1rc3F1YXNoZnMubzooLmJzcysweDQwMGM5
MCk6IGZpcnN0IGRlZmluZWQgaGVyZQotbGQ6IHJlYWRfZnMubzooLmJzcysweDgpOgotICBtdWx0
aXBsZSBkZWZpbml0aW9uIG9mIGBid3JpdGVyX2J1ZmZlcic7IG1rc3F1YXNoZnMubzooLmJzcysw
eDQwMGM5OCk6IGZpcnN0IGRlZmluZWQgaGVyZQotYGBgCi0KLWdjYy0xMCB3aWxsIGNoYW5nZSB0
aGUgZGVmYXVsdCBmcm9tIC1mY29tbW9uIHRvIGZuby1jb21tb246Ci1odHRwczovL2djYy5nbnUu
b3JnL1BSODU2NzguCi0KLVRoZSBlcnJvciBhbHNvIGhhcHBlbnMgaWYgQ0ZMQUdTPS1mbm8tY29t
bW9uIHBhc3NlZCBleHBsaWNpdGx5LgotCi1SZXBvcnRlZC1ieTogVG9yYWxmIEbDtnJzdGVyCi1C
dWc6IGh0dHBzOi8vYnVncy5nZW50b28ub3JnLzcwNjQ1NgotU2lnbmVkLW9mZi1ieTogU2VyZ2Vp
IFRyb2ZpbW92aWNoIDxzbHlmb3hAZ2VudG9vLm9yZz4KLQotW1Vwc3RyZWFtOiBodHRwczovL2dp
dGh1Yi5jb20vcGxvdWdoZXIvc3F1YXNoZnMtdG9vbHMvY29tbWl0L2ZlMmY1ZGE0YjBmODk5NDE2
OWM1M2U4NGI3Y2I4YTBmZWVmYzk3YjUucGF0Y2hdCi1TaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlk
ZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLS0KLSBzcXVhc2hmcy10b29scy9ta3NxdWFzaGZz
LmggfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Ci0KLWRpZmYgLS1naXQgYS9zcXVhc2hmcy10b29scy9ta3NxdWFzaGZzLmggYi9zcXVhc2hmcy10
b29scy9ta3NxdWFzaGZzLmgKLWluZGV4IDFiZWVmZWYuLmI2NTAzMDYgMTAwNjQ0Ci0tLS0gYS9z
cXVhc2hmcy10b29scy9ta3NxdWFzaGZzLmgKLSsrKyBiL3NxdWFzaGZzLXRvb2xzL21rc3F1YXNo
ZnMuaAotQEAgLTE0Myw3ICsxNDMsNyBAQCBzdHJ1Y3QgYXBwZW5kX2ZpbGUgewotICNlbmRpZgot
IAotIGV4dGVybiBzdHJ1Y3QgY2FjaGUgKnJlYWRlcl9idWZmZXIsICpmcmFnbWVudF9idWZmZXIs
ICpyZXNlcnZlX2NhY2hlOwotLXN0cnVjdCBjYWNoZSAqYndyaXRlcl9idWZmZXIsICpmd3JpdGVy
X2J1ZmZlcjsKLStleHRlcm4gc3RydWN0IGNhY2hlICpid3JpdGVyX2J1ZmZlciwgKmZ3cml0ZXJf
YnVmZmVyOwotIGV4dGVybiBzdHJ1Y3QgcXVldWUgKnRvX3JlYWRlciwgKnRvX2RlZmxhdGUsICp0
b193cml0ZXIsICpmcm9tX3dyaXRlciwKLSAJKnRvX2ZyYWcsICpsb2NrZWRfZnJhZ21lbnQsICp0
b19wcm9jZXNzX2ZyYWc7Ci0gZXh0ZXJuIHN0cnVjdCBhcHBlbmRfZmlsZSAqKmZpbGVfbWFwcGlu
ZzsKLS0tIAotMi4yNi4yCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3F1YXNoZnMvc3F1YXNoZnMu
aGFzaCBiL3BhY2thZ2Uvc3F1YXNoZnMvc3F1YXNoZnMuaGFzaAppbmRleCAxZjA4YjUzMGEwLi4w
OWEyYmFlMzY0IDEwMDY0NAotLS0gYS9wYWNrYWdlL3NxdWFzaGZzL3NxdWFzaGZzLmhhc2gKKysr
IGIvcGFja2FnZS9zcXVhc2hmcy9zcXVhc2hmcy5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2Nh
bGx5IGNvbXB1dGVkCi1zaGEyNTYgYTdmYTQ4NDVlOTkwODUyM2MzOGQ0YWNmOTJmOGE0MWZkZmNk
MTlkZWY0MWJkNTA5MGQ3YWQ3NjdhNmRjNzVjMyBzcXVhc2hmcy00LjQudGFyLmd6CitzaGEyNTYg
IGI5ZTE2MTg4ZTZkYzE4NTdmZTMxMjYzMzkyMGY3ZDcxY2MzNmIwMTYyZWI1MGYzZWNiMWYwMDQw
ZjAyZWRkZGQgIHNxdWFzaGZzLTQuNS50YXIuZ3oKIAogIyBMaWNlbnNlIGZpbGVzCi1zaGEyNTYg
ODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIx
Yjg4MDY0MyBDT1BZSU5HCitzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2
YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3F1YXNoZnMvc3F1YXNoZnMubWsgYi9wYWNrYWdlL3NxdWFzaGZzL3NxdWFzaGZzLm1r
CmluZGV4IGNiYzNjOTA2ZDguLmY2NGQ0NDFjOWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3F1YXNo
ZnMvc3F1YXNoZnMubWsKKysrIGIvcGFja2FnZS9zcXVhc2hmcy9zcXVhc2hmcy5tawpAQCAtNCw3
ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVNRVUFTSEZTX1ZFUlNJT04g
PSA0LjQKK1NRVUFTSEZTX1ZFUlNJT04gPSA0LjUKIFNRVUFTSEZTX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLHBsb3VnaGVyLHNxdWFzaGZzLXRvb2xzLCQoU1FVQVNIRlNfVkVSU0lPTikpCiBTUVVBU0hG
U19MSUNFTlNFID0gR1BMLTIuMCsKIFNRVUFTSEZTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCi0t
IAoyLjMzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
