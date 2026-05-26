Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1886CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C63610A1;
	Tue, 26 May 2026 20:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MS4UekmQ1ZVJ; Tue, 26 May 2026 20:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC75F610A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826790;
	bh=SSm8bph8l78zeAjgz4eioqzLg1sEs9bDaEJgyk4qKq0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TsIshLwr10r9yicf9AGuU/M8b83ZJpUp0DcgPDrI/GjCytum1eoeD3Z9chv9OhZgE
	 bUUF9Cd0L9CcMYkRhrE/jt0ReKafutezBYp1rOJpNGi2DSsUkHfm4hbI7uHcoV4ZtA
	 7tZjGg5v/GDwSMWzosZjDNRUOF3v5g9b4s7R7fjkLnJj12ZdHrXntfE+hbpVHQfjP+
	 Mme5AfI8ko2rmTZze/9axpsET0jpbOnNLlROXi9GmNW80iCjMdGLtvCs3tUhu52dqP
	 svYFVUCkzPfgBN31rB8epuyHxnKrS+BM+nMTyX5agaMhKy76KyY16SMyYheAX3z5ue
	 z1ObA0+SqbmXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC75F610A2;
	Tue, 26 May 2026 20:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C9E123F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2260680C71
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vzn-6EieREIT for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3037A80AFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3037A80AFA
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3037A80AFA
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:19:48 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4855003fa6cso2963262b6e.3
 for <buildroot@buildroot.org>; Tue, 26 May 2026 13:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779826787; x=1780431587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZ7kEBZM9q7spYP93nVrmoigGu4Z1b802MuwvkTyk+U=;
 b=XDm+z6/UAWb/YB326vh9ShIuawrzFGdPjwgsNfFD3KZx4T4pkav1hH0yGv64/cvV6q
 O67erg/sWwyuzQXrneG+/jNuNMnkFSohNLZ4hdDN7M3mXheQroe0UJ0sUNE0/leORNhW
 ZjTdu4mfolwg8ZXo1Ru2l666FBVZwmFUGTi2E3cysu1sNJxA0jvyQDgDi3aCSA/Y5gMR
 q+E9eXuSX0dgY0KLFORH4TrrAbZVoL7XzDYZ2283vKN+Kmx93Oe4wyZvR7MgRpx0swij
 2T/1zdMHyJ3hVYMeUbxmV2KMfaJDbCOJKCxoTb4fYFckaw84ViZe7IZnUnr1+ZXggF6h
 2Upg==
X-Gm-Message-State: AOJu0YyZHVQm0Dl0BYc99AfnqZxNN6vZrjKs5HOjv8C2iHh3vhQTj4DL
 tlQERTW+rx8Hv2YXzUJnCVY/rc3gxh8fcz1/Z6B2pIEfuAgBeRz+FWVcfPy0BA==
X-Gm-Gg: Acq92OGH4tgCDxUndk7wMOeiNyP1TJwANtl6w6ruq01AI25qlBVHCdZW9aTWDKXRTYf
 +T9StHKM//GmigmJZUAT1oK1V/H6DN1ZR89lrPoq+pcIq34hrsAAO3mzVtnQN58kK7aw5AvaffH
 Kb+Z+IhlzQkDoYfD0hx1AUn8w1h2viYZhTdl5Ka+CDKllqkttPehm0A2rD0jT3Wi6Ei7J0Hzl3H
 naQVRiZNcL9jwdRlgJiU+4+drbw/xudhPWtbuh48FQ9QrQKOZJAZn+VmxjWlSMlN3Rvh3Q83Tif
 z/b+8NNm7oiFMe4bOCYJbD22YQcXjRSwvuRsK4JYCTLBfe8venMbNGlvz1S+8ivYihryoPgX12t
 kRNn4MPFzz5ZQ37xm6J/8snemly2kEEfhgkgV8wDvKCTATJEh3SntMJw1RTMlvKp/kHb+uTQd9K
 RXI0sRXxHuNKdgPaonUh11dv5aMJflBWA8hGYhrhMllvPoC2MpfpGLg5sKuFAWLFh9kl1p9GHF0
 7R8ymJx6SeCa+Dg2m9UxXS53GCKWOTybwxc6rHg6QnIQa0wGz0Ku6AOgft1GIeeYADty5DSyd8m
 pkac
X-Received: by 2002:a05:6808:1b10:b0:482:e5d4:151f with SMTP id
 5614622812f47-4854a178862mr12332228b6e.29.1779826786864; 
 Tue, 26 May 2026 13:19:46 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-131-78.hlrn.qwest.net.
 [184.96.131.78]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-485544b10e8sm6398445b6e.1.2026.05.26.13.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 13:19:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 14:19:44 -0600
Message-ID: <20260526201944.379676-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779826787; x=1780431587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UZ7kEBZM9q7spYP93nVrmoigGu4Z1b802MuwvkTyk+U=;
 b=TKdvbslCPiYOmtCYluM9f/JIhBKwqdriytLlLxwVIKErGFyBKr1/5nusViAiZAsr2M
 ofUgAw9v+dwSR3g6hZWw6VXmMPk7kKdJP+rjujaRdar9swYuBCyk92tTlnSmy07lJs6M
 uER16ahLyQ5UownGnKECoNvZ90SuAKb2pts1xDHV+uFElTLfp0QC134IR0QximpB0hWq
 Hy4Af31Ez2FRSw9/vovQVle/vS6AjuzTNV00a+4VMdICbcue340GI7Jupszt8czEQkYP
 EOI3fEMD3hWMMPzWWjuvmvsDSEhg6IidX/wFU1LYRcuspEmxse9UjhGbRzwY/WysqMdx
 47kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TKdvbslC
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 4aa8d75119..bed49bf689 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  2c35b502eb0f34a3708d743b3e817186  starlette-1.0.0.tar.gz
-sha256  6a4beaf1f81bb472fd19ea9b918b50dc3a77a6f2e190a12954b25e6ed5eea149  starlette-1.0.0.tar.gz
+md5  2d1e880ba9520c487e52dec610a0dfc5  starlette-1.1.0.tar.gz
+sha256  e83c7fe0ddecd8719c5b840080325aec0260acec86e9832899e377b91d65e90f  starlette-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 8d369d53ab..20126e11ae 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.0.0
+PYTHON_STARLETTE_VERSION = 1.1.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/81/69/17425771797c36cded50b7fe44e850315d039f28b15901ab44839e70b593
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/95/66/4d20cdf39a8d6a51e663b7038e3b828ff211d3891a43a713fe7e4643f3a8
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
