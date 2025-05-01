Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253CC369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 09:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3CE611C9;
	Thu,  1 May 2025 09:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTIhto3kHk9F; Thu,  1 May 2025 09:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2DB3611DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2DB3611DC;
	Thu,  1 May 2025 09:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E87122D
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FF5B41655
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id La-c8vUX2g2G for <buildroot@buildroot.org>;
 Thu,  1 May 2025 09:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75919416BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75919416BC
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75919416BC
 for <buildroot@buildroot.org>; Thu,  1 May 2025 09:50:18 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-73bf1cef6ceso784572b3a.0
 for <buildroot@buildroot.org>; Thu, 01 May 2025 02:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746093017; x=1746697817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=deeX/SH2ZQS5mCXpZMQDXWUF3H6nMRtLxHOiKdeKgwY=;
 b=VvYqE1KYXkLtoTW+4TfTCW/i01+J2AT/JjxAaq3e80HtW62bcO8xQ/LX57kEbPsAix
 iGkHXYNdBHjeza/oFoz2272wzj6nEkajeaZ5IgZ6QNIlUmdS6TB2Gqw2ozQAghNCqeeB
 7ZiuZxdUEeXNJZpteVvaZ8BKXHOJd6Asz5UeZNRaxbnFjMNamlWYSS3QBlbSWxhjaRgE
 /p3eoG/pAccCRjj9cbzTK7iv3ipobU4FdUHa9oa1dYTyx4jcK9naVjFEwnTA+2H48imy
 hiNN8pq+UtX29e4X6cR/mphjFe3e1q6BN1Ze88YaYERXXHW88ARTSUDuGdBDEke5nNio
 3Z9g==
X-Gm-Message-State: AOJu0Yx2X/pE38JbI7VH9NfuaESkA6Ir6FDmKtv6W9oclC3KoPXEcY0Q
 hgATqONenaxKy/p3Rv+7R7MfcPmUVTiYMSwwP2D7oArs76W3Uf1sj6JCDdr+
X-Gm-Gg: ASbGnctdNlOU97TT0UKn1zoYrlyBAs9G0OOrbRMzdAZpDNzYlD3b1TRaX+sTyPdFV8Q
 yzVWNfe3Bz6udvZFFX38rH0gBhrYL39/qb5F9Q042FR32R8JvRe4ZTLLv9xowAy5sQvuSPxRc80
 mm/5+FvQ1sV0L1ZXqfjJh33sdjXOpxvBDOOGUWVNBZQJxRcO18rZ1SaD41NRMTOLvvHq94u9M/S
 87k8Ub0CxbrMjyBoQ/mhFdnharx6Vd84vZ0stelcNFh8n2mpfx1xUfmqLeAGUzN4wkzp9tkWkaj
 PF8NJv6wpb44rGMf7qPoa59MaqwXbvEm0qjPPV2vj7z+Bw8ri/KBZ8WtSoirfDWHnKA6lXw7hr1
 K3Ss13yeNAZHpDdgXGLYsg+BHmF0=
X-Google-Smtp-Source: AGHT+IFVyP0JqelAWhVhTcCRy+BvEvDfLhcBIs1qorPljuAnIukzj53YDEeBwEn04qZRuKqg1JNMHw==
X-Received: by 2002:a05:6a00:2d21:b0:736:491b:536d with SMTP id
 d2e1a72fcca58-7404792a877mr3413370b3a.20.1746093017277; 
 Thu, 01 May 2025 02:50:17 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7404fa42a9bsm411229b3a.164.2025.05.01.02.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 02:50:16 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 02:50:13 -0700
Message-Id: <20250501095013.100849-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746093017; x=1746697817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=deeX/SH2ZQS5mCXpZMQDXWUF3H6nMRtLxHOiKdeKgwY=;
 b=WkfoHIsq9DFjyUcTJXZyQUqwS/Mc2BY0pWMXvvjEwG8xbi9Luczb+NjHAvjdQSrNn+
 QlQdiLCB4D0dINGhex7rl5AG/EM3a8BCvWnImrw1e8ZTahkZygzqx/R5EvwL1YIHpWrt
 uZ/LaAbNcaSnM6vvvRmkVOpYo9O/vQvw1vtzAB65xSOaltEQGhosaZSZkzFA7vckF1iE
 ubR86YSxJ6IMnI/wXwVU3Ly1itew/UxsEZYP/yfKbfRJdzC+u/b2TD0C0BONXzWK1Hlm
 bTsLVZb38gdW+3ALN4lalqL0Yhh6wbLVnhJZQlMLOPi8y/6rKrDpST18bQsBQGsD5wcJ
 eRWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WkfoHIsq
