Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0F8E94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0676E407F1;
	Tue, 30 Dec 2025 08:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW7lyj2AmTbo; Tue, 30 Dec 2025 08:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A14C407D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082790;
	bh=nWYVgdHIZWq25lPpJuX2MD68JFyR+jjiyK5PHIGFtc8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Pqszg8vst14pxzbrBRm8qcgzBFzMzRBcSCHsrujkEqsoovMSQTYhAkv/n7suuYDy5
	 iE2KgU0TY0ZgnGuvJdaqDW97Nyhod0KtrJI0q7O3X6Oe+rQoDQ3yIcPmPSzrrL4H50
	 Snw4+sraaGSNyPRmE/8rmF2nRufKPuKn9rld1ivSnUTfMWle6m0tvjPIzP8edGDgsC
	 4W9pKlwXesUQ67w0KCosCdMqB6/SC9B4QLiObx4Ln0OWyB7TiIDcYpo9skpsvOrcIw
	 MZm9pCoe726KleNO348fQRLPjnnTh+JB8wh3qorORdRvNpW6NiaGCKcEIcAty7VV3f
	 mfTfKHrE5xeaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A14C407D8;
	Tue, 30 Dec 2025 08:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76026177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C1034031A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWjsdwkgx06q for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EC00402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC00402E8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EC00402E8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477632b0621so60662895e9.2
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082783; x=1767687583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ISkOy+uDhedGMVU6hwGRHJ2C0ahvMofrs/jcAHDsV1c=;
 b=HzQGiSoE4Yuys1kX0hYUatsCiIfdC3rHQ6lAoXcXkRiKqTq8aGAkFtMxnzkFl61h7s
 XIWh+A4W+kLwIlGeLD+BhUvs5/U4+UsGU5ft4utv6fTDT554+XhAa8PW1MHCq7Hxnf3x
 Pgnn23jxbg/m34kckO0e8nsWpEkL2TUxhfAluzKXnFEFCBUS6BUvUAoaBKvXAvnGljXG
 QP4ge7oCaMlnrjqIbPQ3ujIHKZr4rllgraP+aWVzw2u1/4NwpwFh3PtR9dmRMMFPozac
 r1wvBsEKoBsnAYAJ3bJQn+sfspkxAZDRzsJTgVb+u3qGYMf6/1ldRjJ2uwyyoshK7FBG
 8IxQ==
X-Gm-Message-State: AOJu0YzRffmuGUMVBbJJm+T9KDC8fZ6f45w+7ioIbyuAy1pdw1hfKxK7
 jAuVFa6QB2W2+lX+PCpoAVT4PEaDS8SC1G+9Ba2VqGj3+vQEg41ETbLKtBj271wo6OWxIPIzxgO
 jMj73bFU=
X-Gm-Gg: AY/fxX65aQR1pRanRbd0zkoUES7b/583YDbqLLyWWsqxbNevA5EuT4N/3PDSxhJjy1E
 hSOZqnIjvbO8iHUqXAIvIvzsOm8SHaUpNaH609v+hUw6vQ94WJtM2vjcvRn0DCohw9RGFY68Kwp
 /Uj83FkkA+yNniVq2e6iXrebDI2EqRRUL3SFyG8UBosZZIjNCk/KN69NS0MSlW1fLF5eZCWOSnB
 3HRgkIU+zE6W9dRsseyG2BCxdoFESZcuxy6mpekr3Dkl1vyfRh4jAZsyyU+v62oAgD/5v5tBAQz
 qdUfbD+uVlX1usgAePRiHXTqbTftnZkTEaeZq8OAOYH8uuxmLiQP3CgFhipglROtomtrcIvM/g+
 V9qKA6Cm+aM5XWcXG2aoqZQ0Jz+BjDrjDjvzhPCAH8UaneoRBg3H7JKkpfo5olyupmkQS4UBoZo
 w4TFs=
X-Google-Smtp-Source: AGHT+IEgdS8laNn75jjTp39YoMsYNU2GbA4uNqLAkn7OLuvSDqKhXCZ6RxqIJ1hpnjN1pFMk7qAKMQ==
X-Received: by 2002:a05:6000:2902:b0:431:8f8:7f2f with SMTP id
 ffacd0b85a97d-4324e4fdb21mr32568455f8f.34.1767082783086; 
 Tue, 30 Dec 2025 00:19:43 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:42 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:17 +0100
Message-ID: <20251230081917.18676-16-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082783; x=1767687583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISkOy+uDhedGMVU6hwGRHJ2C0ahvMofrs/jcAHDsV1c=;
 b=hmG2qsYELZg1MKc7leMasCFGr2q4WDzf1wmQBJ04vvnXkke0plfp3KZ3IXyMRO4JOq
 hlu4KYxi4Z6PXBSLA25+MtnNIjXWCdgQKBrLFhGviYHmYdK66J0r7h+NSOgzxU4OfcQs
 y1qRc/p05YwlHDOthFe0cVHoFm9a9416VxO8JMM5wybyWzemS8NQ8h0apxv9TJWoW9x1
 ACm8txvxlu0oJnVsgQvI50ThhUlitjGXEUJsLGQoIb1MaPliz+1iT6VJ0I7Tor55HvIn
 llyYHeZo+ylmfFNQwnuPaHE3DmD81uJjsQFOYbI+PjnxIRgii+UV5xEjtdizna9O620X
 C6BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hmG2qsYE
Subject: [Buildroot] [PATCH v2 15/15] package/cmake: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the cmake package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 5ce1e773b9 package/cmake: ignore CVE-2016-10642

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cmake/cmake.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e9752640e5..ef4f6aa98e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -11,8 +11,6 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
 CMAKE_CPE_ID_VALID = YES
-# Tool download MITM attack warning if using npm package to install cmake
-CMAKE_IGNORE_CVES = CVE-2016-10642
 
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
