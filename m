Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F4CE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 12:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EF66065D;
	Fri,  6 Dec 2024 12:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FpMH25LIlTw; Fri,  6 Dec 2024 12:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D296115D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D296115D;
	Fri,  6 Dec 2024 12:13:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A7F3ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 12:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0598F404D7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 12:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocEwLudHcRnU for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 12:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D525404DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D525404DB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D525404DB
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 12:12:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434aa472617so13947335e9.3
 for <buildroot@buildroot.org>; Fri, 06 Dec 2024 04:12:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733487175; x=1734091975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H406d49rx+cm9z8s8jxmsZ6v1gjS7AV2jiqg5w5H9Ww=;
 b=AsLwg00NYoT2PW17CcThGRXsg9C3AbdEoChTor3UYsgW6D+NwcaKR+zur7IE7Eclfx
 l8iTMZQcWP3ou+eKvwrJu0CDDMkNi8Lgk8JRlKRuP/RNmzVMTNsmQFyLftb3H+tTTA/Z
 VJM6T2NLF8Zg4ZYWYjEeZZtZ3uyvaFgRSeOvfEMJgiBf6up/2WoPHPLsg3hISCqQw6CS
 iuIEIdVqv/TdiAOjlwCLJRhTxMAFfR27QkTDONNSeZ/34VkFrfUYZRmMmRngAiD4JGQG
 iJN9eoO6fRoBPBZU/KaNhRQw1U02s/7P2s+OmjIBdd6rZZf0JshsShZvtoomVDce2alo
 23VQ==
X-Gm-Message-State: AOJu0YxTjxtSlJv1BKtcCnVyvE09oGhCqNYJjds94mytoyPEH214tens
 RpNrS6rDrVciSFinMcwih3EShlZrE9OzUNzekIogcOGuBq5UKM5WhOzqWRFiCXWU62AD971YWUd
 R
X-Gm-Gg: ASbGncu5a/NGzL6fVX1LcGCzUncLgdRValNzNG78NB6h4CABEuYjMDDcwUL03lJnnc/
 gPYL+UEQlnEHnzbR3fZt8zIIKnq/fdI73mR28W/gohFm8VNBmCfShgxSqkwcjlRzkL2weQJV3q4
 aqypIv3+XfaNybMkL8ahNaZMpGmwAP+1WwI4wOdxB/bdkpV7+O/q7TqNB2O4qtwScQkrVXjQfjZ
 bdHG0B6Ke+fumpFY0168wda5omDEQcVlO6bKWnyh+xUkxGjzq9lYw+N8fA/3cClw3X+Ek4InHJM
 KQ==
X-Google-Smtp-Source: AGHT+IHkTyMtF89PDvi5w1RVLue5iivdowLoFWI1R4SXnRk5WmXWlUS9mXghxzLicEV8+i/JH9foAQ==
X-Received: by 2002:a05:600c:3145:b0:42c:bb96:340e with SMTP id
 5b1f17b1804b1-434ddedbad1mr26960875e9.31.1733487175273; 
 Fri, 06 Dec 2024 04:12:55 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d6961sm54583145e9.12.2024.12.06.04.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 04:12:54 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Martin Bark <martin@barkynet.com>
Date: Fri,  6 Dec 2024 13:12:37 +0100
Message-ID: <20241206121237.612068-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1733487175; x=1734091975; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H406d49rx+cm9z8s8jxmsZ6v1gjS7AV2jiqg5w5H9Ww=;
 b=LGUssmc3hc5zL+YlkB68RS9MTduHCEGuKvhFgCJ+skWMZ1ffPjWPCHIZilq5K2wf+L
 ehreJ+nfomLCkBKG8L2j3jbLe4jMNvvv2OSsN894uUv3gOfeXOumeIDiNklKqhs9fUPk
 4O7VPmKvZhRoV8Z8d6uJvKOvsEw3ir3wZJksN0Omh07DCsdbvv077triWF10HGE4+0cL
 ky53XxzVvyfCoubLGVsqRVAdtXAnVNDQMltRSFMI+LYobXwTMxiCjxXNeciQhtr3LESd
 Kcd5x+NS4rC7Tpidhc8rjnShZ4+lmnxt8EaJYxWnJGpKKc6pfnzSWRGbfM5qLiv2K17n
 IyuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=LGUssmc3
Subject: [Buildroot] [PATCH] package/brcmfmac_sdio-firmware-rpi: bump
 version to 4c1789e
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

