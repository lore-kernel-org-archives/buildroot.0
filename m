Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BABE92725
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61615608EF;
	Sun, 28 Dec 2025 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2pit-GotBvd; Sun, 28 Dec 2025 18:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48371608F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948210;
	bh=s2E+Cd/FxNuGOZ2gpVPXJ9K5FJ1OUpgFPT39QRBKP5Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Aer5cOsKJGvWvTCt7odSMHRi2bxFlKoM60/ajaSVm3dTmuVHPQ8E0e0Y+yzl+cHJH
	 Ktdkw25OMtCfivQt/RZIJ8IYXd3Wvm1PzlBMkfwUEJF01RB++T0iRPvtysBjvPJ4nA
	 EoVGYfao8Jsjg8GbkdKCSjCkAxDu6jgX5aXmZDqo3NqDp36VepzAJYhR7pGdUMnZup
	 KBtEU7csLP+WQRA8P9zTioHSeOOabwn86EmEPyfuQ7dYgiZFKRHwVSY1ZxbXdZZ4V4
	 uNBF68FHa3b3ecDfcal88oWbwz4oI4DWVlKFmCOLLCug3wa4MLyG2GvJPyMAfFrP9J
	 O0YlQ2tU8WNZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48371608F4;
	Sun, 28 Dec 2025 18:56:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC14AB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9297440077
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYG3lq_EHHV0 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 528B240082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 528B240082
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 528B240082
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so5590027f8f.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948202; x=1767553002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zM7wOXuweWmQsQJW8HSOikjDjEM4J/Yu0SSjjMeN08E=;
 b=MsdgpAnp3RDt+L29qMWFtKuacbBaxktmSapPD8Sc/lIp+He7IBBeZNlLmDdXO6+pLC
 DHH8vZ1aGqxU2FpPwwXR9yOsNL78hYG43iXSLic4C7231XrC/iFg7tG5O0mB8YDHbGG3
 0UT+Kg2N54YeUh6Zh8OnNMKBDMdW1ZvLCEGnVvoY9g5ZnOgGWLCCZPl95MP2fMsjpMc9
 +CsVwBdC82D3HHCsogoPfVc8+WztZrkcHBcgD+FbUCqOWfGiich68QAnno2eLgUOFnQ9
 uRlkRWIGVP+JeBcIhaVKsLmIxFldtS3sjAvUjubvKTI9vIyl63xnDu0lCfvCWK8cqk/y
 UcyQ==
X-Gm-Message-State: AOJu0YzH26tvdfZW1wMo18LQD9RrT9HQ8FwTcEyt/3+toteMu6uNVIbW
 rQBKl1qnfrzQX1Tg3vn/lsuZGg9r1C8IpX6TWr1bBkGS2vBhv/AD9XMluYkK3174WOxBweeFPq8
 9FVi/xXg=
X-Gm-Gg: AY/fxX5xcdZ3Fl+ZHQV599Wdk2bsd+CzKw/pWFgT5n1bQNPVYrHF3yPcc5tHRADAgsL
 mYk7yO75Sz4ywAUtbnmbIT4eP2EPpbHDMI0oIRQKfZljDDgPOKZhh/AxsAG4+zDuFp2/X2e0pd6
 shZgp7vbs+k4b5dzQ2q6CatXgBk+3xf9mjvmnhPbmHEGMOhNSkt5LPDTVlOk/dx1T1kit7oxCHv
 b/J2s+kyEajYrOPPr8jLUmNZ1l11zYB4kObSRZHP2x6WKpCTPRBeovGDOPxLxKvgnk1S8GIrZ5s
 GgqtdpbD85M3FMDVWHwgmq1CFuD4ImlG6DvOhYRlsoaU6lSe6D5zUaF0zlqMN1df3YZoHWR9+aA
 ZwFDezUO/vSgZFBWOPrx1kd0NaCOxDAdE+vbB5JES0y0VUA2S32ewstZzBVFbz4AstqW03MA1Ru
 BhoZwq9HVbx7VRZVXCN2KPqBEXAh/Lb+MHsApH/meqtaJds6n1qFwauPTpnivG9ucWaTsAik7C
X-Google-Smtp-Source: AGHT+IEuJL5qkWyu2lQppvxa7O5Dl10GiRHZxtI6Naze3zRXLunG3Ome7TTmXtKCNG5SjEFWbCQ1Sg==
X-Received: by 2002:a05:6000:24c9:b0:430:fc0f:8fb3 with SMTP id
 ffacd0b85a97d-4324e506148mr36946888f8f.38.1766948201941; 
 Sun, 28 Dec 2025 10:56:41 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:41 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:30 +0100
