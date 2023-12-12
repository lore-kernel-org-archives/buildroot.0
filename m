Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7EEC4167B
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 12:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B551415DD;
	Tue, 12 Dec 2023 12:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B551415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrjk_pAfCVs1; Tue, 12 Dec 2023 12:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64003414EA;
	Tue, 12 Dec 2023 12:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64003414EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB951BF853
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 12:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44E1081422
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 12:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E1081422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-fuUjXBUUvd for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 12:47:48 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2777181418
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 12:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2777181418
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6ce9e897aeaso4839564b3a.2
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 04:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702385267; x=1702990067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iS90LkBdhw5n7/rscvMmItRfs7B1v02XtNhfDpZ8+mg=;
 b=fZ3Bnl62eeGRvPRVYFg3H4/KIcxNUjojqh23ul6Yhqq+aO23oJMX0krmn2+yy4EJmA
 MkFizqwcReFrNp9QVCAEROFxkNy5vJKktED0IFgrGbfEi/OgGgmdahmQkQbqhBFXCfuP
 hcifAh41Nw0zEeq/RmU18ojZ2n0qgaymUWRaJU/g6MKkSAwkLLTRXeee6DqyY7saBNs+
 YUXfCai4TY83zzQ3bCOnd7J3sPan/Crwp2kBj1sOscCA93QFlRrn5d9m/zHfu63xHWnF
 ZfsPz8Y7X2Vb5qPZIPwdFDi0XSqpEccndM1Jg6srb8wSwN1AMWTu+4srs0YKh69pUcXO
 icEw==
X-Gm-Message-State: AOJu0YzV7jhXCaDSz735yJejKvOWPUVzdmsWvX3TnkpCETXsVLDNfTWD
 ZD+jJeiPUKQSeF3HM0v6+/rpKeb8tIL+6O9Ddj4=
X-Google-Smtp-Source: AGHT+IEXumtpRdoLYaLYHxJn8jtu5kjaEDTYejgufBcQvvcFWO221biDG1GK3/pu/U8Kp78X/557uw==
X-Received: by 2002:a05:6a20:1016:b0:18f:97c:8a49 with SMTP id
 gs22-20020a056a20101600b0018f097c8a49mr6941572pzc.116.1702385267155; 
 Tue, 12 Dec 2023 04:47:47 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 ka23-20020a056a00939700b006cb4379061esm7923604pfb.205.2023.12.12.04.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 04:47:46 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 09:47:35 -0300
Message-ID: <20231212124735.730065-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1702385267; x=1702990067;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iS90LkBdhw5n7/rscvMmItRfs7B1v02XtNhfDpZ8+mg=;
 b=TDS8ntkCDLgn55MQVthXnWgT1eyrMhtFa13g4cPKr2NUb8IXSZideUg53az8szW/Vm
 CwHw2NbjhBEJXNR7z+tV3+drn9ldxdJEvk2fUAV4feGkXoPVOO0s7fOeyz0I5xiWZTnO
 9uqPLwO4maXyEoz/hk5B/iFsxX/LmzLzAkJxQEnIfoIKgtoCruL4fohQRd0Pdc/umbeb
 y6f9n+IZdpZOi81FpF9PAArmRDeTpJkTDVj+W7DTq785NryeH3t5ivpjETbgQIjREL7h
 CgskNaYj6eK92FzptfgSthEEwxbmvC1zjCjE+wKlJPXEfNX/KyGozA29FnR/aSBvhRAi
 bz8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TDS8ntkC
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2312.0
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
Zy5oYXNoIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAppbmRleCA5MGRmM2UwNTRmLi45
YzAwMzY1MzU1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0
cDovL3d3dy5yc3lzbG9nLmNvbS9kb3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2
ICAyMGQ5Y2U3OTJiZjBhN2VkMDcwM2RiZjA5NDE0OTBmOGJlNjU1ZjQ4YjU1YjRiZWJkYzA4Mjdi
YmIwZGRiZjExICByc3lzbG9nLTguMjMxMC4wLnRhci5negorc2hhMjU2ICA3NzQwMzIwMDYxMjhh
ODk2NDM3ZjU5MTNlMTMyYWEyN2RiZmI5MzdjZDg4NDdlNDQ5NTIyZDVhMTJkNjNkMDNlICByc3lz
bG9nLTguMjMxMi4wLnRhci5negogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRi
M2EwNDdkOTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVm
MDgzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3Bh
Y2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDhlYTkyZWE3ODUuLjE5MTk4NjNmNGYgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xv
Zy9yc3lzbG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUlNZU0xPR19WRVJTSU9OID0gOC4yMzEwLjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjMxMi4w
CiBSU1lTTE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xv
ZwogUlNZU0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNM
T0dfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAot
LSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
