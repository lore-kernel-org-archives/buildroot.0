Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A8C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 10:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27C214019A;
	Thu, 16 May 2024 10:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdmrgCePEtmj; Thu, 16 May 2024 10:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D8A940363
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8A940363;
	Thu, 16 May 2024 10:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95F111BF292
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 10:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81D0B4083C
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 10:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uw5oyPUYOTHF for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 10:52:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C37B40878
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C37B40878
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C37B40878
 for <buildroot@buildroot.org>; Thu, 16 May 2024 10:52:23 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5238fe0cfc9so503260e87.0
 for <buildroot@buildroot.org>; Thu, 16 May 2024 03:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715856741; x=1716461541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGXXurGIZ7xF97HErlt5my83AuncqFBhKCEGZyVXIVg=;
 b=EGKybWSfWwR/G9EdQfIF6A1GbEhn2FjPbBMM9t6myPOGor0FT9jlK8+HE5EJUBlDLm
 H5G4AAG09DdaED+Bnbb/eKC8M3mFAWRC+P4Pwlh2oFBpZrOZjZCBJH8tOplV0aH/5VtS
 Tov1icSIeElFwKsIWcsbTijfn66B/G/acPWpo7YxD+n0IUXVeePhAAwx8L92hlpX3ahr
 rOcnB4AyKoIT6YEfc29mBVoXrV9A0tnq2AI1pvi2LBcjBgdef724+UMY/H86adimwFrL
 o1IGnOCxVQ7NsD74M9Yv+RVYOzC5UPwqGwxE9gXS1Mqtu6+OoXtngos8I3N0A3Kaa/s+
 m4Zg==
X-Gm-Message-State: AOJu0YzEw7/ZQDHPJRl8BHucDysWZcadYXc9Zm1iugHsrqsGmy4qR1rK
 at/maw/hBsLRZzVOvCjuJopXVFrbu2kefVI6ZCs2cnKom4Gqc/8Rmibeb6Rnv+Ir3or5RFurGPo
 0
X-Google-Smtp-Source: AGHT+IEIvULlqQPsJqyQpG/2Ug/ARgBPsyb+JkK7wcq2wmpNfNhxzZBy6Z14NGd8jzXIh33yFcgxKA==
X-Received: by 2002:a05:6512:2116:b0:51f:25f8:7757 with SMTP id
 2adb3069b0e04-521e155a1afmr6160892e87.32.1715856740725; 
 Thu, 16 May 2024 03:52:20 -0700 (PDT)
Received: from nola.getinternet.no ([2a02:fe1:3180:e00::1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5239335e60bsm660738e87.84.2024.05.16.03.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 03:52:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 12:51:18 +0200
Message-Id: <20240516105118.3064532-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1715856741; x=1716461541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGXXurGIZ7xF97HErlt5my83AuncqFBhKCEGZyVXIVg=;
 b=dgd2RvJfe/8DZkMr61wL+pifxDSbdmP9ZtCHnIRcQ53RaLZS1xXLa8/FeWf7obFdqR
 LcvD3+gvvbcCpXXAf114c5nNjx5xmYEBpoEGmmFQkAe4aXSIMCVIBdbks4cAjWA8Mi8h
 3XJ7AmMNp1YfxveubCkP1yn9XEtIkrg49w3N4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=dgd2RvJf
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2024.19
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggOGU5ZTcyMzBlYS4uNjlmYWIxZDBjMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgZDMyOWQ2
ZDFjODg1ZWM0ZDQxMGFiOGM1ZjkzMzIwYWI2MDNjZWY4NjAzMTFhNmIzOTJlZGQ1YjkwMzAzOWE4
MSAgcWJlZS1hZ2VudC0yMDI0LjA5LWdvMi50YXIuZ3oKK3NoYTI1NiAgN2JmN2MzNDFiZjQ4MzEw
YzQ4ZWQzNGI5NzBmNjRiNjU1NjE5N2U2ZGU3MDdkM2ZhOGU5MmQyYjUxNDFkMGMyMCAgcWJlZS1h
Z2VudC0yMDI0LjE5LWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCAzMDIxOWVlYmRjLi43MTFjMTUyMDMxIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4wOQorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNC4x
OQogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IGMzMGQ0M2I4ZTY0Y2ZlZjk2MGNlZTk0NzViNThhZTA4M2U0YWQyNDYKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gOWQwZWQxYmMxYmFiMThjNzVhNzNkYmFjYzIwMjZlODYxMTNjOTdhYQogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
