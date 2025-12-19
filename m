Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF174E66892
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAEED83CE7;
	Fri, 19 Dec 2025 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbEwddzL0Slx; Fri, 19 Dec 2025 21:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4649783CA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178629;
	bh=hIIpqZzL8do5GYxfoPFdb6u/dIiXHd5MCfbMBUjsttE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o8y/FcxLoizU8HMytRoDihhfNLPwWLK8SHvWpRDv8M1f0kkkATnhgS4XpHIjocOai
	 +Cj6TnGkK08x4MngWDqh/zl6NKFIBn5yL7K4NhTyqqM+CSwHVEnCTNBdBXShdc/BVH
	 Hlkl+738oEnkw2q/1GHbypQVwKzufv4QD5syhIaXr2mXTP/Yxx+XpwbUhD3oSQdLcu
	 I5QyoGqHltsAABbFh92x9V681xZV85fN0PKe4JB+3+YNasDl/EUawQSA3DIlBtpzeB
	 Q2SbuUH0mu3Q/ktmdSkOv6tMfO2Moacn6kJbyiIZbDz5Zb4gzyCtQL/BUYJ3MHX3/Y
	 WkirnYwXbnoZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4649783CA3;
	Fri, 19 Dec 2025 21:10:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 729E91A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64EC9401A0
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXX-Iw6u9ldm for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C24A40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C24A40051
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C24A40051
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:10:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:418e:8c09:857b:bc67:c232:7cba])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 593EC780375;
 Fri, 19 Dec 2025 22:10:20 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 19 Dec 2025 22:09:57 +0100
Message-ID: <20251219210957.556930-4-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219210957.556930-1-ju.o@free.fr>
References: <20251219210957.556930-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766178624;
 bh=QXV8l8mOVy0mL9YQPjlYvQbJ8nf/A9tBpfEpjDTZi9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jw6g09obaKpaLzagW6/h68GFed5ujqtuRxuVuK3PjeTxXJUGoQPdiBs3Tz6hhCpnF
 od7yR0jPYxcu5w3B2/z3iPAOXpoP2rQ9tVOepH21X0FMkVNtd6dRGI3HLiB6WDcc2k
 Sfn0UgrT4aYpUQCUYhILktXhGFEjlpgoGvnW5hMbM1dNhvaPpyByC5bamCIKuRZFAD
 L1azW3QqEEzlfJlg9Dh4IWUANO2n4Wt0sjrDxemhixRdHL5MHjvVtKEP9m5V/O8aJ7
 EVcRzfkFhX41mmZ5cjyWf1Tje6QYXT1LBlPKSTO7Ml5l2gkJf71ManglLeksKwFknW
 FGliNjn0PT+2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jw6g09ob
Subject: [Buildroot] [PATCH 4/4] package/ddrescue: bump version to 1.29.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announces, see:
1.29: https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00003.html
1.29.1: https://lists.gnu.org/archive/html/info-gnu/2025-03/msg00011.html

This commit switches _SITE from savannah to use BR2_GNU_MIRROR.
At the time of this commit, the savannah mirror does not include the
1.29.1 archive. This will also use https by default.

This commit also updates the license hash, after the FSF address update.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12503186844
---
 package/ddrescue/ddrescue.hash | 6 +++---
 package/ddrescue/ddrescue.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 4103d4fd6f..716f6e4cfd 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00014.html
-sha256  6626c07a7ca1cc1d03cad0958522c5279b156222d32c342e81117cfefaeb10c1  ddrescue-1.28.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2025-03/msg00011.html
+sha256  ddd7d45df026807835a2ec6ab9c365df2ef19e8de1a50ffe6886cd391e04dd75  ddrescue-1.29.1.tar.lz
 # Locally computed
-sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 13798bb4bb..20070d763a 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.28
+DDRESCUE_VERSION = 1.29.1
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
-DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
+DDRESCUE_SITE = $(BR2_GNU_MIRROR)/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
 DDRESCUE_LICENSE_FILES = COPYING
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
