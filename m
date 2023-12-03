Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE81C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB1DC400EC;
	Sun,  3 Dec 2023 22:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB1DC400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjwjJKmSnbml; Sun,  3 Dec 2023 22:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D41BD400F9;
	Sun,  3 Dec 2023 22:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D41BD400F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3921BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E85B4154E
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E85B4154E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qL2sgsbGA6Bc for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:21:52 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F11E41529
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F11E41529
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b4d9e81deso40726315e9.0
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 14:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701642108; x=1702246908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Su1oojJIWwg3OztDl6SwuhBU/++ze4xFrvkWzEDx4Q8=;
 b=DVq3rHCHbaP1U31EZIdcQxTCyKbUrTHOlIe5gFn5Tyrtu4cR+8Hkrou9WCNmgAT1lj
 kruF4+/IorqW/1R2ffSAijDT90G1lDy/l7rlV1CUhcLKGnrgczAYd25VwepY4ZvmbVnK
 OaOXMO+DLp5DuHRKWT8vD84FauWbnDyZePixgAOiMo3nRQKJtePEgD7F1yG3DXrGlp1U
 PpkNdQgwrtJnvP5DO0+fUVa5Ba4tgH1ow8t45899w6H9Ux1PAS97eA4J9fLi+7yaNOPS
 MTwhJYQhA3zAUyd8m28jcfaHAhyCyYNsyn6m1O3Og3ciAZs5EsdS0PU5XB7rt1/9lQPm
 pnFQ==
X-Gm-Message-State: AOJu0YyMzlQhtHjp2wgXpgJU+Qk3PSipANfFI/rqhBgK4+Vj8CzyYcMi
 Kw0lnSl/b3MpjXaNbneL2RQ2a78jASQ=
X-Google-Smtp-Source: AGHT+IF8W1WjsDU7bACrsaOMNOSXOlsIqaDztDMaflMWTdZjQhqBN3FII0lbuCQ25l2eMzlb1MO1Fg==
X-Received: by 2002:a05:600c:3ba9:b0:408:37aa:4766 with SMTP id
 n41-20020a05600c3ba900b0040837aa4766mr2084153wms.5.1701642108298; 
 Sun, 03 Dec 2023 14:21:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fa23-20020a05600c519700b003fee6e170f9sm12790951wmb.45.2023.12.03.14.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 14:21:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 23:21:45 +0100
Message-ID: <20231203222145.347693-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701642108; x=1702246908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Su1oojJIWwg3OztDl6SwuhBU/++ze4xFrvkWzEDx4Q8=;
 b=Iy001DprYpUf2t3b2AxpfUFTKgfiLi6Re/NRmL95Bz9dqLw93a3ooG3RSfwF21y2N8
 MHBQTIB0Jv8fgQ48HvuGwNrZsik7efABP8Hsk0JMzB9vd27pgE5Yh2gg1bXhNvf07+v/
 Y5O5Y7BQzZUl76BYu9EHS9utdgilAD1vl5FzLZbt6/kLlM2Llx7Ulk9trKK1RyFvZkGZ
 VB4SsSH6Em4ON7MmCCTuuDJYzcsixI866TaFl4l5pxHGAf4z4iCKZXXyIqIvASJBKr8e
 rIT1eBzmR/G/hU3vIYsRHuBFonBiGeUaGB6smaZ2mRWu1JxJFqp0ZWbvda3GSfrLghfp
 KNCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iy001Dpr
