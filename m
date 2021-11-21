Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE480C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E424540225;
	Sun, 21 Nov 2021 17:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSaQB9YmTu6W; Sun, 21 Nov 2021 17:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACD2840201;
	Sun, 21 Nov 2021 17:06:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E49BA1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE22260710
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKCglzSMRMsO for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:06:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C114D60705
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:06:53 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id q21so8863868vkn.2
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZM7FWKkMO2Q5myyXwY/hmNNpKlq7HbGRVm/5v+k9K10=;
 b=UeFRmtdtv5KbSxuX4YX9T+J8P0ynAMwRpapdbsPATT7FOc/+FZPsN0FkFYaw3JuiV+
 aKOk9t9ySHxe6KIQKh0JfJxDzC5bpFjHEb5O3tA3wPJMTfSFZib9cfWy8Y5isYu9+8Un
 deeyhY3Cv3/DtcyGhW4ROyNngP2lJwjU9om6Bv5M33V+RfKwaQ0I1ymvArOk0EWsBcFW
 dGwjNk2d1leYroN/pL1UdkcJQ4+yxeF65miZtNBs2UPVd76dvmBbZr30fU2YmK+WWk48
 qI9NrZ/BQnl5rPLuIcDFCo/nTaYs5nZGW+DM1l1t54q3s7NUk+EYuMASdzcCk9U97yL4
 NeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZM7FWKkMO2Q5myyXwY/hmNNpKlq7HbGRVm/5v+k9K10=;
 b=rDnHhpvgY/YqI+yQMxj2AbcvBeniUwqtBYjYPLKpffskGaXIgzSVnSqv7lWMw9AdD4
 WScCBWZTza8bdv4tqXZIxW5o7HuX8LQ2zY8pS0P5T0rQnUBHtb7/hvJcR/CFEkawfFX2
 OpzUXSALwInl803V971/U7rnzNAR0yg/xLO6Sd9tcbamI1js8csXPDPJjPAptVCXZv3D
 uJMSLi6aGcqggiLNpcDU6pVsOsNopaO5MfIHpuGz8FlKmxQvTPn9/SZsqD/qDM6U4Cie
 4kOTNH5gOWu9yDPwcNbLHWWh2Qgct7d0vWV2A1Hkb5kUJaOeznGWZKKr43b+7WD9deBd
 Skbg==
X-Gm-Message-State: AOAM5321vwMTZORawmvgQ7whI61k/hYx+NBozDkiJWVQZpVis0RuFEBW
 E47woL0KRdWygr1RE4u/rRsJFVzyhwE=
X-Google-Smtp-Source: ABdhPJy4sh+4vKNyZgHUAhEYcdtxQ5bofkzqXsWsYVxfYLHKKSPcHehJJQl9qMtnyTNEON0y7b18qA==
X-Received: by 2002:a05:6122:7d4:: with SMTP id
 l20mr53412663vkr.26.1637514412559; 
 Sun, 21 Nov 2021 09:06:52 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id t132sm3172530vkb.19.2021.11.21.09.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:06:51 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:05:34 -0300
