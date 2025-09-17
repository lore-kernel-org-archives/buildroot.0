Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE1CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 22:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C741041897;
	Wed, 17 Sep 2025 22:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mq-kwDgsrB0F; Wed, 17 Sep 2025 22:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A06417CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A06417CA;
	Wed, 17 Sep 2025 22:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE37199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 22:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425B66149A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 22:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMVbO332uGBp for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 22:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D59446147E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D59446147E
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D59446147E
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 22:54:33 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-88f1b8e448bso15681739f.2
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758149672; x=1758754472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CmdT/3iezYwW4z3FrkoWlQRvqaxHVolJRsUmTp6MOE8=;
 b=ld8itRe0EsXVHYy7w68EDWEq1r1B6x8u14HBGEBVLQeFbTu3IHdOvPxJl6OnHoXXNH
 ouJZKf+fHxoS2FfT8YvVmUCeoxOpmZjQbNCp+i2BJ8dmRbQur/bEgtoJzvDNY5UmZypO
 EWvTqHHsab667ZzMldmZn456YSmo7g8CMaoFm3kztMU8e5Ec4kb7+Q3XZtUW9t1u29Sc
 GgIaR2bC3YYc2tIgk6vwJ3B8SgKQxffn6vPZAHzOVdQdJo6OfrECqQg0fkXAYTb/1ptE
 hnxV9Ynb0xqg5isdZNXZPNu/3B6cFipgzP3HYrZ4RBYmgCDYU58OzAWDZz00vTM5/Tyr
 tBFw==
X-Gm-Message-State: AOJu0YxJHlqhv2SWy4G1weOsE4OH/zOBFWzzo+5cjoiuzMlnHBewUDcY
 3FSFkKolVvI72dy3iBYCRWZ2lTeL7BTDlJrhl9rT7kM5e/G6MbgfcYMVqMprJWO7
X-Gm-Gg: ASbGncvqQdL/HXA1IyAFREYR0RrdDxdjFZPiuoHlrHagZ2G0kcWaOL1uYn02ujEWUYv
 2vh6HIRu1xdfIYXDWFENCI+o3cvkzFdUhVj1D3dSPnjSOArCB3yiWsJ1muFxGc7vN7P8aEfg6YH
 Wfg/TH9ICSk1+O5NRRv/9uKIvw/faHzIvSEKVjnK/4FBL12Ckn4p5c05UM9NtLF/w/K3hKGgvI9
 vePVTzLCGRG52kep2bhtyjADO6q1V98MmJYKBzL8snxn+VKZU/kh9sTr8LrBBfWBiKFFY4ApdoP
 lFN4QAkZGUaA41m/lBwm1xBrNLde8xJ9NeS33nKkzP6cHd5oHFhShbgLpq4Jb+pvBfqYcgondLo
 u7wTX71VjmYBSi4yqd88BcWlR6ZHBeLukaxZkNYFaIzQxIcZNR6q/ILxMb0+H+J3K+43jwf3Jev
 hQquYTL0cAdi4pOSlV6gH96h+EBA==
X-Google-Smtp-Source: AGHT+IFloG2Im1DQibRXDOb9MXJGCUUb/EgMCD3+cV09P1M+UPiRRuDISDSWakn6hJREjm7xCYrv7w==
X-Received: by 2002:a05:6e02:1fc2:b0:415:de5:2e1 with SMTP id
 e9e14a558f8ab-4241a528474mr50983035ab.18.1758149672500; 
 Wed, 17 Sep 2025 15:54:32 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-53d56b5a299sm253322173.69.2025.09.17.15.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 15:54:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Sep 2025 16:54:30 -0600
Message-ID: <20250917225430.2843930-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758149672; x=1758754472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CmdT/3iezYwW4z3FrkoWlQRvqaxHVolJRsUmTp6MOE8=;
 b=Q8DfQssUM2AXMUFv/a07pTLpTBdel3UORmLRrzxWuBgRJFJIWC9DgowLig+sqWm59t
 P1RVZV6NgpBSiUb81Ow2TTVeBGnyipjc3RCfQ6NV12l1pbiQtCEs7bDXvwbGMgFJ9LHw
 j2t0NQZNvmiJlUfQKD2hEzrwfrBldhc2XG8KD9VHYZQ02/nGv9Tx54LnNV6baq3reawi
 fQLn+vJftKd2E7xWYNWJaUtzzU3BiAf1tLUGkomSpauYyPXspztJG7StyiMvxh/2FEZz
 MYcuZHpRHihXSLI+TLMYzhZ7ER05CBk5rzw1g4V709HPdppBF6M0cFe+0+HbMlpKQbjU
 1lqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8DfQssU
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 14.0.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 35fe608e20..cd2a82508d 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2024-October/043858.html
-sha256  a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3  weston-14.0.1.tar.xz
-sha512  2d782f98f28b39b990acecfc885f62ab34c9cdd22ef06b09c5d8df792112c47b365f89c2bf05d871e36ddfb4c49aa7e6d05ff60fe67a2657727162e4f564a412  weston-14.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2025-April/044158.html
+sha256  b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac  weston-14.0.2.tar.xz
+sha512  e8214ec893e6c3ae94eb3c92feba104b0201843e9143f726a3e9a4d396d02523c94da706c1348cf934bc339fb1a4bc1fecdb865f0ea914115fd346d9eda091f5  weston-14.0.2.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 1d55a1fcba..57869b7e63 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 14.0.1
+WESTON_VERSION = 14.0.2
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
