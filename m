Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4086C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CC2C84136;
	Thu,  7 Apr 2022 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pfox428URnCF; Thu,  7 Apr 2022 16:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 187348412E;
	Thu,  7 Apr 2022 16:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5D31BF470
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37DA5419A5
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 16:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJmw-1NEZqzK for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 16:43:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6C7B408DD
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 16:43:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z1so8717952wrg.4
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IiUFhZbyjgxBdkcKnxcDDFunAhxhrCyIS+riY8eoBsw=;
 b=aPSAT3ORXaQhhiM9IIEGCbCYjPErL5LXefWj8g5lxXIG4QjVDMO2NcYc+oPPRFy0yn
 rtWqQX8c3mhf/FmBCmIiaNog6LzuewnEkh5bLBGCC/08hFRyMRNGnzgUgmYpjN3p2mTT
 1e/hxFgR2JdGTadixPWM20+IcnWEZe0uWl6zEVq26RIriBC8aTFJjKQwGI4fkHDDpjve
 XMp2zjU1MlqyaL+6sRb0+X1D+e8PaDqkaqTYACfyEV+xvNJg5hh7HdVc4Yt+P3x5MhMY
 qNhrQEfSfLWRPaDQi2RUMWqDlAq82ydv+VZEs0UNTItg6yGclxsLKIQZYSxTHYsmZg1p
 7D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IiUFhZbyjgxBdkcKnxcDDFunAhxhrCyIS+riY8eoBsw=;
 b=SMzC1/X680wSE246UCUvYh+z+p+GWfo6ues6dGuwm83wOfkeH6zCa33vpo2KORV/hZ
 5k6JQ7rUBCcYQpQtbkmfRRW4sI4Pyq68VkjrJMB69OzF3rnt9UHC4RvPKxnoHdaFDWL6
 2aGIFaAjYJbcXsdTCAsNNZd/ZzhiBw8Sbstasyec5AiivACNsHVBeI/R/K9zdDxCUPDw
 SKBzKKsesiYdVt64wdhYly8cqMKya6Iai98oE3sO+NvGnQMhsHqplKy7Vf1bV+WHjh2+
 X/+6BouAi+mMVAFWjCWsCsM/4OPo6UjasW/hlIJcF4UwpxUhoLhMgEti+I5HZ2jAeBWP
 Aclg==
X-Gm-Message-State: AOAM530WDYnu+Eo5Pi1DsW0ssTaRLF2B7+NrkKxGALuosqhrrPz/cUMJ
 7vXvMVBitmK8B0iHnmxs0km2YWkGsHY=
X-Google-Smtp-Source: ABdhPJxjzfNyAupVd5h3Af2OAL2KL4d3jS+mjQh2cyWsr4ALc/6mY9nJTVru0uiLndFBaI9ATt9TlQ==
X-Received: by 2002:a5d:410c:0:b0:206:b5c:65c7 with SMTP id
 l12-20020a5d410c000000b002060b5c65c7mr11198369wrp.94.1649349782630; 
 Thu, 07 Apr 2022 09:43:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm12675351wra.66.2022.04.07.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 09:43:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 18:41:14 +0200
