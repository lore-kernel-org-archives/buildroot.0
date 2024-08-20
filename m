Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE3C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 16:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C75474014D;
	Tue, 20 Aug 2024 16:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id og3bpYIb8z-I; Tue, 20 Aug 2024 16:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845AA404B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845AA404B5;
	Tue, 20 Aug 2024 16:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE4EA1BF37A
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 16:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9C9404B5
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 16:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2JqDquqpT-K for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 16:51:24 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1466A4014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1466A4014D
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1466A4014D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 16:51:23 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2023dd9b86aso20166525ad.1
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724172682; x=1724777482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ilq4ixPPavuvnpHvaFNMhCvD5oCWCCUlpQm7djvJ1YE=;
 b=njzz4vP1ybvZoy0hyEtyhiioUtL44U8SejGsF3chzGnUR6sKtibf6CT30Z4rx5qP8o
 SasfQ7G18gv7esHAW/Q0k577Yhm/sVwi2n4gYORDwvTWod383/84pRTEMKMJZmo/XGwX
 jBMyCJkP90XlEyqdfUhuKRIepCz9sMwaBqbwCJy+t8M5tkMqtASniECVWmciJysFBZTq
 VKyRFuvUWIP4dVbkhnlXnCxS6K6Icpe7VrStLV50+SNzVWdpoDY4foyAqE1k3aLeD8lO
 1uEs/swluWZYeXjW5EZlJ7WFHdX6RF0c00N+4NIEMyfz02DYiq//eKGtmWmtf1uqk/hS
 RNzA==
X-Gm-Message-State: AOJu0YwjSUdmK+rs3G0LsSYM0L+SWW8LGAh6oL+qPLd46c/79BVOvwxs
 yg/zwjMgrA7q2AOBdTu2wiW0ZW+yUW6TO1PHfRo3rXfsp/HiWQGYDwSX4qbzI+a8Ay95DS2d4DC
 M
X-Google-Smtp-Source: AGHT+IE6XPw1AMy1KcndB9SPfqMKvFJEYhtiw9OnvpNqINS3JrZbREsmLVAmfNtd2R4G/CDLPya2zw==
X-Received: by 2002:a17:902:d4c2:b0:202:4a24:ee with SMTP id
 d9443c01a7336-2024a24046fmr75508875ad.55.1724172682480; 
 Tue, 20 Aug 2024 09:51:22 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038e1e5sm79875615ad.201.2024.08.20.09.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 09:51:22 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 13:51:15 -0300
Message-ID: <20240820165115.53193-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1724172682; x=1724777482;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ilq4ixPPavuvnpHvaFNMhCvD5oCWCCUlpQm7djvJ1YE=;
 b=fnX3kDok0cXxxdIRDURELXmxP2euoL5EloBx0qb9uY6FqV33fWL9DR+ACk1eELC7nk
 03ycVzcONh2AVisihnSS93R4XrbBE6FzNBXpsN1eJL0elWA46Huh5CaluOuz2I9SJd77
 5LyLb3W9wNblCKGGl/kHCs/Zov/N6oA1i1TaH4KBN2p2VWsyox3gh14CsRLxH6W7e2UX
 kWBtSejWTWrO5z11PLpwIWa4aqXYyJvzn27D9OnXwta60HLQ0PfmBQ9gs49yg1oWhwSP
 Fz02GpAUdifiJuiMxYkehipTvdKdE95N1Y6KHo5Ff0lOC5xVGPhwzQ7RdluFxcHIpBv2
 pXuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fnX3kDok
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2408.0
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2Uv
cnN5c2xvZy9yc3lzbG9nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xv
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCAyMTJhMWFjY2VhLi4y
NDc0OGVhYjE5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICBhY2JkZDg1Nzk0ODlkZjM2YjRhMzgzZGM2OTA5YTYxYjc2MjM4MDdmMGFmZjU0YzA2MjExNWYy
ZGU3ZWE4NWJhICByc3lzbG9nLTguMjQwMi4wLnRhci5negorc2hhMjU2ICA4YmIyZjE1ZjliZjli
YjdlNjM1MTgyZTNkM2UzNzBiZmMzOWQwOGJmMzVhMzY3ZGNlOTcxNGUxODZmNzg3MjA2ICByc3lz
bG9nLTguMjQwOC4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IGZhYzc4Nzk1YzIuLjY0NzY5ZTQ3YmEgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yNDAyLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjQwOC4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
