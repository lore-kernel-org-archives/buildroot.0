Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625DDCCFA13
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3073D80D85;
	Sat,  8 Nov 2025 10:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChJ29a5_roMV; Sat,  8 Nov 2025 10:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D25C980D88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D25C980D88;
	Sat,  8 Nov 2025 10:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F8E2B8
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F98480D85
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTsMf-3OsZ9p for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35C0080D82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C0080D82
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C0080D82
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:55:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b729a941e35so181833766b.3
 for <buildroot@buildroot.org>; Sat, 08 Nov 2025 02:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762599315; x=1763204115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0bS/rOIwd/4fG2IhR3a3JLc2BxvK9IVs5+pyEDamts=;
 b=skvkPw9ZQLlEXC6CIRh1fWN+Zl/inmbIV+S7e3xPohiY/jRTHi1yfeoGcla/PjEMI6
 V4HudVuMj0bZFX/IPjn+TPgWRwu0NbLXjawty4YY3KK12O2N+/l+vaod+44boAxNzEY9
 mMwZD5s9Djdt4Q7ZlKRQLLA/7aD/5FNAu/7Hz/izfIa8o5coOY86J4I1nX4mdpMzUIC3
 tzu/PJ9DN/CQ9LAFPzqnJYrrxmnfU9q4xg4aKHSBuE/pcWtQtjF55Q/UhLRy5byYNch1
 hK+wujF2Ap65w3vC9e5SDXYxPp3KApUPaMjuC1hwcGad1fY+60Tr16UIgdidJU1cFYQG
 1xUw==
X-Gm-Message-State: AOJu0YziKWr2w7vl1ORXEfk5RYGQUfB/zKo6xYJVtVfYM9ljy4fDXFqZ
 mmxJ4QYcoRDti/OphgG89j0KGHaCFKZy+VhPoxu7d0VsPN31VVYBkoDkbxE9OkWUaNQ/BRNwVQG
 kfRUFRpI=
X-Gm-Gg: ASbGncthA6uI5Z0hM34mc1mIomhugAQeTog9Xg5BLna761wBFRg4WXCBZnXatWFZo6r
 40oTU8Mo1MB7nArEr14zeINHKCs9YqliWJEplnxfpwC6ipl6DYqJlhkQVv9Dvs+2KpNFUWpRWHZ
 Ls21g4lOmnRYAjeudOuUmgVjecXlzDCLRuSZieU7An2ccKv1+DdwP+EdJki9PkKVV9cYqbP3oy7
 tg807hNlFzpVn8HCTwB2J2kbQ96CZajIee2I//FcsdCdMa8SSMhWU3rygGAnTMlCo7iTOTMQsun
 hhUyN9OV97O8KLaV3ctXd7Qye61YETu8/woQB/xXG3dcUsHVqLGNJamrr1od6HqicVLPRnfhloS
 fb68kRkP5YP9SbHfJFmuw6qBdB6rgXefRz/KTBF/SfN7TpfwObrd0PSOJ7H59MwuRwEGbG6mLoA
 G5eTmd7pT6xA6qnGeR6iFTKtZ+mowpLhaLkcidvT4pdee0m43/ia13aV/LqUubWeMN8+4md9sly
 wHUWBjHHAv6HtIDgU29oCz8mf6CVIJdL8Df3p9h1g==
X-Google-Smtp-Source: AGHT+IFjujFlN8q4+YL6YXzmz9kUjxaUpie74L8V1DLODBtDr3XYHBOTbfHJ4v5pOUYdiYh7qs/2pQ==
X-Received: by 2002:a17:906:7309:b0:b72:5f93:2959 with SMTP id
 a640c23a62f3a-b72e02d9744mr178334866b.17.1762599314811; 
 Sat, 08 Nov 2025 02:55:14 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-99-245.retail.telecomitalia.it. [87.9.99.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d3c0sm520828266b.36.2025.11.08.02.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 02:55:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  8 Nov 2025 11:55:10 +0100
Message-ID: <20251108105510.2390949-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762599315; x=1763204115;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p0bS/rOIwd/4fG2IhR3a3JLc2BxvK9IVs5+pyEDamts=;
 b=NU2caBFAFnMjvQRyXuBOtLQfT4lR1/nqzH+qcRA5tzB87H+rS19muPNkR3xEJuQuoO
 rLLDLgvGiEcMDWuBUJAonND9N6IRRsvnhH6D/ertJOcAzne/8ROl5r6Gbto7BsZJIm3R
 jXkGo8KGkXIn4Va0abnB9v3mppb1NxZqbbo38=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=NU2caBFA
Subject: [Buildroot] [PATCH 1/1] package/conntrack-tools: bump to version
 1.4.8
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

Upstream now ships the source archive as .tar.xz instead of .tar.bz2.

Release notes:
https://netfilter.org/pub/conntrack-tools/changes-conntrack-tools-1.4.8.txt

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/conntrack-tools/conntrack-tools.hash | 2 +-
 package/conntrack-tools/conntrack-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/conntrack-tools/conntrack-tools.hash b/package/conntrack-tools/conntrack-tools.hash
index 371ede34325c..122208b80928 100644
--- a/package/conntrack-tools/conntrack-tools.hash
+++ b/package/conntrack-tools/conntrack-tools.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/conntrack-tools/downloads.html
-sha256  099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d  conntrack-tools-1.4.7.tar.bz2
+sha256  067677f4c5f6564819e78ed3a9d4a8980935ea9273f3abb22a420ea30ab5ded6  conntrack-tools-1.4.8.tar.xz
 # Locally calculated
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index ec633f0d54df..426bc2091446 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CONNTRACK_TOOLS_VERSION = 1.4.7
-CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
+CONNTRACK_TOOLS_VERSION = 1.4.8
+CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.xz
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cthelper libnetfilter_cttimeout \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
