Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9823ACCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B21403DE;
	Thu, 16 Oct 2025 18:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3U_cuJ9dkxI; Thu, 16 Oct 2025 18:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E931403EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E931403EB;
	Thu, 16 Oct 2025 18:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C42A2EC
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A1C80CD5
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sM2E6fuWRI5f for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9C8980304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C8980304
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9C8980304
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:23:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1AC2A4C5136;
 Thu, 16 Oct 2025 20:23:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49278)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9SdB-000000000nF-1YjK;
 Thu, 16 Oct 2025 18:23:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 20:23:17 +0200
Message-ID: <20251016182317.3396030-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760638997;
 bh=/MTWnaPGllxqUTLQhC9uHLchhU/aQAKJJGrHtVoOPyI=;
 h=From:To:Cc:Subject:Date:From;
 b=HYfXpFVvUwumwAHIOiyjpIzZUcvqh5aIpywV/tq4eGSDw/yNGrJ3WZS1k5r9xzaOU
 /i3fux/A3pS1Q/bt3OTlnGL6uyQS8S8T49+DyvIfpHP6dan1yiVDUFbUw/ct709KcS
 C6q0p2VW0I2wGhTXv+Gkw4M5NXq/kUxEF1utEQdwQ5mYvgr5RFYAXGLUSHkEoWE/1q
 xHQnha3QeZrXzu9XaN3pkr7crwTHOIrODCLhyI+2IRd5R5pQ4kVXYFvGGANvscOP2s
 Z0XjwLyLJmr1fBeSiMjv4U34Ik6NQXhzY7nMBQ9yMK+if5M34kzFtm2qQKFx8MOx2D
 jCJPpf+AkYVLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=HYfXpFVv
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/python-webpy: add
 upstream commit to fix CVE-2025-3818
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Address-CVE-2025-3818.patch          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/python-webpy/0001-Address-CVE-2025-3818.patch

diff --git a/package/python-webpy/0001-Address-CVE-2025-3818.patch b/package/python-webpy/0001-Address-CVE-2025-3818.patch
new file mode 100644
index 0000000000..d8373cbac6
--- /dev/null
+++ b/package/python-webpy/0001-Address-CVE-2025-3818.patch
@@ -0,0 +1,42 @@
+From 3ba1b40e5a828a26a1df1b49cdc87395f3274c81 Mon Sep 17 00:00:00 2001
+From: Mek <michael.karpeles@gmail.com>
+Date: Wed, 7 May 2025 15:14:44 -0400
+Subject: [PATCH] Address CVE-2025-3818 (#807)
+
+* Address CVE-2025-3818
+
+Co-authored-by: Scott Barnes <scottreidbarnes@gmail.com>
+
+Upstream: https://github.com/webpy/webpy/commit/3ba1b40e5a828a26a1df1b49cdc87395f3274c81
+
+Fixes CVE-2025-3818: https://github.com/advisories/GHSA-9g47-36rw-gjh2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ web/db.py | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/web/db.py b/web/db.py
+index 5284f8d0..ba3e12c5 100644
+--- a/web/db.py
++++ b/web/db.py
+@@ -1198,10 +1198,18 @@ def _process_insert_query(self, query, tablename, seqname):
+                 seqname = None
+ 
+         if seqname:
+-            query += "; SELECT currval('%s')" % seqname
++            query += self.get_sequence_query(seqname)
+ 
+         return query
+ 
++    def get_sequence_query(self, seqname):
++        import re
++        # Ensure the sequence name is valid
++        if not re.match(r'^[a-zA-Z_][a-zA-Z0-9_$]*$', seqname):
++            raise ValueError(f"Invalid sequence name: {seqname}")
++        return SQLQuery("; SELECT currval(%s)", seqname)
++
++
+     def _get_all_sequences(self):
+         """Query postgres to find names of all sequences used in this database."""
+         if self._sequences is None:
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
