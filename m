Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DEFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 21:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2642E4023F;
	Thu,  2 Nov 2023 21:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2642E4023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLN33UPq25Uh; Thu,  2 Nov 2023 21:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA9074028D;
	Thu,  2 Nov 2023 21:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA9074028D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0953A1BF59C
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C9F6F514
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 21:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C9F6F514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0ymmcOYOiU8 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 21:07:12 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37D266F504
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 21:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D266F504
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40838915cecso10170705e9.2
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 14:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698959229; x=1699564029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z+1U33k/naNjhcsELfpEg5Zn5HRskQfzoVUn8WFTpsY=;
 b=pqcZiqVBCbMUT2P00grt6q9CgySjOhIccFMTMIiAnQvgXuS6iuIeuAHNu1/rCbyIWc
 dsasIL49Din3vLyopqjTRFC6gPwjtMmlDBvQ8wts6tasoulZvr0Ld3NQkigjwvr8yXMR
 WWElfZ+RhU+3JwI3DAQfMbkWQzxPAKHVhpq2pQIuCX5mYVWgm+vSKlcoIogf+sFFWW0F
 fPoMb7N/mX/WAmxsVkpo8BBqRCQvBXJp2a3uuD4G+QB5lNlQa6FwezKC2u89bKiT9h9R
 OfCCmQG58Cp1Jh3vqtL/3OnS4S/d7SJTIAJTh1ttqamwqcDg5yZukpytGmW9MWP3264H
 PiuQ==
X-Gm-Message-State: AOJu0YwqSoLpzwyNMtm9F36seMlmxQeQYXtMGaUnL6iqf/4D10Xrasae
 PpkEHysVyOLA42apjUawJ0bS7p2ZwC4=
X-Google-Smtp-Source: AGHT+IGtKeDjqxPNQQHyCVvRl4ppHftT1IqXHEx6Mnp+b30SEnDPRY/EeBHAH9QlBNEVAw88ILGlrw==
X-Received: by 2002:a05:600c:35c9:b0:401:73b2:f039 with SMTP id
 r9-20020a05600c35c900b0040173b2f039mr17087133wmq.7.1698959229119; 
 Thu, 02 Nov 2023 14:07:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c4e8600b003fefb94ccc9sm317834wmq.11.2023.11.02.14.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 14:07:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 22:07:04 +0100
Message-ID: <20231102210704.4817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698959229; x=1699564029; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+1U33k/naNjhcsELfpEg5Zn5HRskQfzoVUn8WFTpsY=;
 b=Fj0zKvBU7F6+/j/Fxu4tDlGDjjio1C3blOl4hhp5V67lrtH27kbZhjpDEyoa68tylX
 8B6UyJTd0MZC7dwek7IFPrUTme3q7F/S+JatP8k9ka7mN1AMNZRCO6CVd5rSIHc31lfL
 H5T5+DQZVCxzm5ZhP9wA69bt2LxmD6TledSpsZ8zRyr3gPwZX3T/0t4cX6reCFosKXEc
 mrklh9Ulzb9/NQPy1VerlKk1pS0QAiu8FaUyB3jlng5XTSVuPleKDeGvTUSYhwgLyBwA
 JhFbI9BCYukQXz4OD5hr2HA3QzQbjrUZPX1QrqSePn9lO9UsBANl/TPlDuQyDb/e1zjU
 CCXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fj0zKvBU
Subject: [Buildroot] [PATCH 1/1] package/dtbocfg: bump to version 0.1.0
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBidW1wIHdpbGwgZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGtlcm5l
bCA+PSA2LjYgdGhhbmtzCnRvCmh0dHBzOi8vZ2l0aHViLmNvbS9pa3d6bS9kdGJvY2ZnL2NvbW1p
dC8zNmU5ZGFkN2JkZWRjNDNiOWM2M2FhNDhjM2ZjNDhmZmM0ZDJiMmRkOgoKL2hvbWUvdGhvbWFz
L2F1dG9idWlsZC9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxkL2R0Ym9jZmctMC4wLjkvLi9kdGJv
Y2ZnLmM6IEluIGZ1bmN0aW9uIOKAmGR0Ym9jZmdfb3ZlcmxheV9pdGVtX2NyZWF0ZeKAmToKL2hv
bWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxkL2R0Ym9jZmctMC4w
LjkvLi9kdGJvY2ZnLmM6Njg6MTk6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlv
biDigJhvZl9vdmVybGF5X2ZkdF9hcHBseeKAmQogICA2OCB8ICAgICAgICAgcmV0X3ZhbCA9IG9m
X292ZXJsYXlfZmR0X2FwcGx5KG92ZXJsYXktPmR0Ym8sb3ZlcmxheS0+ZHRib19zaXplLCAmb3Zj
c19pZCk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KCmh0
dHBzOi8vZ2l0aHViLmNvbS9pa3d6bS9kdGJvY2ZnL2NvbXBhcmUvdjAuMC45Li4udjAuMS4wCgpG
aXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZTViYWU3ZmE1
NTU4ODAxYzM5ZjUzYTRhMTVhYzU1MGMzODU1MzIyZQoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9kdGJvY2Zn
L2R0Ym9jZmcuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZHRib2NmZy9kdGJvY2ZnLm1rICAgfCAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2R0Ym9jZmcvZHRib2NmZy5oYXNoIGIvcGFja2FnZS9kdGJvY2ZnL2R0
Ym9jZmcuaGFzaAppbmRleCA3ZGI2OWY5ZTU5Li5kZjE4MTdmN2FhIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2R0Ym9jZmcvZHRib2NmZy5oYXNoCisrKyBiL3BhY2thZ2UvZHRib2NmZy9kdGJvY2ZnLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIGZhYTUzYWVm
ZDdmNzYzNmM2NWUyYjU2YmVjMjIzZDJiYzc2NzYzNTRlM2FkOWI1YzE2OTFhY2EzNDliOWJiYjgg
IGR0Ym9jZmctMC4wLjkudGFyLmd6CitzaGEyNTYgIGYxNjY3ZGU0MjUwYjc0NGJiNGExMWRmYzVm
ODVkOGIxZjk2MGRhN2QzOTZjOWYyMzBmNWI0ZDEyMjI0ZjUyNGYgIGR0Ym9jZmctMC4xLjAudGFy
Lmd6CiBzaGEyNTYgIGU1N2NiOWYyZWQ2MDdjZDk1YmYxYjY0MzcxMzI1YzUwNWMxYWM4ZmU2NDBh
OGM5OTMzZTdmZTc2MzdhMzg1NjcgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHRib2Nm
Zy9kdGJvY2ZnLm1rIGIvcGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcubWsKaW5kZXggNjhiZWIxYTQ1
ZS4uZGY1ZjY5MmJjMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcubWsKKysr
IGIvcGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1EVEJPQ0ZHX1ZFUlNJT04gPSAwLjAuOQorRFRCT0NGR19WRVJT
SU9OID0gMC4xLjAKIERUQk9DRkdfU0lURSA9ICQoY2FsbCBnaXRodWIsaWt3em0sZHRib2NmZyx2
JChEVEJPQ0ZHX1ZFUlNJT04pKQogRFRCT0NGR19MSUNFTlNFID0gQlNELTItQ2xhdXNlCiBEVEJP
Q0ZHX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCi0tIAoyLjQyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
