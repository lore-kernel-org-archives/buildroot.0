Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EE8ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49C72403EA;
	Sun, 30 Oct 2022 18:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49C72403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTdu7PJQMDTB; Sun, 30 Oct 2022 18:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98A19403A2;
	Sun, 30 Oct 2022 18:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98A19403A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 861C01BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6088A403A2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6088A403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9cHpsIPQmsN for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:20:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 393E140018
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 393E140018
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:20:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h9so13194891wrt.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yj1E2eWVUfWD6qu19l86zpshRx4cF1Jhbzq+R57pDK8=;
 b=Fqr8JpO4ZrRZM6HA/Uxs4/xhCzmQVpGPJqsDJ962kqoeFzrHO3sWtX0lOg5hTAnAkM
 dPd2V9Z+LBRh1TTELgaWPxPpdE4jH6N9wc7jOSJwdRwoYSCk+TWXX8o+a897uXRLpOgF
 uF2bXlGW95ljH6OFXboB/xgiQB0kE9LDJ4itO1gOZwzJMZo7bbUcEMgc8tQcC3xOqkZb
 D0u1NMWC4YXJ59euOkiWO0Jt5pEuNM6GZdw0207KOnxgPchSVe+b5hjsbVzQoWGJUS9z
 gbMmdWR/gNz1bj4/SZGt6eI+FvQVzcHUelc8k268rgXFsiCMkSlhhPnA9ACrVORiqIpm
 lO/A==
X-Gm-Message-State: ACrzQf08o0/ickvyjOi5FK7q2wYWjgCFk3lb63Lzu8AMSzwlcntzTE43
 R0hM+OweJsMgR9rQK12cVO7ikhTbHrE=
X-Google-Smtp-Source: AMsMyM5HvYgfz4+rFsZ2Yght7H5STkMUmsGzNbUKZgQNey557gU3OBr7NakRCrc/X5VUJWDYnLBpcg==
X-Received: by 2002:adf:d1c2:0:b0:236:9033:8ead with SMTP id
 b2-20020adfd1c2000000b0023690338eadmr5787786wrd.653.1667154032922; 
 Sun, 30 Oct 2022 11:20:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b003b47e8a5d22sm5791819wmq.23.2022.10.30.11.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 11:20:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 19:20:27 +0100
Message-Id: <20221030182027.186259-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yj1E2eWVUfWD6qu19l86zpshRx4cF1Jhbzq+R57pDK8=;
 b=qlOfaYHR78slKnlIHrD955vDhDwEeHQyrFIJ2Bxy0no8vW8H/4nrfiSSCIdjeF5WGD
 CnBE4byoETYQcYy00+9rSZ776PTKDZzMiAxfquEkpKOrG9ipjfXa1sa2zWvGfBBV1Z5L
 2sqDGTCcmqmbZIcgTYLpKTX03Q+cw327ioGctKjlmLItsO0fXdksu+atmXH4vtwDMWQH
 gaIsEYBIh2AvxrkixB1ohR6VqNUNVThihn3x8u3S7ibCVT3PkKjtb5DNa7QE8l7RbgU7
 SwFqEXm0Ht8xrX35X4/i+fwUTB6WD+m/1MnR0lb7xz3eBF/e4xClr0jAXjONp+d+tEoG
 Uubg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qlOfaYHR
