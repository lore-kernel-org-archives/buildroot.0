Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5314CC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 08:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E5841678;
	Wed, 15 Jan 2025 08:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bb2bD7Rwj6ut; Wed, 15 Jan 2025 08:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B08D841680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08D841680;
	Wed, 15 Jan 2025 08:00:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4571A94B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E4C84807
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93Qb6DIIb9su for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 08:00:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3045A84805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3045A84805
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3045A84805
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 08:00:56 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso116872245ad.3
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 00:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736928055; x=1737532855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Jg+kNlq2NkYPuWzw6cr0kCp0WTvMbqBDbAhpvK8B1Y=;
 b=F2PhMIS9b+6heKAKRaNSIPH+XyXA4d8FrqNGPQdzOcXOwAcSgJHxuY2/9pt8ICZl/Z
 IWnoe7b2UR64zJdgOl8YC4ESKjQe8ve1oQ8Trp+/QquwnLYiAfFwiwjLe+IqFgHc2xtW
 mkvQvSOhpRsevZnN36THay1a5CPsbBoozAj8JdQU96GrrPdgkj2b1Zh1/1+ZIPiAd/TU
 IsXi4XLIdv4gonS4yO03WoR4XXAlP6MPKlRxt9XkGzMROmAxfLq4d2mJt7SVLw0gjL4c
 30SiteyvMW4GQdCzGZDL0cx8pvHWPG8eAaxeYC/xzG9o6zMR4kEnOLLsufi5jn/D68eI
 uSww==
X-Gm-Message-State: AOJu0Yz9QoDl634aCoH8rEQVE8yHVyqimb6Er9kLnArmpaLvpIvvck3y
 NQEFdwW/c+F7DnMDYJlt2iLc8gwQGBKswhDUgfUm8OhQ6ZfLDBexp9qntoev
X-Gm-Gg: ASbGnct0E3wMK0WXH9bS6VreGLaA877zC5CdzF4ZPuq/VCOYm8uzWHSVz8UnZC7OUPh
 H4FHtYZIAdwBU6CmYYnSyrYr7DYboe/MQ88yHsci5QUJNLv8bBm02p8Jw06vRR6aCZlu76UrgK8
 FUtB3lglp45pXvs63Md921+Nz1dTwPAgp0e1REffCAl8JdrLXX3QQ98VxGQ1cK8VpxDWOlieSJY
 uTPPogdtiID8NbvsN02UlVQuem3rujxJAn7oes5NIMaWkemaMV8HQaB6hX58hv7mXYKRy0Jiu/8
 fzicPN4+zT96uFNvJKz87ZpCPLVmKchaDmrMkYuQ
X-Google-Smtp-Source: AGHT+IG6FsJE/hUI5c1hvCgvQH83OlVBiT6GFF46QFJ9hXrIUMqg9bT837/oT83x2+X/mAdmH1mwKg==
X-Received: by 2002:a05:6a20:3d84:b0:1e1:b224:74c0 with SMTP id
 adf61e73a8af0-1e88d0f074emr27410102637.38.1736928055089; 
 Wed, 15 Jan 2025 00:00:55 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d40569fddsm8521247b3a.39.2025.01.15.00.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:00:54 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed, 15 Jan 2025 00:00:52 -0800
Message-Id: <20250115080052.794978-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736928055; x=1737532855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Jg+kNlq2NkYPuWzw6cr0kCp0WTvMbqBDbAhpvK8B1Y=;
 b=eGn/q1zB1BOp99fqYYYrE0R3sbKz6V7nOhJZ3oq4qxqhneHSf/gdk3cvhygpof8nlb
 anRHCkmFW6IFh/TlUmKxd65yKk/NBs3E/xgll0c8RWwKJ/PXWvLp45+2iLKgiY4OlTh7
 k6DCeOGKWFf5+zD7RHjBrIOTD4rr5Ov7GHXX9kSFUmfe3xj9jI3mVv6GR+kboJvdUEjp
 HosnKD4K+Og+LQdNmNYOmkvG50jRPBVAd7VyXfjoLJFuafKx1Up32SRRlmV9FSlcoiim
 Ihw2tITB6WCYLVuJzOemGFeXGQzAFArlIRLPBVBg/jh6Z1+wt/Uu98kq0wh4ogwxF5M7
 aQ9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eGn/q1zB
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump version to 1.7.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Rebase 0002-Handle-__mips64.patch
- Fix a check-package warning related to Upstream tag.

Release notes: https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.6

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/makedumpfile/0002-Handle-__mips64.patch | 8 ++++----
 package/makedumpfile/makedumpfile.hash          | 2 +-
 package/makedumpfile/makedumpfile.mk            | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/makedumpfile/0002-Handle-__mips64.patch b/package/makedumpfile/0002-Handle-__mips64.patch
index fd3fdbbb39..b3fc6fba05 100644
--- a/package/makedumpfile/0002-Handle-__mips64.patch
+++ b/package/makedumpfile/0002-Handle-__mips64.patch
@@ -14,7 +14,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/makedumpfile/makedumpfile/pull/11]
+Upstream: https://github.com/makedumpfile/makedumpfile/pull/11
 ---
  arch/mips64.c  | 2 +-
  makedumpfile.h | 6 +++---
@@ -37,7 +37,7 @@ diff --git a/makedumpfile.h b/makedumpfile.h
 index 70a1a91..3842f9c 100644
 --- a/makedumpfile.h
 +++ b/makedumpfile.h
-@@ -963,7 +963,7 @@ typedef unsigned long pgd_t;
+@@ -972,7 +972,7 @@ typedef unsigned long pgd_t;
  
  #endif          /* sparc64 */
  
@@ -46,7 +46,7 @@ index 70a1a91..3842f9c 100644
  #define KVBASE			PAGE_OFFSET
  
  #ifndef _XKPHYS_START_ADDR
-@@ -1204,7 +1204,7 @@ unsigned long long vaddr_to_paddr_sparc64(unsigned long vaddr);
+@@ -1285,7 +1285,7 @@ unsigned long long vaddr_to_paddr_sparc64(unsigned long vaddr);
  #define arch_crashkernel_mem_size()	stub_false()
  #endif		/* sparc64 */
  
@@ -55,7 +55,7 @@ index 70a1a91..3842f9c 100644
  int get_phys_base_mips64(void);
  int get_machdep_info_mips64(void);
  int get_versiondep_info_mips64(void);
-@@ -2364,7 +2364,7 @@ int get_xen_info_ia64(void);
+@@ -2513,7 +2513,7 @@ int get_xen_info_ia64(void);
  #define get_xen_info_arch(X) FALSE
  #endif	/* sparc64 */
  
diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index 9083ced423..1eb51f1edb 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0c53f1e5e11e75e4896197df795bee63b3d46b8821fbc3368f7a240861b543b5  makedumpfile-1.7.5.tar.gz
+sha256  c949a5b2ad95e5f83a6d1b4faac0972510e4286b0e3257020762e45357816a61  makedumpfile-1.7.6.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 5fa1331910..b06f3d0cb4 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.5
+MAKEDUMPFILE_VERSION = 1.7.6
 MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
