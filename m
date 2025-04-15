Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBDEC369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F0D83342;
	Tue, 15 Apr 2025 19:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiDc5eSzhkbp; Tue, 15 Apr 2025 19:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39AC1837BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39AC1837BC;
	Tue, 15 Apr 2025 19:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 169B1108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F33B5836D5
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuFca7Olnoan for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09ACD835F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09ACD835F2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09ACD835F2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:56:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-399749152b4so3483536f8f.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 12:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746975; x=1745351775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JwbueKYZmvrOsFTWOlN2wYjTxIUrFgXXaHkZQ6H03lw=;
 b=t5WhjpXIp7fCdIJxxgDe2xjVNFF7Til4aIGVXSvNSNsg4XWuLh4t3hg99q2aAuwP/A
 BunlwaYku8ZDN8up3ch5g6TlDqqmbCiJX+ejkxJ3eFltRqjtdbdfw1uZhrCb2aDr+R7t
 sBWjuQp9+E7Kqk9YzR9urJ6gO2bp+wkgSG9s1VNUpYsqHlcT7o/oTQg35Cj/u/X8HVjo
 ESPvgRFJEk304OrqOqmYob2ahemE4WO/voRcZQaZlM5IuEkf8eYqb8dpgtpkq1rij/vP
 Khw9IfNX1ukmBRNwKIJddDyeJG4bG/jJUyJWh26kUaAsvOKlDZtcO5lyLdH2WGHYTScr
 mjFw==
X-Gm-Message-State: AOJu0Yx6qRmsiBbmLjxJuOccK75dzvV3zxSUMk+eztKz7XByrZK+Q+PU
 LkFE5xnkWr1Mn+S6Z7cTububq8BcXGD1IbtqL9oH9frOiRkFv2sfUNOnZa14MDClNj4gTLSXakw
 l
X-Gm-Gg: ASbGncsb7iFL1GLIEFUPakv711tp5U5PJS31oYCdh7pjNPlkgC1P13605v8c7JG4kXR
 4EJE7qZ9XqBm/reU1NKXwx2Av/9O041G7YgfhxBum/oEY5KwQtkOLbP35ZL/e6jKgudU2liVjsa
 4wlSKDGj0ZdtvK1AK6AM1gRANgOe7C3RKh8QFdACrjsuuPhrjrYSrLWAWiv9vt7VozEhCuMwpb7
 XGh8AE4OCguAzzZUXX+NyQu+sUXXreXtj8rCMLIUFtA87/lqWu2+Wr8pUqrDvKfBpLMlj/nMLV5
 9Viimh+Rejlpdj+OoqvrG/d5Q5qyoWxRVDl35yEveaTXcIznpCPs+rM=
X-Google-Smtp-Source: AGHT+IHVF3iY+sLTNSMYbH+vCbMCnvWmK7lD29/VhpXW3zSh5xIS69nVlM8Fp9LJzP9I+fW56UgNFQ==
X-Received: by 2002:a05:6000:290d:b0:391:3aaf:1d5d with SMTP id
 ffacd0b85a97d-39ee274fc63mr566780f8f.27.1744746974783; 
 Tue, 15 Apr 2025 12:56:14 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf447777sm14957366f8f.100.2025.04.15.12.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 12:56:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:55:38 +0200
Message-ID: <20250415195547.199428-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415195547.199428-1-thomas.perale@mind.be>
References: <20250415195547.199428-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744746975; x=1745351775; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwbueKYZmvrOsFTWOlN2wYjTxIUrFgXXaHkZQ6H03lw=;
 b=EgBISXJ8blj32Pbn6zy/iveoFyr+b2cbpeT3q1VHrNpjGY87NXyipxA1QuVLlzL6oa
 w3Pa0Ce1l6afki4HnbGyZ7y/G7Uinj/23LkV57NvBu0jkTrVqTlX+v9ZZ6JcT7SJCDRz
 KcgtsA3KQ+KB8/PPjoidtEiMrUKQLpADmTa1Ir5QE8tgSBEh9jV3tkOhHQxJ0yJL8k1l
 o1hE5hW4h6wlM9HaWKMqyWPHjng+TqomhGPGjsG0AYE6dFbDhKNpDv4gIBhnhkud4BjP
 OjJczXnrvwm/WyYr8jRoRoemqIIZceSSA1w5WgM482IhnSzjzjf6soircXLzyZbNz+Zc
 97/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EgBISXJ8
Subject: [Buildroot] [PATCH 4/7] package/pkg-cargo: support PURL generation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The PURL specification for Cargo packages follows the coordinates from
the sonatype ossindex:

https://ossindex.sonatype.org/ecosystem/cargo

- The type is defined as 'cargo'.
- The name is the package name

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-cargo.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f25..6fb3cb8bc2 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -306,6 +306,14 @@ define $(2)_INSTALL_CMDS
 endef
 endif
 
+ifndef $(2)_PURL_TYPE
+ ifdef $(3)_PURL_TYPE
+  $(2)_PURL_TYPE = $$($(3)_PURL_TYPE)
+ else
+  $(2)_PURL_TYPE = cargo
+ endif
+endif
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
