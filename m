Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47ECE9B260
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 13:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BCB540A6E;
	Tue, 24 Feb 2026 13:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul0TB0zmzjvP; Tue, 24 Feb 2026 13:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D1B640AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771939247;
	bh=2SmEsOZRY+F2GINSgr6dCTgLmTxqzDcqm70tx0ScjIg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ekRJ2tX24wgagYcTuY3I1NSbW3Sj/5LJMKYfw5d+oLcf5PKTVItxKUzjyb3cmHerS
	 oRmxOBMkyShV2htpVzPKnrh/xLugOZSPvvmPZJHhJ1FdSeHvX4A9r1Nkw3WJxSf4qC
	 lP7b1VKKeK4XnhH33UVfFVYXkUH3NJzi4FC6y0OPslKMTfyCOW6LQZKzoozy56aDk8
	 DcbtEl6//bPePxPg8Mp41f6kurLqTmBwBh9yyqNm84cKAvLpnHEhH/2pAy90nB5wnV
	 Bswf/H9VspRS+AQHYgRW/PouC9fpFfDNmU0NkscwKU5wUYohOZgFaR5eXIP8ibER41
	 g3mz48SYT0gLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D1B640AF2;
	Tue, 24 Feb 2026 13:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F127D237
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D665660BED
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7sS_21hbQSh for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 13:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 099EB60BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 099EB60BD0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 099EB60BD0
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:20:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48378136adcso33260215e9.1
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 05:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771939241; x=1772544041;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKNs+tLMjfBiO2PWdRdfyc6lv6LzcT1CaD6NblinbMU=;
 b=DER11+ixVA+bp6iw4u9sjsZBz8a2WgFx6+vlJcYXoWvSEXvLUgFwmJy9ZnbSCggKPE
 mPMuO7W/DYlZafOcXiXaJJuQP85SsxzerymrqBtfpWtHVAENPAipnK56AP66rz+9yKBH
 Ab1gMaGY7qPovurH4l9bY9XEJsx/0hh0bjBUfsfE8gVnVr/NS3Mk9C53bAdkYExLQ8eU
 mUEQ1soyHAFc2FjmE2zpNjd5xhp7pR0ogox/jD6ThISqYIDWT2QV/HW9ME16ufABynjb
 itGRwC7Owy9N73eNKOtLaU7DZuR2wrZv17goF0SU2BdX6H61NFwCOIjE6fDdhQaTbNPM
 F1rw==
X-Gm-Message-State: AOJu0YxXCPXDBJJlH6Hw8OophG3OCajS97vvV4O1vmJ2UnGxeW7ttX48
 +inbjTzhMJQlNft0SA4dRb6WI9b5qdDUV7y3T+N8cUXjrKIP0a7QNls18RRYmcZ32h21WqsIMMX
 G7oOL
X-Gm-Gg: AZuq6aKjZ+AVQsYsuI1C+6iLoIBABsVeK1wjatL51KT2soLVEazBnplmiaB1MfiIPym
 vyGgHU5QegKCRim87tz/0oXTn1hWHNCTesg6c00xayY3P3oTqNFVTqKu5+MIIxAxB4GwSse1XpX
 qWaHdrk6LNsq2Fxk3rmoyBS+ihOHBls45n6jyX+91XwbCjgUUsmZ5Uo7LT+xBrojyWoUWvxVzMH
 l7BTuMFQuu4sDxGfNu7i9nWJMYKIxO0g+Ckm6C/IGJFIWQbzCaYVjppdev+t45q5sxQrBlrlfDE
 z4rEDypWRw317cxEOy+job2P1nX8WHEDhUMXmskI86w25N++weatzSppC1/gN7g095KoIZWKs1S
 Ohy8yqFiVwoBp2CsKvdoT7OYv6OCA6/5jbrk46TyY+aEQcTy31xKTLXRIvIhHh/SW6L3817eZdV
 O8wQPQuR9jDQj89CLBKpcUK64UEqfCvaOgv50kbFmrH1BzelJLQdbumfOjQwP3Q1lJS89HvoF3R
 JjP0noFhT0MnYFzi5W5Ss/t7lqwPhAc+Jklhk+W1A5ddXkHxgNj
X-Received: by 2002:a05:600c:3b20:b0:477:561f:6fc8 with SMTP id
 5b1f17b1804b1-483a95eabadmr214342565e9.5.1771939241283; 
 Tue, 24 Feb 2026 05:20:41 -0800 (PST)
Received: from FRSMI25-GRAVITY.idf.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9cb4bb3sm267088025e9.14.2026.02.24.05.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 05:20:40 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Tue, 24 Feb 2026 14:20:33 +0100
Message-ID: <20260224132033.1700023-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1771939241; x=1772544041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YKNs+tLMjfBiO2PWdRdfyc6lv6LzcT1CaD6NblinbMU=;
 b=MrdrR5YNhapNPOO9JYMHdL73k2VUa0eBKohJHZf/7hM1/jMR0t0/DklNU7/vo+nF42
 jpis7at8u5SD5NBR10jv+RrlIAnPxStxDMWYlFrIfwgNFI9WCO7IhmsL5HMMYfqk6ApV
 HQG7TKDBNeZmr3wpMR+/m+NxUz4NEIBkDIeLw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=MrdrR5YN
Subject: [Buildroot] [PATCH 1/1 v2] support/scripts/generate-cyclonedx: add
 source attribute to CVEs
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

Add 'source' attribute to each CVE in vulnerabilities node, including NVD
URL reference to enable proper import into Dependency-Track.

Dependency-Track's VEX importer requires the source attribute to
properly process vulnerability entries. Without it, vulnerabilities are
skipped during import with "does not have an ID and / or source" warnings.

Include the full NVD URL following the CycloneDX 1.6 documentation format:
https://nvd.nist.gov/vuln/detail/{CVE-ID}

Test Environment:
- Buildroot: 2025.02.11 (or master)
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

CVEs are correctly imported in Dependency-Track

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2b6c6d63d3..35198a47cf 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -327,6 +327,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
 
     return [{
         "id": cve,
+        "source": {
+            "name": "NVD",
+            "url": "https://nvd.nist.gov/vuln/detail/" + cve
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
