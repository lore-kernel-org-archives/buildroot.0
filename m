Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E064EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 07:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA5D400E7;
	Fri,  7 Jul 2023 07:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA5D400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDkqtA5RgXCx; Fri,  7 Jul 2023 07:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532B040152;
	Fri,  7 Jul 2023 07:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 532B040152
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88E711BF255
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 07:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6259282334
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 07:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6259282334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJ5gc8vjdNnu for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 07:53:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F8481F14
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25F8481F14
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 07:53:16 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6ef9ed2fdso24436641fa.2
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 00:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688716393; x=1691308393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3G6Z+HstYoaWdF+nF+ROLlz+me8tG78OYS0TkWR5Fr8=;
 b=e8ueBj8kyRiSnJBcom2K+f7FeI1ZKrz/FZEiwqDl9SNSq40YNT+/4/PXaXjH40rSW7
 +DBqK+oCFLmN5f73YznjP2Dy4pP3Bcl8ZzhbbvLqQtfyfhhOr8YL1D7Xht3AZ4eD12+f
 5wK6yoAf3PmFfWwy20is/XX6Vp2rkyNAiC3zb1lN7/OCQ4fjbov7FvDT981lihiliet7
 jN1Ddb5seBpZMdstu/X/qGCaJb3lByyfnyRuJHSDyV8WlYVTcTzu9KzimNxRbW/IXSzL
 DA9KevfKSe2isFrd6INYCxIej4BSLB2nkf+60tYq/MVHVNFFp4zfEvuQRHp0O72zezRP
 +Thg==
X-Gm-Message-State: ABy/qLbmrhpW/mhROCLrVcEiVg18H1B+jBX5IPRSxnBvDnz7BzmcFXU1
 3TnmNF6QrmtdBAkeG5z9OD0f1VNH4y0KInHJ
X-Google-Smtp-Source: APBJJlFYefQ/J/CAbThD9oGaGtG5Hyre9Y+xbBN8jBtVTbsgwbwni23ErhV+40DvvDw+FB7yVLxnug==
X-Received: by 2002:a05:6512:3149:b0:4fb:8de9:ac13 with SMTP id
 s9-20020a056512314900b004fb8de9ac13mr2952954lfi.23.1688716393364; 
 Fri, 07 Jul 2023 00:53:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e34:eca2:2100:dea8:bf43:866b:a7e4])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a7bc01a000000b003f7f475c3bcsm8524972wmb.1.2023.07.07.00.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 00:53:12 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 09:53:37 +0200
Message-ID: <20230707075339.7207-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688716393; x=1691308393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3G6Z+HstYoaWdF+nF+ROLlz+me8tG78OYS0TkWR5Fr8=;
 b=Lz/L2zKFSRl93Sr7nMN9n2C5taovj8dL+I56xQipu4RI/jkno6WlTHr8an2tMh5YbG
 l0StPgshkWo4ctx8cXIFE4N85+jyZfewNNcHhXTvZsUG8mHrYsPH5l7yv/5eANTSdrIL
 HZlgfutM8VCOVzMLYcK+Qx0CiIhY1cpxsbo76VOIC9+aFdTzgWJPk/XGu3LCuYIZgsiH
 N3BKqAD0+lnE6eMm5bM21JdVkd1PsXCdomhlLula3vFr552zFUl+KvzFbRa0PRN2a+V8
 +yqkV+aqJH4BYZOJTs5pCBijWlsLLobdim6sMLsRDQFS5LRCwAlXg2THo197G+3O7fcb
 I48g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Lz/L2zKF
Subject: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bring back the
 configuration for the rockchip rk3399 built by firefly.
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

