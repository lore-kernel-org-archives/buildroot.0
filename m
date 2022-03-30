Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4962AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B9C611B4;
	Wed, 30 Mar 2022 07:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0qoIFkU8hQg; Wed, 30 Mar 2022 07:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1BE6118B;
	Wed, 30 Mar 2022 07:32:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 712711BF3E8
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F26384563
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTDzrNUCzaMN for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:32:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F6684562
 for <buildroot@busybox.net>; Wed, 30 Mar 2022 07:32:10 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u3so27975268wrg.3
 for <buildroot@busybox.net>; Wed, 30 Mar 2022 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0JdLhd2u1nDIX8YGZ8d+siKH/vgGtiHYShBdBEGi2dU=;
 b=fQV3Hfv5v5JrqyQ0yTu0u70lLOZx0TliOs1u1s0CVQGJWHjRt6qO2zSLv7+tuq8Tw1
 0iw8IxCaT7k/OaxVRJxB9XqQjmVCWTmIieKpKdc5WE8yRQ5iF99WQOAlmB8EUdqZLE5q
 n0JpQt+nrq5vcmxA4lWNgNMVyZgnKE8tgHY7Mc5VI0aoC8k2SWhc/5/hnxRWxsX4Bczg
 dOlWfW8wDUp1eUyI4b1quN6IdyEs26npv0epCdlOhv/e168gv80yjcKZtTrIH11s9XDV
 VV+4Fc5BgFImbMJrgC8EkV7MGZwrBdDthrZ79aWipcRxKlEeI42RHsGQ98oQ0G1qXppu
 6w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0JdLhd2u1nDIX8YGZ8d+siKH/vgGtiHYShBdBEGi2dU=;
 b=QYYNdQxkJk1Oes6+dvL4hK7fK0CrIdyvwh0sfmUtqDVkUzx9PRwLXHJGnz43bz+ofG
 cleqhxEAOaR8fBduzfY9QEOQaJqNTIfhNQGN1ft17Mjmb8rJu0HNLbWO+9qviltDxW5K
 E3okBOprUqzFrFCEudTDewNhLcHgzktQdcPBg8sfkXv4CU8792/onVSjX4Wcr6uOs6jM
 sFm2VwkckknkCXNbGJL6+Sj0VUvKzoNCh3qb+7abBLWyMLE/c5YvTqRa3UbZD/2R25YE
 o7YuQSSZ7KJhTDtt4ePI2X461AyCh3cZIZR+C1Weh2DIvjZK7xqVYikqdblQZDReFx1M
 PK4A==
X-Gm-Message-State: AOAM532J6ryM3wpdCaHGKwXKWLt6zUw1ditqpP+YRNxLzRYO9wDza71D
 d+UEKGKNsRQq4X92rZTEl5P7Bo3MLtI=
X-Google-Smtp-Source: ABdhPJx+dccMrnItO0DmLXh0+LIqVN2oyXtf/slW+/8lR7AzUAH5w7fPR9ZjQyXWWW3+mF6q+6AS9A==
X-Received: by 2002:a05:6000:1866:b0:204:cce:c89e with SMTP id
 d6-20020a056000186600b002040ccec89emr36498579wri.601.1648625528890; 
 Wed, 30 Mar 2022 00:32:08 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g10-20020adfe40a000000b00203eb3551f0sm23002314wrm.117.2022.03.30.00.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 00:32:08 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 30 Mar 2022 09:31:52 +0200
