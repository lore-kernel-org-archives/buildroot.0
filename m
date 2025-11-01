Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE6CCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 18:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75615413B6;
	Sat,  1 Nov 2025 18:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwguEw3jv-d4; Sat,  1 Nov 2025 18:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C1A641FB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C1A641FB8;
	Sat,  1 Nov 2025 18:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC517222
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADE0A84C37
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9ON51KdT8Rc for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 18:15:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B23F484C35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B23F484C35
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B23F484C35
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:15:35 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7a4176547bfso3129865b3a.2
 for <buildroot@buildroot.org>; Sat, 01 Nov 2025 11:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762020935; x=1762625735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vTXo/e8O5kFsoMqf3CfXaHcVrpQqS/qZpsix8XKVWLk=;
 b=t1sj0WDSQDqYtuMckadi/NydT91AJXGRU/p+6yHHTacQErfEeH3kBlNZdyxHk8tt2v
 gP8h9OVF9kRSZw8KIg/Lz6oSn96zwhJdr+7PSgPuIBQaMJVGKFUCni5vRW0g9iPCSWLf
 qozJi6KR14hxeZjjteD1Kb5vnYMcyC0lE+/UJ6iYHldB6wGqZHlIHqAFBeNBhsr04zY5
 yOO5+0i2xc93cr1PyWWEjpoo/vI2fmLfwOgesN1t4HN3fw7rl3CWt3VuzVPDpPXMKszK
 I3u+f43GaV5vFOpjf3rpJhvLJQs9I0TEhq01IJVRiNUWdbG7ye4xeHU5isPp3NpP6KcF
 Oywg==
X-Gm-Message-State: AOJu0YyIrHrWjYNGbCUNiYHMcL9EHiliVAUEBymoa4Nr6zlru2BrHEM+
 YnXH8gFY99rr/Wx6zX2g7UtJLas9UmeLPxLXCn+Vavv+no/zXYpmyubUddCRTs5cyKu0lG6qX4v
 DbsAo
X-Gm-Gg: ASbGncu9wh5KPURhC54AD1Gw4YGlzFpDGPARTiNBBMmBxCWHp3SuN9yPYqIqwC16PLa
 NE6IQsAlr0AHg9Lv2Oezc2Prc44k/MOF32ucDDcXikZyR/z2bVR+lx3lhc8K6GjlniU/qo/q55E
 Ze96EpinRbEF0gvWuV1nYHLaZI05SNvBmuo9XABsOvoOLzjur4wtvJ5Ck64NBwb+MMuTWj1B7uA
 GXhVsx1+s59axUHuPmTAnKq1JTK2fMXZDVKFwybnExqyAobchAWy9OhVrlg6fS5ZlpyiIpUDzYl
 SZSrUmNYzhWTnh/F+Z497rMSLWocgynPZb6MBM3bpzftdEzsbLsaYOrA6l9tNHg3EbfohbCDntZ
 Ai1XtgdIjQnsikDsBDRo/umGz28M2yRu1SQz3CoI6MKE89uSfx+u5YmZDhV+2xFSufTdzSLGBn7
 eV21XiSiqmvrqzZPjRIK5U5pI=
X-Google-Smtp-Source: AGHT+IEQuZa3yaIqti68sRQHFNYcUMb3oJ9hscNQtGjNvJIHhwZznBnycdYTJ3gpaCHYvqI5EVwDuQ==
X-Received: by 2002:a05:6a20:3d8f:b0:334:b8bb:b11d with SMTP id
 adf61e73a8af0-348cc6f56a2mr11399275637.31.1762020935070; 
 Sat, 01 Nov 2025 11:15:35 -0700 (PDT)
