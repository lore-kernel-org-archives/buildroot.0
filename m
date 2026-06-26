Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18250CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 08:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B5240D94;
	Fri, 26 Jun 2026 08:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muGG0MJklqkY; Fri, 26 Jun 2026 08:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5326240CD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782462539;
	bh=3QmqgqpPR1CtYgHgj27QVrvyMigGBciQjVJF2MH0zIg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=aKA6l/P+i7uatsF6KgHH1hrFWHQsiCz5pS/xc1oTseaPS1w1saILOdgl27GqomvV6
	 KP+PCDcDosE7+a2sQCOT3ilfvRtT6Zc9vd96WkyCKQDVhiQoN+3rMGks7kKL2fb8ib
	 G7b3loTpAtn9UpoK31N46Tg9Fn9dwcs4MKlCc9HybP84YlcYv58mD9Xd+V6nQbAm0H
	 k2rnXcZl55z4SCbssssL4p26LPsbQoHjelN07f/k/RDZc1spF22YtY7OLNSr5nH/8m
	 m1fYx4qXpp9g+gVtqMVjlgkG15hVfPUyBq9Xv92Dc+McKpYHu3Y+K3zR1enhWbo2UK
	 /vifXLk2K/JnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5326240CD5;
	Fri, 26 Jun 2026 08:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F3DEFE1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AEE782036
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBaArkMGkHn3 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 08:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 617F281FD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617F281FD8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 617F281FD8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 08:28:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4923fb1f095so6445625e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 01:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782462534; x=1783067334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cDkZMC9I8LGk7NZYfTRNQynz+2AfnNH1TgSL817iGYs=;
 b=nPX3wCC8VrUft3syYJsxeqdijgknQKAk1OFQVDMP59XySXO158qGXUf4GlDHFfGmq6
 CQ4v0S1JZ5XcivTuDkP8tGeF5nzCMxvpoHSPiKW8LktvgiA/jxcfimmEHudhFiz9Fd1C
 mvR0WvK6BQFw38U8tv3cQdfOWebzB0v50yrPHVQW5ItvyiAqYKJ22/QUzNMK5wgP548f
 8xPDAevxQ++9nwqt2vpiVmKAgtn6hpg6wv/CdZJN7xkMUatf6qNzDKNLLIKT72w1EVRm
 hGQ3bu7EKx81AUQFWI5bCcedOjutmizoy+JKcicLZ5Ps2hqyO/IK9RbpPe+1AbtxFu1m
 nPGw==
X-Gm-Message-State: AOJu0YxE8pN7X0jcYCmYhHp7uGIBc6YaKWO9lFLv6kZE5MHglB1skMvy
 hidpFDJZ9Qw/BidsT24JKSca1rfoxyJv3Vk2bx/Z4SmIrws8FZsaQ7cZ/14//GFryRp7wGNXnZJ
 nQY7o
X-Gm-Gg: AfdE7ck5YafrzxfhN+qZkO8glFPDggbucATtayECEJ2mD/u0Yq27s4xNxNoBuKjx5B6
 SO99WCY7VJvwq3eIYyxjCyaKLHf143raywQKSEpS+9eGRTYSjKuIcAIiJtHQbo2p7xXNEF1EkV8
 1LteZkwMgyE7gl0I43j9zsHBp9THaUhxwXDV6gwqvtXClS/F+6mxkBLOGCCrwa24TstZnqMjF/q
 MXcYYdb2m/Wy+i7WVmj0n4K9rb3hVnl90KnnezXgRP+046oBx5/mWbfusa9WipNmjg52YDRcqRP
 S53LfnjUMcOhspPhNM/J8lDcx6S1EZTZIcwkcVceMndensMwK0YDsn9QRvMV+YTt7QsdyzPyNNd
 IxLkgLw5DE/+XD/RhwnlRo3ICgDEZpuswObkIOCL9mcHr6ZRSecd19Kt430kc99xOMauTchmYxJ
 uAyGUb
X-Received: by 2002:a05:600c:4692:b0:490:4b89:535d with SMTP id
 5b1f17b1804b1-492668677ebmr91221685e9.1.1782462534238; 
 Fri, 26 Jun 2026 01:28:54 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fe31b0sm67003175e9.4.2026.06.26.01.28.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 01:28:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 10:28:52 +0200