KiBVc2VzIGEgbW9yZSByZWNlbnQgdmVyc2lvbiBvZiBURi1BIHdoaWNoIHNvbHZlcyB0aGUgYnVp
bGRpbmcgaXNzdWUgZm9yCiAgdGhpcyBib2FyZC4KKiBTb21lIG1pbm9yIGZpeGVzIGluIHRoZSBw
b3N0LWJ1aWxkLnNoIHNjcmlwdCB1c2luZyBgc2hlbGxjaGVja2AuCgpTaWduZWQtb2ZmLWJ5OiBS
b2JlcnRvIE1lZGluYSA8cm9iZXJ0b3htZWRAZ21haWwuY29tPgotLS0KIGJvYXJkL2ZpcmVmbHkv
cm9jLXJrMzM5OS1wYy9leHRsaW51eC5jb25mIHwgIDQgKysrCiBib2FyZC9maXJlZmx5L3JvYy1y
azMzOTktcGMvZ2VuaW1hZ2UuY2ZnICB8IDIyICsrKysrKysrKysrKwogYm9hcmQvZmlyZWZseS9y
b2MtcmszMzk5LXBjL3Bvc3QtYnVpbGQuc2ggfCAgNSArKysKIGJvYXJkL2ZpcmVmbHkvcm9jLXJr
MzM5OS1wYy9yZWFkbWUudHh0ICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKwogY29uZmln
cy9yb2NfcGNfcmszMzk5X2RlZmNvbmZpZyAgICAgICAgICAgfCA0MSArKysrKysrKysrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9leHRsaW51eC5jb25mCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYm9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL2dlbmltYWdlLmNmZwogY3Jl
YXRlIG1vZGUgMTAwNzU1IGJvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9wb3N0LWJ1aWxkLnNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL3JlYWRtZS50
eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3JvY19wY19yazMzOTlfZGVmY29uZmlnCgpk
aWZmIC0tZ2l0IGEvYm9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL2V4dGxpbnV4LmNvbmYgYi9i
b2FyZC9maXJlZmx5L3JvYy1yazMzOTktcGMvZXh0bGludXguY29uZgpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi41MGEzNThmYWRjCi0tLSAvZGV2L251bGwKKysrIGIvYm9h
cmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL2V4dGxpbnV4LmNvbmYKQEAgLTAsMCArMSw0IEBACits
YWJlbCBSSzMzOTlSb2NQQyBsaW51eAorICBrZXJuZWwgL2Jvb3QvSW1hZ2UKKyAgZGV2aWNldHJl
ZSAvYm9vdC9yazMzOTktcm9jLXBjLmR0YgorICBhcHBlbmQgZWFybHljb249dWFydDgyNTAsbW1p
bzMyLDB4ZmYxYTAwMDAgcm9vdD0vZGV2L21tY2JsazBwMSByb290d2FpdApkaWZmIC0tZ2l0IGEv
Ym9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL2dlbmltYWdlLmNmZyBiL2JvYXJkL2ZpcmVmbHkv
cm9jLXJrMzM5OS1wYy9nZW5pbWFnZS5jZmcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uOTY2Yzg2OTI3MwotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2ZpcmVmbHkvcm9j
LXJrMzM5OS1wYy9nZW5pbWFnZS5jZmcKQEAgLTAsMCArMSwyMiBAQAoraW1hZ2Ugc2RjYXJkLmlt
ZyB7CisJaGRpbWFnZSB7CisJfQorCisJcGFydGl0aW9uIHUtYm9vdC10cGwtc3BsLWR0YiB7CisJ
CWluLXBhcnRpdGlvbi10YWJsZSA9ICJubyIKKwkJaW1hZ2UgPSAiaWRibG9hZGVyLmltZyIKKwkJ
b2Zmc2V0ID0gMzJLCisJfQorCisJcGFydGl0aW9uIHUtYm9vdC1kdGIgeworCQlpbi1wYXJ0aXRp
b24tdGFibGUgPSAibm8iCisJCWltYWdlID0gInUtYm9vdC5pdGIiCisJCW9mZnNldCA9IDhNCisJ
CXNpemUgPSAzME0KKwl9CisKKwlwYXJ0aXRpb24gcm9vdGZzIHsKKwkJcGFydGl0aW9uLXR5cGUg
PSAweDgzCisJCWltYWdlID0gInJvb3Rmcy5leHQ0IgorCX0KK30KZGlmZiAtLWdpdCBhL2JvYXJk
L2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9wb3N0LWJ1aWxkLnNoIGIvYm9hcmQvZmlyZWZseS9yb2Mt
cmszMzk5LXBjL3Bvc3QtYnVpbGQuc2gKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAw
MDAwMC4uZDg0YTVkYTBiMAotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2ZpcmVmbHkvcm9jLXJr
MzM5OS1wYy9wb3N0LWJ1aWxkLnNoCkBAIC0wLDAgKzEsNSBAQAorIyEvYmluL3NoCisKK0JPQVJE
X0RJUj0iJChkaXJuYW1lICIkMCIpIgorCitpbnN0YWxsIC1tIDA2NDQgLUQgIiRCT0FSRF9ESVIi
L2V4dGxpbnV4LmNvbmYgIiRUQVJHRVRfRElSIi9ib290L2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYK
ZGlmZiAtLWdpdCBhL2JvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9yZWFkbWUudHh0IGIvYm9h
cmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL3JlYWRtZS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uOGE2ZjFjZGVlNgotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2Zp
cmVmbHkvcm9jLXJrMzM5OS1wYy9yZWFkbWUudHh0CkBAIC0wLDAgKzEsNDAgQEAKK0xpYnJlIENv
bXB1dGVyIEJvYXJkIFJPQy1SSzMzOTktUEMKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CisKK0J1aWxkOgorCisgICQgbWFrZSByb2NfcGNfcmszMzk5X2RlZmNvbmZpZworICAk
IG1ha2UKKworRmlsZXMgY3JlYXRlZCBpbiBvdXRwdXQgZGlyZWN0b3J5Cis9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KKworb3V0cHV0L2ltYWdlcworCivilJzilIDilIAgYmwzMS5l
bGYKK+KUnOKUgOKUgCBpZGJsb2FkZXIuaW1nCivilJzilIDilIAgSW1hZ2UKK+KUnOKUgOKUgCBy
azMzOTktcm9jLXBjLmR0Ygor4pSc4pSA4pSAIHJvb3Rmcy5leHQyCivilJzilIDilIAgcm9vdGZz
LmV4dDQgLT4gcm9vdGZzLmV4dDIKK+KUnOKUgOKUgCByb290ZnMudGFyCivilJzilIDilIAgc2Rj
YXJkLmltZwor4pSc4pSA4pSAIHUtYm9vdC5iaW4KK+KUlOKUgOKUgCB1LWJvb3QuaXRiCisKK0Ny
ZWF0aW5nIGJvb3RhYmxlIFNEIGNhcmQ6Cis9PT09PT09PT09PT09PT09PT09PT09PT09PQorCitT
aW1wbHkgaW52b2tlIChhcyByb290KQorCitzdWRvIGRkIGlmPW91dHB1dC9pbWFnZXMvc2RjYXJk
LmltZyBvZj0vZGV2L3NkWCAmJiBzeW5jCisKK1doZXJlIFggaXMgeW91ciBTRCBjYXJkIGRldmlj
ZQorCitTZXJpYWwgY29uc29sZQorLS0tLS0tLS0tLS0tLS0KKworQmF1ZHJhdGUgZm9yIHRoaXMg
Ym9hcmQgaXMgMTUwMDAwMAorCitXaWtpIGxpbms6CitodHRwczovL3dpa2kuYW1hcnVsYXNvbHV0
aW9ucy5jb20vYnNwL3JvY2tjaGlwL3JrMzM5OS9yb2MtcmszMzk5LXBjLmh0bWwKZGlmZiAtLWdp
dCBhL2NvbmZpZ3Mvcm9jX3BjX3JrMzM5OV9kZWZjb25maWcgYi9jb25maWdzL3JvY19wY19yazMz
OTlfZGVmY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZkYTVl
NTUyY2UKLS0tIC9kZXYvbnVsbAorKysgYi9jb25maWdzL3JvY19wY19yazMzOTlfZGVmY29uZmln
CkBAIC0wLDAgKzEsNDEgQEAKK0JSMl9hYXJjaDY0PXkKK0JSMl9jb3J0ZXhfYTcyX2E1Mz15CitC
UjJfQklOVVRJTFNfVkVSU0lPTl8yXzQwX1g9eQorQlIyX1RBUkdFVF9HRU5FUklDX0hPU1ROQU1F
PSJyb2MtcmszMzk5LXBjIgorQlIyX1RBUkdFVF9HRU5FUklDX0lTU1VFPSJXZWxjb21lIHRvIFJP
Qy1SSzMzOTktUEMhIgorQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0iYm9hcmQvZmlyZWZs
eS9yb2MtcmszMzk5LXBjL3Bvc3QtYnVpbGQuc2giCitCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NS
SVBUPSJzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2giCitCUjJfUk9PVEZTX1BPU1RfU0NSSVBU
X0FSR1M9Ii1jIGJvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9nZW5pbWFnZS5jZmciCitCUjJf
TElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9
eQorQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VSTkVMX0lOVFJF
RV9EVFNfTkFNRT0icm9ja2NoaXAvcmszMzk5LXJvYy1wYyIKK0JSMl9MSU5VWF9LRVJORUxfSU5T
VEFMTF9UQVJHRVQ9eQorQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQorQlIy
X1RBUkdFVF9ST09URlNfRVhUMj15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQorQlIyX1RB
UkdFVF9ST09URlNfRVhUMl9TSVpFPSIyNDBNIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJN
V0FSRT15CitCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9HSVQ9eQorQlIy
X1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0
LnRydXN0ZWRmaXJtd2FyZS5vcmcvVEYtQS90cnVzdGVkLWZpcm13YXJlLWEuZ2l0IgorQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fUkVQT19WRVJTSU9OPSJ2Mi45LjAiCitC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJyazMzOTkiCitCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0lNQUdFUz0iIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9ORUVEU19BUk0zMl9UT09MQ0hBSU49eQorQlIyX1RBUkdFVF9VQk9PVD15CitC
UjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKK0JSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT049eQorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
MjAyMC4wMSIKK0JSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJyb2MtcGMtcmszMzk5
IgorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQorQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19Q
WVRIT04zPXkKK0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfQVRGX0JMMzE9eQorQlIyX1RBUkdFVF9V
Qk9PVF9ORUVEU19BVEZfQkwzMV9FTEY9eQorQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9N
PXkKK0JSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0NVU1RPTV9OQU1FPSJ1LWJvb3QuaXRiIgorQlIy
X1RBUkdFVF9VQk9PVF9TUEw9eQorQlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0iaWRibG9hZGVy
LmltZyIKK0JSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15CitCUjJfUEFDS0FHRV9IT1NUX0dF
TklNQUdFPXkKK0JSMl9QQUNLQUdFX0hPU1RfTVRPT0xTPXkKK0JSMl9QQUNLQUdFX0hPU1RfVUJP
T1RfVE9PTFM9eQotLSAKMi40MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
