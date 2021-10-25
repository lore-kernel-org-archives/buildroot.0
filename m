Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCCCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:34:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1F860240
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C1F860240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD1D40246;
	Mon, 25 Oct 2021 12:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6sRBp7SOTKC; Mon, 25 Oct 2021 12:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89DB540399;
	Mon, 25 Oct 2021 12:34:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA6091BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B71A980BBA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qh8ZU8hkgCqy for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:34:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98B8480BA0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:34:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y78so5285691wmc.0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+apNcjmZ5rBbfKIIwDhrWqBLbGgpRfPv+nbOV4ckwdE=;
 b=o83FbdSmFj4MJxQF9/wbCjAACz1SfzRWN+U9ZLX+Unq/+FC6TdtZO8cORU6zMRtPWr
 Ko3/+xsGmhuJLNVzaIw1PAfgSRNyp5/mbd2PrR3pUKFvzy4sNWz2B+7mZ+WE9cjOrCtX
 q8Bl9RAWIzWtuAtn3NKJt6MC3HWm9ZfSH6Qmh78PegcaXDQQpNOU2BEGsqkfhpey7Jde
 VQ5unh5YY2y+1h5HdKF5SP6swg4usjuMb1HVqjndVTJnmjTMXU9MFRf80OvYSqYGqA+A
 FQj/e1WfzJYAxnan76tR7V7xHcFIHtE6PC/N1cCaj/PQ1+p+iO4haaa1foITtct7M1gF
 mKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+apNcjmZ5rBbfKIIwDhrWqBLbGgpRfPv+nbOV4ckwdE=;
 b=Zkhdfo8EcHoT2kb5gki9xkrwUh0eoOXXpZ4llZ5Wj1OGhdYtozCDXmJ3unZgrJrb65
 Ez1mMrpSyIrZhj5HxqlKa8TDSF7IWGhrJm0GEh0z+cXdj31tLwwYBK65YSSxbzUF388A
 2jwGAAJcw2W3d8n87J83jvEr8RZjztxIMz7u6oL7PUGf/KJi6r2luLRPW5cdTncEeZbs
 W1TKQRKuuNnJNX8NkBeMYjfb9E0vUVUKNzqJK6+uWNr7avVI3HUyGnGl5oRnEtGobDVF
 jYmdntUp/FNMROS4GI/uXZTbXjVfPeqBmn9QVvkUK7RpRFh2q32Nib2Nz1putKZNk8Pq
 Vz1A==
X-Gm-Message-State: AOAM533R5SUcMW4E76Y3yrrkCP+5LPim3kGqYJO5y7v8Osm9B1pU0wNW
 0myta1HwQiYtQ1j1+URjMWj06fZuUIQ=
X-Google-Smtp-Source: ABdhPJym0B4gJ1fC0zPEWnVAaOmiekjbSr+kUTLuedUZFSrc+lP1Ffbk2XsaMIH0MQXXUYBVpfx5lQ==
X-Received: by 2002:a1c:1bd7:: with SMTP id b206mr9859921wmb.57.1635165253774; 
 Mon, 25 Oct 2021 05:34:13 -0700 (PDT)
Received: from localhost ([78.30.63.238])
 by smtp.gmail.com with ESMTPSA id l2sm12175905wrx.68.2021.10.25.05.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:34:13 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>
