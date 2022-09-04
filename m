Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AFFECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 15:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5EC44088D;
	Sun,  4 Sep 2022 15:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5EC44088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0dnaX1yhXxf; Sun,  4 Sep 2022 15:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD024032F;
	Sun,  4 Sep 2022 15:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BD024032F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95EF91BF34B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 15:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76075813EB
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 15:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76075813EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2Ws4Je55DxR for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 15:05:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B82813E0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44B82813E0
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 15:05:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e20so8250381wri.13
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 08:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=BxPPT2oIsBganwOAxcjNopT0PTXT+OfqU0x0YQzJxbg=;
 b=wfxR+M/O57XxuqVH5v3bYsmMBR6P58IW9Hr7KletsY2BV9emLxps9bNg/QeBboz/vh
 n9488CKL4MWrKUyivZNmpaqTmu82Sq7Ow4cWK1SKoHEU4/oHm02BSJnEuJRrjuTUJTk6
 5zH8nMVPWGrhXYNYjOF3ZFrbaDJbWCdbQ/0Q9yD/QSKyO83KLmZXqhcTrgS1a1aqxxAG
 Evem62R7lS66Opl2tQFSjTDf3++n3ufME9mML3wf8yVINE4QrC+bP/ABLlqn0wz65iQi
 dIqk0J32Kx0XW2jY14grPFs8lcWXjVK5zI3BhSzZP1ckt5MSdXoLTNFCXDdILfyr1Qu9
 5EOQ==
X-Gm-Message-State: ACgBeo3NaGeUmumkUV4DiJ3eQTKBxCdyW6GzTlGhyflgx6zbD5YVm1Sd
 bZer50uv5QRB2AXnp1nyfXfusA1scwk=
X-Google-Smtp-Source: AA6agR4aigGgi+/2jRpJO47S+N8UkoCID5n8BOp+qg+1gwVyPZQgv8s4RubCdtgdiMI6EbGKUPuF7Q==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr22064085wrb.487.1662303945118; 
 Sun, 04 Sep 2022 08:05:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003a5e7435190sm16412712wms.32.2022.09.04.08.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 08:05:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 17:05:41 +0200
Message-Id: <20220904150541.368134-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=BxPPT2oIsBganwOAxcjNopT0PTXT+OfqU0x0YQzJxbg=;
 b=J2cxEz84KsmbbuhQDWjmEtIznpNVDHLXBQJHdeTGyukJOtfCUvcY/i8VfWZaRov/3I
 RMqY5IfhRXtd8Koi94870Bz3tx9cb7BnsUf/rli4Oq7NAGlvDvB03A0yHmfK+oPu16Lx
 XXyEbBk6o73bzgkNB9yvtqyXr3zPQIUcNocKtDwmS4BqcRFewzGx8MqOC09uRUJxMbWL
 8RW+qDtenwYaNIGhFhvwKI8C3hgf5rx+CQ7PNfLiP8bvfm26NnvZsOnW+0lL79Ml7I/6
 G0/fchksAJ++c7FGKaPjWvzO0ByU9w8NOQl270TGmx2jJpJGKpHFTWkHVnx1qOnabyUh
 8IMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J2cxEz84
Subject: [Buildroot] [PATCH/next 1/1] package/cracklib: bump to version 2.9.8
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
 =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCAoYWxyZWFkeSBpbiB2ZXJzaW9uKQoKaHR0cHM6Ly9naXRodWIuY29tL2NyYWNr