Received: from niltesque ([2804:7f0:b403:385c:db12:d153:88b1:e0c9])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b9887a3f044sm1558578a12.18.2025.11.01.11.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 11:15:33 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Sat,  1 Nov 2025 15:15:19 -0300
Message-ID: <20251101181519.129751-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1762020935; x=1762625735;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vTXo/e8O5kFsoMqf3CfXaHcVrpQqS/qZpsix8XKVWLk=;
 b=rYglT+uJOWMxeN0CaOPFPMXNr7KDwQJwZNDsiX1GNjaFoyrlE4Lfs3zEoqvY34OvjL
 rqfrMVZI2w9JcS5mjUiQVX/TUy4zGa6Avk6fHqi0FnygHV5NkuV8YLwiZ3KIomUKtK/h
 srdVLqZka1sgrB3Etx80qZ69hGGkOqjRB2xN9LeOv2i+2Y5OJPS7Vzp0RnF0AQx6k7Hj
 gE9bFfZ8YOozFgGRXtwA2p2/81TlvEF2/6DfPE3nIccgR8FK/XaUtHqYE5vbjhGyTkWn
 YsqfNPTMYj3uB89Bsq2G580S9aDsy4NcSgFIxUuo4c5pE6sKnjPG2gHbMeCIru00F/qR
 uTbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=rYglT+uJ
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to 8.2510.0
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

UmVsZWFzZSBhbm5vdW5jZToKaHR0cHM6Ly93d3cucnN5c2xvZy5jb20vcnN5c2xvZy04LTI1MTAt
MC0yMDI1LTEwLXJlbGVhc2VkLwoKQ2hhbmdlbG9nOgpodHRwczovL2dpdGh1Yi5jb20vcnN5c2xv
Zy9yc3lzbG9nL2Jsb2IvdjguMjUxMC4wL0NoYW5nZUxvZwoKU2lnbmVkLW9mZi1ieTogRmzDoXZp
byBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+Ci0tLQogcGFja2FnZS9y
c3lzbG9nL3JzeXNsb2cuaGFzaCB8IDIgKy0KIHBhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5oYXNoIGIvcGFja2FnZS9yc3lz
bG9nL3JzeXNsb2cuaGFzaAppbmRleCA1NDY2ODJjOWY3NC4uMTNhODRiMjA2ZjcgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLmhhc2gKKysrIGIvcGFja2FnZS9yc3lzbG9nL3Jz
eXNsb2cuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgRnJvbSBodHRwOi8vd3d3LnJzeXNsb2cuY29t
L2Rvd25sb2Fkcy9kb3dubG9hZC12OC1zdGFibGUvCi1zaGEyNTYgIGM4OWIxZTc0ZDM2ZDBjYTRh
OTViNzRhMWFiZTM2ZWQwYjFmYWFjOGI3YzhiZTQ3MWE4NDE1Y2ZhNzc2MjA2ZmQgIHJzeXNsb2ct
OC4yNTA4LjAudGFyLmd6CitzaGEyNTYgIGE3MGE5ODM0MTg2ODU5NTM5YTZhNGQxYzdiM2Y2OGMy
Mzg5N2U4MDU4MjliNzY0YTQ1ZTkyY2IwY2M5NWU2NmEgIHJzeXNsb2ctOC4yNTEwLjAudGFyLmd6
CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDA1NGIzYTA0N2Q5MjMyMzc2YTQ2Yjg3
MzU2YjE5YjBjMGMyOTI0Y2I1ZTY5MTFhYjk2YTAxZmM0YjUxNWYwODMgIENPUFlJTkcKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9nLm1rIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNs
b2cubWsKaW5kZXggNzcwNTljOWJiOGYuLjY5MTI4YWZiYWM0IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3JzeXNsb2cvcnN5c2xvZy5taworKysgYi9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVJTWVNMT0dfVkVSU0lP
TiA9IDguMjUwOC4wCitSU1lTTE9HX1ZFUlNJT04gPSA4LjI1MTAuMAogUlNZU0xPR19TSVRFID0g
aHR0cDovL3JzeXNsb2cuY29tL2ZpbGVzL2Rvd25sb2FkL3JzeXNsb2cKIFJTWVNMT0dfTElDRU5T
RSA9IEdQTC0zLjAsIExHUEwtMy4wLCBBcGFjaGUtMi4wCiBSU1lTTE9HX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HIENPUFlJTkcuTEVTU0VSIENPUFlJTkcuQVNMMjAKLS0gCjIuNTEuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
