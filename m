Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A72C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 22:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31719402EC;
	Sun, 11 Dec 2022 22:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31719402EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGThZPWNIWKm; Sun, 11 Dec 2022 22:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A89F402EF;
	Sun, 11 Dec 2022 22:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A89F402EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B51E61BF3C6
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 22:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 906AA812B5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 22:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 906AA812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Timmo-Mp_L89 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 22:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CEB8812AB
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CEB8812AB
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 22:55:51 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h17so2607501ila.6
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 14:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sDD+Tps8EoO7EhUwL1fXdQgPtjl0ItPT/U4Yv361Cck=;
 b=20whr4171/AcB38Ekb4tbIGIUpV6e3who0IUO2Toly8gmFIAh/0fCl6Il6vIoKMTRE
 /W39i9g3ea9FOBFumdf56NiDK9zKdc9EsuLkSi1OTDGXNNfrtq58uz8UPu663vyipayE
 HoiwhpOdj83ekvIrWPOIsNCPvyISj9WcmztH/Cu0yrAPkPMaz+Z+FWgyPpmSA+1/MzoX
 oOc+aS7Y2XuRR4TSl1RgdUOzXNC4C/ehg4U0LtVcB71N2dTpjHPRrBhPLnQwJZb+DVe1
 FFrXsyWuTvHlW8sL1P2s4C2jKDUAFDUoa2djqOZSJJSfbng5TUROczC0AJLvYr2VdGC1
 z0vw==
X-Gm-Message-State: ANoB5pm95mdK+vUzyRC/d2qunbi4Zxj93+TVu7c27LPlMVegVrC09mJn
 QKEPz3irX6G79Go4Xnkmaw+HVsvzMNnPnQ==
X-Google-Smtp-Source: AA0mqf4tBcU7DypBkTQjhixaBjIS8uemfijp95OHAWzFOq8cmrP5Nma4AwKWsjVBpqfaTIonheDUag==
X-Received: by 2002:a92:d3d2:0:b0:302:c24c:94da with SMTP id
 c18-20020a92d3d2000000b00302c24c94damr8418867ilh.2.1670799350303; 
 Sun, 11 Dec 2022 14:55:50 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056638218900b0038a87954f81sm2564697jaj.31.2022.12.11.14.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 14:55:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 15:55:15 -0700
Message-Id: <20221211225515.588291-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sDD+Tps8EoO7EhUwL1fXdQgPtjl0ItPT/U4Yv361Cck=;
 b=kTydYGGrMCc9hXLJrUSRGXiAV3bi8sSsPHNdFGv86CZKxiiGGb73x3Wbaf/ytUHz2R
 JU13YZZOabl117JwZzKMvORn66vq5GPrBuvQRPlHM7LfdQtwoVHiwF+4FA2mtABKEkGq
 nCZn+VJgsQt01s6j9NJcXvdg9n2UZR1FeVddIUJ5hZIn8hIwYDnovG2FCDzYPud6+OQN
 3a+v2Iwv87Ui8XQ5HWG9unTqDP/3mo4voG2hywjIAKSEBvQJ/k/Za2sjZf18pRgEzBTr
 RkS8bf1/SoGyOb9w8+YH4qxqdFncNFSOp2gN/B6kPhpEaQiRn54yr21QKCyn+vXQ5R5U
 ArNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kTydYGGr
Subject: [Buildroot] [PATCH 1/1] package/python-bunch: remove package
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