bGliL2NyYWNrbGliL2Jsb2IvdjIuOS44L3NyYy9ORVdTCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNl
IEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi5lYXQtdGhlLWlu
cHV0LWFzLXRleHQtd2hlbi1mb3JtYXR0aW4ucGF0Y2ggfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0t
CiBwYWNrYWdlL2NyYWNrbGliL2NyYWNrbGliLmhhc2ggICAgICAgICAgICAgICAgfCAgNCArLS0K
IHBhY2thZ2UvY3JhY2tsaWIvY3JhY2tsaWIubWsgICAgICAgICAgICAgICAgICB8ICA3ICsrKy0t
CiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jcmFja2xpYi8wMDAxLUZvcmNlLWdyZXAtdG8tdHJlYXQt
dGhlLWlucHV0LWFzLXRleHQtd2hlbi1mb3JtYXR0aW4ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2NyYWNrbGliLzAwMDEtRm9yY2UtZ3JlcC10by10cmVhdC10aGUtaW5wdXQtYXMtdGV4dC13
aGVuLWZvcm1hdHRpbi5wYXRjaCBiL3BhY2thZ2UvY3JhY2tsaWIvMDAwMS1Gb3JjZS1ncmVwLXRv
LXRyZWF0LXRoZS1pbnB1dC1hcy10ZXh0LXdoZW4tZm9ybWF0dGluLnBhdGNoCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCBiMDVhNjljYWEyLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2Uv
Y3JhY2tsaWIvMDAwMS1Gb3JjZS1ncmVwLXRvLXRyZWF0LXRoZS1pbnB1dC1hcy10ZXh0LXdoZW4t
Zm9ybWF0dGluLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzAgKzAsMCBAQAotRnJvbSBkMjcw
NjJmZTdhNTIwZDU3OTFmN2E1NmQxNzVhNWNiNmEzOWJhZTYxIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQotRnJvbTogPT9VVEYtOD9xP1N0ZWZhbj0yMFM9QzM9QjhyZW5zZW4/PSA8c3RlZmFuLnNv
cmVuc2VuQHNwZWN0cmFsaW5rLmNvbT4KLURhdGU6IFR1ZSwgMTggQXByIDIwMTcgMTI6MDA6Mzkg
KzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gRm9yY2UgZ3JlcCB0byB0cmVhdCB0aGUgaW5wdXQgYXMg
dGV4dCB3aGVuIGZvcm1hdHRpbmcgd29yZAotIGZpbGVzLgotTUlNRS1WZXJzaW9uOiAxLjAKLUNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAotCi1TaWduZWQtb2ZmLWJ5OiBTdGVmYW4gU8O4cmVuc2VuIDxzdGVmYW4u
c29yZW5zZW5Ac3BlY3RyYWxpbmsuY29tPgotLS0tCi0gdXRpbC9jcmFja2xpYi1mb3JtYXQgfCAy
ICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRp
ZmYgLS1naXQgYS91dGlsL2NyYWNrbGliLWZvcm1hdCBiL3V0aWwvY3JhY2tsaWItZm9ybWF0Ci1p
bmRleCAxZDdiZTViLi5iMWRlOGU4IDEwMDY0NAotLS0tIGEvdXRpbC9jcmFja2xpYi1mb3JtYXQK
LSsrKyBiL3V0aWwvY3JhY2tsaWItZm9ybWF0Ci1AQCAtNCw3ICs0LDcgQEAKLSAjIGludG8gY3Jh
Y2tsaWItcGFja2VyCi0gIwotIGd6aXAgLWNkZiAiJEAiIHwKLS0gICAgZ3JlcCAtdiAnXlwoI1x8
JFwpJyB8Ci0rICAgIGdyZXAgLWEgLXYgJ15cKCNcfCRcKScgfAotICAgICB0ciAnW0EtWl0nICdb
YS16XScgfAotICAgICB0ciAtY2QgJ1wwMTJbYS16XVswLTldJyB8Ci0gICAgIGVudiBMQ19BTEw9
QyBzb3J0IC11Ci0tLSAKLTIuOS4zCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvY3JhY2tsaWIvY3Jh
Y2tsaWIuaGFzaCBiL3BhY2thZ2UvY3JhY2tsaWIvY3JhY2tsaWIuaGFzaAppbmRleCA3MzViY2Zl
ZGQyLi5mZjUyN2Q1MTdhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NyYWNrbGliL2NyYWNrbGliLmhh
c2gKKysrIGIvcGFja2FnZS9jcmFja2xpYi9jcmFja2xpYi5oYXNoCkBAIC0xLDQgKzEsNCBAQAog
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgOGI2ZmQyMDJmM2YxZDhmYTM5NWQzYjdhNWQ4
MjEyMjdjZmQ4YmI0YTlhNTg0YTdhZTMwY2Y2MmNlYTYyODdkZCAgY3JhY2tsaWItMi45LjcudGFy
Lmd6Ci1zaGEyNTYgIDdmMGM0NWZhZjg0YTI0OTRmMTVkMWUyNzIwMzk0YWNhNGEzNzkxNjNhNzBj
NGFjYWQ5NDgxODZjMDA0N2QzODkgIGNyYWNrbGliLXdvcmRzLTIuOS43Lmd6CitzaGEyNTYgIDFm
OWQzNDM4NWVhM2FhN2NkN2MwN2ZhMzg4ZGMyNTgxMGFlYTlkM2MzM2UyNjBjNzEzYTNhNTg3M2Q3
MGUzODYgIGNyYWNrbGliLTIuOS44LnRhci5iejIKK3NoYTI1NiAgZWMyNWFjNGE0NzQ1ODhjNThk
OTAxNzE1NTEyZDg5MDJiMjc2NTQyYjI3YjhkZDE5N2U5YzJhZDM3MzczOWVjNCAgY3JhY2tsaWIt
d29yZHMtMi45LjguYnoyCiBzaGEyNTYgIGYxOGEwODExZmEwZTIyMGNjYmM0MmY2NjE1NDVlNzdm
MDM4ODYzMWUyMDk1ODVlZDU4MmExYzY5MzAyOWM2YWEgIENPUFlJTkcuTElCCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2NyYWNrbGliL2NyYWNrbGliLm1rIGIvcGFja2FnZS9jcmFja2xpYi9jcmFja2xp
Yi5tawppbmRleCA0NjkxN2I3OTI2Li5iYjdjMThkNWJlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Ny
YWNrbGliL2NyYWNrbGliLm1rCisrKyBiL3BhY2thZ2UvY3JhY2tsaWIvY3JhY2tsaWIubWsKQEAg
LTQsNyArNCw4IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1DUkFDS0xJQl9WRVJT
SU9OID0gMi45LjcKK0NSQUNLTElCX1ZFUlNJT04gPSAyLjkuOAorQ1JBQ0tMSUJfU09VUkNFID0g
Y3JhY2tsaWItJChDUkFDS0xJQl9WRVJTSU9OKS50YXIuYnoyCiBDUkFDS0xJQl9TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL2NyYWNrbGliL2NyYWNrbGliL3JlbGVhc2VzL2Rvd25sb2FkL3YkKENS
QUNLTElCX1ZFUlNJT04pCiBDUkFDS0xJQl9MSUNFTlNFID0gTEdQTC0yLjEKIENSQUNLTElCX0xJ
Q0VOU0VfRklMRVMgPSBDT1BZSU5HLkxJQgpAQCAtMzMsOCArMzQsOCBAQCBlbmRpZgogSE9TVF9D
UkFDS0xJQl9DT05GX09QVFMgKz0gLS13aXRob3V0LXB5dGhvbiAtLXdpdGhvdXQtemxpYgogCiBp
ZmVxICgkKEJSMl9QQUNLQUdFX0NSQUNLTElCX0ZVTExfRElDVCkseSkKLUNSQUNLTElCX0VYVFJB
X0RPV05MT0FEUyA9IGNyYWNrbGliLXdvcmRzLSQoQ1JBQ0tMSUJfVkVSU0lPTikuZ3oKLUNSQUNL
TElCX0RJQ1RfU09VUkNFID0gJChDUkFDS0xJQl9ETF9ESVIpL2NyYWNrbGliLXdvcmRzLSQoQ1JB
Q0tMSUJfVkVSU0lPTikuZ3oKK0NSQUNLTElCX0VYVFJBX0RPV05MT0FEUyA9IGNyYWNrbGliLXdv
cmRzLSQoQ1JBQ0tMSUJfVkVSU0lPTikuYnoyCitDUkFDS0xJQl9ESUNUX1NPVVJDRSA9ICQoQ1JB
Q0tMSUJfRExfRElSKS9jcmFja2xpYi13b3Jkcy0kKENSQUNLTElCX1ZFUlNJT04pLmJ6MgogZWxz
ZQogQ1JBQ0tMSUJfRElDVF9TT1VSQ0UgPSAkKEBEKS9kaWN0cy9jcmFja2xpYi1zbWFsbAogZW5k
aWYKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