QnVtcCB2ZXJzaW9uIHRvIHRoZSBsYXRlc3Qgc3luY2VkIHZlcnNpb24gZnJvbSBSUGkgT1MgdGhh
dCBhZGRzIGZpcm13YXJlIGZvcgpuZXcgY2hpcHNldHMgYW5kIHVwZGF0ZXMgQkNNNDM0NTUgU0RJ
TyBmaXJtd2FyZS4gVGhlIG9sZCBmaXJtd2FyZSBoYXMgc29tZQpmZWF0dXJlcyBtaXNzaW5nIHdo
aWNoIGNhbiByZXN1bHQgaW4gdGhlIGRyaXZlciByZXR1cm5pbmcgZXJyb3JzIGxpa2U6CgpicmNt
Zl9zZXRfY2hhbm5lbDogc2V0IGNoYW5zcGVjIDB4ZDA5OSBmYWlsLCByZWFzb24gLTUyCgpUaGlz
IHdhcyB0cmFja2VkIGRvd24gWzFdIHRvIHVzYWdlIG9mIERVTVBfT0JTUyBmZWF0dXJlLCBhbmQg
d2hpbGUgZGlzYWJsaW5nCnRoaXMgZmVhdHVyZSBpcyBhIHBvdGVudGlhbCB3b3JrYXJvdW5kLCB1
cGRhdGluZyB0aGUgZmlybXdhcmUgaXMgYWN0dWFsbHkgdGhlCmNvcnJlY3Qgc29sdXRpb24gdG8g
dGhlIHByb2JsZW0uCgpCdWlsZHJvb3QgaXMgdXNpbmcgZG93bnN0cmVhbSBrZXJuZWwgNi42IGFs
cmVhZHkgc2luY2UgNTFiNDQyMSwgc28gdGhlIGZpcm13YXJlCnNob3VsZCBiZSBidW1wZWQgdG8g
d2hhdCBSUGkgT1MgdXNlcyBhdCB0aGlzIHBvaW50IHRvby4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmFzcGJlcnJ5cGkvbGludXgvaXNzdWVzLzYwNDkjaXNzdWVjb21tZW50LTI0ODU0MzExMDQK
ClNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KLS0tCiAuLi4v
YnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkuaGFz
aCAgfCAyICstCiAuLi4vYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1m
aXJtd2FyZS1ycGkubWsgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JyY21mbWFjX3NkaW8tZmly
bXdhcmUtcnBpL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLmhhc2ggYi9wYWNrYWdlL2JyY21m
bWFjX3NkaW8tZmlybXdhcmUtcnBpL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLmhhc2gKaW5k
ZXggYzIwYWJmYzI2Yy4uZGI1YzljNDIxMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9icmNtZm1hY19z
ZGlvLWZpcm13YXJlLXJwaS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS5oYXNoCisrKyBiL3Bh
Y2thZ2UvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1y
cGkuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDJm
MDkxN2IxMDQ3Mzk0NTVkZDQ4OGRkOGY1YWYyZWU0NDMwODAxYTdhYzhmZThkOTg2NmU3NGJmYmIx
ODUzNTYgIGJyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpLTI2ZmYyMDViNDVkYzEwOWI0OThhNzBh
YWYxODI4MDRhZDlkYmZlYTUudGFyLmd6CitzaGEyNTYgIDAyODA5ZGFkMjA2ZGUxMDUxMjI2YTU4
ZDFmYjE1ZjkzMGJjMmYxOTU0NGJiMjg2NTg5MzcxMjI1MDc2MDA2N2UgIGJyY21mbWFjX3NkaW8t
ZmlybXdhcmUtcnBpLTRjMTc4OWViODcwNTMzNmI5NTZiM2JmMWEzZTZlMzM1OWMwNTU1ZTQudGFy
Lmd6CiBzaGEyNTYgIGVhOGI3YjdiNmNmYzZmZDMwNTg3ZWQ5NzcxMDBmNmE1NDI3MzRjZTUzMjE4
YjViNjNkZTE2MTgwYWNkZGQ1OTkgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnJjbWZt
YWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWsgYi9wYWNr
YWdlL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBpL2JyY21mbWFjX3NkaW8tZmlybXdhcmUtcnBp
Lm1rCmluZGV4IDk1NzA3NDg3YTkuLmMzYjlmYTdlYjggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYnJj
bWZtYWNfc2Rpby1maXJtd2FyZS1ycGkvYnJjbWZtYWNfc2Rpby1maXJtd2FyZS1ycGkubWsKKysr
IGIvcGFja2FnZS9icmNtZm1hY19zZGlvLWZpcm13YXJlLXJwaS9icmNtZm1hY19zZGlvLWZpcm13
YXJlLXJwaS5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAK
LUJSQ01GTUFDX1NESU9fRklSTVdBUkVfUlBJX1ZFUlNJT04gPSAyNmZmMjA1YjQ1ZGMxMDliNDk4
YTcwYWFmMTgyODA0YWQ5ZGJmZWE1CitCUkNNRk1BQ19TRElPX0ZJUk1XQVJFX1JQSV9WRVJTSU9O
ID0gNGMxNzg5ZWI4NzA1MzM2Yjk1NmIzYmYxYTNlNmUzMzU5YzA1NTVlNAogQlJDTUZNQUNfU0RJ
T19GSVJNV0FSRV9SUElfU0lURSA9ICQoY2FsbCBnaXRodWIsTGlicmVFTEVDLGJyY21mbWFjX3Nk
aW8tZmlybXdhcmUtcnBpLCQoQlJDTUZNQUNfU0RJT19GSVJNV0FSRV9SUElfVkVSU0lPTikpCiBC
UkNNRk1BQ19TRElPX0ZJUk1XQVJFX1JQSV9MSUNFTlNFID0gUFJPUFJJRVRBUlkKIEJSQ01GTUFD
X1NESU9fRklSTVdBUkVfUlBJX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