Message-Id: <20211121170534.3807972-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-2021.08.x] package/stress-ng: fix broken URL
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
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMu
Y29tPgoKRG8gdGhlIHNhbWUgYXMgY29tbWl0ICIxMmMwMTA3OWJkIHBhY2thZ2Uvc3RyZXNzLW5n
OiBidW1wIHRvIHZlcnNpb24KMC4xMy4wNSIgZGlkIGZvciAyMDIyLjAyIGJ1dCB3aXRob3V0IHRo
ZSB2ZXJzaW9uIGJ1bXAuCgpUaGUgcHJvamVjdCBVUkwgcmV0dXJucyA0MDQgZXJyb3IgYmVjYXVz
ZToKClF1b3RpbmcgQ29saW5nIEtpbmc6CiJVbmZvcnR1bmF0ZWx5IHdoZW4gSSBsZWZ0IENhbm9u
aWNhbCBsYXN0IHdlZWsgdGhleSByZW1vdmVkIG15IHRhcmJhbGxzIgoKU28gdXNlIGdpdGh1YiBh
bmQgdXBkYXRlIGhhc2guCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2Vi
YXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CkNjOiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAo
RXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KW1JpY2FyZG86IGRvIG5vdCBidW1wIHRo
ZSB2ZXJzaW9uLgogVGhlcmUgd2lsbCBiZSBubyB2ZXJzaW9uIGNsYXNoIGF0IHNvdXJjZXMuYnVp
bGRyb290Lm5ldCBzaW5jZSB0aGUgZmlsZQogZm9ybWF0IGNoYW5nZWRdClNpZ25lZC1vZmYtYnk6
IFJpY2FyZG8gTWFydGluY29za2kgPHJpY2FyZG8ubWFydGluY29za2lAZGF0YWNvbS5jb20uYnI+
CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Ci0tLQokIHV0aWxzL3Rl
c3QtcGtnIC1wIHN0cmVzcy1uZwo2IGJ1aWxkcywgMSBza2lwcGVkLCAwIGJ1aWxkIGZhaWxlZCwg
MCBsZWdhbC1pbmZvIGZhaWxlZAotLS0KIHBhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbiAgICAg
IHwgMiArLQogcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2ggfCAyICstCiBwYWNrYWdl
L3N0cmVzcy1uZy9zdHJlc3MtbmcubWsgICB8IDMgKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1u
Zy9Db25maWcuaW4gYi9wYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4KaW5kZXggNjRiNDczYjc1
Yy4uODM5Y2JiMWNjMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3MtbmcvQ29uZmlnLmluCisr
KyBiL3BhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbgpAQCAtMTIsNyArMTIsNyBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfU1RSRVNTX05HCiAJICBzdWJzeXN0ZW1zIG9mIGEgY29tcHV0ZXIgYXMgd2Vs
bCBhcyB0aGUgdmFyaW91cyBvcGVyYXRpbmcKIAkgIHN5c3RlbSBrZXJuZWwgaW50ZXJmYWNlcy4K
IAotCSAgaHR0cDovL2tlcm5lbC51YnVudHUuY29tL35ja2luZy9zdHJlc3MtbmcvCisJICBodHRw
czovL2dpdGh1Yi5jb20vQ29saW5JYW5LaW5nL3N0cmVzcy1uZwogCiBjb21tZW50ICJzdHJlc3Mt
bmcgbmVlZHMgYSB0b29sY2hhaW4gdy8gaGVhZGVycyA+PSAzLjMiCiAJZGVwZW5kcyBvbiAhQlIy
X25pb3MyICYmICFCUjJfYXJjCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3Mt
bmcuaGFzaCBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCmluZGV4IDQxZTI4MDE5
MTUuLjI0ZmM2ZDRkNTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5o
YXNoCisrKyBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoCkBAIC0xLDMgKzEsMyBA
QAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZjg0N2JlMTE1ZjYwZDNhZDdkMzdjODA2
ZmQxYmZiMTQxMmFhM2M2MzFmY2E1ODFkNmRjMjMzMzIyZjUwZDZhNSAgc3RyZXNzLW5nLTAuMTIu
MDIudGFyLnh6CitzaGEyNTYgIDBiNDU1N2E1MTFiZTk4NWRmYWNjY2MyM2YxNzgyNjIwYjIxN2Ix
MTcyY2RjMjc2YThlZWU4Mjg3MmI4MjU4YzUgIHN0cmVzcy1uZy0wLjEyLjAyLnRhci5negogc2hh
MjU2ICA4MTc3Zjk3NTEzMjEzNTI2ZGYyY2Y2MTg0ZDhmZjk4NmM2NzVhZmI1MTRkNGU2OGE0MDQw
MTA1MjFiODgwNjQzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJl
c3MtbmcubWsgYi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKaW5kZXggNTNkN2I3ZTVi
Ny4uYjEzNDE3ODM5ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLm1r
CisrKyBiL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawpAQCAtNSw4ICs1LDcgQEAKICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKIFNUUkVTU19OR19WRVJTSU9OID0gMC4xMi4wMgotU1RS
RVNTX05HX1NPVVJDRSA9IHN0cmVzcy1uZy0kKFNUUkVTU19OR19WRVJTSU9OKS50YXIueHoKLVNU
UkVTU19OR19TSVRFID0gaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tpbmcvdGFyYmFsbHMv
c3RyZXNzLW5nCitTVFJFU1NfTkdfU0lURSA9ICQoY2FsbCBnaXRodWIsQ29saW5JYW5LaW5nLHN0
cmVzcy1uZyxWJChTVFJFU1NfTkdfVkVSU0lPTikpCiBTVFJFU1NfTkdfTElDRU5TRSA9IEdQTC0y
LjArCiBTVFJFU1NfTkdfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKIAotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
