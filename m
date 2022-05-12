Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF72DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D81C60B93;
	Thu, 12 May 2022 21:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4BogLC4yYz7; Thu, 12 May 2022 21:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7977160B4F;
	Thu, 12 May 2022 21:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B79781BF3D4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A649940462
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8V3IEsb4kXJ for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B04F640412
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:49:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h16so8313472wrb.2
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLBo3ughwyi2R7ZsTT+LmcBNNF2jemTRI7vnzwHsNHU=;
 b=B6yFv0IU/Jqexiu1z36QPv0/Ap2sAIyexrWo5zhQPxosNSgYAvEXG60DueElISo2Y3
 sgAhK+Z8SCCHh2CnXcnJo6+s7xNaHBACtyfW+HWtPoWaR5YF1dUAcFX8CdQD3YAYc6CO
 bV7lbfcSJ/WwKB3nUSVbYpJsfjRx3zB1FzXS4ZuJAESbpGwWoj/2IZldM6l2h0frhqu0
 33d1bdhKFRJuc7J3yiDH4iW91XnW6GOWFuTnPjAj0P9r1VMbjoVe1OVAJl9/frz5Zqq+
 Xhs/l2d3qtuMkXRyfLCu/tBv4SKOmKPmlWVGULiDJXlrgT39KJVNVZCw1RmuOrRE55/M
 IYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLBo3ughwyi2R7ZsTT+LmcBNNF2jemTRI7vnzwHsNHU=;
 b=uyEEDQlbBCF8a1m4nYMgmxKrjfnXHOh1/6eASURqeQP+JJgd8rzl+3s/B4mdO6jCkg
 CgJDea8ixmmDR/lmr4ni472XcjZbjBocN8n3N8WeZyRD3z0xZ8FABpqMbNa8vVBKV3KS
 mkWr2J3+lXSt1To462+9NJCZCw8f+Xhf2SGV4GVqaGrVnWeA1ddk6MmNYEBEP+qPLuPG
 +/kuY2jEcPBLCUBP8Jz41WU7BiWdTIJUbNMzywhEGnpl57kUbaigHchPRcuFd+sA/h4q
 OCoS7qqb7yDhS2Gm57Xy7+GFdy/NfA3yenRGVYki4lOFlDkfu3iRXoR38wQEyODPGGRE
 X5Tw==
X-Gm-Message-State: AOAM5338hoLOypKPQyvtTQ6YZsNF0YuBeyvV7P7PnEgkEBld5E5eGuvf
 2AWk4lVhiI6wtYb1M51MDA57AqPiNLo=
X-Google-Smtp-Source: ABdhPJxla1nDhCH4pCfQiENV1YOa3zrOtU4QyNdTprY2u0Hent2vlTH3cdn39sbLSc8RvOjEdpF4Tg==
X-Received: by 2002:a5d:6d8d:0:b0:20c:5f60:d551 with SMTP id
 l13-20020a5d6d8d000000b0020c5f60d551mr1346004wrs.427.1652392151754; 
 Thu, 12 May 2022 14:49:11 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c4a0600b003942a244f29sm3525525wmp.2.2022.05.12.14.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 14:49:10 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 23:49:04 +0200
Message-Id: <20220512214906.96815-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: test_zfs: don't run
 TestZfsBase as a test
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGNvbW1pdCBbMV0gaW50cm9jdWRlZCBUZXN0WmZzQmFzZSBhcyBhIGNvbW1vbiBmdW5jdGlv
bgpiZXR3ZWVuIGFsbCBaZnMgdGVzdHMuIEJ1dCBUZXN0WmZzQmFzZSB0ZXN0IGlzIGV4ZWN1dGVk
CmFzIGEgdGVzdCBpdHNlbGYuCgpSZW5hbWUgdGVzdF9ydW4oKSB0byBiYXNlX3Rlc3RfcnVuKCkg
dG8gYXZvaWQgdGhpcyBpc3N1ZS4KCkZpeGVzOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzI0MjkwMTQwMDYKClsxXSA1OTNlOGNiNzFmOGYyYWM2OTg4
OTQyNGJiZWY1YWIwOWMwZGJiMDZlCgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+CkNjOiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9y
Lmpvc2VsdWlzQGdtYWlsLmNvbT4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3pmcy5weSB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96
ZnMucHkKaW5kZXggODkxMWRjZmQ5ZS4uZTM3ODRmN2Q3ZCAxMDA2NDQKLS0tIGEvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKQEAgLTI1LDcgKzI1LDcgQEAgY2xhc3MgVGVzdFpmc0Jh
c2UoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKICAgICAgICAgIyBCUjJfVEFSR0VUX1JPT1RGU19U
QVIgaXMgbm90IHNldAogICAgICAgICAiIiIKIAotICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAg
ICBkZWYgYmFzZV90ZXN0X3J1bihzZWxmKToKICAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2lu
KHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiYnpJbWFnZSIpCiAgICAgICAgIGNwaW9fZmlsZSA9
IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKICAg
ICAgICAgc2VsZi5lbXVsYXRvci5ib290KApAQCAtNjUsNiArNjUsOSBAQCBjbGFzcyBUZXN0WmZz
R2xpYmMoVGVzdFpmc0Jhc2UpOgogICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RM
SU5fWDg2XzY0X0NPUkVfSTdfR0xJQkNfU1RBQkxFPXkKICAgICAgICAgIiIiCiAKKyAgICBkZWYg
dGVzdF9ydW4oc2VsZik6CisgICAgICAgIFRlc3RaZnNCYXNlLmJhc2VfdGVzdF9ydW4oc2VsZikK
KwogCiBjbGFzcyBUZXN0WmZzVWNsaWJjKFRlc3RaZnNCYXNlKToKICAgICBjb25maWcgPSBUZXN0
WmZzQmFzZS5jb25maWcgKyBcCkBAIC03Miw5ICs3NSwxNSBAQCBjbGFzcyBUZXN0WmZzVWNsaWJj
KFRlc3RaZnNCYXNlKToKICAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX1g4
Nl82NF9DT1JFX0k3X1VDTElCQ19TVEFCTEU9eQogICAgICAgICAiIiIKIAorICAgIGRlZiB0ZXN0
X3J1bihzZWxmKToKKyAgICAgICAgVGVzdFpmc0Jhc2UuYmFzZV90ZXN0X3J1bihzZWxmKQorCiAK
IGNsYXNzIFRlc3RaZnNNdXNsKFRlc3RaZnNCYXNlKToKICAgICBjb25maWcgPSBUZXN0WmZzQmFz
ZS5jb25maWcgKyBcCiAgICAgICAgICIiIgogICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFM
X0JPT1RMSU5fWDg2XzY0X01VU0xfU1RBQkxFPXkKICAgICAgICAgIiIiCisKKyAgICBkZWYgdGVz
dF9ydW4oc2VsZik6CisgICAgICAgIFRlc3RaZnNCYXNlLmJhc2VfdGVzdF9ydW4oc2VsZikKLS0g
CjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
