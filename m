Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF9CCCD183
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 19:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC7D4613B3;
	Thu,  9 Oct 2025 19:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sbj1FS8h12hR; Thu,  9 Oct 2025 19:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890B76139F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 890B76139F;
	Thu,  9 Oct 2025 19:32:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB35C119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E1941015
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZWjLT-tw128 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 19:32:09 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9E4641009
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9E4641009
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9E4641009
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 19:32:08 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-78af9ebe337so1040369b3a.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 12:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760038328; x=1760643128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TETdRBQ4BjUe9wgiriBRwXY/+a3t01m7ltXMJiv83rM=;
 b=a3JClvHI1XgtmRNUtLEsTad2hwg41CTYsjfYuOcRdh6vTMBdYx9RhuBkEhLEJXzrc6
 yIEyOcSPBf32FtE6NxXk1yeI7bIopzsVjtF8MJp3xCzxjdpFRkg6L8XexGb8swB+7G3u
 N3PJugvFRWaDWDJzOhCWHSYMhHHcTChAt1PtVwJ0sgbqoL4jhuL3cRR0FZwyGf5tTmCG
 7eQ7makxcHfVQANXRtCTA6fuJcKL4tcn8Lk8bb8+6ftV57kc1vJctw50n89ewonuHO2S
 YIGMVo+gAu8GOSd1zgdkYFOWNUdAORDAfI+4zQZg7dXJnwjDGD3TiogCtexYYPPN6tNr
 wmrw==
X-Gm-Message-State: AOJu0Yy0Y8w0DUTwAGEcBq1JCUnQoLV7fUSrt2qiaI/f95VAuLS5pCmw
 eSNM81f/Dd8ug6wyYa+h6ReKZhHQ6rH+bP//5qnw8J+PV0aGdtBgetchHXRnLAGWaJ0E/k4zX5K
 aGDrdL34=
X-Gm-Gg: ASbGncsnLDkZLjKwr5h7V8d+gJlJrJut/1EsOdTpedcUizBUdXakNlIrRoo76LpjbDr
 Ngq/eMwQn2BieWBl25bSznqg8/NjK7A0jx3Z117TdnGKF+sn57fq3D75xFaSLafNpChi1nSTrDv
 6UHz2zVZRBfCMOidD8Qv/VsWl2zJ7X3tUMiiNHd5e8ub2yNL5jicigHT0gkTbE8hsQjUnXZZvdC
 bR3l4nEUucIbM3jVJ9pNMqeyMf8z/OdLm/+q053E4hKIQNPlj0z86PcUtTmaiIU3M1ko6CNW5hh
 MZ75LrV4dDgGow0BjM93kP31PP6dkMiaGThPst5Ed5++HyCQL4ScIKBJzO1S2ymHv659gDigeq3
 yTOYiBCETpZzgOA2OQCVRysJNOPJpWV3t3dRxpgHj9BUAFC+ZlxUNFWYKH1mf71BgoQAJ
X-Google-Smtp-Source: AGHT+IE2nrtD8eLzkV6bqSmA3S9bogtm4SI24CeaHJeZkdgtWtkLhDLP071/1IbZpYQ/ABeOzMCLAw==
X-Received: by 2002:a05:6a21:7785:b0:32d:b924:ed87 with SMTP id
 adf61e73a8af0-32db9251cd9mr6435067637.20.1760038327927; 
 Thu, 09 Oct 2025 12:32:07 -0700 (PDT)
Received: from niltesque ([189.113.44.122]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b252f23sm529671b3a.6.2025.10.09.12.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 12:32:07 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Thu,  9 Oct 2025 16:32:04 -0300
Message-ID: <20251009193204.1951332-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1760038328; x=1760643128;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TETdRBQ4BjUe9wgiriBRwXY/+a3t01m7ltXMJiv83rM=;
 b=UO/G1y1IyMay7M0sEmeMtWsCC5HuhEyGhzmFe8zNQTEmHP7WMnUT1PtEBUP5EJpB7r
 nV0Ey2am3fcRWChVwpgThmFp+NmUtpeMjLeWsluvttlQZqS5YO9lzFQzYj1vFgACicNW
 HNWoKyKeWzwotOZDt03zo08UprlbXPrXtvIjnKjjNyNB6iH6nqlC6FhAurPuH5q5rf6H
 gR1LDYtdXwYSK6ymLT0S1JKxY5ZQwDIe80vNng7KEZDgmnAUb79759RzUAwkcNHXfTk1
 OW+qMFCbNbQsElplMQUTIqIBV8N8rzD1335y5dyvclOnCpxjnebH+4DmchgMHiXhFEu4
 UXbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UO/G1y1I
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2506.0
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

UmVsZWFzZSBhbm5vdW5jZToKaHR0cHM6Ly93d3cucnN5c2xvZy5jb20vcnN5c2xvZy04LTI1MDgt
MC0yMDI1LTA4LXJlbGVhc2UtYW5ub3VuY2VtZW50LwoKQ2hhbmdlbG9nOgpodHRwczovL2dpdGh1
Yi5jb20vcnN5c2xvZy9yc3lzbG9nL2Jsb2IvdjguMjUwOC4wL0NoYW5nZUxvZwoKU2lnbmVkLW9m
Zi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Ci0t
LQogcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCB8IDMgKystCiBwYWNrYWdlL3JzeXNsb2cv
cnN5c2xvZy5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaCBi
L3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKaW5kZXggNWE5NzEwYmQ2Yi4uZDU5ZWZmN2Vl
ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cuaGFzaAorKysgYi9wYWNrYWdl
L3JzeXNsb2cvcnN5c2xvZy5oYXNoCkBAIC0xLDUgKzEsNiBAQAogIyBGcm9tIGh0dHA6Ly93d3cu
cnN5c2xvZy5jb20vZG93bmxvYWRzL2Rvd25sb2FkLXY4LXN0YWJsZS8KLXNoYTI1NiAgNmQ2ZmQw
MjU3Yzk1ZTc1Njc2NWQ0ZDU4NWE4MzNkNTRkZDNhMGU1ZWViODMwOGI4NjJhODFiMzY4YTc0YmI3
YiAgcnN5c2xvZy04LjI1MDYuMC50YXIuZ3oKK3NoYTI1NiAgYzg5YjFlNzRkMzZkMGNhNGE5NWI3
NGExYWJlMzZlZDBiMWZhYWM4YjdjOGJlNDcxYTg0MTVjZmE3NzYyMDZmZCAgcnN5c2xvZy04LjI1
MDguMC50YXIuZ3oKKwogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRiM2EwNDdk
OTIzMjM3NmE0NmI4NzM1NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVmMDgzICBD
T1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3BhY2thZ2Uv
cnN5c2xvZy9yc3lzbG9nLm1rCmluZGV4IDNkNTRiNDlkODguLjc3MDU5YzliYjggMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xvZy9yc3lz
bG9nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUlNZ
U0xPR19WRVJTSU9OID0gOC4yNTA2LjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjUwOC4wCiBSU1lT
TE9HX1NJVEUgPSBodHRwOi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xvZwogUlNZ
U0xPR19MSUNFTlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNMT0dfTElD
RU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAotLSAKMi41
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
