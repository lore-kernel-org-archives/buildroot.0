Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4432EC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 13:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B61426A8;
	Fri, 24 Jan 2025 13:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KapHu8fdwbzv; Fri, 24 Jan 2025 13:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6585426BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6585426BA;
	Fri, 24 Jan 2025 13:42:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B18D941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C424811EB
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzTkZlcVjhO7 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 13:42:34 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E171811D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E171811D8
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E171811D8
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:42:32 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21634338cfdso48203095ad.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 05:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737726152; x=1738330952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/1MlcdTQQXar+zHdey/8qjQ19egKAEqNw2b28Je/MEY=;
 b=Qrwo/Oecuc33fRO4yEQwVuUpQPUqg3ljr0SEC74SVxWut9smumQns2z59sEx/qyBoU
 VewiunA0Lt01yrR2cnlEoQosLa8kDDOPmny/Z3BI8pKw3pk6JtNU37R80EEDz/bBYhUk
 jNkGJluvNrxuCIm6m81LRr+mrGcSYWQmIm3+dvq/mafz054iNeQ3NyaxZSoWuRq1AL4B
 p1IB858Wm0wrs9mF/9ilU1064u6kx1tQ5uryZFA1GX+a7XZGrAF+hVnqr3Ca9kOfoTkP
 1btKCXqyh+zen4zSDoVExxngTBsw5UcdTc0bY6k5PdeFlNXi/bWMhh7C/LZhLgc67RcC
 2P+g==
X-Gm-Message-State: AOJu0YzkoETyNR5RdTBIP5n+HnKJ/15FzajCRmoUj43J5hiaedTrFDOI
 xMZ79ASOg37zxvRfBWli63onFklIgtPVKN0Wnh8ZDr/2SjbgFv2Tx9xW3RU2q/IMczn4pXs9pBp
 e
X-Gm-Gg: ASbGncsIoRQWWXXMQDo1nKClm6x//ikobw/A24qsTdtXR2aBl9ZiPV7YLHexI42AkxC
 z7/vRk1e0PiSYA0JO+hAFwULFCdyeH1zYqksHhx+RAbORn2FK/dWMhSqSGWzHQjmjsRxOZMQWsr
 mKJjS3Y1UUwPJGo5g1n64V1V6HS3Dy1Uoa1ihFYv2LAtljPVpfz+Cfgr1iWSZ9YXDSCR5K6DST1
 anxgXgIAYrLSLrXPBAwvNvvke9OSQqIjR8+2wQJkPjPoAZUisDkE2JzSI5izH9ByeuDeXjRDXWp
 nNkbZtp3jG/KlPBhhLARRjW6P5NhtGCyZuI=
X-Google-Smtp-Source: AGHT+IGY1z/5M1BaEzThSRlwWLU6ex5HFFtO6CZh+zBd9Npyfs7pvTKwinzPf/fpafaxgK/3yM91/Q==
X-Received: by 2002:a05:6a00:2d19:b0:72a:8bb6:2963 with SMTP id
 d2e1a72fcca58-72dafa44141mr41755807b3a.13.1737726151922; 
 Fri, 24 Jan 2025 05:42:31 -0800 (PST)
Received: from niltesque.newtesc.com.br ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b2b76sm1828491b3a.38.2025.01.24.05.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 05:42:31 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Fri, 24 Jan 2025 10:42:27 -0300
Message-ID: <20250124134227.1621021-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1737726152; x=1738330952;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/1MlcdTQQXar+zHdey/8qjQ19egKAEqNw2b28Je/MEY=;
 b=DGrmf51C7y/0hMqQPQVSvWS7Rq/kcG7fLsVJqms0Yd3bUgwCsdH6ZE0+HBtJi+4xMr
 hpu020WIm/+uZZrk1LbZKQhK4vKLk/4jbxRIRo6WYJ+jkAJb6ceITNA4efF7KOBwr04g
 9m+w1bz0rKdqKtePHQgjdLclb/9XbjtGt0LRxGJum7cRcpyVR8WEXeJPKUUFUmHbJUZZ
 16GM3Hrcxax9BA+jfGNXq+BhlifUz8m+451NtNWpmbsB4b/WgBwMkF4hViW599fpFkp6
 xunBXWNbcpXmKOkeCMuOCOPAVuV6XfOtEpTqCKNWON9FP8R5oiC4+PivbKeWmXgYmPg0
 mDGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DGrmf51C
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2412.0
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
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCA5YzUyM2M1ODgxLi5i
ZDc4M2E2OWI2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICBiNmJlMDNjNzY2ZGY0Y2RlMzE0OTcyYzFjMDFjYjc0ZjNlYWNmOGFlYzU3MDY2YzBjMTJiZTBl
MDc5NzI2ZWJhICByc3lzbG9nLTguMjQxMC4wLnRhci5negorc2hhMjU2ICA4Y2RmYTVhMDc3Y2Jh
NTc2YmRkNmIxODQxY2MyODQ4Yjc3NGU2NjNiMmU0NGEzOTUxMmJiODIwMTc0MTc0ODAyICByc3lz
bG9nLTguMjQxMi4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDY5YjMyMDc2ZjguLmY3MmUxOWVlMGQgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yNDEwLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjQxMi4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
