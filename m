Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695E9C02185
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 05:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C99B981164;
	Mon, 20 Jan 2025 05:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xi_RrbePkr9r; Mon, 20 Jan 2025 05:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E560A81DE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E560A81DE9;
	Mon, 20 Jan 2025 05:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 965D2959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 05:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A4440B7F
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 05:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0LWMkEs5VcZ for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 05:21:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DFEB40B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DFEB40B7B
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DFEB40B7B
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 05:21:55 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2163dc5155fso74902165ad.0
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 21:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737350514; x=1737955314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0QiLVVMUvUkfC89wj0iyW6FOJBHGitx5A9uI1LzbQqc=;
 b=b1aL9PZj71Oq9CcjJCCBs9Cj0UHYYNkFvh7OXpyb8u9wtx2NrUx2X5MyHnarJvWcMF
 ABFEfV1bQ0kgMCg4pZVaFB6hzKdz/klKeRqcZ+RJWfgYHVpCOrwn+5p3MxtEy+Ve37+x
 mC0mTFotKydRohkoA2cMh/CZ8mSoHrcJYL/IiJIkYaKMO5NgywZKAD1g2JtWwjZb3w35
 u/yMkQfAO+NrltjcV08i8pI1u0BDNZR5ApAFEUTe4Gi963nYEtP5TH/aj/tvDaig81mx
 R/HpHsYtBUmFjMvbRqlhnx8hfR0IHHTh8EhQOAXkUBIKtmhyVlr0dT2gupcCZouzsS9o
 XNdw==
X-Gm-Message-State: AOJu0YyqxrblrMrb3t2vy2/H3NdTY0dXoUi8KAFw7B7juw5NI0Qv/X5W
 0luHPEzcLf9dBFvXB2WChRTsLTNlb8+PA2BEuboxGGXqYolwulxrYPCWsX5j
X-Gm-Gg: ASbGncuJgLwcufGHg+PsDDSwdXeYmWm4ScyjxXL0+758Vmx4oVjCOliK2LTNMKXJ07B
 gMPbNf9vP1EudnxxFlhxXEUUXrBPONCKY/EJMrPvzn7KQFiwB87+8pfAhtIc6bbarwmxl0Dklvl
 /lRElpbiGj6ME7w+l0guu90QkGUcsIK1RtFy92wbBwXxWsCJdetgwSOvlUuPsgIl53LDDMlfzwc
 tgxm4RHsOyo/vb3yif/HD4dXlHQDzYA9bn7duplgURrq8ByJdx+bc/x+oBQPILzGhF5Jgb/7JRU
 vjbxEwFFYsvxRXKWz3rQGO037S2i4kmvDWOPHrWm/SH3CdtZ/mGmEw==
X-Google-Smtp-Source: AGHT+IGh5gJBjKhmAofaCLuFfyWTVLDHw9JkF99w/YnAQtB0C/8d0ztYYZegTlQ9otgLabJ/Y7cYug==
X-Received: by 2002:a17:902:db12:b0:215:603e:214a with SMTP id
 d9443c01a7336-21c352c8151mr214332555ad.1.1737350514317; 
 Sun, 19 Jan 2025 21:21:54 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d40273bsm53109065ad.213.2025.01.19.21.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2025 21:21:53 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 19 Jan 2025 21:21:50 -0800
Message-Id: <20250120052150.3608-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737350514; x=1737955314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0QiLVVMUvUkfC89wj0iyW6FOJBHGitx5A9uI1LzbQqc=;
 b=nQNPNgh3M+luDkzvoiZgcbiBpvo1q9FA5/pEKBczNIBYvsem/lZOGcsB67hNRzSl+Q
 3kQc1qUKB41HONCQLU5lLmQcCNAfY6JJk5flP3gkBIz/0tJFL2xMojnhiw5fhbx1Eam2
 k6hrOax21V2XMk7FUgDNOmdU6GjE+RAZ1odHC5wDVbyk2wF7ghGWyEhfH3ceSgRYP+SA
 Flu5FjbHi6Z+w6ShDZinNMVs2XhdpYgAwhCHe+0wYfq0qHFlFZoj44iQyf00T4++Sda3
 aOtWuHDCc9q3WpnFO1ybWpXS/UBKeFWY4MfLXuvGieRZRLc9B99qWcGJmdl0+8shjzjq
 ajWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nQNPNgh3
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.50.0
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

Release notes:
https://github.com/libuv/libuv/releases/tag/v1.50.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index a2bb65b9ae..6618450af7 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2e910e668e5daf1be6a5195a696985d7200adfa5c4d3400ee7b3355affdcf52c  libuv-v1.49.2-dist.tar.gz
+sha256  c42c51d4e630f95dcefcafff95bf003ea52939e312d5e6584e7d9e102ead3e9e  libuv-v1.50.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 36a5b89fa7..57c128abf0 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.49.2
+LIBUV_VERSION = 1.50.0
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
