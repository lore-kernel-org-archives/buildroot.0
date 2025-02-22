Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4E6C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 13:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B203360906;
	Sat, 22 Feb 2025 13:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yLuV9FToH1y; Sat, 22 Feb 2025 13:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D19C60AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D19C60AC0;
	Sat, 22 Feb 2025 13:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA09D92
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD4264069D
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXG-RhvLapEt for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 13:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com;
 envelope-from=devin.buildroot@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B5D84064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5D84064E
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B5D84064E
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:36 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7c0155af484so457327485a.0
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 05:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740231093; x=1740835893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUL+azsRWnNvuX3xJKMnY2pmeUT9DxingtT+BSMwFa0=;
 b=oZCe+mPeSQDy99FHQLOFCTYQI1qlMn/YwBw9RsdpOaCoy9yVhzUCRmdpb1CbVK4E+f
 KlUk262VGNrUzBVHTtkZQNjQZRxZCg8ZcyIIM3UkoPBBtjWjZKfZNeEFDgHeFUTWpdeC
 7oiHtgaOI7YmvLxmHKnfM95/KTRbWEt77sLwbwldHijpbtS6IuyWbqurqXEPpUtIZ+rx
 blz9g/wTxJIe3/YuvAkubJIGq7ax4CTS0vgT1mHdUIlMT1ic7ocYPd5RDRDtTlJtiZHh
 X36LprLPpzh1ngaGJQsqL6EQYoM12Vs04Gg8jA0V/bdIE86ce30qJQ6+LYd5vYE2UC8y
 +1Cw==
X-Gm-Message-State: AOJu0YwV27aNZTa3uNpKMTlGEGmAOc6DY4mmPzQHIRdV1rap6tO+ghJI
 DUFMCcvL3e2trZ0ypwM0PCZHzroA1+4pUqjhhRB65h0kyta8YpDfGckjLy9CfKA=
X-Gm-Gg: ASbGncucQT81eo40vnFhWrb1vY0S/Aq/NMOmjkV6UcwMXmFY/JJ3pGDLwe56QIwsnqc
 j2Hqy/9kJuIvaLpvDVTc7yctqlzkPl7F+qaUYwdDYNnDaduzoH8xXRLf15KjSm3CgWGz9CWs33M
 qrnSxScFmCDSwqO3dIb6qaH864QZ9EvtihmJfCjneG5z7eB0IAtvzeKOS1Hi3eHfiXQTaw1Ks4y
 iguY4UH69HRifrPSXV/K5/o1hAr7RbeeqCn8KLxh4JhXt4ofAMqdFkkp1IhqS5odnWPh1U1Y4xw
 uM8VBYbSqOKImK5UFuMaA/h/zi5QlEVLcQXJk8GZ8eXyIdbawi7sEKrCEcu3iyOCmPtxitJBVvH
 GuolQ8aZcBZq4WCtsMOLqC+KbmQYrNP5TjIN2zA==
X-Google-Smtp-Source: AGHT+IH6d1ldcCZM+8ElW20CyOkN8+8Cfq/NHA0aTGArqXYrlyR64QLu5UnCZxRyvLr/eNLsjD4N8Q==
X-Received: by 2002:a05:620a:2450:b0:7c0:b08d:2432 with SMTP id
 af79cd13be357-7c0ceee4a87mr1229728085a.8.1740231093447; 
 Sat, 22 Feb 2025 05:31:33 -0800 (PST)
Received: from localhost.localdomain
 (vlnsm6-toronto12-142-117-124-97.internet.virginmobile.ca. [142.117.124.97])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c0a63cdcd7sm653747185a.1.2025.02.22.05.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 05:31:32 -0800 (PST)
From: devin.buildroot@gmail.com
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 22 Feb 2025 08:31:25 -0500
Message-ID: <20250222133127.9445-1-devin.buildroot@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740231093; x=1740835893; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dUL+azsRWnNvuX3xJKMnY2pmeUT9DxingtT+BSMwFa0=;
 b=XolbXmHjjCmLTpbjXbFwlJ+pPTJrIkp/Qqa6MEOecuaJR8ITNTl9RHa9YFZiiMpxby
 ynTTNs9IveA3ipCIOWZozGAg6TlFeJTeb/2x50rUZ0Fnnjwb+gcQ7cGMsYu8MTYgcxIE
 fjnAtoQm/CY+MMGLIJxF8dADzoH2cqWabLWFr7IBL2DCZUX6uhHGXlzN4AhK9uocLswn
 ZGEVEiHV/e7HofkPB0G+QNl/NjEJuQjM6hZAKUOH27GW8zOb5ZruVJBQ+QEMwBjKjUxI
 p/gmVtSnwqvDq+9lokjAWy7sxekMwIlZXK7yAM3bi53z/eCxD5EQPlgFXYfYtsadkiOk
 G1Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XolbXmHj
