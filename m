Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BD3EC110C
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 16:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8C4183026;
	Mon, 23 Feb 2026 16:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4_sjhbpPu9Y; Mon, 23 Feb 2026 16:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AC083459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771865732;
	bh=PZACkv86hN79uyGsbvWLRhVQmkEaIiYdLqnG+BYEkYQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dydWaZ21gUPNyuJCZH4J/rh4FMU4p7VwTEKm+huoWAk/DJn/TAhdRKB1n6NEbxRFh
	 z0ENwcYZjIHlq5lwFkyUgRcMbrUL48Hn5BJBLgJcCQo4rPCRcVzoca+JVplN9SrVj/
	 5MYEoXshp1lmqsXT15tFgfZBGK32GHPDwg8K73XncSCc2vc5X+uVtfxXXD/AOD/k9O
	 0g9x8prnRf/KRIOAi3qnGc30d1P0mhxWyIT8I6/z60u8CYR6/ZUkfsO9JCuuhVjQB5
	 /3Scg0DHFqzNeXpbbnibu7YB2a3YzCodJ5PXsob857bpTt55SulGHBUW3myMPwKmIk
	 PDBjVYh+O/LXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AC083459;
	Mon, 23 Feb 2026 16:55:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1C1E1CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 16:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A747083459
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 16:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwQ7QETxStGK for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 16:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 762A783026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762A783026
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 762A783026
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 16:55:29 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso52020095e9.0
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 08:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771865726; x=1772470526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5evqOG3fMqkKfTlW0gB89eLdvGjRuL5GcCUvpQAKDT8=;
 b=YyEBr2keFld/KGfZg/wz9ZWubY4Qggo/KBGMlc2inmpC9ACWcRgFU13uLMmq+lCHB/
 EI8Wk+LgUn1uVp0oHC6qAIYqsc51/xzrOp502WHeCmydKDEgTYqprFK1QpDmVrAdN18b
 g9+vGCKU1/9m+7amvubFitelZufbo0U6Qs7PJS7lSDIXaczC9WPtQWDz6yDj3YqXzGMT
 xDMpn6pbvkWKwD1+ZTKN84jRPWgAaVJdwhIUm8VckJf7Tadk5KLrxDiaiVgZrCWPk0oZ
 Ruf8QbscLrbvKZ3b3LE1LA6FCMtkoc0uL/X4V42ffFRbkZH0hS09atRtYUKBQZesx0m9
 j43g==
X-Gm-Message-State: AOJu0YwU37zpED6Qh6mgtZB9pboIRHviiN2YeCkIXXx8V9q0lyB9wGyJ
 nFURm5aVYP71FrfhCVx4vKOHRQJBRC7ZUZ0SygwprRkWqQIRlAkCd5ln5pBwKz4WoNHnW/B1wvG
 BvIYT
X-Gm-Gg: AZuq6aLIt5/18ou5a+x076/k/jqfLPR06kp5ylPBiD+rUO7XemWfjextWn8rIlhLwng
 RQ37gCWNIxxJB1vUgRcBcyq1BpvcX8RD2L2oa57HULrr7fx+kAkG9Sw/xBNH9Z3ORjB5YvI3bd+
 g38jB1WYR7wWZDgE86N3HjaG08l2On1QDi1E+gRORPIxfjJKIoYGhvFYr18H6ZEkbiqDKAK7Non
 xhwJ529cbab1GzJ3ImvhZAFwD2DbHznf1ucunkTzaKIJS9a4jaGOTnM7rwxNnAQ1pFdDh9546St
 j3uQ1MgDyXv7J+rjuemDtpgf82DJTOaHrcPf8ArkCukH5lbDkq6B/uJgYtNQV1sLSqhNSDGwC+4
 xPeXk5idQrzGKtQNXGc9ioiSkTbuyK6lHdjh46s96F90OfQuO4rAJ3msGJcuxnAVwr+vAUkvNCU
 W+SvbP4oBoWJcUbtdIMdVFA5lHGv8O4z01HX+UniZ3pna8QmyXA/THXwtt7iYrDPDN/sdFRTy1I
 VixA+LDBqG4dpihp92l5c2E1L3Qq2s0pq1Jr/ORPQ==
X-Received: by 2002:a05:600c:3b10:b0:483:43da:6c87 with SMTP id
 5b1f17b1804b1-483a963d603mr134572435e9.33.1771865726528; 
 Mon, 23 Feb 2026 08:55:26 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c048bsm289296615e9.7.2026.02.23.08.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 08:55:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Mon, 23 Feb 2026 17:55:23 +0100
Message-ID: <20260223165523.1392281-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771865726; x=1772470526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5evqOG3fMqkKfTlW0gB89eLdvGjRuL5GcCUvpQAKDT8=;
 b=mg0aC8mSjWr1AJRuE5a69UMsD/qzUNqCcTP39eJTmkJAnrK7kCiA22ym8QJPd9rew0
 8cc01c8Ldk/tL9k8koJ84wCS6g5dzpxfORgRoG7YHGmPan1Ue1+eksyCGpszwouKIL1l
 gKNhUrVutnGcA3mM5IOIJVv/iWmuYrEPmebeM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mg0aC8mS
Subject: [Buildroot] [PATCH 1/1] support/scripts/generate-cyclonedx: add
 source attribute to each CVE
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CycloneDX 1.6 specification requires that each CVE include a 'source'
attribute to identify the origin of the vulnerability information.
Without this mandatory source attribute, SBOM files cannot
be properly imported as VEX into vulnerability management tools like
Dependency-Track.

Test Environment:
- Buildroot: 2025.02.1 (or master)
- Dependency-Track: v4.13.6

Test Results - BEFORE (without source attribute):
apiserver_1  | 2026-02-23 16:05:40,890 INFO [VexUploadProcessingTask] Processing CycloneDX VEX uploaded to project: e43fe185-c0a3-4e3a-a908-667344a66a9c
apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #0 does not have an ID and / or source; Skipping it
apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #1 does not have an ID and / or source; Skipping it
...
apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #19 does not have an ID and / or source; Skipping it
apiserver_1  | 2026-02-23 16:05:40,941 INFO [CycloneDXVexImporter] The uploaded VEX does not contain any applicable vulnerabilities; Skipping VEX import

Test Results - AFTER (with source):
apiserver_1  | 2026-02-23 16:17:13,492 INFO [VexUploadProcessingTask] Processing CycloneDX VEX uploaded to project: e43fe185-c0a3-4e3a-a908-667344a66a9c
apiserver_1  | 2026-02-23 16:17:14,054 INFO [VexUploadProcessingTask] Completed processing of CycloneDX VEX for project: e43fe185-c0a3-4e3a-a908-667344a66a9c

CVEs are correctly filtered and imported in Dependency-Track

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..6007a6a402 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -327,6 +327,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
 
     return [{
         "id": cve,
+        "source": {
+            "name": "NVD",
+            "url": "https://nvd.nist.gov/"
+        },
         "analysis": {
             "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
             "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