Message-Id: <20220330073152.1804932-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luaexpt: bump to version 1.4.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bW92ZWQgdW5kZXIgdGhlIGhhdCBvZiBodHRwczovL2dpdGh1Yi5jb20vbHVuYXJtb2R1bGVzCgpy
ZW1vdmUgdXBzdHJlYW0gcGF0Y2gKCmRpZmYgTElDRU5TRToKLVRoZSBNSVQgTGljZW5zZSAoTUlU
KQotQ29weXJpZ2h0IChjKSAyMDEzIFRvbcOhcyBHdWlzYXNvbGEKK0NvcHlyaWdodCAoQykgMjAw
My0yMDA3IFRoZSBLZXBsZXIgUHJvamVjdCwgMjAxMy0yMDIyIE1hdHRoZXcgV2lsZAoKU2lnbmVk
LW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Ci0tLQog
Li4uLzAwMDEtcmVzdG9yZS1nZXRjdXJyZW50Ynl0ZWNvdW50LnBhdGNoICAgIHwgNDAgLS0tLS0t
LS0tLS0tLS0tLS0tLQogcGFja2FnZS9sdWFleHBhdC9Db25maWcuaW4gICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHBhY2thZ2UvbHVhZXhwYXQvbHVhZXhwYXQuaGFzaCAgICAgICAgICAgICAg
ICB8ICA0ICstCiBwYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lm1rICAgICAgICAgICAgICAgICAg
fCAgMyArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygt
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHVhZXhwYXQvMDAwMS1yZXN0b3JlLWdldGN1
cnJlbnRieXRlY291bnQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YWV4cGF0LzAwMDEt
cmVzdG9yZS1nZXRjdXJyZW50Ynl0ZWNvdW50LnBhdGNoIGIvcGFja2FnZS9sdWFleHBhdC8wMDAx
LXJlc3RvcmUtZ2V0Y3VycmVudGJ5dGVjb3VudC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggNmNmMjE5MjY3Li4wMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9sdWFleHBhdC8wMDAx
LXJlc3RvcmUtZ2V0Y3VycmVudGJ5dGVjb3VudC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQw
ICswLDAgQEAKLUZyb20gNzdjYjY5MWY3ODE5MTg5MDhkZmUzNDc4NWYwMGE1ZmY3NWQ1Y2MyMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMu
cGVycmFkQGdhZHoub3JnPgotRGF0ZTogU2F0LCAxNiBGZWIgMjAxOSAxNTo1NjowMCArMDEwMAot
U3ViamVjdDogW1BBVENIXSByZXN0b3JlIGdldGN1cnJlbnRieXRlY291bnQKLQotc2VlIGh0dHBz
Oi8vZ2l0aHViLmNvbS90b21hc2d1aXNhc29sYS9sdWFleHBhdC9pc3N1ZXMvMwotCi1GZXRjaCBm
cm9tOiBodHRwczovL2dpdGh1Yi5jb20vdG9tYXNndWlzYXNvbGEvbHVhZXhwYXQvY29tbWl0LzA5
MjZmMmQ3MDUxMDliN2QzNWI3MjEzNDQyNjRiMzljMTE2OWUwZGUKLQotU2lnbmVkLW9mZi1ieTog
RnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Ci0tLS0KLSBzcmMvbHhw
bGliLmMgfCA3ICsrKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9sdWFleHBhdC0xLjMuMy9zcmMvbHhwbGliLmMgYi9sdWFleHBhdC0xLjMuMy9z
cmMvbHhwbGliLmMKLWluZGV4IDc3MjY5MTMuLjM1YmVjM2MgMTAwNjQ0Ci0tLS0gYS9sdWFleHBh
dC0xLjMuMy9zcmMvbHhwbGliLmMKLSsrKyBiL2x1YWV4cGF0LTEuMy4zL3NyYy9seHBsaWIuYwot
QEAgLTUzOCwxMSArNTM4LDE4IEBAIHN0YXRpYyBpbnQgbHhwX3N0b3AgKGx1YV9TdGF0ZSAqTCkg
ewotICAgcmV0dXJuIDE7Ci0gfQotIAotK3N0YXRpYyBpbnQgbHhwX2dldGN1cnJlbnRieXRlY291
bnQgKGx1YV9TdGF0ZSogTCkgewotKyAgbHhwX3VzZXJkYXRhICp4cHUgPSBjaGVja3BhcnNlcihM
LCAxKTsKLSsgIGx1YV9wdXNoaW50ZWdlcihMLCBYTUxfR2V0Q3VycmVudEJ5dGVDb3VudCh4cHUt
PnBhcnNlcikpOwotKyAgcmV0dXJuIDE7Ci0rfQotKwotIHN0YXRpYyBjb25zdCBsdWFMX1JlZyBs
eHBfbWV0aHNbXSA9IHsKLSAgIHsicGFyc2UiLCBseHBfcGFyc2V9LAotICAgeyJjbG9zZSIsIGx4
cF9jbG9zZX0sCi0gICB7Il9fZ2MiLCBwYXJzZXJfZ2N9LAotICAgeyJwb3MiLCBseHBfcG9zfSwK
LSsgIHsiZ2V0Y3VycmVudGJ5dGVjb3VudCIsIGx4cF9nZXRjdXJyZW50Ynl0ZWNvdW50fSwKLSAg
IHsic2V0ZW5jb2RpbmciLCBseHBfc2V0ZW5jb2Rpbmd9LAotICAgeyJnZXRjYWxsYmFja3MiLCBn
ZXRjYWxsYmFja3N9LAotICAgeyJnZXRiYXNlIiwgZ2V0YmFzZX0sCi0tLSAKLTIuMTcuMQotCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2x1YWV4cGF0L0NvbmZpZy5pbiBiL3BhY2thZ2UvbHVhZXhwYXQv
Q29uZmlnLmluCmluZGV4IDIzMjJkYzQzMC4uMjViMDY3NDYwIDEwMDY0NAotLS0gYS9wYWNrYWdl
L2x1YWV4cGF0L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2x1YWV4cGF0L0NvbmZpZy5pbgpAQCAt
NCw0ICs0LDQgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xVQUVYUEFUCiAJaGVscAogCSAgTHVhRXhw
YXQgaXMgYSBTQVggWE1MIHBhcnNlciBiYXNlZCBvbiB0aGUgRXhwYXQgbGlicmFyeS4KIAotCSAg
aHR0cDovL3d3dy5rZXBsZXJwcm9qZWN0Lm9yZy9sdWFleHBhdC8KKwkgIGh0dHBzOi8vbHVuYXJt
b2R1bGVzLmdpdGh1Yi5pby9sdWFleHBhdApkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWFleHBhdC9s
dWFleHBhdC5oYXNoIGIvcGFja2FnZS9sdWFleHBhdC9sdWFleHBhdC5oYXNoCmluZGV4IGRkMWNm
NDBlNS4uZmJmYjYyM2ZjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lmhh
c2gKKysrIGIvcGFja2FnZS9sdWFleHBhdC9sdWFleHBhdC5oYXNoCkBAIC0xLDMgKzEsMyBAQAog
IyBjb21wdXRlZCBieSBsdWFyb2Nrcy9idWlsZHJvb3QKLXNoYTI1NiBiNTU5MDhmY2Q3ZGY0OTBh
NTlhYWIyNTI4NDQ2MGFkZDgyODNmMWM2Yjk0YWI1ODQ5MDBmZTNlNDk3NzUxNzJhICBsdWFleHBh
dC0xLjMuMy0xLnNyYy5yb2NrCi1zaGEyNTYgN2Y1Y2IwYzE3NTBiYWJjYmIwOTYzN2I3ZjBmZjM0
OTcyZDUxY2YyM2I3ZjQxM2JlZjkwMmI0N2FhNjVmZWJjZCAgbHVhZXhwYXQtMS4zLjMvTElDRU5T
RQorc2hhMjU2ICBiZWU4OGRkYzEwNjNmNDljNTY4NWI3NWI2Njk2ZThkZjA2MDdhMzg4NDMyY2Jj
YjE4OWNkMGI4MjkxZDk1NmFhICBsdWFleHBhdC0xLjQuMC0xLnNyYy5yb2NrCitzaGEyNTYgIDdl
NmE3MjdlNWI1N2NjYTcxM2EyZjI2MzNmMDVkN2UwY2MxZTI2MWNjNmE3NjEzYmJlMjY2ZTYyNWIy
ZjE0ZGEgIGx1YWV4cGF0L0xJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhZXhwYXQvbHVh
ZXhwYXQubWsgYi9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lm1rCmluZGV4IDhjODZiMjRmMi4u
YzE3NmZiOGMxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YWV4cGF0L2x1YWV4cGF0Lm1rCisrKyBi
L3BhY2thZ2UvbHVhZXhwYXQvbHVhZXhwYXQubWsKQEAgLTQsNyArNCw4IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1MVUFFWFBBVF9WRVJTSU9OID0gMS4zLjMtMQorTFVBRVhQQVRf
VkVSU0lPTiA9IDEuNC4wLTEKK0xVQUVYUEFUX1NVQkRJUiA9IGx1YWV4cGF0CiBMVUFFWFBBVF9M
SUNFTlNFID0gTUlUCiBMVUFFWFBBVF9MSUNFTlNFX0ZJTEVTID0gJChMVUFFWFBBVF9TVUJESVIp
L0xJQ0VOU0UKIExVQUVYUEFUX0RFUEVOREVOQ0lFUyA9IGV4cGF0Ci0tIAoyLjMyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