Subject: [Buildroot] [PATCH 1/3] package/lttng-modules: bump to version
 2.13.17
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

RnJvbTogRGV2aW4gU3RlZmZsZXIgPGRldmluLmJ1aWxkcm9vdEBnbWFpbC5jb20+CgpUaGUgY3Vy
cmVudCBsdHRuZy1tb2R1bGVzIHRoYXQgYnVpbGRyb290IHVzZXMgaXMgMi4xMy4xMC4KVGhhdCB2
ZXJzaW9uIG9mIGx0dG5nLW1vZHVsZXMgZG9lcyBub3QgY29tcGlsZSB3aXRoIGFueSByZWNlbnQg
dmVyc2lvbiBvZiBidWlsZHJvb3QsIGluY2x1ZGluZyB0aGUgZm9sbG93aW5nOgotIGxhdGVzdCBz
dGFibGUgcmVsZWFzZTogMjAyNC4xMS4yCi0gbGF0ZXN0IGxvbmcgdGVybSByZWxlYXNlOiAyMDI0
LjAyLjExCi0gbWFzdGVyIGJyYW5jaCBvbiBnaXRodWIKClRoZXJlIGFyZSBtYW55IGNvbXBpbGVy
IGVycm9ycywgdGhlIGZpcnN0IGNvbXBpbGVyIGVycm9yIGZyb20gdGhlIG1hc3RlciBicmFuY2gg
aXMgYXMgZm9sbG93czoKCi9ob21lL2RldmluL2J1aWxkcm9vdF90ZXN0L2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvbHR0bmctbW9kdWxlcy0yLjEzLjEwLy4vc3JjLy4uL2luY2x1ZGUvd3JhcHBlci91
cHJvYmVzLmg6Mjg6MTY6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJh1
cHJvYmVfcmVnaXN0ZXLigJkKICAgMjggfCAgICAgICAgIHJldHVybiB1cHJvYmVfcmVnaXN0ZXIo
aW5vZGUsIG9mZnNldCwgdWMpOwogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fgoKV2hlbiBpbnZlc3RpZ2F0aW5nIGEgcG90ZW50aWFsIGZpeCB0byBtYWtlIGx0dG5nLW1vZHVs
ZXMgYnVpbGQgYWdhaW4sIGl0IHdhcyBkaXNjb3ZlcmVkIHRoYXQKdGhlIGNvbXBpbGVyIGVycm9y
cyB3ZXJlIGFscmVhZHkgZml4ZWQgaW4gbmV3ZXIgdmVyc2lvbnMgb2YgbHR0bmctbW9kdWxlcy4K
CkEgY2hhbmdlbG9nIGZvciBsdHRuZy1tb2R1bGVzIDIuMTMuMTcgY2FuIGJlIGZvdW5kIGhlcmU6
Cmh0dHBzOi8vZ2l0Lmx0dG5nLm9yZy8/cD1sdHRuZy1tb2R1bGVzLmdpdDthPWJsb2JfcGxhaW47
Zj1DaGFuZ2VMb2c7aGI9ZGEyNDQxMDdhNWZmZTMwNGY2MWJiMjU5NzRiYzI1YzhkZjA1ZjY2YgoK
SSB0ZXN0ZWQgbHR0bmctbW9kdWxlcyAyLjEzLjE3IHdpdGggdGhlIG1hc3RlciBicmFuY2ggb25s
eSBhbmQgaXQgY29tcGlsZXMgZmluZS4KCkFzIGEgc2lkZSBub3RlLCB0aGVyZSBhcmUgbmV3ZXIg
dmVyc2lvbnMgb2YgbHR0bmctdG9vbHMgKDIuMTMuMTQpIGFuZCBsdHRuZy11c3QgKDIuMTMuOCkg
YXMgd2VsbC4KSSBiZWxpZXZlIHRoYXQgdGhlc2Ugc2hvdWxkIGJlIHVwZGF0ZWQgdG9nZXRoZXIg
YXMgdGhleSBhcmUgbGlzdGVkIG9uIHRoZSBsdHRuZy5vcmcgd2Vic2l0ZSB0b2dldGhlci4KSG93
ZXZlciwgdGhlIGJ1aWxkcm9vdCBtYW51YWwgcmVjb21tZW5kcyBhIHNpbmdsZSBwYXRjaCBmb3Ig
ZWFjaCBwYWNrYWdlIHRoYXQncyB1cGRhdGVkLgpTbyBJJ20gcGxhbm5pbmcgdG8gc3VibWl0IHR3
byBtb3JlIHBhdGNoZXMgbGF0ZXIgb24gZm9yIGx0dG5nLXRvb2xzIGFuZCBsdHRuZy11c3QuCgpU
aGlzIGlzIG15IGZpcnN0IHRpbWUgc3VibWl0dGluZyBhIHBhdGNoIGZvciBidWlsZHJvb3QuCgpT
aWduZWQtb2ZmLWJ5OiBEZXZpbiBTdGVmZmxlciA8ZGV2aW4uYnVpbGRyb290QGdtYWlsLmNvbT4K
LS0tCiBwYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoIHwgNiArKystLS0K
IHBhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLm1rICAgfCAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoIGIvcGFja2FnZS9sdHRuZy1t
b2R1bGVzL2x0dG5nLW1vZHVsZXMuaGFzaAppbmRleCBiMTRiNDg4ODM3Li4xMzM3NjVhYWJhIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5oYXNoCisrKyBi
L3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLmhhc2gKQEAgLTEsOCArMSw4IEBA
Ci0jIEZyb20gaHR0cHM6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1
bGVzLTIuMTMuMTAudGFyLmJ6Mi5zaGEyNTYKLXNoYTI1NiAgMTNhYmZiMWFjODcwNzExZjBkMGFk
ZmE4OGU1M2IxN2RlYjJlMzA1MjE3MzcxNWEyNjBhNmVmMTRhYTQ1YjBhNyAgbHR0bmctbW9kdWxl
cy0yLjEzLjEwLnRhci5iejIKKyMgRnJvbSBodHRwczovL2x0dG5nLm9yZy9maWxlcy9sdHRuZy1t
b2R1bGVzL2x0dG5nLW1vZHVsZXMtMi4xMy4xNy50YXIuYnoyLnNoYTI1Ngorc2hhMjU2ICBiMGIy
MzUwNDE1MGFlNWMxZmM2ZWUxNGUyOGQwMjk1MThmNjFmZTJlYzVmMTdiYjYxYzc5NDFhYTUyYmI2
ZTY1ICBsdHRuZy1tb2R1bGVzLTIuMTMuMTcudGFyLmJ6MgogCiAjIEhhc2ggZm9yIGxpY2Vuc2Ug
ZmlsZXMKIHNoYTI1NiAgZDcyOTIxMjY2YmM4NDUyYTg3ODlmOGEwNGE4Mjc1NTM3Mzk5MGQwMGI3
ZTBiMGYxYThlZGI4Zjg1NGU5NGQxYyAgTElDRU5TRVMvTEdQTC0yLjEKIHNoYTI1NiAgNjg0MWM4
NWI5NGY5ZGFiMzE5MzU2ZTNhYWY5ZTk2OWZjZWRhZDUxZDNhYWFkZjY2NWJmODZmMzRmNDE4NmI2
MiAgTElDRU5TRVMvR1BMLTIuMAogc2hhMjU2ICAzMjNjNTg3ZDBjY2YxMGUzNzZmOGJmOWE3ZjMx
ZmI0Y2E2MDc4MTA1MTk0YjQyZTBiMWUwZWUyYmM5YmRlNzFmICBMSUNFTlNFUy9NSVQKLXNoYTI1
NiAgMDEzM2QzYzUwNWYxNzY4NDVkN2E4YjRkY2ZlMDA2YWM2MTU4MzJjNDNjNDFlNzZmZTNiMzY1
MTkxYmFmY2E5MiAgTElDRU5TRQorc2hhMjU2ICBkYzQ3ZGMxN2IxMTFmNjdmNTI1NDlkNGY5NjQ5
YWVhZDE0MmY4NDMxN2IyNjllY2NlODBkZWIxYjY0ZTdkMDIzICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2x0dG5nLW1vZHVsZXMvbHR0bmctbW9kdWxlcy5tayBiL3BhY2thZ2UvbHR0bmct
bW9kdWxlcy9sdHRuZy1tb2R1bGVzLm1rCmluZGV4IGQ2ZjFlNDExNGQuLjlkYTRmMDczODcgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLm1rCisrKyBiL3Bh
Y2thZ2UvbHR0bmctbW9kdWxlcy9sdHRuZy1tb2R1bGVzLm1rCkBAIC00LDcgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTFRUTkdfTU9EVUxFU19WRVJTSU9OID0gMi4xMy4x
MAorTFRUTkdfTU9EVUxFU19WRVJTSU9OID0gMi4xMy4xNwogTFRUTkdfTU9EVUxFU19TSVRFID0g
aHR0cDovL2x0dG5nLm9yZy9maWxlcy9sdHRuZy1tb2R1bGVzCiBMVFROR19NT0RVTEVTX1NPVVJD
RSA9IGx0dG5nLW1vZHVsZXMtJChMVFROR19NT0RVTEVTX1ZFUlNJT04pLnRhci5iejIKIExUVE5H
X01PRFVMRVNfTElDRU5TRSA9IExHUEwtMi4xL0dQTC0yLjAgKGtlcm5lbCBtb2R1bGVzKSwgTUlU
IChsaWIvYml0ZmllbGQuaCwgbGliL3ByaW9faGVhcC8qKQotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