Date: Mon, 25 Oct 2021 14:31:18 +0200
Message-Id: <20211025123117.3605744-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <CAH+XeQao6Ea_p1Y20a7PqXBfhP+J1KGozTMLwQzuQieXvLwLVA@mail.gmail.com>
References: <CAH+XeQao6Ea_p1Y20a7PqXBfhP+J1KGozTMLwQzuQieXvLwLVA@mail.gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/zfs: bump version to 2.0.6
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkZWQgcGF0Y2ggZnJvbSB1cHN0cmVhbSB0aGF0IGZpeGVzIHRoZSBgbWFrZWAgZXhlY3V0ZWQg
ZnJvbSB0aGUKYGtlcm5lbC5tNGAgaW4gY3Jvc3MtcGxhdGZvcm0tY29tcGlsYXRpb25zIGVudmly
b25tZW50cy4KCkFzIHRoaXMgdmVyc2lvbiBicmluZ3Mgc3VwcG9ydCBmb3Iga2VybmVsIHVwIHRv
IDUuMTQsIHdlIHVwZGF0ZSB0aGUKdGVzdCBjYXNlcyB0byB1c2UgdGhlIDUuMTQga2VybmVsLgoK
U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQpJIGRpZG4ndCBmaW5kIGFub3RoZXIgYWx0ZXJuYXRpdmUgeWV0IHRv
OgpgYGAKWkZTX01BS0VfRU5WID0gJChMSU5VWF9NQUtFX0ZMQUdTKQpaRlNfQ09ORl9FTlYgPSAk
KExJTlVYX01BS0VfRkxBR1MpCmBgYApBbnkgc3VnZ2VzdGlvbj8KCiBwYWNrYWdlL3pmcy96ZnMu
aGFzaCAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrLS0KIHBhY2thZ2UvemZzL3pmcy5tayAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKy0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfemZzLnB5IHwgMzYgKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS96ZnMvemZzLmhhc2ggYi9wYWNrYWdlL3pmcy96ZnMuaGFzaAppbmRleCA3ZjRmNWE1
OWY4Li4wNjYyOTU5ZjZiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMuaGFzaAorKysgYi9w
YWNrYWdlL3pmcy96ZnMuaGFzaApAQCAtMSw1ICsxLDYgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMC41L3pmcy0yLjAuNS5z
aGEyNTYuYXNjCi1zaGEyNTYgIDNhMTc0OThkNzA0ZWJmNGM1ZDcyMzE2NjBmNmZiNDRhZTA3YTE1
NDU1MTlmNTY3NDUyYTQyNzA4NTFhODZlYzkgIHpmcy0yLjAuNS50YXIuZ3oKKyMgRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLTIuMC42L3pm
cy0yLjAuNi5zaGEyNTYuYXNjCitzaGEyNTYgIDQ0YjIyMTY2YjEwMzAyMmUzY2E2N2NiNzEzYWJk
Yzk5MWUyNzRlZDE0MWI2YTMwNTY4YTFiZDVjODBiMmFhOTUgIHpmcy0yLjAuNi50YXIuZ3oKK3No
YTI1NiAgNmViYzFjYjU1MmYxNDI4NjA2YjZlNzVkMmM5NTU3NDY4NWJhYjcxYTljZDhlMzY3OWQ0
MTZmNDg2ZGMwNWI3NCAgZWQzYTNiZGIwZDU5NzcyYWU0Yjg3MTljYjZmZmE2OTA2MjdiZjExMi5w
YXRjaAogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5
ZjA0ZTk0N2ZhY2M1Yzc4NTFmMjg5NjA5MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VO
U0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawpp
bmRleCAzYjFhZmI0MTlhLi4yNTlhZjk5ZjM5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMu
bWsKKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCkBAIC00LDE1ICs0LDIxIEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1aRlNfVkVSU0lPTiA9IDIuMC41CitaRlNfVkVSU0lPTiA9IDIu
MC42CiBaRlNfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9k
b3dubG9hZC96ZnMtJChaRlNfVkVSU0lPTikKIFpGU19MSUNFTlNFID0gQ0RETAogWkZTX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFIENPUFlSSUdIVAogWkZTX0NQRV9JRF9WRU5ET1IgPSBvcGVuemZz
CiBaRlNfQ1BFX0lEX1BST0RVQ1QgPSBvcGVuemZzCiAKK1pGU19QQVRDSCA9IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuemZzL3pmcy9jb21taXQvZWQzYTNiZGIwZDU5NzcyYWU0Yjg3MTljYjZmZmE2
OTA2MjdiZjExMi5wYXRjaAogWkZTX0FVVE9SRUNPTkYgPSBZRVMKIAorIyBjcm9zcyBjb21waWxl
IGVudmlyb25tZW50IGZvciBsaW51eCBrZXJuZWwgbW9kdWxlCitaRlNfTUFLRV9FTlYgPSAkKExJ
TlVYX01BS0VfRkxBR1MpCisjIGAuL2NvbmZpZ3VyZWAgd2lsbCBleGVjdXRlIGEgYG1ha2UgbW9k
dWxlc2AgdGVzdCBjYXNlCitaRlNfQ09ORl9FTlYgPSAkKExJTlVYX01BS0VfRkxBR1MpCisKIFpG
U19ERVBFTkRFTkNJRVMgPSBsaWJhaW8gb3BlbnNzbCB1ZGV2IHV0aWwtbGludXggemxpYgogCiAj
IHN5c3Zpbml0IGluc3RhbGxzIG9ubHkgYSBjb21tZW50ZWQtb3V0IG1vZHVsZXMtbG9hZC5kLyBj
b25maWcgZmlsZQpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF96ZnMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQppbmRl
eCA3NzJhNjZjMWU0Li4wM2JjZmIzYzhjIDEwMDY0NAotLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X3pmcy5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3pmcy5weQpAQCAtMywxNyArMywxNSBAQCBpbXBvcnQgb3MKIGltcG9ydCBpbmZyYS5i
YXNldGVzdAogCiAKLWNsYXNzIFRlc3RaZnNHbGliYyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgot
ICAgIGNvbmZpZyA9IFwKLSAgICAgICAgIiIiCitjbGFzcyBUZXN0WmZzQmFzZShpbmZyYS5iYXNl
dGVzdC5CUlRlc3QpOgorICAgIGNvbmZpZyA9ICIiIgogICAgICAgICBCUjJfeDg2XzY0PXkKICAg
ICAgICAgQlIyX3g4Nl9jb3JlaTc9eQogICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkK
LSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX1g4Nl82NF9DT1JFX0k3X0dM
SUJDX1NUQUJMRT15CiAgICAgICAgIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNf
RVVERVY9eQogICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKICAgICAgICAgQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTj15Ci0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjUuMTIuMTMiCisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZF
UlNJT05fVkFMVUU9IjUuMTQuMTQiCiAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RP
TV9DT05GSUc9eQogICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0i
Ym9hcmQvcWVtdS94ODZfNjQvbGludXguY29uZmlnIgogICAgICAgICBCUjJfUEFDS0FHRV9aRlM9
eQpAQCAtMjYsNiArMjQsMTMgQEAgY2xhc3MgVGVzdFpmc0dsaWJjKGluZnJhLmJhc2V0ZXN0LkJS
VGVzdCk6CiAgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKICAgICAg
ICAgIiIiCiAKKworY2xhc3MgVGVzdFpmc0dsaWJjKFRlc3RaZnNCYXNlKToKKyAgICBjb25maWcg
PSBUZXN0WmZzQmFzZS5jb25maWcgKyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJfVE9PTENI
QUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2XzY0X0NPUkVfSTdfR0xJQkNfU1RBQkxFPXkKKyAgICAg
ICAgIiIiCisKICAgICBkZWYgdGVzdF9ydW4oc2VsZik6CiAgICAgICAgIGtlcm5lbCA9IG9zLnBh
dGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgImJ6SW1hZ2UiKQogICAgICAgICBjcGlv
X2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuY3Bp
byIpCkBAIC02MCwyNyArNjUsMTAgQEAgY2xhc3MgVGVzdFpmc0dsaWJjKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6CiAgICAgICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKIAogCi1jbGFzcyBU
ZXN0WmZzVWNsaWJjKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Ci0gICAgY29uZmlnID0gXAorY2xh
c3MgVGVzdFpmc1VjbGliYyhUZXN0WmZzQmFzZSk6CisgICAgY29uZmlnID0gVGVzdFpmc0Jhc2Uu
Y29uZmlnICsgXAogICAgICAgICAiIiIKLSAgICAgICAgQlIyX3g4Nl82ND15Ci0gICAgICAgIEJS
Ml94ODZfY29yZWk3PXkKLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CiAgICAgICAg
IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfQ09SRV9JN19VQ0xJQkNfU1RB
QkxFPXkKLSAgICAgICAgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15
Ci0gICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQotICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OPXkKLSAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNS4xMi4xMyIKLSAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJ
Rz15Ci0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9x
ZW11L3g4Nl82NC9saW51eC5jb25maWciCi0gICAgICAgIEJSMl9QQUNLQUdFX1pGUz15Ci0gICAg
ICAgIEJSMl9QQUNLQUdFX1BZVEhPTjM9eQotICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fQ0ZG
ST15Ci0gICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9TRVRVUFRPT0xTPXkKLSAgICAgICAgQlIy
X1BBQ0tBR0VfWkxJQl9ORz15Ci0gICAgICAgIEJSMl9QQUNLQUdFX0xJQlJFU1NMPXkKLSAgICAg
ICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15Ci0gICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNf
VEFSIGlzIG5vdCBzZXQKICAgICAgICAgIiIiCiAKICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Ci0t
IAoyLjMzLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
