Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E994E937EE
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 18:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B024B423EA;
	Sun, 12 Apr 2026 18:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HkunWRGZsIF; Sun, 12 Apr 2026 18:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B12E942350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776017363;
	bh=j4ZdtbEc63RdP++y1zEoBrehO7k4fPU/BX23MJ/AlXQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xf2nJjzAknq64MG66bk/DeHpunD6flXBDawpGHtO3jpqok4yxDT2OKpyM08Z+Uc2l
	 qVwWmuls2UaWRsKTI5D9BIXM2yCZas7QPhdLJ6mgsiBb8yekE99sRPWjUYKPVcE75w
	 aib0b7kHoDwjgzT4iRYRNXjmhYwZr6sHf4Wf4vfJWu/3tV30j/zDmUi/2fy8+98DnL
	 mGlbexl2kCPUJTZUx/vAclpZD08uNoIkmcER4gz0sV7p5xcRQbpPSpjkrwqa8TibB+
	 1IuUkWDpaFAqsxear/db3lzhjaRDYgvMeg9dnF+cpqunvGef6E8Ajnk9EHan0IoF/4
	 P68N60+yDhrAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B12E942350;
	Sun, 12 Apr 2026 18:09:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CCA2194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 18:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E72084606
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 18:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4y0_5et1zql0 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 18:09:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 492F3845FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492F3845FA
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 492F3845FA
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 18:09:21 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82f33d28c1dso274380b3a.3
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 11:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776017360; x=1776622160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RW9BXldmAeKxexGsIIG3kULH4JCrYLkZu9VonO7U0fk=;
 b=Szz82fe3i5Fv18A4MhT0RoX3sISh47dIxEWqeb+DB851rmfXYYnvOFpuWqbp7DZLjo
 phspjJIKm0ThAGjtwHoc0tJ1MvEsT0NLIUsIpXwEl/p1vf+51lkzJR+CmsLAdlUmXbRH
 0+uCk0rhnvi8K6417dlgTYuLO87cNxgNuoVqmOFCVsesXhFj+Rh7v46UZVNs+FlGghEJ
 flr8Lws+yeHTTGC9HuMX6kSxd9bF/92E6kTRB83GEvrnBxKcbvDWNBohFRfE8+YQj3xB
 F5Z78hja1bRch0x/rlfvbZ7H6gqKyWvAcxHv6/uPTYZftzpNk6nUteVkgQzVS8Ynxshg
 RwEw==
X-Gm-Message-State: AOJu0YxHYTpLUn4xYfLqNwvjz1Ouqk3VSPpPrhe014rLo6e0bWhSkUwA
 mqPPuk6pClFjLpLiQH3I0HRLKnOiXlzSE+XJFXS6rjVHStphi3pHKohgL6XO9lxu
X-Gm-Gg: AeBDiesQfy7vfKIX/mUi+AEaOfGmxnQWS5MQfqD3Sv9LnGZaoHYkEROlrKXdfJ8u5rs
 rGUrSiJBrsFkpTc6MsOFpKFRJKNblIQeZI5SlHYfdphlX/59YYa4dv24q6Y0z3TkiqQ+y1vRi1x
 EqTLBhi+SvvEaM4qXyWqMjwlw1dxDimIQyoR5DX4E5zILUcyFgGBG78Ihh45/vrAT0jGKMKHbc6
 CdnTzgLzaZF0eW+unFr0zugo7S4Q/VYih9aAxJgKdDuOChCwXmgwDRkXIIRoRXpUE1p1Y8CflL+
 F2xBgpWcD9YB8FAl4EOxBCZJsyF/NcxanG/vyze8rb3BYGDPV2g2HhS7rF67c279wzwBvGtEDPD
 NCWeQPRsnXS8lM6gjNfMbNZiMBOCYBwy/Vm96lEPHh0mteTP3gQ4bQLb2C24iYkuEAkXl9nq7+c
 rpaoYH9DY1rZ6UYxyPlwX52rFdegGAsxVBCw==
X-Received: by 2002:a05:6a20:9155:b0:39f:2a91:5453 with SMTP id
 adf61e73a8af0-39fe3c96a94mr11784933637.3.1776017359636; 
 Sun, 12 Apr 2026 11:09:19 -0700 (PDT)
Received: from fedora ([2409:40e1:502:1849:68c1:d0f0:6b7f:ab95])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7921a20100sm7590432a12.29.2026.04.12.11.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 11:09:19 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 12 Apr 2026 23:39:01 +0530
Message-ID: <20260412180902.86006-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776017360; x=1776622160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RW9BXldmAeKxexGsIIG3kULH4JCrYLkZu9VonO7U0fk=;
 b=mS/0SfCoJKQwlExGt6gYsB5dB3AQ3oibLoDg9BJXfIOvcFxN7WjNMYIFI4BUA/WKKq
 sWDb/9nGwp8snz1uXEZDAmB0SOkmZS3YTCJJ01hMjRNaTQw/NXeANSZzu4rKltMWh6bP
 bMwbfJ24rFaHzi2D1lHhx8pLBBlASkblsad0dZSl2lBJGjinNAAP0OSYBGdgeGCcRJ/K
 SBK0WwtHFePFE8vh0Eyd1kTWljKcdT3h/sDT/NmeKnNUXrkeNp7TMo8SJ+GXiUhIe7Lq
 5Zn3OfSWRps1rEats4bdKEkATFq16/CITtyE4lySaSdEw3X5y84kNkC51+hovM0oCgsS
 KP6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mS/0SfCo
Subject: [Buildroot] [PATCH] package/inotify-tools: bump to version 4.25.9.0
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

- Fix crash on >=1024 watched files
- Add recursive watch with --include
- Add static compilation flag
- Fix fanotify-only options when disabled
- Fix man page reference formatting

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                               | 1 +
 package/inotify-tools/inotify-tools.hash | 2 +-
 package/inotify-tools/inotify-tools.mk   | 5 +++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e9c8a5a0f..5c8adfb316 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3062,6 +3062,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/hyperfine/
+F:	package/inotify-tools/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/inotify-tools/inotify-tools.hash b/package/inotify-tools/inotify-tools.hash
index 5984827f8b..782db42e1d 100644
--- a/package/inotify-tools/inotify-tools.hash
+++ b/package/inotify-tools/inotify-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5b018567814ea555d716f518b6e3ae243c733f7bd3e8585d81748a6da286f3c  inotify-tools-3.20.2.2.tar.gz
+sha256  d33a4fd24c72c2d08893f129d724adf725b93dae96c359e4f4e9f32573cc853b  inotify-tools-4.25.9.0.tar.gz
 sha256  e41fc126320a79ed53b5aa3386f059f7d10770856d6fd714ab80a96ce6bd09d6  COPYING
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index b410ade33d..75deddb697 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-INOTIFY_TOOLS_VERSION = 3.20.2.2
-INOTIFY_TOOLS_SITE = https://github.com/inotify-tools/inotify-tools/releases/download/$(INOTIFY_TOOLS_VERSION)
+INOTIFY_TOOLS_VERSION = 4.25.9.0
+INOTIFY_TOOLS_SITE = $(call github,inotify-tools,inotify-tools,$(INOTIFY_TOOLS_VERSION))
 INOTIFY_TOOLS_LICENSE = GPL-2.0+
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
 INOTIFY_TOOLS_INSTALL_STAGING = YES
+INOTIFY_TOOLS_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