Subject: [Buildroot] [PATCH 1/1] package/pcre2: bump version to 10.45
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

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9naXRodWIuY29tL1BDUkUyUHJvamVjdC9wY3JlMi9yZWxl
YXNlcy90YWcvcGNyZTItMTAuNDUKaHR0cHM6Ly9naXRodWIuY29tL1BDUkUyUHJvamVjdC9wY3Jl
Mi9ibG9iL3BjcmUyLTEwLjQ1L05FV1MjTDQKCkNoYW5nZWxvZzoKaHR0cHM6Ly9naXRodWIuY29t
L1BDUkUyUHJvamVjdC9wY3JlMi9ibG9iL3JlbGVhc2UvcGNyZTItMTAuNDUvQ2hhbmdlTG9nI0wx
MAoKTElDRU5DRSBmaWxlIHJlbmFtZWQgdG8g4oCOTElDRU5DRS5tZC4KVXBkYXRlIGhhc2ggb2Yg
dGhlIOKAjkxJQ0VOQ0UubWQuIChBZGRpdGlvbiBvZiBkZXRhaWxzIG9uIG5ldyBtYWludGFpbmVy
c2hpcCkuCgpTaWduZWQtb2ZmLWJ5OiBLYWRhbWJpbmkgTmVtYSA8a2FkYW1iaW5pLm5lbWFAZ21h
aWwuY29tPgotLS0KIHBhY2thZ2UvcGNyZTIvcGNyZTIuaGFzaCB8IDYgKysrLS0tCiBwYWNrYWdl
L3BjcmUyL3BjcmUyLm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGNyZTIvcGNyZTIuaGFz
aCBiL3BhY2thZ2UvcGNyZTIvcGNyZTIuaGFzaAppbmRleCA4YjIyMDQwYmE3Li4zNWI4N2FkODU0
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3BjcmUyL3BjcmUyLmhhc2gKKysrIGIvcGFja2FnZS9wY3Jl
Mi9wY3JlMi5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIg
Y2hlY2tpbmcgcGdwIHNpZ25hdHVyZToKLSMgaHR0cHM6Ly9naXRodWIuY29tL1BoaWxpcEhhemVs
L3BjcmUyL3JlbGVhc2VzL2Rvd25sb2FkL3BjcmUyLTEwLjQ0L3BjcmUyLTEwLjQ0LnRhci5iejIu
c2lnCi1zaGEyNTYgIGQzNGYwMmUxMTNjZjcxOTNhMWViZjI3NzBkM2FjNTI3MDg4ZDQ4NWQ0ZTA0
N2VkMTBlNWQyMTdjNmVmNWRlOTYgIHBjcmUyLTEwLjQ0LnRhci5iejIKKyMgaHR0cHM6Ly9naXRo
dWIuY29tL1BoaWxpcEhhemVsL3BjcmUyL3JlbGVhc2VzL2Rvd25sb2FkL3BjcmUyLTEwLjQ1L3Bj
cmUyLTEwLjQ1LnRhci5iejIuc2lnCitzaGEyNTYgIDIxNTQ3ZjM1MTYxMjBjNzU1OTdlNWIzMGE5
OTJlMjdhNTkyYTMxOTUwYjUxNDBlN2I4YmZkZTNmMTkyMDMzYzQgIHBjcmUyLTEwLjQ1LnRhci5i
ejIKICMgTG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICAwMzAwODdlMmU4ZGQ3YzFiZGQyNjA1N2Qy
NWQ0ZGVkOGY0NWJiZjAxYWQ0NThkNjg2NjVhZDA0YjhiMGZiZWRmICBMSUNFTkNFCitzaGEyNTYg
IDljZjdhYzY5NzYwOTlhMWQ4NTY4MjZkM2VmMWIwOTNiZDZiODQ0ODlkYzYxMDA2MjhhYzc5ZTc0
MGNmOTg4NWEgIExJQ0VOQ0UubWQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGNyZTIvcGNyZTIubWsg
Yi9wYWNrYWdlL3BjcmUyL3BjcmUyLm1rCmluZGV4IDE5MTU5NjE4MWEuLjZkMmI3MjlkZmUgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvcGNyZTIvcGNyZTIubWsKKysrIGIvcGFja2FnZS9wY3JlMi9wY3Jl
Mi5tawpAQCAtNCwxMSArNCwxMSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUENS
RTJfVkVSU0lPTiA9IDEwLjQ0CitQQ1JFMl9WRVJTSU9OID0gMTAuNDUKIFBDUkUyX1NJVEUgPSBo
dHRwczovL2dpdGh1Yi5jb20vUENSRTJQcm9qZWN0L3BjcmUyL3JlbGVhc2VzL2Rvd25sb2FkL3Bj
cmUyLSQoUENSRTJfVkVSU0lPTikKIFBDUkUyX1NPVVJDRSA9IHBjcmUyLSQoUENSRTJfVkVSU0lP
TikudGFyLmJ6MgogUENSRTJfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQotUENSRTJfTElDRU5TRV9G
SUxFUyA9IExJQ0VOQ0UKK1BDUkUyX0xJQ0VOU0VfRklMRVMgPSBMSUNFTkNFLm1kCiBQQ1JFMl9D
UEVfSURfVkVORE9SID0gcGNyZQogUENSRTJfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiBQQ1JFMl9D
T05GSUdfU0NSSVBUUyA9IHBjcmUyLWNvbmZpZwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
