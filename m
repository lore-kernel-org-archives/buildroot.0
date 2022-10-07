Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2F4C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 12:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4608B417D7;
	Fri,  7 Oct 2022 12:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4608B417D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOCXeyiIQm5y; Fri,  7 Oct 2022 12:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F339F41568;
	Fri,  7 Oct 2022 12:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F339F41568
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE801BF338
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79A4740359
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A4740359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qPYyN7AY8Ar for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 12:47:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902D8404EB
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 902D8404EB
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 12:47:07 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h19so3547483iof.0
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 05:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8EVHkFLW8z2veTMXbwyQqtxOnPDoeDzyCQYDWMsp/vw=;
 b=C0jp+WNEFbIYtPMOQbPBxymKxsWUchLvA+q8lMb0cmHsU/UcIV2kyLh7kdGvcQuJGy
 zopoHm6Vr3k6uFxD0Yfo4ReNQZtXgXVRqVRJHmZtWGEuCJBCrepFJ8yU0QnFDwoleAsS
 VPmowyqTf5P/fQnHzqYwzbe6uiPrukvr96fHQoziTyzCMj8cYFx2N5owrjdpqNJ5xsJv
 8afF6yQi/cK3pRmBrF/CdMwPg5z/IOh6PXVN+UFxiLZ6JqEBPbfDZqh5dBgmks8kiM+m
 2EQmyz7Mbaaj+Sb6AuiA+Yh3yKxDJeaaBYIBDV4Yw1t56LAqNFN23BmBv7IXo9gUOiOH
 +TyA==
X-Gm-Message-State: ACrzQf19VO7QxBvdmctOaaxf98fGG2Z7NMcZEAsYm9r1XltnWrqZM1ES
 ZhJvdUFXjjQJi0JyRlAWgnJSc0r+bI4TOQ==
X-Google-Smtp-Source: AMsMyM6r9S4rxFI2Dhx+vDny6MaIPfd/r2byqT8qy56BoyfdXBwI5bUvTiOCmvtVJcSumWl2CakYJA==
X-Received: by 2002:a05:6638:2686:b0:35a:40db:95ea with SMTP id
 o6-20020a056638268600b0035a40db95eamr2470807jat.303.1665146826361; 
 Fri, 07 Oct 2022 05:47:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n20-20020a027154000000b0034e0cdeecc2sm830159jaf.98.2022.10.07.05.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:47:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 06:47:03 -0600
Message-Id: <20221007124703.2733559-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8EVHkFLW8z2veTMXbwyQqtxOnPDoeDzyCQYDWMsp/vw=;
 b=JcP1EkSSGRgx+WQ2FBKS4d2OI7tzUY3Hj3GwCMToxfcDpDnoFOSQJXwX3B/aYhwm/r
 ZGKJx8jAOV/A+Jjg1CgBpnjyCW51FvO+q8fOfOSe2izpZnnVFUIbfILCNooDQ0k/6Se0
 oPn2gV4jjVP+TWwMEEDnT4q/Jzy8nm4Uujy0btcCEwzYVb42ImRRcuQ5C5xzfDbKM633
 K1nIL/vQ2zvsUgslTJAIcHZqE55zatgAiQUWNoNVxAs1iBh0S36fXPuUHIyDrXVmf1OE
 BFqBDDdvK+OtMlpI7hJpquRKSEKuu0MpsnZ2/aXm9bJkVcIci+bEv8zsx9p6pDE2m+WS
 w0AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JcP1EkSS