Subject: [Buildroot] [PATCH 1/1] package/batman-adv: bump to version 2022.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBidW1wIHdpbGwgZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGtlcm5l
bCA+PSA1LjE4IHRoYW5rcyB0bwpodHRwczovL2dpdGh1Yi5jb20vb3Blbi1tZXNoLW1pcnJvci9i
YXRtYW4tYWR2L2NvbW1pdC9mMDdhMGMzN2FiMjc4ZmI2YTllOTVjYWQ4OTQyOWIxMjgyZjFhYjU5
OgoKL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL2Jh
dG1hbi1hZHYtMjAyMS40L25ldC9iYXRtYW4tYWR2L2JyaWRnZV9sb29wX2F2b2lkYW5jZS5jOiBJ
biBmdW5jdGlvbiDigJhiYXRhZHZfYmxhX3NlbmRfY2xhaW3igJk6Ci9ob21lL2J1aWxkcm9vdC9h
dXRvYnVpbGQvaW5zdGFuY2UtMi9vdXRwdXQtMS9idWlsZC9iYXRtYW4tYWR2LTIwMjEuNC9uZXQv
YmF0bWFuLWFkdi9icmlkZ2VfbG9vcF9hdm9pZGFuY2UuYzo0NDY6OTogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmG5ldGlmX3J4X2FueV9jb250ZXh04oCZIFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDQ0NiB8ICAgICAgICAgbmV0aWZf
cnhfYW55X2NvbnRleHQoc2tiKTsKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+
CgpJbmRlZWQsIG5ldGlmX3J4X2FueV9jb250ZXh0IGhhcyBiZWVuIGRyb3BwZWQgc2luY2Uga2Vy
bmVsIDUuMTg6Cmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvMjY1NTky
NmFlYTliZWVhNjJjOWJhODBjMDMyNDg1NDU2ZmQ4NDhmMAoKaHR0cHM6Ly9naXRodWIuY29tL29w
ZW4tbWVzaC1taXJyb3IvYmF0bWFuLWFkdi9ibG9iL3YyMDIyLjIvQ0hBTkdFTE9HLnJzdAoKRml4
ZXM6CiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzU0MmI3Yjk5ZGE3
YjdhNjVlNmUxMWU3YzczYTI2ODU2ZTMyMjJlODkKClNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvYmF0bWFuLWFk
di9iYXRtYW4tYWR2Lmhhc2ggfCA2ICsrKy0tLQogcGFja2FnZS9iYXRtYW4tYWR2L2JhdG1hbi1h
ZHYubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRtYW4tYWR2Lmhhc2gg
Yi9wYWNrYWdlL2JhdG1hbi1hZHYvYmF0bWFuLWFkdi5oYXNoCmluZGV4IGMwOTg2NjM3MzkuLmM1
YWRkNGNkZWEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRtYW4tYWR2Lmhhc2gK
KysrIGIvcGFja2FnZS9iYXRtYW4tYWR2L2JhdG1hbi1hZHYuaGFzaApAQCAtMSw3ICsxLDcgQEAK
LSMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy5vcGVuLW1lc2gub3JnL2JhdG1hbi9yZWxlYXNlcy9i
YXRtYW4tYWR2LTIwMjEuNC9iYXRtYW4tYWR2LTIwMjEuNC50YXIuZ3ouc2hhMQotc2hhMSAgODBh
M2U0ZDc2M2I2YmYzNWRiNmU1NjFlZDlkNjc3NWRjODc0ZDdjNiAgYmF0bWFuLWFkdi0yMDIxLjQu
dGFyLmd6CisjIEZyb20gaHR0cHM6Ly9kb3dubG9hZHMub3Blbi1tZXNoLm9yZy9iYXRtYW4vcmVs
ZWFzZXMvYmF0bWFuLWFkdi0yMDIyLjIvYmF0bWFuLWFkdi0yMDIyLjIudGFyLmd6LnNoYTEKK3No
YTEgIGUxODI5ZTEwZmMzN2VhNjc0YTIwY2I5YmExZDZjMTQ4MzA0MmZiZmEgIGJhdG1hbi1hZHYt
MjAyMi4yLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXMKLXNoYTI1NiAgY2ZmN2Ey
ZjE2MDA0NWZkMGRiZjFmMWNkN2UzNWU5M2JmNDg5ZTgxY2I4Yjk1MDFiMzc1NmRhYTM5MWYzZWIx
YiAgYmF0bWFuLWFkdi0yMDIxLjQudGFyLmd6CitzaGEyNTYgIDhhY2EyN2M2ZjE2OGIxMzdhN2Vk
NzAzMWQ1ODE2OTM5NmMxYTk3Zjk1OGMyZWE5NWI5YzMwYTliOTI1NzZmZTAgIGJhdG1hbi1hZHYt
MjAyMi4yLnRhci5negogc2hhMjU2ICBjZWNiZjUzZDExNDhlMTMyNTZhYzI5ZjhiOTAwNjU1Yjdm
YzhkYzEyZDU5OTM5YTk1YmMyMzIzZWExNzQ3MDI1ICBMSUNFTlNFUy9wcmVmZXJyZWQvR1BMLTIu
MAogc2hhMjU2ICAzMjNjNTg3ZDBjY2YxMGUzNzZmOGJmOWE3ZjMxZmI0Y2E2MDc4MTA1MTk0YjQy
ZTBiMWUwZWUyYmM5YmRlNzFmICBMSUNFTlNFUy9wcmVmZXJyZWQvTUlUCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2JhdG1hbi1hZHYvYmF0bWFuLWFkdi5tayBiL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRt
YW4tYWR2Lm1rCmluZGV4IDZhMWFhYTY5OWMuLmQyNzk2OTRiZjUgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvYmF0bWFuLWFkdi9iYXRtYW4tYWR2Lm1rCisrKyBiL3BhY2thZ2UvYmF0bWFuLWFkdi9iYXRt
YW4tYWR2Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAot
QkFUTUFOX0FEVl9WRVJTSU9OID0gMjAyMS40CitCQVRNQU5fQURWX1ZFUlNJT04gPSAyMDIyLjIK
IEJBVE1BTl9BRFZfU0lURSA9IGh0dHBzOi8vZG93bmxvYWRzLm9wZW4tbWVzaC5vcmcvYmF0bWFu
L3N0YWJsZS9zb3VyY2VzL2JhdG1hbi1hZHYKIEJBVE1BTl9BRFZfTElDRU5TRSA9IEdQTC0yLjAs
IE1JVCAoYmF0bWFuX2Fkdi5oKQogQkFUTUFOX0FEVl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRVMv
cHJlZmVycmVkL0dQTC0yLjAgTElDRU5TRVMvcHJlZmVycmVkL01JVAotLSAKMi4zNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
