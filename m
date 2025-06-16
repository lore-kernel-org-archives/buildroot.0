Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1071CC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6DF1811EF;
	Mon, 16 Jun 2025 20:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbNTbtKRQf35; Mon, 16 Jun 2025 20:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02DD6811E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02DD6811E5;
	Mon, 16 Jun 2025 20:34:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E9EE16B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04831811E5
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzSNQZPDqSHa for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:34:53 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA0CE811E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA0CE811E3
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA0CE811E3
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:34:52 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-234bfe37cccso63426515ad.0
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 13:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750106091; x=1750710891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/sRGNQwk+PGGRLOugwaxSkBQKpOYbSGznTTJo5kms4o=;
 b=bgXB4vstoAuZlyId52Bq7AoWPfNfAHCWEgb+h2sPwC3UPzpkjvHIHJkL3TwsX5/f+F
 XOXGdLCWaozA6ce4Ov73o2KZx7RPkq/8lam3qO88Ffb/5tFg0oINa1WQqGYVhnf6EVKI
 qAjakAOteLMdWDR+F1GEVaVlarw6cptr3EQKNTtcbma4XK9/pUZV4mk0IrxxA5MRwyNg
 WUvToBVstb3Kl1rXQo+WElMC2PkzU5L12vp5UnPhx+E2dHrI8SSSWiVWYu6PKarjqikF
 L1/Ba4dFxwNmemU5ELV7CpHwZcIb7mgy8V/0jotm056NaQFJonyqazSJKanmrOI+Ga/e
 OCAw==
X-Gm-Message-State: AOJu0YwjdXue18jsXVrTR9ClN2cXkIKBvr+jc6H5ycI3Rom3f9nZRAVF
 137VTxkrFGnYTuWZnC4z2zSDwociF7DeMIDTxooOuSeor2w3WeC+s+pQAZbCEYnFT0a/4Izyxkd
 0afZx
X-Gm-Gg: ASbGncsrFZPdjWmo7cKyIZGWZKeBrrM+Tdkagi3LMML3TUjct5GG5saFBNUScQTuapu
 xLh+1Q27A3HrbyPqi63+fpFLVar0rAA6GIoDOb9WskyC6yHM3WRhaGRzDlMuF4SgBUg3OLMEWGs
 Q2dXjt6sUEGhBv3q44MFN4YUACU3v9/5+rGT1heYvVnqDeOMsxF/1mlV15dYtzoNVmTJDiWt0yK
 v3pXPIj4zbnQLYVJa2p/zTb1QbKLbPEoGPwgbduroAGpQ9hDP5KzOuj8YT4fHhqtuGd8QUa7fc1
 GDwZynkL0ylFRPqx3bkU/P+pFX1Mgg6F+y2GiBpxzjUgQm1dVn4yWkewkkpknKZ/Z9IqlQxGDc6
 NkkxqyhVA3ox0+wEVbw==
X-Google-Smtp-Source: AGHT+IHi2GCrbojTl0KLsBx/HU643qlD49iYjevohiKr11W8fmwIg65zRtCh+ZrmcO0+ntmICwzuLw==
X-Received: by 2002:a17:90a:da86:b0:313:480f:ee72 with SMTP id
 98e67ed59e1d1-313f1daf632mr14242710a91.23.1750106091188; 
 Mon, 16 Jun 2025 13:34:51 -0700 (PDT)
Received: from niltesque.mtz.newtesc.com ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb8a73sm65823405ad.185.2025.06.16.13.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 13:34:50 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Mon, 16 Jun 2025 17:34:46 -0300
Message-ID: <20250616203446.369468-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1750106091; x=1750710891;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/sRGNQwk+PGGRLOugwaxSkBQKpOYbSGznTTJo5kms4o=;
 b=U2A64DgAmWJ49eUUyMjKh9X2ApEi5bX0oih5jLYLzmglL6WPA48nvYybLBHbWicKiQ
 Z/FvdADZImaH9n09s1tvcbA/yAZ1gPMnyhjWcRZjw8RnmGU2oILEBP7xWjhWOvJHJtkG
 eMZElPRVG4Fqpq6r+eSibrVOwdwG+Kc11F6ZtonE3ye58xRfRzKvGzk+2XAuDRG8MLEA
 zK8E5W0yfzO9z+3enJPylRDES5o/biqO2n0tTUrg6gMu3XnDt38SeTMx7NVlQzfBxY0J
 m4LgzifzL/LPa3jGTLU8bY5v9gWhWma5WDSjYTx4lsisXUqVr9/mmimB+3IbyPUiVWzO
 4+ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=U2A64DgA
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

UmVsZWFzZSBhbm5vdW5jZToKaHR0cHM6Ly93d3cuYWRpc2Nvbi5jb20vcnN5c2xvZy9yc3lzbG9n
LTgtMjUwNi0wLXJlbGVhc2VkLwoKQ2hhbmdlbG9nOgpodHRwczovL2dpdGh1Yi5jb20vcnN5c2xv
Zy9yc3lzbG9nL2Jsb2IvdjguMjUwNi4wL0NoYW5nZUxvZwoKU2lnbmVkLW9mZi1ieTogRmzDoXZp
byBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Ci0tLQogcGFja2FnZS9y
c3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoIGIvcGFja2FnZS9yc3lz
bG9nL3JzeXNsb2cuaGFzaAppbmRleCA0OWYwYTFjOWUzLi41YTk3MTBiZDZiIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoCisrKyBiL3BhY2thZ2UvcnN5c2xvZy9yc3lz
bG9nLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0cDovL3d3dy5yc3lzbG9nLmNvbS9k
b3dubG9hZHMvZG93bmxvYWQtdjgtc3RhYmxlLwotc2hhMjU2ICA1MDkyYTIwZWQ0MDk4N2M3NGNj
NjA0ZWJmY2Q2Yzc0OWU0N2ViOWZjMzRhZGMxYzI2MzdlNjU1M2U3ZjA0N2FiICByc3lzbG9nLTgu
MjUwNC4wLnRhci5negorc2hhMjU2ICA2ZDZmZDAyNTdjOTVlNzU2NzY1ZDRkNTg1YTgzM2Q1NGRk
M2EwZTVlZWI4MzA4Yjg2MmE4MWIzNjhhNzRiYjdiICByc3lzbG9nLTguMjUwNi4wLnRhci5negog
CiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwNTRiM2EwNDdkOTIzMjM3NmE0NmI4NzM1
NmIxOWIwYzBjMjkyNGNiNWU2OTExYWI5NmEwMWZjNGI1MTVmMDgzICBDT1BZSU5HCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayBiL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9n
Lm1rCmluZGV4IGE3Y2ViY2I0MTIuLjNkNTRiNDlkODggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnN5
c2xvZy9yc3lzbG9nLm1rCisrKyBiL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rCkBAIC00LDcg
KzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUlNZU0xPR19WRVJTSU9OID0g
OC4yNTA0LjAKK1JTWVNMT0dfVkVSU0lPTiA9IDguMjUwNi4wCiBSU1lTTE9HX1NJVEUgPSBodHRw
Oi8vcnN5c2xvZy5jb20vZmlsZXMvZG93bmxvYWQvcnN5c2xvZwogUlNZU0xPR19MSUNFTlNFID0g
R1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKIFJTWVNMT0dfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcgQ09QWUlORy5MRVNTRVIgQ09QWUlORy5BU0wyMAotLSAKMi40OS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