Message-ID: <20260626082852.96329-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626082852.96329-1-thomas.perale@mind.be>
References: <20260626082852.96329-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782462534; x=1783067334; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDkZMC9I8LGk7NZYfTRNQynz+2AfnNH1TgSL817iGYs=;
 b=h/RJJaM9dCwWVLWNmtNJyEv71ASfE3MkzNJebojzH4fqj6ENzDqTedic8Ta37HAIf1
 1MIXPsMxH+2U6Fsw98x3u47F97se+gv44VOH3NfqFYdl5apk0Ad7E28GB9eGBdMRt4GU
 N19A3bWyX9AKprrPfzIAcmTZfxD8X6g7o240+pqUN0qQibGTdiG+AnjDtLyDucwf39jJ
 TDq1mTW0dcbfqwBshAHCVzo/xNV09GOAmlfr6c1QIVxRu9Im2cP7C/7CVj3I9/EvmJT0
 I3oh/PXiB8g25QKt6eiAAs/30RAivQdIG057IWZR47pigb/o1wKLmYUBFn4Lo9Cv9X0b
 tGQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h/RJJaM9
Subject: [Buildroot] [PATCH 2025.02.x 4/4] package/squid: add upstream patch
 for CVE-2026-50012
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

- CVE-2026-50012
    Due to an Improper Input Validation bug, Squid is vulnerable to a
    Heap-based Buffer Overflow attack against cache digests.

For more information, see:
  - https://github.com/squid-cache/squid/security/advisories/GHSA-5vmx-9x64-9284
  - https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/0006-CVE-2026-50012.patch | 33 +++++++++++++++++++++++++
 package/squid/squid.mk                  |  3 +++
 2 files changed, 36 insertions(+)
 create mode 100644 package/squid/0006-CVE-2026-50012.patch

diff --git a/package/squid/0006-CVE-2026-50012.patch b/package/squid/0006-CVE-2026-50012.patch
new file mode 100644
index 0000000000..ac3af8a36d
--- /dev/null
+++ b/package/squid/0006-CVE-2026-50012.patch
@@ -0,0 +1,33 @@
+From 19fcfe922717c8b255270c032dcde4071c003bcd Mon Sep 17 00:00:00 2001
+From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
+Date: Sat, 30 May 2026 10:16:33 +0000
+Subject: [PATCH] Harden peerDigestSwapInMask against invalid cache digest
+ reply (#2423)
+
+A cache_digest on-the-wire size may be bigger than the
+mask_size declared in the digest itself.
+
+Ignore the digest in case this happens.
+Upstream: https://github.com/squid-cache/squid/commit/19fcfe922717c8b255270c032dcde4071c003bcd
+CVE: CVE-2026-50012
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/peer_digest.cc | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/peer_digest.cc b/src/peer_digest.cc
+index 741090574d6..53dac203eab 100644
+--- a/src/peer_digest.cc
++++ b/src/peer_digest.cc
+@@ -622,6 +622,11 @@ peerDigestSwapInMask(void *data, char *buf, ssize_t size)
+      * NOTENOTENOTENOTENOTE: buf doesn't point to pd->cd->mask anymore!
+      * we need to do the copy ourselves!
+      */
++    Assure(size >= 0);
++    if (fetch->mask_offset + size > static_cast<ssize_t>(pd->cd->mask_size)) {
++        finishAndDeleteFetch(fetch, "peer digest mask data too large", true);
++        return -1;
++    }
+     memcpy(pd->cd->mask + fetch->mask_offset, buf, size);
+ 
+     /* NOTE! buf points to the middle of pd->cd->mask! */
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 439d65e479..21aca9fe8b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -27,6 +27,9 @@ SQUID_IGNORE_CVES += CVE-2026-33526
 # 0005-CVE-2026-47729.patch
 SQUID_IGNORE_CVES += CVE-2026-47729
 
+# 0006-CVE-2026-50012.patch
+SQUID_IGNORE_CVES += CVE-2026-50012
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