Message-ID: <20251228185637.58072-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948202; x=1767553002; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zM7wOXuweWmQsQJW8HSOikjDjEM4J/Yu0SSjjMeN08E=;
 b=d6i4+nAixoRN27Qm/3xF+JcRJGyRXmH6QFOBCotmuAFZqy/zYHkaK3Z08IvM5tpp3A
 bte/Sw6yjuzK6/+O8F+XrftB7okJmSB5vudm2oOlrfKe2ny2ndgVTHnhNzXjGtQXPlMw
 LNTVAXeBNslMKMM/9yV5fQoyg7AfePtr/hXlYNUZQCKsoC+9WHwj4jqFulnr4ZxJ5YEx
 T7gKUsytU69oNcsBII6UqcZWGgGzhZtoHuVsH2Aaz5dXRZYU+yeJJtSoGFAz/pOwEgXU
 lBvg9QjoVpauGmd9enVHWjvM3B7G5kg+eOiWaMK8YNfFWXuq06FUXT9eE0DyvwzNhOi9
 EqUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d6i4+nAi
Subject: [Buildroot] [PATCH 05/10] boot/grub2: add CVE trailer in patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...4-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch |  4 ++--
 ...-tar-Integer-overflow-leads-to-heap-OOB-write.patch |  2 +-
 ...text-Integer-overflow-leads-to-heap-OOB-write.patch |  2 +-
 boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch    |  4 ++--
 ...44-fs-Disable-many-filesystems-under-lockdown.patch | 10 +++++-----
 ...ent-overflows-when-allocating-memory-for-arra.patch |  4 ++--
 boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch |  1 +
 7 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
index 40df727a60..3cffc80530 100644
--- a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
+++ b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
@@ -5,8 +5,8 @@ Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
 
 Replaced with grub_strlcpy().
 
-Fixes: CVE-2024-45782
-Fixes: CVE-2024-56737
+CVE: CVE-2024-45782
+CVE: CVE-2024-56737
 Fixes: https://savannah.gnu.org/bugs/?66599
 
 Reported-by: B Horn <b@horn.uk>
diff --git a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
index c3c845a50a..9d89bcd48f 100644
--- a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
+++ b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
@@ -9,7 +9,7 @@ number parsed by read_number(). Later direct arithmetic calculation like
 grub_size_t leading to heap OOB write. This patch fixes the issue by
 using grub_add() and checking for an overflow.
 
-Fixes: CVE-2024-45780
+CVE: CVE-2024-45780
 
 Reported-by: Nils Langius <nils@langius.de>
 Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
diff --git a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
index bb3cfb1813..b9638caabb 100644
--- a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
+++ b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
@@ -9,7 +9,7 @@ to 0 leading to heap OOB write. This patch fixes
 the issue by using grub_add() and checking for
 an overflow.
 
-Fixes: CVE-2024-45777
+CVE: CVE-2024-45777
 
 Reported-by: Nils Langius <nils@langius.de>
 Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
diff --git a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
index 58a63985cd..7598254496 100644
--- a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
+++ b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
@@ -6,8 +6,8 @@ Subject: [PATCH] fs/bfs: Disable under lockdown
 The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
 This will also disable the AFS.
 
-Fixes: CVE-2024-45778
-Fixes: CVE-2024-45779
+CVE: CVE-2024-45778
+CVE: CVE-2024-45779
 
 Reported-by: Nils Langius <nils@langius.de>
 Signed-off-by: Daniel Axtens <dja@axtens.net>
diff --git a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
index 9120f8c872..778903533d 100644
--- a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
+++ b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
@@ -9,11 +9,11 @@ hfsplus, iso9660, squash4, tar, xfs and zfs.
 The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
 reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
 
-Fixes: CVE-2025-0677
-Fixes: CVE-2025-0684
-Fixes: CVE-2025-0685
-Fixes: CVE-2025-0686
-Fixes: CVE-2025-0689
+CVE: CVE-2025-0677
+CVE: CVE-2025-0684
+CVE: CVE-2025-0685
+CVE: CVE-2025-0686
+CVE: CVE-2025-0689
 
 Suggested-by: Daniel Axtens <dja@axtens.net>
 Signed-off-by: Daniel Axtens <dja@axtens.net>
diff --git a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
index e7bf8d543b..ce84e677c3 100644
--- a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
+++ b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
@@ -9,8 +9,8 @@ overflow checks are in place.
 The HFS+ and squash4 security vulnerabilities were reported by
 Jonathan Bar Or <jonathanbaror@gmail.com>.
 
-Fixes: CVE-2025-0678
-Fixes: CVE-2025-1125
+CVE: CVE-2025-0678
+CVE: CVE-2025-1125
 
 Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
diff --git a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
index 7449e08191..e7d89e02e7 100644
--- a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
+++ b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
@@ -9,6 +9,7 @@ The code is extracted from the upstream commit:
 
 Fix: bsc#1234959
 
+CVE: CVE-2024-56738
 Signed-off-by: Gary Lin <glin@suse.com>
 Upstream: not submitted upstream, as upstream has switched to gcrypt
 Taken-from: https://build.opensuse.org/projects/SUSE:SLE-15-SP5:Update/packages/grub2.39923/files/grub2-constant-time-grub_crypto_memcmp.patch?expand=0
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
