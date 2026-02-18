Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267FE9A047
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 16:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD87F81247;
	Wed, 18 Feb 2026 16:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3s0KE9g4SliA; Wed, 18 Feb 2026 16:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BB298123F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771432333;
	bh=6Y9bkyRDS6M16b24DOnxYfOB1Mtj1fVSIQE+QcktZtk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HaepCEF6tjuhr+6XDsmRjaLuy2YZudsJxiqQ8vVLDrI0CFzUxm0gzmVKJ53cj9QaE
	 8P7znK6PteqXx19SI+Hga+DhLmRoiagxhgW06fbEeuHyMHOUMutAG5UNJoJylHdJsT
	 ZUBdxQpor5IQckB3vFeHqSrhhmlboKy9xezBijgjesfG+vtAN35RAhMQEPILof/ju8
	 qAQ4SGhG1/LcejIkoBzfzKrGNgflMJylu2o5VFnS310rDscBckcm4GNM5U48TrM4L/
	 wc9+Ddx9tgd+SJveZTqqAlDQhWNmhwmrP3q/F06hjxERrlg8c2HoyCRoXDAl7beUYj
	 fNZgitzmY58Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB298123F;
	Wed, 18 Feb 2026 16:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BCC435B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2138860903
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zvYSoOJMuhl for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 16:32:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF4CE60904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF4CE60904
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF4CE60904
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 16:32:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso117565e9.3
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 08:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771432328; x=1772037128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3DEq4/FuA6nMw9VAplQrh1f7Qa9qLwYhLmIDDzTRsM=;
 b=WPrXa9haZv7lOOI4JLfFmLncg56ooC19FkeXhSwufJwG6UPjx1h3rGFb2B0dhGLgki
 Zc84lORjc7HSfsFTnsjyps1e9cYAERggxfZR5YUoAoOq7l1T0CjtdfDF/Fs4T/8EX7vr
 lZRpfQ0i1TiRUdm1nezPbnMa3FS0MwWLBeVYhbI5uebzLyVyyVKXiGIdt2z01eNxO3VY
 LjDK2D1us5es6A57ESL2hiAnJDt1lKQMz6j+O1rdw9khqNd7aGEDvR36DCRRvqpgb3Om
 Ft4xHTbITTKK0rETOqtq/mzt4dWWMY7Jf+FhaC5CT61M1RV3gGp/vFo175bBwsZ0A75A
 JgOA==
X-Gm-Message-State: AOJu0YyQS9IkiKutgrWBIKxdCm/JSEjw2kAq6me4ZmbylLhay0Mba/hi
 hBa1A2Uk2xjFx4POHNNTtRu0KNjjxDRBH/wJcJj5KQQUBkUkF0Wu08/ApI4Y01wXIICrDNIM97N
 o0KoK
X-Gm-Gg: AZuq6aIhV5GUGhaYF3IBaBzwJFtnTjO6t/YpKgTiy6j2ppapQp6j4d1u1nnLG9z5KbE
 e9U+1KQFYYRPQhHlIH84o7CbtTydKxkG9pW6x4G7Ncwv8Bch78uTSAKKD2+ZjFUHQE5bQhATFyy
 My3BKy5c43JVdI+rU7R2sZQOuH0XSHJnJDHItlwVpzAN1VcyWizH43UiXVvPDDlWAKxoI4md3Nw
 lR29kvR54erC4jI8YSBfleY/brJSM0uFa35ZSzNoPeQnlSmwJdu6Iqq5oY1YUiL3BDxseKFsg6N
 SIvtC1Z48M4uL7Dp54AHGdDjMC36aCeBbRiMMnxaHhoSScQMkfk8bFcoQLZ9p8jrSMdMojpkI3c
 yiL9p34MuRCixX5euary88zeGtxVNYczxnQ42FONhrb2TfJpb0pAy9fOrfY7a+LoPJV9h/4+V/c
 EilPvyVCX7UWoERN3Iz3djXWTNcgyluv5sQtm07z5B
X-Received: by 2002:a05:600c:3b86:b0:480:69b6:dfed with SMTP id
 5b1f17b1804b1-48398ad3023mr45249185e9.24.1771432328206; 
 Wed, 18 Feb 2026 08:32:08 -0800 (PST)
Received: from FRSMI25-GRAVITY.. ([2a01:e0a:943:83d0:6dc6:c524:f7df:4d64])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483983e8e3dsm20677605e9.20.2026.02.18.08.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 08:32:07 -0800 (PST)
To: buildroot@buildroot.org
Cc: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Wed, 18 Feb 2026 17:32:02 +0100
Message-ID: <20260218163205.1639035-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771432328; x=1772037128; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x3DEq4/FuA6nMw9VAplQrh1f7Qa9qLwYhLmIDDzTRsM=;
 b=S2f1nMchf9oUUez20cO07xnNztMDZy1iAL4SkF9O2ettrFFX4cOnBqfwWPaE4JgHM2
 mNUBUIKJYo4e7IWv/RcdcbcsSVMlqA0IU/S5qXr94Rc6x0w0QFZOaWD1snddnCvlDYyI
 WrLC+bbgWAGqfn2npOOQwl6HuE76Np4U/eRuo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=S2f1nMch
Subject: [Buildroot] [PATCH 0/2] Linux kernel CVE filtering improvements
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for generating compile_commands.json during
the Linux kernel build and provides a tool to filter out CVEs that are
definitively NOT applicable to the current build.

The goal is to remove false positives from CVE reports while keeping
potentially applicable CVEs that require
further investigation.

The series consists of:

1. linux: generate compile_commands.json for kernel CVE analysis
   - Adds Makefile hook to generate compile_commands.json
   - Adds Kconfig option to enable this feature (disabled by default)
   - File is copied to binaries directory for use by analysis tools

2. support/scripts: add filter-kernel-cve script for Linux kernel CVE analysis
   - New script to analyze CVEs from Buildroot's CycloneDX SBOM
   - Cross-references with official CVE database (CNA/cvelistV5)
   - Removes CVEs where NO affected files are compiled
   - Keeps CVEs where affected files ARE compiled
   - Keeps CVEs with insufficient data for manual review
   - Supports stdin/stdout for pipeline integration
   - Optionally auto-updates CVE database


Fabien Lehoussel (2):
  linux/linux.mk: add generation of compile_commands.json
  support/scripts: add filter-kernel-cve script for Linux kernel CVE
    analysis

 linux/Config.in                   |  20 +
 linux/linux.mk                    |  12 +
 support/scripts/filter-kernel-cve | 592 ++++++++++++++++++++++++++++++
 3 files changed, 624 insertions(+)
 create mode 100755 support/scripts/filter-kernel-cve

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