Subject: [Buildroot] [PATCH 1/1] package/assimp: bump to version 5.2.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVwbGFjZSBkaXNhYmxlIC1XZXJyb3IgcGF0Y2ggd2l0aCBuZXcgY21ha2Ugb3B0aW9uOgotREFT
U0lNUF9XQVJOSU5HU19BU19FUlJPUlM9T0ZGCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL2Fzc2ltcC8wMDAxLWNv
ZGUtZGlzYWJsZS1XZXJyb3IucGF0Y2ggfCAzOSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdl
L2Fzc2ltcC9hc3NpbXAuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9h
c3NpbXAvYXNzaW1wLm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0KIDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2Fzc2ltcC8wMDAxLWNvZGUtZGlzYWJsZS1XZXJyb3IucGF0Y2gKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2Fzc2ltcC8wMDAxLWNvZGUtZGlzYWJsZS1XZXJyb3IucGF0Y2ggYi9wYWNr
YWdlL2Fzc2ltcC8wMDAxLWNvZGUtZGlzYWJsZS1XZXJyb3IucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDMzODY3ZTYxYzMuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9hc3Np
bXAvMDAwMS1jb2RlLWRpc2FibGUtV2Vycm9yLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzkg
KzAsMCBAQAotRnJvbSA1MTQ2ZTFjNGQ1ODE3NGUzMDJkYmRjZjJhODVjMjAyM2JlMWNmZmM2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBn
bXgubmV0PgotRGF0ZTogRnJpLCAxMCBEZWMgMjAyMSAxNToxNTozMCArMDEwMAotU3ViamVjdDog
W1BBVENIXSBjb2RlOiBkaXNhYmxlIC1XZXJyb3IKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKLQotRml4ZXM6Ci0KLSAgLi4uL2J1aWxkL2Fzc2ltcC01LjEuMy9jb2RlL1Bvc3RQ
cm9jZXNzaW5nL1RyaWFuZ3VsYXRlUHJvY2Vzcy5jcHA6Mjg1OjUwOiBlcnJvcjogYXJndW1lbnQg
MSB2YWx1ZSDigJg0Mjk0OTY3Mjk04oCZIGV4Y2VlZHMgbWF4aW11bSBvYmplY3Qgc2l6ZSAyMTQ3
NDgzNjQ3IFstV2Vycm9yPWFsbG9jLXNpemUtbGFyZ2VyLXRoYW49XQotICAgIDI4NSB8ICAgICBz
dGQ6OnVuaXF1ZV9wdHI8Ym9vbFtdPiBkb25lKG5ldyBib29sW21heF9vdXRdKTsKLSAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgotICBb
Li4uXQotICAuLi4vaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9wb3dlcnBjLWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMvaW5jbHVkZS9jKysvOS4zLjAvbmV3OjEyNzoyNjogbm90ZTogaW4gYSBjYWxsIHRv
IGFsbG9jYXRpb24gZnVuY3Rpb24g4oCYdm9pZCogb3BlcmF0b3IgbmV3IFtdKHN0ZDo6c2l6ZV90
KeKAmSBkZWNsYXJlZCBoZXJlCi0gICAgMTI3IHwgX0dMSUJDWFhfTk9ESVNDQVJEIHZvaWQqIG9w
ZXJhdG9yIG5ld1tdKHN0ZDo6c2l6ZV90KSBfR0xJQkNYWF9USFJPVyAoc3RkOjpiYWRfYWxsb2Mp
Ci0gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Ci0KLVNpZ25lZC1v
ZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tLQotIGNvZGUvQ01h
a2VMaXN0cy50eHQgfCAyIC0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCi0KLWRp
ZmYgLS1naXQgYS9jb2RlL0NNYWtlTGlzdHMudHh0IGIvY29kZS9DTWFrZUxpc3RzLnR4dAotaW5k
ZXggZTQ1YmY4YTJhLi5mNzFiNjU4M2QgMTAwNjQ0Ci0tLS0gYS9jb2RlL0NNYWtlTGlzdHMudHh0
Ci0rKysgYi9jb2RlL0NNYWtlTGlzdHMudHh0Ci1AQCAtMTE2Nyw4ICsxMTY3LDYgQEAgVEFSR0VU
X1VTRV9DT01NT05fT1VUUFVUX0RJUkVDVE9SWShhc3NpbXApCi0gIyBlbmFibGUgd2FybmluZ3Mg
YXMgZXJyb3JzICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKLSBJRiAo
TVNWQykKLSAgIFRBUkdFVF9DT01QSUxFX09QVElPTlMoYXNzaW1wIFBSSVZBVEUgL1dYKQotLUVM
U0UoKQotLSAgVEFSR0VUX0NPTVBJTEVfT1BUSU9OUyhhc3NpbXAgUFJJVkFURSAtV2Vycm9yKQot
IEVORElGKCkKLSAKLSAjIGFkZHMgQ19GTEFHUyByZXF1aXJlZCB0byBjb21waWxlIHppcC5jIG9u
IG9sZCBHQ0MgNC54IGNvbXBpbGVyCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2Fzc2ltcC9hc3NpbXAuaGFzaCBiL3BhY2thZ2UvYXNzaW1wL2Fzc2ltcC5oYXNoCmluZGV4IGE3
NzhiNzkxMzIuLjg2YTkwOTI3ZWQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXNzaW1wL2Fzc2ltcC5o
YXNoCisrKyBiL3BhY2thZ2UvYXNzaW1wL2Fzc2ltcC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBM
b2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYzljYmJjODU4OTYzOWNkOGMxM2Y2NWU5NGE5MDQy
MmE3MDQ1NGU4ZmExNTBjZjg5OWI2MDM4YmE4NmU5ZWNmZiAgYXNzaW1wLTUuMi4xLnRhci5negor
c2hhMjU2ICBiNTIxOWU2M2FlMzFkODk1ZDYwZDk4MDAxZWU1YmI4MDlmYjJjN2IyZGUxZTdmNzhj
ZWViNjAwMDYzNjQxZTFhICBhc3NpbXAtNS4yLjUudGFyLmd6CiBzaGEyNTYgIDE0Nzg3NDQ0M2Qy
NDJiNGUyYmFlOTcwMzZlMjZlYzlkNmIzN2Y3MDYxNzRjMWJkNWVjZmNjOGMxMjk0Y2VmNTEgIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXNzaW1wL2Fzc2ltcC5tayBiL3BhY2thZ2UvYXNz
aW1wL2Fzc2ltcC5tawppbmRleCA3OTg2NTY3M2FjLi4wYjYwMzRmYjhlIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2Fzc2ltcC9hc3NpbXAubWsKKysrIGIvcGFja2FnZS9hc3NpbXAvYXNzaW1wLm1rCkBA
IC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotQVNTSU1QX1ZFUlNJ
T04gPSA1LjIuMQorQVNTSU1QX1ZFUlNJT04gPSA1LjIuNQogQVNTSU1QX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLGFzc2ltcCxhc3NpbXAsdiQoQVNTSU1QX1ZFUlNJT04pKQogQVNTSU1QX0xJQ0VOU0Ug
PSBCU0QtMy1DbGF1c2UKIEFTU0lNUF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQpAQCAtMzksNiAr
MzksNyBAQCBBU1NJTVBfQ1hYRkxBR1MgKz0gLU8wCiBlbmRpZgogCiBBU1NJTVBfQ09ORl9PUFRT
ICs9IC1EQVNTSU1QX0JVSUxEX1RFU1RTPU9GRiBcCisJLURBU1NJTVBfV0FSTklOR1NfQVNfRVJS
T1JTPU9GRiBcCiAJLURDTUFLRV9DWFhfRkxBR1M9IiQoVEFSR0VUX0NYWEZMQUdTKSAkKEFTU0lN
UF9DWFhGTEFHUykiCiAKICQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
