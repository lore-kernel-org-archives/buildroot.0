Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B56CEB2FA
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 18:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56E2E84055;
	Sat, 15 Nov 2025 18:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnxD20OPvRvt; Sat, 15 Nov 2025 18:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C37884059
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C37884059;
	Sat, 15 Nov 2025 18:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFB16D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABBA840546
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bReJ0oX3POBM for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 18:21:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB3614054E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB3614054E
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB3614054E
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6406f3dcc66so5266374a12.3
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763230883; x=1763835683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZuoN08ci7YrxaA0virnyIy3ozdgGLeUZxxR7fvFFur0=;
 b=Xkq7Mxd2jbzH64z0zg1Jedel2qbPLL3hNOuMXIk1VQevT8HKZBOnjyOTca4ZNOZ2zH
 zOB9QTqEnGa567oKzeAik2VQOx7UUfH0KvEO0nW8O+vYbMgVSSleC/7D/qfm0u2muDnu
 k2SUEcizNSk/NsCN8/XmhMt+nfje7DDjNi+5dz6gzB7nOpGKSzQKz7gWI+Lp6Z31MdFj
 MHXNqJTWb5dq82jGi0d/xb/PhlE+rcHL3/K/dR0cWUyQIIMbM8fzWZLTGzyA6p4oyQRW
 X5d5ir2vYsRYkovjyYFxXsIX8qy3eOQoWgsICdfvTyHXLa+ssFAjvfOrJJr4GKYXeWJJ
 8ivQ==
X-Gm-Message-State: AOJu0YzVgnwfspQS8umS+P+UsWjs8kCuziulX3lzEBESFxA+gL61JiLg
 UT8zqbZxd/MwT1n+Q7gY7KxtOoPZZ/k8ExMV34eb+Fa9ogSXdrMsSnDFKByFOVjbOBK1Y0OtwA4
 PmArR
X-Gm-Gg: ASbGncvNiJ87FXRlYQNn0O3wqYlzUhNG2ASOkXfNuhRRLa7I/Zu2t92FfiOUwOVkTJ5
 vwFD8y5GClQEynkNtfMuIpfHF7zZhRjNmMuG7XurFJvC+3ZRRujpdytchL4MzZ3im9YWxlLMwTR
 RNRNhic2TGSu738Ii3lx3OHDY0+cdzDMK2Et83WlDANASXBrsa99cjE70BxY4tbGkZyhXeUmb5R
 2dCPVL5acRb7hnb4uM2PiIG7Yyzb3l3QeaztSwx4pJNbwmXxwCfiG6Jqlt4DrUuS4Db6g4SLyFI
 LJtuZJ+oZRNT+p8NSgqHafb6h38ik8XaY1nu7fTIvoFqm+wujf4N7WvEUkt2ruRwdZWBejDTPK2
 cG4Tfs6zOPOyUKy6fuQOmBixvVgw2uug8wCfeds8jHQHI/uD7wZiKX9RT5y3yWZ0RGBdCIyuFlt
 WNxgC0Ql0X5iLGdLg8eiW0n+gBBEFSKC3SSfObIA38mSqULScWCFJ6g/52R0fzAtHWK2UF/JpGC
 qFFTbp79qEoR/bz7p7RARm6pIHgdbaHpJDFkH54AJGrRAkEoLBJlY8=
X-Google-Smtp-Source: AGHT+IFikHoHjZlEftty2Id1t5GXIkvwPzgkdJ8A/fYTg/LS4vkc2IiQkMw/IidO+JZadfrc5aE1ew==
X-Received: by 2002:a05:6402:1445:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-64350e06df6mr7266010a12.15.1763230883556; 
 Sat, 15 Nov 2025 10:21:23 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4c5834sm6088324a12.33.2025.11.15.10.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 10:21:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 19:21:10 +0100
Message-ID: <20251115182110.464345-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
References: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763230883; x=1763835683;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuoN08ci7YrxaA0virnyIy3ozdgGLeUZxxR7fvFFur0=;
 b=jhz3CjJWmFmDORqmX1IHPBv89X0MZ/ZrkgRZ8yxJBIsM9s0283oKVo2y92cwLrYT1W
 71vkzfLGddGLw3aWMIM9i5p7Pa8JKRPdRVqMbKVpfsRydwU8ofiIEVK4fQUwVC3nW0Dh
 LYO0b2N9VKs1GUcJcTeXKFhekuayWtT4jJV04=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jhz3CjJW
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump to version 2.4.5
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

This release depends on libyang (v3.13.6), libnetconf2 (v3.7.10) and
sysrepo (v3.7.11).

See https://github.com/CESNET/netopeer2/releases for the changes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 3a70b155396f..e87aebf0bf60 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  86d77efcb65f0bb2c3bc0f2128a320113ce7125f39882fe7d8334c168ed9567d  netopeer2-2.4.1.tar.gz
+sha256  63d42493752062e7dfb3d3aca9c4157f49298401bdc5cd5166975f2cbc5f6f1b  netopeer2-2.4.5.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 71f2c506409e..543dfdfa334b 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.4.1
+NETOPEER2_VERSION = 2.4.5
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
