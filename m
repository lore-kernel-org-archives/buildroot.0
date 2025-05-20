Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3549C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B879A818E6;
	Tue, 20 May 2025 11:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCxpDMormj2F; Tue, 20 May 2025 11:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3891818C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3891818C4;
	Tue, 20 May 2025 11:42:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C210193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0B28605D5
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELUrKjlpVIxi for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:42:43 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF74E607AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF74E607AE
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF74E607AE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:42:42 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7cad6a4fae4so912069985a.2
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747741361; x=1748346161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oW6eiDdgKVGKvkgvYVd78qzbKBZ9IkZdWX+Z9uDqwo8=;
 b=TD2eZhAClsMkMg3nFYwFKl+vfGt9OZIdDVKWU5a0izHPbOyUp0lNBH+cLxqopJxVSs
 3sLB58FqGgXfPmoQHNX0svB3bhGJbwFxxRkc/ZKFf2BTI5e0hbD1uCzVv+jd59Lob+ed
 B3b2JgQoYmxhj0cSU7X0snHcB6QZkwGFg0sDTBwrUZhf5xYdPeftdaSVhA4Kukn4VTde
 GUllv13w+7ccHaBP7juu+c25f0fwsw67OPEtUZ8D+9QWRYCQT1IscSCK+e3NQpFKsa18
 jYI40lg+tYfcE2+bn3BRQUFpHszPWSInaqzzIVQCVOmo4DwLchG797vsMGj/+zvaK/47
 GnQA==
X-Gm-Message-State: AOJu0YyKawWiWEEIgDjY7xov//8nOS8bUr7lsoYKmOrd38+DL7svdgsx
 UUFAoHVEcS9QHGmfbnfxvDm55lobQIet2eojHreaNYPm6rWmd+80IAPm2iCktdfI7Oy9t1JWPBP
 NpIAV
X-Gm-Gg: ASbGncvjCQ7g+ks69Heu8s0iuvDUWyqWQzkbIyiOtp3TsHoyNeAhdhBT+ufN3Olpckd
 p7SRVS9OONQcVfAzDaNmZEewb+F72tBSL1HkD3f2IXH9T3qHDssa+locNTHV0NY/SijuQsW1edw
 WgGWoW9+ojEzo8XbmzD8VPzvfgqgd+i5Y8Lh09auYddrs8m8euSWQWFXNFPfKNm+dCNP9rTkKOZ
 CHdthEw7wXDbYPGxUUzVlYzTulE/WJd5JDBXZ8p56Ca0MIE3ledzU5yNL7dPYOT3ZBi/szAJQjt
 YtXFUQA64XZr+AeIkwvAkee5TfWHr6GSrdY//wCFg54nLDX00MVz6Af6Xi63glbmuI2RzYLqeGl
 k
X-Google-Smtp-Source: AGHT+IEZZ5Ds96aTEWkGnWqhifeE6jCu6Ou+mfhqv03eAnVbn2iZ/BtUdQ/DDwO5mwjB/36xKYauAQ==
X-Received: by 2002:a05:620a:408f:b0:7ca:cd16:b433 with SMTP id
 af79cd13be357-7cd47f4d0a8mr2318155585a.31.1747741361308; 
 Tue, 20 May 2025 04:42:41 -0700 (PDT)
Received: from localhost.localdomain ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467be47bsm725593985a.16.2025.05.20.04.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:42:40 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Tue, 20 May 2025 08:42:27 -0300
Message-ID: <20250520114227.9435-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1747741361; x=1748346161;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oW6eiDdgKVGKvkgvYVd78qzbKBZ9IkZdWX+Z9uDqwo8=;
 b=WaQdNl7pEDHzHrFCcFmeiytTxsf1eE0ZwYJLTEvdKPebrzRTPdwmf1PY/hyks6ZAoe
 nCfQ7En58fuPXWIeMLnlqLUDx2O/8ybezy9zoKFyBuJV1PygoC3678dtvrHlZx35Y/2s
 raUrPwS5v2o8+wekWlg8dbPZPeOCRTgL7OKt9I2R+AyWljIEm9Rq8pf3qSUAK5pp849u
 OLWUeOhdg4Qmb8AQ/pMJLJ6DgzUrKEs5Y27A/tvL8OkgMLES+cApN7URr8dv4WJ7lO9w
 gxe+Pi8gxQvP5vTkbutd2SVYBCYVSEdiDzZ4fHbtSNEwjTPsHTXJ+Eq+jYOc2YcDqA5P
 +pZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=WaQdNl7p
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2504.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2Uv
cnN5c2xvZy9yc3lzbG9nLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xv
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCAxNTdjYmUzMGJkLi40
OWYwYTFjOWUzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICAwMmZhMTk3ZDIxZDUxOWY1YTI1YTkyOGRlYjkzOTdjZDM4N2JhNzM4MmI5YjQ0OTc4MmJhMzFk
OGYzMTE4MjA2ICByc3lzbG9nLTguMjUwMi4wLnRhci5negorc2hhMjU2ICA1MDkyYTIwZWQ0MDk4
N2M3NGNjNjA0ZWJmY2Q2Yzc0OWU0N2ViOWZjMzRhZGMxYzI2MzdlNjU1M2U3ZjA0N2FiICByc3lz
bG9nLTguMjUwNC4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDRmODZiYjY4ZGEuLmE3Y2ViY2I0MTIgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yNTAyLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjUwNC4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
