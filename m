Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE34C43217
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 16:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595B040414;
	Sun, 27 Nov 2022 16:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 595B040414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3IcXn_EUmeY; Sun, 27 Nov 2022 16:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6557F400D6;
	Sun, 27 Nov 2022 16:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6557F400D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A186E1BF425
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 16:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CED360B2E
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 16:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CED360B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbaKXxqW0Md4 for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 16:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19995605A1
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19995605A1
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 16:45:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q7so12525847wrr.8
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 08:45:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xx357/iOyae+Njcvve5qLeCgLNEzP1a7LWSmS0ufvCI=;
 b=gE+fFIAV7sfCxPRLbbFrNXGJV6vQLPRiGOt8U2KlDCv9N+9JONJ1j0vC1/l1plBvtK
 mndbnm7lDjCn3gs1yGZp5nHeceGi0pIs8rzxu3gqhkvRkK6JvS0VMBQQ22RMos+WdaJD
 NE7TiU24DanoDWvzovG/d/j8LrAcY8X2iiU98WlBOW8FKeiCIilUMYjbZD37MdirjJve
 szHT3NpPPjYrgUK6B46/b8BxlxSQGJe8jNq5EwmNdnHMTIvYu9lYC8APRM83dcVk4oFs
 Ah6GiHK7rwVd5vnsusUwKKf+RS61WfjoOA8kRzw7lpkisJOBMU+jDCWT+jqF9H4/xyrI
 S9kQ==
X-Gm-Message-State: ANoB5pmOHBzMcMahdrBtO0OimpYgls3+jGxBwU9P1odxnm342QrFcoDu
 dFEvVtYWWP8Dv9FfuVMvW7qzwA/AlU1IlA==
X-Google-Smtp-Source: AA0mqf65F/pjD0Iq7vPA06Slc28bAhNTIyP3dYAbtheSLEyWecD2mQDGSJj5n1trIjNGCFKteayWrg==
X-Received: by 2002:adf:ab1d:0:b0:242:e73:f642 with SMTP id
 q29-20020adfab1d000000b002420e73f642mr3531660wrc.184.1669567536837; 
 Sun, 27 Nov 2022 08:45:36 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:2488:d453:b017:99a])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003b3307fb98fsm12075180wms.24.2022.11.27.08.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 08:45:35 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 17:45:33 +0100
Message-Id: <20221127164533.1075407-1-anisse@astier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xx357/iOyae+Njcvve5qLeCgLNEzP1a7LWSmS0ufvCI=;
 b=7pFaYKx5noeRNUohqFnMUlFdGrEV5wXevM2QM/0UPEDyeLaHaW5Ntbwzz83Ee8JyYz
 lQdsvud5mFh55Bw4Hgt8czHthyJyB10YxPkrZvDfopKXHt1omQ07bxsVfhFgbCZR70aA
 OVpez6xsbybv/95AjIqYfQbexNzOvA8wBzbQBG3+eg1H1UKJa7x98Q+V+nEnKObfOfJv
 Poo7MU+369dhlQQDMoJGADIAdR/3W6Owx8DxCaJRl8meH5xJh3ImRTzQbF7cQVGcWGbx
 QVLklNDBjb7x6Kd9d4HCCbVg1G5WHK/6snIK70B97KLtGn023/aSzM4u+fUcGhI9MLEh
 MfMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=astier-eu.20210112.gappssmtp.com
 header.i=@astier-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7pFaYKx5