Subject: [Buildroot] [PATCH 1/1] package/lttng-modules: bump to version
 2.13.10
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBidW1wIHdpbGwgZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZXMgd2l0aCBrZXJu
ZWwgPj0gNi4zLjAKdGhhbmtzIHRvCmh0dHBzOi8vZ2l0aHViLmNvbS9sdHRuZy9sdHRuZy1tb2R1
bGVzL2NvbW1pdC9mMzU1OWU1YjA2YjI0YWQwMzM2MjExOTUwNzkyZmE5NzM5OGM1ZTlhCmFuZApo
dHRwczovL2dpdGh1Yi5jb20vbHR0bmcvbHR0bmctbW9kdWxlcy9jb21taXQvOTM5MjAwZWYxNjBj
OTVjOGE5ZDcxZmQ4MGM5OWY0MmExZGUwYTlmMDoKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9t
ZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEvYnVpbGQvbHR0bmctbW9k
dWxlcy0yLjEzLjcvLi9zcmMvbHR0bmctcmluZy1idWZmZXItY2xpZW50Lmg6MTYsCiAgICAgICAg
ICAgICAgICAgZnJvbSAvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0
LTEvYnVpbGQvbHR0bmctbW9kdWxlcy0yLjEzLjcvLi9zcmMvbHR0bmctcmluZy1idWZmZXItY2xp
ZW50LWRpc2NhcmQuYzoxNjoKL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0xL291
dHB1dC0xL2J1aWxkL2x0dG5nLW1vZHVsZXMtMi4xMy43Ly4vc3JjLy4uL2luY2x1ZGUvbHR0bmcv
ZXZlbnRzLWludGVybmFsLmg6MjkyOjk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1dWlk
X2xl4oCZCiAgMjkyIHwgICAgICAgICB1dWlkX2xlIHV1aWQ7ICAgICAgICAgICAgICAgICAgIC8q
IFRyYWNlIHNlc3Npb24gdW5pcXVlIElEIChjb3B5KSAqLwogICAgICB8ICAgICAgICAgXn5+fn5+
fgoKWy4uLl0KCi9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5zdGFuY2UtMy9vdXRwdXQtMS9idWls
ZC9sdHRuZy1tb2R1bGVzLTIuMTMuNy8uL3NyYy9saWIvcmluZ2J1ZmZlci9yaW5nX2J1ZmZlcl9t
bWFwLmM6IEluIGZ1bmN0aW9uIOKAmGxpYl9yaW5nX2J1ZmZlcl9tbWFwX2J1ZuKAmToKL2hvbWUv
dGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxkL2x0dG5nLW1vZHVsZXMt
Mi4xMy43Ly4vc3JjL2xpYi9yaW5nYnVmZmVyL3JpbmdfYnVmZmVyX21tYXAuYzoxMTY6MjM6IGVy
cm9yOiBhc3NpZ25tZW50IG9mIHJlYWQtb25seSBtZW1iZXIg4oCYdm1fZmxhZ3PigJkKICAxMTYg
fCAgICAgICAgIHZtYS0+dm1fZmxhZ3MgfD0gVk1fRE9OVEVYUEFORDsKICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgXn4KCmh0dHBzOi8vZ2l0aHViLmNvbS9sdHRuZy9sdHRuZy1tb2R1bGVz
L2Jsb2IvdjIuMTMuMTAvQ2hhbmdlTG9nCgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvN2I4ZjU3MjYyYTAyY2Q5YWFhOTUzYTlkODY2NjY0NmJhZTFjYzY1
NQoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Ci0tLQogcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaCB8IDQg
KystLQogcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLmhhc2ggYi9wYWNrYWdlL2x0
dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoCmluZGV4IGU2ODVjYzMzNjcuLmIxNGI0ODg4
MzcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLmhhc2gK
KysrIGIvcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaApAQCAtMSw1ICsx
LDUgQEAKLSMgRnJvbSBodHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRuZy1tb2R1bGVzL2x0dG5n
LW1vZHVsZXMtMi4xMy43LnRhci5iejIuc2hhMjU2Ci1zaGEyNTYgIDVhOTk2NzlkZjc5MDMxNjBj
YmRlMzkxOGZlZTVhZjkwZmZhZmM5MGZjOTZjY2RlZmFhNTdjZjIzMDQ5MmIyMzQgIGx0dG5nLW1v
ZHVsZXMtMi4xMy43LnRhci5iejIKKyMgRnJvbSBodHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRu
Zy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMtMi4xMy4xMC50YXIuYnoyLnNoYTI1Ngorc2hhMjU2ICAx
M2FiZmIxYWM4NzA3MTFmMGQwYWRmYTg4ZTUzYjE3ZGViMmUzMDUyMTczNzE1YTI2MGE2ZWYxNGFh
NDViMGE3ICBsdHRuZy1tb2R1bGVzLTIuMTMuMTAudGFyLmJ6MgogCiAjIEhhc2ggZm9yIGxpY2Vu
c2UgZmlsZXMKIHNoYTI1NiAgZDcyOTIxMjY2YmM4NDUyYTg3ODlmOGEwNGE4Mjc1NTM3Mzk5MGQw
MGI3ZTBiMGYxYThlZGI4Zjg1NGU5NGQxYyAgTElDRU5TRVMvTEdQTC0yLjEKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLm1rIGIvcGFja2FnZS9sdHRuZy1t
b2R1bGVzL2x0dG5nLW1vZHVsZXMubWsKaW5kZXggNDE2ODMzZjRlZi4uZDZmMWU0MTE0ZCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsKKysrIGIvcGFj
a2FnZS9sdHRuZy1tb2R1bGVzL2x0dG5nLW1vZHVsZXMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MVFROR19NT0RVTEVTX1ZFUlNJT04gPSAyLjEzLjcK
K0xUVE5HX01PRFVMRVNfVkVSU0lPTiA9IDIuMTMuMTAKIExUVE5HX01PRFVMRVNfU0lURSA9IGh0
dHA6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0bmctbW9kdWxlcwogTFRUTkdfTU9EVUxFU19TT1VSQ0Ug
PSBsdHRuZy1tb2R1bGVzLSQoTFRUTkdfTU9EVUxFU19WRVJTSU9OKS50YXIuYnoyCiBMVFROR19N
T0RVTEVTX0xJQ0VOU0UgPSBMR1BMLTIuMS9HUEwtMi4wIChrZXJuZWwgbW9kdWxlcyksIE1JVCAo
bGliL2JpdGZpZWxkLmgsIGxpYi9wcmlvX2hlYXAvKikKLS0gCjIuNDIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
