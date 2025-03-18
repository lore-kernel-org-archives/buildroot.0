Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F20EC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337BF81086;
	Tue, 18 Mar 2025 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCoIzEu4Q3JF; Tue, 18 Mar 2025 21:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492458104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492458104C;
	Tue, 18 Mar 2025 21:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36F6D950
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17C1781028
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6KRnzb2S9fm for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 21:40:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13D468104C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D468104C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13D468104C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 21:40:03 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:59e1:621f:708c:1995])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6EF672003D0;
 Tue, 18 Mar 2025 22:39:57 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>, Changming Huang <jerry.huang@nxp.com>,
 Vincent Jardin <vjardin@free.fr>
Date: Tue, 18 Mar 2025 22:38:39 +0100
Message-ID: <20250318213839.17470-1-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742334000;
 bh=KFdS0b7sP/sg2+gvMz0hB/F+iifzzpYKq5SQm+ew3fU=;
 h=From:To:Cc:Subject:Date:From;
 b=OvnLaOm3CD77OvoUgSgtydi8vpbU2wRBvy6RZzp1raHcI9tAgwAPKUn7Zg5cwHa6W
 qhq5lmGRpyyqN/ALOVJCqPt7d8psXKWpmO0g41kZoqLNAv5NiQmu3olHg2X3C9Ou3b
 QxFC9wBBa8Nk1lIHFEQfFA1gPy+mQHfJqmr7FjOTvLf5zoW26aoB0Wkg8b74eKabYo
 zMAnxg3xAi45odVYAfez3sssod6BwZbU+yBI0cw9sxUA53K4o57FXwG/VTSaGzVKlA
 9zXVw9nKkb2iOTmf+7adR7jnrRsXXmWqjzOYLXHcURQwQ9yXAmc/b7NehKzlsi2jcm
 pNQnOrWxB+Anw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OvnLaOm3
Subject: [Buildroot] [PATCH] package/qoriq-rcw: fix rcw parsing
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

Some boards cannot be properly supported due to a bad C/C++ syntax

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 ...001-e100g1_split.rcw-fix-parse-error.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/qoriq-rcw/0001-e100g1_split.rcw-fix-parse-error.patch

diff --git a/package/qoriq-rcw/0001-e100g1_split.rcw-fix-parse-error.patch b/package/qoriq-rcw/0001-e100g1_split.rcw-fix-parse-error.patch
new file mode 100644
index 0000000000..a8bb0933f3
--- /dev/null
+++ b/package/qoriq-rcw/0001-e100g1_split.rcw-fix-parse-error.patch
@@ -0,0 +1,38 @@
+From 87d1691c63a1172397968286a12e94991bf05d86 Mon Sep 17 00:00:00 2001
+From: Vincent Jardin <vjardin@free.fr>
+Date: Tue, 18 Mar 2025 22:18:14 +0100
+Subject: [PATCH] e100g1_split.rcw: fix parse error
+
+Embedded /* */ comments into comments is not a proper syntax.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+
+Origin: https://github.com/nxp-qoriq/rcw/issues/4
+---
+ lx2160asi/e100g1_split.rcw | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lx2160asi/e100g1_split.rcw b/lx2160asi/e100g1_split.rcw
+index e1853f8..e63f393 100644
+--- a/lx2160asi/e100g1_split.rcw
++++ b/lx2160asi/e100g1_split.rcw
+@@ -6,11 +6,11 @@
+  *
+  * board_info {
+  *	serdes {
+- *		/* Do not rely on the RCW protocol number, but rather read
+- *		 * the protocol status registers (PSSR) for each SerDes
+- *		 * block. That information will be used to enable/disable
+- *		 * the appropriate MACs.
+- *		 */
++ *		 // Do not rely on the RCW protocol number, but rather read
++ *		 // the protocol status registers (PSSR) for each SerDes
++ *		 // block. That information will be used to enable/disable
++ *		 // the appropriate MACs.
++ *		 //
+  *		follow_hw_pssr;
+  *	};
+  * };
+-- 
+2.48.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