Subject: [Buildroot] [PATCH v3] package/go: disable cgo support with static
 libs
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
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGdvIHN0ZGxpYiAicGx1Z2luIuKAr3BhY2thZ2UgcmVsaWVzIG9uIGRsZmNuLmggd2hpY2gg
aXNuJ3QgYXZhaWxhYmxlCndoZW4gd2UgaGF2ZSBCUjJfU1RBVElDX0xJQlM9eS4KCkNvbmNlbnRy
YXRlIGFsbCBjZ28gZGVjaXNpb24gdW5kZXIgdGhlIGNvbmZpZyBvcHRpb24KQlIyX1BBQ0tBR0Vf
SE9TVF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMgdGhhdCBoYXMgdGhlIHByb3Blcgpk
ZXBlbmRzLgoKVGhpcyBzaG91bGQgZml4IHRoaXMgYnVpbGQgZXJyb3IgZnJvbSBhdXRvYnVpbGRl
cnM6CgovYnVpbGRyb290L2J1aWxkL2hvc3QtZ28tMS4xOS4zL3NyYy9wbHVnaW4vcGx1Z2luX2Rs
b3Blbi5nbzoxMToxMDogZmF0YWwgZXJyb3I6IGRsZmNuLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKICAgMTEgfCAjaW5jbHVkZSA8ZGxmY24uaD4KClNpZ25lZC1vZmYtYnk6IEFuaXNzZSBB
c3RpZXIgPGFuaXNzZUBhc3RpZXIuZXU+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYyOgogLSBhZGQgbW9y
ZSBjb21tZW50cwogLSBjb25zb2xpZGF0ZSBhbGwgZGVjaXNpb24gdW5kZXIgYSBzaW5nbGUgY29u
ZmlnIG9wdGlvbiBhcyBzdWdnZXN0ZWQgYnkKICAgWWFubgoKLS0tCiBwYWNrYWdlL2dvL0NvbmZp
Zy5pbi5ob3N0IHwgIDQgKysrKwogcGFja2FnZS9nby9nby5tayAgICAgICAgICB8IDMxICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9Db25maWcuaW4u
aG9zdCBiL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QKaW5kZXggZGVkMDJkM2IzYS4uYWNjMWFk
ZTE3MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9nby9Db25maWcuaW4uaG9zdAorKysgYi9wYWNrYWdl
L2dvL0NvbmZpZy5pbi5ob3N0CkBAIC0yMyw2ICsyMywxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
SE9TVF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMKIAkjIEdvIGRvZXNuJ3Qgc3VwcG9y
dCBDR08gbGlua2luZyBvbiBNSVBTNjR4IHBsYXRmb3JtcwogCSMgU2VlOiBodHRwczovL2dpdGh1
Yi5jb20va2FyYWxhYmUveGdvL2lzc3Vlcy80NgogCWRlcGVuZHMgb24gIUJSMl9taXBzNjQgJiYg
IUJSMl9taXBzNjRlbAorCSMgZ28gdXNlcyBkbGZjbi5oICsgY2dvIGZvciBpdHMgcGx1Z2luIG1v
ZHVsZQorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUworCSMgY2dvIHN1cHBvcnRzIHVzZXMg
dGhyZWFkcworCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwogCiAjIEhvc3Qg
Z28gcGFja2FnZXMgc2hvdWxkIGRlcGVuZCBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX0hPU1RfQVJD
SF9TVVBQT1JUUwogY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR09fSE9TVF9BUkNIX1NVUFBPUlRT
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2dvL2dvLm1rIGIvcGFja2FnZS9nby9nby5tawppbmRleCBm
ZDRjYWEyZTVhLi5lODAyM2RhMjYwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2dvL2dvLm1rCisrKyBi
L3BhY2thZ2UvZ28vZ28ubWsKQEAgLTgzLDE2ICs4Myw2IEBAIEhPU1RfR09fVEFSR0VUX0VOViA9
IFwKIAlDR09fTERGTEFHUz0iJChUQVJHRVRfTERGTEFHUykiIFwKIAlHT1RPT0xESVI9IiQoSE9T
VF9HT19UT09MRElSKSIKIAotIyBUaGUgZ28gY29tcGlsZXIncyBjZ28gc3VwcG9ydCB1c2VzIHRo
cmVhZHMuICBJZiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIGlzCi0jIHNldCwgYnVpbGQgaW4g
Y2dvIHN1cHBvcnQgZm9yIGFueSBnbyBwcm9ncmFtcyB0aGF0IG1heSBuZWVkIGl0LiAgTm90ZSB0
aGF0Ci0jIGFueSB0YXJnZXQgcGFja2FnZSBuZWVkaW5nIGNnbyBzdXBwb3J0IG11c3QgaW5jbHVk
ZQotIyAnZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTJyBpbiBpdHMgY29uZmln
IGZpbGUuCi1pZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMpLHkpCi1IT1NUX0dPX0NH
T19FTkFCTEVEID0gMQotZWxzZQotSE9TVF9HT19DR09fRU5BQkxFRCA9IDAKLWVuZGlmCi0KIEhP
U1RfR09fQ1JPU1NfRU5WID0gXAogCUNDX0ZPUl9UQVJHRVQ9IiQoVEFSR0VUX0NDKSIgXAogCUNY
WF9GT1JfVEFSR0VUPSIkKFRBUkdFVF9DWFgpIiBcCkBAIC0xMDEsMTIgKzkxLDI1IEBAIEhPU1Rf
R09fQ1JPU1NfRU5WID0gXAogCSQoaWYgJChHT19HTzM4NiksR08zODY9JChHT19HTzM4NikpIFwK
IAkkKGlmICQoR09fR09BUk0pLEdPQVJNPSQoR09fR09BUk0pKSBcCiAJR09fQVNTVU1FX0NST1NT
Q09NUElMSU5HPTEKK2VuZGlmICMgQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQ
T1JUUwogCi1lbHNlICMgIUJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMK
LSMgaG9zdC1nbyBjYW4gc3RpbGwgYmUgdXNlZCB0byBidWlsZCBwYWNrYWdlcyBmb3IgdGhlIGhv
c3QuIE5vIG5lZWQgdG8gc2V0IGFsbAotIyB0aGUgYXJjaCBzdHVmZiBzaW5jZSB3ZSB3aWxsIG5v
dCBiZSBjcm9zcy1jb21waWxpbmcuCisjIFRoZSBnbyBjb21waWxlcidzIGNnbyBzdXBwb3J0IHVz
ZXMgdGhyZWFkcy4gSWYgQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyBpcworIyBzZXQsIGJ1aWxk
IGluIGNnbyBzdXBwb3J0IGZvciBhbnkgZ28gcHJvZ3JhbXMgdGhhdCBtYXkgbmVlZCBpdC4KKyMK
KyMgSWYgdGhlIHdlIGFyZSB1c2luZyBzdGF0aWMgbGlicywgZHluYW1pYyBsb2FkaW5nIG9mIGxp
YnJhcmllcyB3b24ndCBiZQorIyBhdmFpbGFibGUsIGFuZCBnbyB3b24ndCBiZSBhYmxlIHRvIHVz
ZSBkbGZjbi5oIGZvciBpdHMgcGx1Z2luIHBhY2thZ2UuCisjIERpc2FibGUgY2dvIGFzIHdlbGwu
CisjCisjIElmIHRoZSB0YXJnZXQgYXJjaCBkb2VzIG5vdCBzdXBwb3J0IGdvLCBob3N0LWdvIGNh
biBzdGlsbCBiZSB1c2VkIHRvIGJ1aWxkCisjIHBhY2thZ2VzIGZvciB0aGUgaG9zdCwgYW5kIGVu
YWJsZSBjZ28uCisjCisjIE5vdGUgdGhhdCBhbnkgdGFyZ2V0IHBhY2thZ2UgbmVlZGluZyBjZ28g
c3VwcG9ydCBtdXN0IGluY2x1ZGUgJ2RlcGVuZHMgb24KKyMgQlIyX1BBQ0tBR0VfSE9TVF9HT19U
QVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMnIGluIGl0cyBjb25maWcgZmlsZS4KK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQ0dPX0xJTktJTkdfU1VQUE9SVFMpLHkpCiBIT1NU
X0dPX0NHT19FTkFCTEVEID0gMQotZW5kaWYgIyBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9B
UkNIX1NVUFBPUlRTCitlbHNlCitIT1NUX0dPX0NHT19FTkFCTEVEID0gMAorZW5kaWYKIAogIyBG
b3IgdGhlIGNvbnZlbmllbmNlIG9mIGhvc3QgZ29sYW5nIHBhY2thZ2VzCiBIT1NUX0dPX0hPU1Rf
RU5WID0gXAotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