Message-Id: <20220407164114.1024718-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: fix build with libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGxpYnJlc3NsOgoKdXRpbHMuYzoo
LnRleHQrMHgxNjE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgRVZQX3NoYTUxMl8yNTYnCgpG
aXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvY2IxOGY2NTMz
ODA2ZjM3MjlmOTcxOGJkY2M3MTkzODRiZTM3NWI2NgoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogLi4uLzAwMDItZml4LWJ1
aWxkLXdpdGgtbGlicmVzc2wucGF0Y2ggICAgICAgIHwgNDcgKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3R2aGVhZGVuZC8wMDAyLWZpeC1idWlsZC13aXRoLWxpYnJlc3NsLnBhdGNoCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS90dmhlYWRlbmQvMDAwMi1maXgtYnVpbGQtd2l0aC1saWJyZXNzbC5wYXRj
aCBiL3BhY2thZ2UvdHZoZWFkZW5kLzAwMDItZml4LWJ1aWxkLXdpdGgtbGlicmVzc2wucGF0Y2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzk5ZGFjZGJlYgotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvdHZoZWFkZW5kLzAwMDItZml4LWJ1aWxkLXdpdGgtbGlicmVz
c2wucGF0Y2gKQEAgLTAsMCArMSw0NyBAQAorRnJvbSBlYTY1ZjgwMjVhOTEyNGNkNzM1M2IyMWYx
Njc5NjhiZGI4OTczMDZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CitEYXRlOiBXZWQsIDYgQXByIDIw
MjIgMjE6NTQ6MjUgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gZml4IGJ1aWxkIHdpdGggbGlicmVz
c2wKKworRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGxpYnJlc3NsIHJhaXNl
ZCBzaW5jZQoraHR0cHM6Ly9naXRodWIuY29tL3R2aGVhZGVuZC90dmhlYWRlbmQvY29tbWl0L2U2
MWFjYjhhZDRhMzQxMWY0ZTdhY2ZkODEzM2QyMjIyOTlmNmQ0N2U6CisKK3V0aWxzLmM6KC50ZXh0
KzB4MTYxNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYEVWUF9zaGE1MTJfMjU2JworCitGaXhl
czoKKyAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2NiMThmNjUzMzgw
NmYzNzI5Zjk3MThiZGNjNzE5Mzg0YmUzNzViNjYKKworU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CitbUmV0cmlldmVkIGZyb206Cito
dHRwczovL2dpdGh1Yi5jb20vdHZoZWFkZW5kL3R2aGVhZGVuZC9jb21taXQvZWE2NWY4MDI1YTkx
MjRjZDczNTNiMjFmMTY3OTY4YmRiODk3MzA2Zl0KKy0tLQorIHNyYy9odHRwLmMgIHwgMiArLQor
IHNyYy91dGlscy5jIHwgMiArLQorIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2h0dHAuYyBiL3NyYy9odHRwLmMKK2lu
ZGV4IDA2ZDVlNzYxNzIuLjcyYTQ5ODMxN2MgMTAwNjQ0CistLS0gYS9zcmMvaHR0cC5jCisrKysg
Yi9zcmMvaHR0cC5jCitAQCAtNDEyLDcgKzQxMiw3IEBAIGh0dHBfc2VuZF9oZWFkZXIoaHR0cF9j
b25uZWN0aW9uX3QgKmhjLCBpbnQgcmMsIGNvbnN0IGNoYXIgKmNvbnRlbnQsCisgICAgICAgICBo
dHRwX2F1dGhfaGVhZGVyKCZoZHJzLCByZWFsbSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uZmlnLmh0dHBfYXV0aF9hbGdvID09IEhUVFBfQVVUSF9BTEdPX1NIQTI1NiA/CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIlNIQS0yNTYiIDoKKy0jaWYgT1BFTlNTTF9WRVJTSU9OX05V
TUJFUiA+PSAweDEwMTAxMDFmTAorKyNpZiBPUEVOU1NMX1ZFUlNJT05fTlVNQkVSID49IDB4MTAx
MDEwMWZMICYmICFkZWZpbmVkKExJQlJFU1NMX1ZFUlNJT05fTlVNQkVSKQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIlNIQS01MTItMjU2IiwKKyAjZWxzZQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIlNIQS0yNTYiLAorZGlmZiAtLWdpdCBhL3NyYy91dGlscy5jIGIvc3Jj
L3V0aWxzLmMKK2luZGV4IGQ4ZmZlNGFkNWMuLmVlY2IxMGUxMTYgMTAwNjQ0CistLS0gYS9zcmMv
dXRpbHMuYworKysrIGIvc3JjL3V0aWxzLmMKK0BAIC02MTYsNyArNjE2LDcgQEAgc2hhMjU2c3Vt
ICggY29uc3QgY2hhciAqc3RyLCBpbnQgbG93ZXJjYXNlICkKKyBjaGFyICoKKyBzaGE1MTJzdW0y
NTYgKCBjb25zdCBjaGFyICpzdHIsIGludCBsb3dlcmNhc2UgKQorIHsKKy0jaWYgT1BFTlNTTF9W
RVJTSU9OX05VTUJFUiA+PSAweDEwMTAxMDFmTAorKyNpZiBPUEVOU1NMX1ZFUlNJT05fTlVNQkVS
ID49IDB4MTAxMDEwMWZMICYmwqAhZGVmaW5lZChMSUJSRVNTTF9WRVJTSU9OX05VTUJFUikKKyAg
IHJldHVybiBvcGVuc3NsX2hhc2hfaGV4c3RyKHN0ciwgbG93ZXJjYXNlLCBFVlBfc2hhNTEyXzI1
NigpLCAzMik7CisgI2Vsc2UKKyAgIHJldHVybiBOVUxMOwotLSAKMi4zNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
