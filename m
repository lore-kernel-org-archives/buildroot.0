Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C1EC7EE39
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 23:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7EF411D2;
	Sun, 29 Jun 2025 23:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXW7uc0CumtN; Sun, 29 Jun 2025 23:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B301E41494
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B301E41494;
	Sun, 29 Jun 2025 23:54:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3972D223
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 23:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD7E84022
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 23:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkGI6koVBSMt for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 23:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f64; helo=mail-qv1-xf64.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECFAE83D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFAE83D21
Received: from mail-qv1-xf64.google.com (mail-qv1-xf64.google.com
 [IPv6:2607:f8b0:4864:20::f64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECFAE83D21
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 23:54:06 +0000 (UTC)
Received: by mail-qv1-xf64.google.com with SMTP id
 6a1803df08f44-6fd0a7d3949so60471506d6.0
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 16:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751241245; x=1751846045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b+DaSbedsEpjUiO3h5E6/+Msj8BQT1zSjgX8kHPwemE=;
 b=NFXeLoZUE1k9MUtcbTF6zAV2h0bffsJ/mjrM+5O1MlAcrzrXnp0S8Z0WCSqtXV1OAU
 zU/GRbLnLEPxCzWilXFaYReGGoPqTsAsAAZ9c+6Xaqmc9cAgE9Jn52DVvYvEcpz7ptoY
 ted2Rvp56l9eeiKo2K2ITMnE4u+9BJyTPAM5ieRHCojhbpbbKMH57q6mKihCs2BVT+y9
 ygP9VoW16Mrlqp2a2ie7X0XIbPAoaeo5W+S8w8IwRYoEfOITETGZTSpYeduMoMfPpw1h
 54JWY/VFEe42NFYxy7oLDQ4eWghamArElmDMsehFmoS/nOdMqvpDpDxQ76LMtdJQrjIn
 Q98w==
X-Gm-Message-State: AOJu0Ywdc/CUNKlvw2PmMuHuVfJ5HYnka1LBrQRAw6dZOgJFIyuHIt3j
 hqMrKdld8SvLyF4mn1ZSLxQ2Z8LH2z0M6snWFbfUSScl9yASGY4K9jUf9WcYDV5C20sVEhtFlb+
 I49RdxpoN4u+t/zzaG86uCUqlaBOWQtsUdn/f4xcMxMFup28=
X-Gm-Gg: ASbGncvq3V9ROVFvezzLLGiLt0DsyrJ4fEBleb8dGEwZ8VXejHWG3R/3O6IV0MrncdR
 VF6Ii85FhhKtz3G2i4W4LkDykdiCAxXH+JXUkYpOl14x2SPiNahuNwWKS+P5vAJxw03s8EeO9+J
 0JH+MZJ6XVxGvaPyjaAlgBpD+G5hP++6agT7V6SaJMPu7Jl/A7UYSvcLg6by4FSr8fgpjNQ+spH
 fad1IaRSY9TthS4v2DypjcKcV8FfTQ4x6Nf4QdPGqAjqXn0I7LcIuLBoV+g5oS2gqPcUD/jxhCE
 BKlLOoQvLDXpDthF/bV65+EibJ4OnpqvWyktD98YSfI=
X-Google-Smtp-Source: AGHT+IEATyav0bxAGsyUGQntEUlQBHOuEI6eKnDM7ZdDKbKsWYMAjknNGEwHaofUoBAKpGv6LYmOsXlSIdPx
X-Received: by 2002:a05:6214:4009:b0:6fd:c82:cc33 with SMTP id
 6a1803df08f44-6ffed7a42eemr188340366d6.7.1751241245398; 
 Sun, 29 Jun 2025 16:54:05 -0700 (PDT)
Received: from localhost.localdomain ([184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-6fda3a7d565sm4475546d6.39.2025.06.29.16.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 16:54:05 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Knight <git@jdknight.me>
Date: Sun, 29 Jun 2025 19:53:42 -0400
Message-ID: <20250629235342.1609-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751241245; x=1751846045;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b+DaSbedsEpjUiO3h5E6/+Msj8BQT1zSjgX8kHPwemE=;
 b=aohMp4SfK30MgcTl7BxIhj/YltUQ5nEJZQfyYi/xZw9YvNL09bQFp/lyGXsSaXdUsw
 2eg+V/YvE/dpANZrCjEgfu24y+meEE9W52QNST1WwouqMOj0yPBcLryq25wNjVPEXVoi
 h+DkjlbWh9BlOjfW1RkxnKAagzIwa7maWLT4SrLaH/CN3Lcyy0qmDQUk/9YB7qtlQoXz
 8QKWbu/GaO2QFh/pmh9WHd3deDBnjTrbK3XMOzFKJ6FSsu+wapVuGHPjjKFz+VK5FUuy
 aquCTq6kHYAVRUq17iy4evXjjDCGD7e3NXeahrQtMUAHCcnLo/MlatYjSqpmCHCg5LlX
 qfAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=aohMp4Sf
Subject: [Buildroot] [PATCH 1/1] package/llvm-project/clang: use host arch
 in gcc-install-dir setup
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

V2hlbiBjb25maWd1cmluZyBgLS1nY2MtaW5zdGFsbC1kaXJgIGZvciBleHRlcm5hbCB0b29sY2hh
aW4KY29uZmlndXJhdGlvbiwgdGFrZSBpbnRvIGNvbnNpZGVyYXRpb24gb2YgdGhlIGNvbmZpZ3Vy
ZWQgaG9zdAphcmNoaXRlY3R1cmUgKGBIT1NUQVJDSGApIHdoZW4gcG9wdWxhdGluZyB0aGUgZXhw
ZWN0ZWQgcGF0aCBmb3IgYSBHQ0MKaW5zdGFsbC4gVGhpcyBpcyBoZWxwIHNldHVwIHJlZ2lzdGVy
IHRoZSBkZXNpcmVkIEdDQyBhcmNoaXRlY3R1cmUgaWYgYQpnaXZlbiB0b29sY2hhaW4gcGFja2Fn
ZXMgaW5jbHVkZXMgbXVsdGlwbGUgR0NDIGFyY2hpdGVjdHVyZQppbnN0YWxsYXRpb25zIChlLmcu
IGEgbWVyZ2VkIHN0YWNrIG9mIGNyb3NzdG9vbC1uZyBidWlsZHM7IHN0YW5kYWxvbmUsCm5vbi1t
dWx0aWxpYiBidWlsZHMpLgoKRm9yIGV4YW1wbGU6CgogICAg4pSU4pSA4pSAIC9vcHQvY29udGFp
bmVyL215LXRvb2xjaGFpbi0yMDI1LjAxLjAxLjEyMzQ1L2xpYi9nY2MvCiAgICAgICAg4pSc4pSA
4pSAIGFhcmNoNjQtZXhhbXBsZS1saW51eC1nbnUvCiAgICAgICAg4pSCICAg4pSU4pSA4pSAIC4u
LgogICAgICAgIOKUnOKUgOKUgCBpNjg2LWV4YW1wbGUtbGludXgtZ251LwogICAgICAgIOKUgiAg
IOKUlOKUgOKUgCAuLi4KICAgICAgICDilJTilIDilIAgeDg2XzY0LWV4YW1wbGUtbGludXgtZ251
LwogICAgICAgICAgICDilJTilIDilIAgLi4uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBLbmlnaHQg
PGdpdEBqZGtuaWdodC5tZT4KLS0tClRoaXMgcGF0Y2ggd2FzIGNyZWF0ZWQgZHVlIHRvIGEgY29t
cGlsaW5nIGlzc3VlIGRldGVjdGVkIHdoZW4gYnVpbGRpbmcgbGliY2xjCndpdGggYW4gZXh0ZXJu
YWwgdG9vbGNoYWluLiBBbiB4ODZfNjQgYnVpbGQgZmFpbGVkIHdpdGggdGhlIG1lc3NhZ2U6Cgog
ICAgLS0gQnVpbGQgZmlsZXMgaGF2ZSBiZWVuIHdyaXR0ZW4gdG86IC9zcnYvc2hhcmUvdGVzdC9v
dXRwdXQvYnVpbGQvbGliY2xjLTIwLjEuNwogICAgPj4+IGxpYmNsYyAyMC4xLjcgQnVpbGRpbmcK
ICAgIEdJVF9ESVI9LiBQQVRIPSIvc3J2L3NoYXJlL3Rlc3Qvb3V0cHV0L2hvc3QvYmluOi9zcnYv
c2hhcmUvdGVzdC9vdXRwdXQvaG9zdC9zYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2FsL2Jp
bjovdXNyL2JpbjovdXNyL2Jpbi9zaXRlX3Blcmw6L3Vzci9iaW4vdmVuZG9yX3Blcmw6L3Vzci9i
aW4vY29yZV9wZXJsIiAgL3Vzci9iaW4vY21ha2UgLS1idWlsZCAvc3J2L3NoYXJlL3Rlc3Qvb3V0
cHV0L2J1aWxkL2xpYmNsYy0yMC4xLjcvIC1qMTcgLS0KICAgIFsgIDAlXSBHZW5lcmF0aW5nIGNs
c3B2LWNvbnZlcnQuY2wKICAgIFsgIDAlXSBCdWlsZGluZyBDWFggb2JqZWN0IENNYWtlRmlsZXMv
cHJlcGFyZV9idWlsdGlucy5kaXIvdXRpbHMvcHJlcGFyZS1idWlsdGlucy5jcHAubwogICAgLi4u
CiAgICBbICAxJV0gR2VuZXJhdGluZyBvYmoubGliY2xjLmRpci9udnB0eDY0LS0vY2xjL2xpYi9n
ZW5lcmljL2NvbW1vbi9jbGNfZGVncmVlcy5jbC5iYwogICAgY2xhbmdjbGFuZ2NsYW5nY2xhbmc6
IDogOiA6IGVycm9yOiBlcnJvcjogZXJyb3I6IGVycm9yOiBubyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5OiAnaTY4Ni1leGFtcGxlLWxpbnV4LWdudScKICAgIG5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnk6ICdpNjg2LWV4YW1wbGUtbGludXgtZ251JwogICAgbm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eTogJ2k2ODYtZXhhbXBsZS1saW51eC1nbnUnCiAgICBjbGFuZzogZXJyb3I6IG5vIHN1Y2ggZmls
ZSBvciBkaXJlY3Rvcnk6ICdpNjg2LWV4YW1wbGUtbGludXgtZ251JwogICAgY2xhbmc6IGVycm9y
OiBubyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5OiAnaTY4Ni1leGFtcGxlLWxpbnV4LWdudScKICAg
IGNsYW5nOiBlcnJvcjogbm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJ2k2ODYtZXhhbXBsZS1s
aW51eC1nbnUnCgpXaGVuIG1hbnVhbGx5IHJ1bm5pbmcgdGhlIGBjbGFuZ2AgaG9zdCBidWlsZCwg
dGhlIGZvbGxvd2luZyBlcnJvcnMgd2VyZQpyZXBvcnRlZDoKCiAgICAkIC9zcnYvc2hhcmUvdGVz
dC9vdXRwdXQvaG9zdC9iaW4vY2xhbmcKICAgIGNsYW5nOiBlcnJvcjogJy9vcHQvY29udGFpbmVy
L215LXRvb2xjaGFpbi0yMDI1LjAxLjAxLjEyMzQ1L2xpYi9nY2MvYWFyY2g2NC1leGFtcGxlLWxp
bnV4LWdudScgZG9lcyBub3QgY29udGFpbiBhIEdDQyBpbnN0YWxsYXRpb24KICAgIGNsYW5nOiBl
cnJvcjogbm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJ2k2ODYtZXhhbXBsZS1saW51eC1nbnUn
CiAgICBjbGFuZzogZXJyb3I6IG5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk6ICd4ODZfNjQtZXhh
bXBsZS1saW51eC1nbnUvL29wdC9jb250YWluZXIvbXktdG9vbGNoYWluLTIwMjUuMDEuMDEuMTIz
NDUvbGliL2djYy9hYXJjaDY0LWV4YW1wbGUtbGludXgtZ251OicKICAgIGNsYW5nOiBlcnJvcjog
bm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTogJzE0LjIuMCcKICAgIGNsYW5nOiBlcnJvcjogbm8g
aW5wdXQgZmlsZXMKCkluc3BlY3RpbmcgdGhlIGNsYW5nIGhvc3QgY29uZmlndXJhdGlvbiBzaG93
ZWQgYW4gaW50ZXJlc3RpbmcgcmVzdWx0OgoKICAgICQgY2F0IC9zcnYvc2hhcmUvdGVzdC9vdXRw
dXQvaG9zdC9saWIvY2xhbmcvMjAveDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUuY2ZnCiAgICAt
LWdjYy1pbnN0YWxsLWRpcj0vb3B0L2NvbnRhaW5lci9teS10b29sY2hhaW4tMjAyNS4wMS4wMS4x
MjM0NS9saWIvZ2NjL2FhcmNoNjQtZXhhbXBsZS1saW51eC1nbnUKICAgIGk2ODYtZXhhbXBsZS1s
aW51eC1nbnUKICAgIHg4Nl82NC1leGFtcGxlLWxpbnV4LWdudS8vb3B0L2NvbnRhaW5lci9teS10
b29sY2hhaW4tMjAyNS4wMS4wMS4xMjM0NS9saWIvZ2NjL2FhcmNoNjQtZXhhbXBsZS1saW51eC1n
bnU6CiAgICAxNC4yLjAKICAgIC0tdGFyZ2V0PXg4Nl82NC1idWlsZHJvb3QtbGludXgtZ251CgpJ
bnNwZWN0aW5nIHRoZSBjbGFuZyBwYWNrYWdlLCBub3RpY2VkIGBIT1NUX0NMQU5HX0lOU1RBTExf
Q09ORklHX0ZJTEVgIHNlYXJjaGVzCmZvciBhIEdDQyBwYXRoIHVzaW5nOgoKICAgIGxzICQoVE9P
TENIQUlOX0VYVEVSTkFMX0lOU1RBTExfRElSKS9saWIvZ2NjLwoKSG93ZXZlciwgZm9yIHRoZSB0
b29sY2hhaW4gcGFja2FnZSBJIHdhcyB1c2luZywgaXQgY29udGFpbnMgbXVsdGlwbGUgR0NDIHBh
dGhzOgogICAgCiAgICAkIGxzIC9vcHQvY29udGFpbmVyL215LXRvb2xjaGFpbi0yMDI1LjAxLjAx
LjEyMzQ1L2xpYi9nY2MvCiAgICBhYXJjaDY0LWV4YW1wbGUtbGludXgtZ251ICBpNjg2LWV4YW1w
bGUtbGludXgtZ251ICB4ODZfNjQtZXhhbXBsZS1saW51eC1nbnUKClRvIHN1cHBvcnQgdGhpcywg
bWFkZSB0aGUgdHdlYWsgdG8gYEhPU1RfQ0xBTkdfSU5TVEFMTF9DT05GSUdfRklMRWAgdG8gdXNl
IHRoZQpjb25maWd1cmVkIHZhbHVlIG9mIGBIT1NUQVJDSGAgd2hlbiBwb3B1bGF0aW5nIHRoZSBw
YXRoLiBQZXJmb3JtZWQgYSByZWluc3RhbGwKb2YgY2xhbmcgKGBtYWtlIGhvc3QtY2xhbmctcmVp
bnN0YWxsYCkgYW5kIG9ic2VydmVkIGFuIGV4cGVjdGVkIHBhdGg6CgogICAgJCBjYXQgIC9zcnYv
c2hhcmUvdGVzdC9vdXRwdXQvaG9zdC9saWIvY2xhbmcvMjAveDg2XzY0LWJ1aWxkcm9vdC1saW51
eC1nbnUuY2ZnCiAgICAtLWdjYy1pbnN0YWxsLWRpcj0vb3B0L2NvbnRhaW5lci9teS10b29sY2hh
aW4tMjAyNS4wMS4wMS4xMjM0NS9saWIvZ2NjL3g4Nl82NC1leGFtcGxlLWxpbnV4LWdudS8xNC4y
LjAKICAgIC0tdGFyZ2V0PXg4Nl82NC1idWlsZHJvb3QtbGludXgtZ251CgpXYXMgYWJsZSB0byBi
dWlsZCBteSBjb25maWd1cmF0aW9uIGFmdGVyd2FyZHMuCi0tLQogcGFja2FnZS9sbHZtLXByb2pl
Y3QvY2xhbmcvY2xhbmcubWsgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5n
L2NsYW5nLm1rIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKaW5kZXggYTVj
OGI5OTBhYS4uODAwZjhkOWVmMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvY2xh
bmcvY2xhbmcubWsKKysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKQEAg
LTExNiw3ICsxMTYsOCBAQCBpZmVxICgkKEJSMl9UT09MQ0hBSU5fRVhURVJOQUwpLHkpCiBkZWZp
bmUgSE9TVF9DTEFOR19JTlNUQUxMX0NPTkZJR19GSUxFCiAJbWtkaXIgLXAgJChIT1NUX0RJUikv
bGliL2NsYW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikKIAl0b3VjaCAkKEhPU1RfRElSKS9saWIv
Y2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdOVV9UQVJHRVRfTkFNRSkuY2ZnCi0JZWNo
byAiLS1nY2MtaW5zdGFsbC1kaXI9JChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpL2xp
Yi9nY2MvJCQobHMgJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIpL2xpYi9nY2MvKS8k
JChscyAkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGliL2djYy8kJChscyAkKFRP
T0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGliL2djYy8pLykiID4gJChIT1NUX0RJUikv
bGliL2NsYW5nLyQoQ0xBTkdfVkVSU0lPTl9NQUpPUikvJChHTlVfVEFSR0VUX05BTUUpLmNmZwor
CVRSSVBMRVQ9JCQoYmFzZW5hbWUgLWEgJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9ESVIp
L2xpYi9nY2MvJChIT1NUQVJDSCkqKTsgXAorCWVjaG8gIi0tZ2NjLWluc3RhbGwtZGlyPSQoVE9P
TENIQUlOX0VYVEVSTkFMX0lOU1RBTExfRElSKS9saWIvZ2NjLyQkVFJJUExFVC8kJChscyAkKFRP
T0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX0RJUikvbGliL2djYy8kJFRSSVBMRVQvKSIgPiAkKEhP
U1RfRElSKS9saWIvY2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdOVV9UQVJHRVRfTkFN
RSkuY2ZnCiAJZWNobyAiLS10YXJnZXQ9JChHTlVfVEFSR0VUX05BTUUpIiA+PiAkKEhPU1RfRElS
KS9saWIvY2xhbmcvJChDTEFOR19WRVJTSU9OX01BSk9SKS8kKEdOVV9UQVJHRVRfTkFNRSkuY2Zn
CiBlbmRlZgogCi0tIAoyLjQ5LjAud2luZG93cy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