U2luY2UgdGhlIHB5dGhvbjMgYnVtcCB0byB2ZXJzaW9uIDMuMTEgaW4gY29tbWl0CjczODUwMGMy
OTZjOGIxMjA2ZjIwZTk0Y2EzZTdjNTkzMmE2YTA0ODYgcHl0aG9uLWJ1bmNoIGhhcyBmYWlsZWQK
dG8gYnVpbGQuCgpUaGlzIGlzIGR1ZSB0byBvcGVuKCkgd2hpY2ggbm8gbG9uZ2VyIGFjY2VwdHMg
J1UnICjigJx1bml2ZXJzYWwKbmV3bGluZeKAnSkgaW4gdGhlIGZpbGUgbW9kZS4KClJlbW92ZSB0
aGlzIHBhY2thZ2UgYXMgaXQgaGFzIG5vdCBoYWQgYSByZWxlYXNlIHNpbmNlIDIwMTEgYW5kCmlz
IHVubWFpbnRhaW5lZCB1cHN0cmVhbS4KCkRldGFpbHM6Cmh0dHBzOi8vZG9jcy5weXRob24ub3Jn
LzMuMTEvd2hhdHNuZXcvMy4xMS5odG1sI3BvcnRpbmctdG8tcHl0aG9uLTMtMTEKCkZpeGVzOgog
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yYmEvMmJhNzJmYzk4Mzc2
MDVhMzZlYTYzYmJkM2U2ZTE4MWE0MGNkZjM2MAoKU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Ci0tLQogQ29uZmlnLmluLmxlZ2FjeSAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgLQogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAg
ICAgfCAgMSAtCiBwYWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4gICAgICAgICB8ICA2IC0t
LS0tLQogcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLmhhc2ggfCAgNSAtLS0tLQog
cGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rICAgfCAxNCAtLS0tLS0tLS0tLS0t
LQogNiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgogZGVsZXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCiBkZWxldGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNoLm1rCgpkaWZmIC0t
Z2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKaW5kZXggMjhjNjgyMjY4
OS4uNWMxZTE2MmY1NiAxMDA2NDQKLS0tIGEvQ29uZmlnLmluLmxlZ2FjeQorKysgYi9Db25maWcu
aW4ubGVnYWN5CkBAIC0xNDYsNiArMTQ2LDEyIEBAIGVuZGlmCiAKIGNvbW1lbnQgIkxlZ2FjeSBv
cHRpb25zIHJlbW92ZWQgaW4gMjAyMy4wMiIKIAorY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9C
VU5DSAorCWJvb2wgInB5dGhvbi1idW5jaCByZW1vdmVkIgorCXNlbGVjdCBCUjJfTEVHQUNZCisJ
aGVscAorCSAgVGhlIHB5dGhvbi1idW5jaCBwYWNrYWdlIGlzIHVubWFpbnRhaW5lZC4KKwogY29u
ZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9NMlIKIAlib29sICJweXRob24tbTJyIHJlbW92ZWQiCiAJ
c2VsZWN0IEJSMl9MRUdBQ1kKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmlu
ZGV4IGYwZGNjNDJkZTcuLjBjMzc3MzY5NWEgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIv
REVWRUxPUEVSUwpAQCAtMjAxNyw3ICsyMDE3LDYgQEAgRjoJcGFja2FnZS9wb2xpY3ljb3JldXRp
bHMvCiBGOglwYWNrYWdlL3Byb2Z0cGQvCiBGOglwYWNrYWdlL3Byb3RvYnVmLWMvCiBGOglwYWNr
YWdlL3Byb3RvYnVmLwotRjoJcGFja2FnZS9weXRob24tYnVuY2gvCiBGOglwYWNrYWdlL3B5dGhv
bi1jb2xvcmFtYS8KIEY6CXBhY2thZ2UvcHl0aG9uLWZpbGVsb2NrLwogRjoJcGFja2FnZS9weXRo
b24tZmxhc2stY29ycy8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9D
b25maWcuaW4KaW5kZXggOTE0YzM1ODRlOS4uN2YwYzM0NTE5YSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTk3OSw3ICs5NzksNiBAQCBt
ZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWJv
dHRsZS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1icm90bGkvQ29uZmlnLmlu
IgogCXNvdXJjZSAicGFja2FnZS9weXRob24tYnNkaWZmNC9Db25maWcuaW4iCi0Jc291cmNlICJw
YWNrYWdlL3B5dGhvbi1idW5jaC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1j
YWNoZWQtcHJvcGVydHkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tY2FuL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNhbm9wZW4vQ29uZmlnLmluIgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tYnVuY2gvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24t
YnVuY2gvQ29uZmlnLmluCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4OWVhZTc0MmI4
Li4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL0NvbmZpZy5pbgorKysgL2Rl
di9udWxsCkBAIC0xLDYgKzAsMCBAQAotY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9CVU5DSAot
CWJvb2wgInB5dGhvbi1idW5jaCIKLQloZWxwCi0JICBBIGRvdC1hY2Nlc3NpYmxlIGRpY3Rpb25h
cnkgKGEgbGEgSmF2YVNjcmlwdCBvYmplY3RzKS4KLQotCSAgaHR0cDovL2dpdGh1Yi5jb20vZHNj
L2J1bmNoCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2guaGFz
aCBiL3BhY2thZ2UvcHl0aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBjZmRlMmRiNjAzLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvcHl0
aG9uLWJ1bmNoL3B5dGhvbi1idW5jaC5oYXNoCisrKyAvZGV2L251bGwKQEAgLTEsNSArMCwwIEBA
Ci0jIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2J1bmNoL2pzb24KLW1k
NSAgMGE4MjlkNjRlOTVlZDk2ZGVmYmNhZTJiZjkwNjFiYjAgIGJ1bmNoLTEuMC4xLnRhci5negot
c2hhMjU2ICA1MGM3N2EwZmMwY2IzNzJkZmU0OGI1ZTExOTM3ZDVmNzBlNzQzYWRiZjQyNjgzZjNh
NmQyODU3NjQ1YTc2YWFhICBidW5jaC0xLjAuMS50YXIuZ3oKLSMgTG9jYWxseSBjb21wdXRlZCBz
aGEyNTYgY2hlY2tzdW1zCi1zaGEyNTYgIDU3Y2E5NWM5MjA1OWM4MzgwNjI1MTkyNDYyOTc5YmQz
Mjk5NGFhZTNmY2RmOTAyZmY2ZWIxZTQ2N2VlYjA0NjkgIExJQ0VOU0UudHh0CmRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1idW5jaC9weXRob24tYnVuY2gubWsgYi9wYWNrYWdlL3B5dGhvbi1i
dW5jaC9weXRob24tYnVuY2gubWsKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDE4ZmRj
MjIzYmIuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9weXRob24tYnVuY2gvcHl0aG9uLWJ1bmNo
Lm1rCisrKyAvZGV2L251bGwKQEAgLTEsMTQgKzAsMCBAQAotIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKLSMKLSMgcHl0aG9uLWJ1bmNoCi0jCi0jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotCi1QWVRI
T05fQlVOQ0hfVkVSU0lPTiA9IDEuMC4xCi1QWVRIT05fQlVOQ0hfU09VUkNFID0gYnVuY2gtJChQ
WVRIT05fQlVOQ0hfVkVSU0lPTikudGFyLmd6Ci1QWVRIT05fQlVOQ0hfU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lZi9iZi9hNGNmMTc3OWE0ZmZiNGY2MTA5
MDNmYTA4ZTE1ZDFmNGE4YTJmNGUzMzUzYTAyYWZiZTA5N2M1YmY0YTgKLVBZVEhPTl9CVU5DSF9T
RVRVUF9UWVBFID0gc2V0dXB0b29scwotUFlUSE9OX0JVTkNIX0xJQ0VOU0UgPSBNSVQKLVBZVEhP
Tl9CVU5DSF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLQotJChldmFsICQocHl0aG9uLXBh
Y2thZ2UpKQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
