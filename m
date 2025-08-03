Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F51EC87FCB
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 18:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D62160F58;
	Sun,  3 Aug 2025 18:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pa5xuQicUAp5; Sun,  3 Aug 2025 18:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD1F60A8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD1F60A8E;
	Sun,  3 Aug 2025 18:00:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC564118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 18:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B609380B94
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 18:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jsmc2uTqhv0n for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 18:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0A0180AEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A0180AEB
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A0180AEB
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 18:00:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b792b0b829so2551909f8f.3
 for <buildroot@buildroot.org>; Sun, 03 Aug 2025 11:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754244008; x=1754848808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ecE4aG+Gl3K5CfhxCp12I0u454yL39eGJ2Ak6JK9/6Q=;
 b=lAjGJOsDXlcIGb3lfK4Crxtf289oidKrvF3na0HM7nBlP1Bk5pqQal7qoJI89WjydC
 +aQUmupQb94DQZ2cpQu690QsteVPIVPfd1BSVy4uwNuL8iqHr4XJ90n7MRJ1FfzVYjDE
 XfZ1dxgGWhXma1mWDfS/x8XI7eD3TgvNi40otA/pYbUCShsvrHOnJWAwOA149jtvQf8o
 doTtjzP9Vf71/vZs7XXnQP3/rjW0h6BiFkz4nXzDI8ke7Wwgk5RajMCwRA/4eQopaYvq
 kuAu57gNFRHWCI/dRXVf4YVqlHg6/Em/IPTPYND1hWvFT430xh6nTw8b2ylAcX9C3dAE
 LvLQ==
X-Gm-Message-State: AOJu0YwosC9HTC95OEzImm3QLb1+EZrPnarR7mm9Q5rp3MJGHTJm4DQ8
 ZDbtEUXvkKTr7lVXMkW6jWseriGiWv2Vmmu4KzUz+kcxUP4+f902MFhIQjeDGg==
X-Gm-Gg: ASbGncuOUkb3jtUG6mlQ+hSgpcSB7psHfg9EY9V24ukVFIBWpaO22g1DCgM3MLAnfr9
 lTgJ+fQIy+fm6/9kLt4KnZ1BObqAgDjlBBcyv6KMYKH/sOMNUzWVPU01OsD3xd4sRtRxqIZlEXE
 CfSHdeRE0cP5b+hj8xN9kfLvHTB5Xte+rMMX/qhvL2dtPIODF5wUSllKoCmagAyuASPwSKLKEMt
 3+kZvPv0t7+cZ7NE4oVgKDr5tBSQ9Dbte6pwEYSsA1D5edUCvnaPgEecuUsQnKCAaYVPy8sgiCb
 9No+OoJfHKnVGLgEAG6sWLr8Ru/958nfFdjgpTbc0LpgCXSxnlJa93poz0buykh2uetFi+R7/dW
 mb2Hi/WjflMKtYKNtJZ8eiSkXMSVKYT8/CbhBKtDl05SuXdVOI25rjO+6BA==
X-Google-Smtp-Source: AGHT+IFYxrChZS5ThYWfFwcb6s2GX+wjHfGQqBlIEHU45208n4q/R86ju+6ezymei531X9pWG4i1VQ==
X-Received: by 2002:a05:6000:26cb:b0:3b7:8c98:2f4c with SMTP id
 ffacd0b85a97d-3b8d94bac01mr4454624f8f.33.1754244008255; 
 Sun, 03 Aug 2025 11:00:08 -0700 (PDT)
Received: from localhost.localdomain ([91.243.185.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm12899846f8f.27.2025.08.03.11.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 11:00:07 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  3 Aug 2025 20:00:04 +0200
Message-Id: <20250803180004.337531-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754244008; x=1754848808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ecE4aG+Gl3K5CfhxCp12I0u454yL39eGJ2Ak6JK9/6Q=;
 b=BzTLbVThWG5HOOr4y84mwj4XUu7BSSdsk3ofVuwvrnNPIbT6hhzZ1j/AjglanlVNa3
 /3kHJHY0lO6Kk9fOKRl3H1rmOtxVF05X93Do67Z5tS6dtxrfpW3ltV1pDksvhgV8iDzG
 T3RwcclD5lKPIF5yD1SPGfL5f4VWcwkl7iGBec758LOTzDw6ABggyYgX2A2MdSd2QKJx
 bo14rA8awQKQjsVN+XwVxOhWlxfmm9IcKLpd+vJus/IUmVOIzeQgCShs+SD7Urddqo6T
 0zOpMnoIUPpz00XsGwRU01TIOx8bk5PW+hwNd3auX9HXqcTQngJSXVTWh+oa3OCZD8yR
 Qn3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BzTLbVTh
Subject: [Buildroot] [PATCH] ckage/htpdate: bump to version 2.0.0
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

Changelog:
https://github.com/twekkel/htpdate/releases/tag/v2.0.0

LICENSE file hash changed because of the copyright year update.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/htpdate/htpdate.hash | 4 ++--
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index b711773af5..efccaf0097 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2  htpdate-1.3.7.tar.gz
-sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
+sha256  52f25811f00dfe714e0bcf122358ee0ad74e25db3ad230d5a4196e7a62633f27  htpdate-2.0.0.tar.gz
+sha256  74096c67e102bb6545b84487b5e7f18edd038fd5fc0199c8a0b25efb3c522f06  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 20be904d3d..7040500a3c 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.7
+HTPDATE_VERSION = 2.0.0
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
