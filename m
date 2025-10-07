Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B46CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 17:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68DFA6078B;
	Tue,  7 Oct 2025 17:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHA1DzxDgQhE; Tue,  7 Oct 2025 17:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9590F607AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9590F607AD;
	Tue,  7 Oct 2025 17:40:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A86C119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 17:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6149380EF1
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 17:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwBXfO95fmc6 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 17:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=nhed+buildroot@starry.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AE3980E75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AE3980E75
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AE3980E75
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 17:40:43 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4de1b5a6b7fso61742401cf.2
 for <buildroot@buildroot.org>; Tue, 07 Oct 2025 10:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759858842; x=1760463642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unegnB/cNuGNH/ctighwWdW6+mVJnrzit05q/K634bI=;
 b=U587/aFYYHE+pccLQ7Rd6H5qAnjFpXNMEiPKMz3EGGpul2I5E0O9Lau9ivi06eOs4m
 ITYNriUCIgjFvmaf74xREgosty2uiEfKXeMPqcMilkKI9i59PZT6pP2DMg1OlauT1UGz
 g9mL0y6fhKi9hTwDEQdCWaqBFEjNoLQidp7FkPbIC7/4cAlvxYQh76SqmipBiCKUZCZd
 7YaFWy/0WNysY5iqDoSRNh7G0cjFmUm8PmcU+NzqyjFGMSFNhjB9UctNB5pN/A359iwq
 zmAbDqhceQ0ewBd9Run6HtnB065k/eTpiCymfgtvTFv7D+xiOxwn/rZCzsEHWTPRQ+mM
 X3lw==
X-Gm-Message-State: AOJu0YzQFJViAuKY99/VROECZ0ZGOHhm1LmswIc7qmsvAhyWOW2cuvpv
 mZMwC7g7Uxx9rCyF01mB1jZQLvaSYrtH9kxpfwNPzqKqFmnt5oXYaGNeavtnKExNoxJi4JgvbXI
 MG9MK6Cw=
X-Gm-Gg: ASbGnctJSOWo7WA3dZXKTong3LOw+mGPcfCPzqE6Hzv42/d+Ooqjt0+5pHyD8RBuVwy
 kCwS38heixuboxzaHq19xxTXX7rsbFsrtKzEiZwkCWhsqqU2ZjjooB/j3G4+oVJatotpaW3CmUQ
 3zj88jbf2xM3j4W058pzwieKroVgm6occ0k+wZOlf5d/o3AzDgNzWbIIB/8uziO5lZWH8gHAQY2
 aE66NZvb/qOjZMkjafq5UPSieBDliiOJJo4z8ZU5cWLwPhxE0USnm3lPRcTXJyCzxhhUzkEoohC
 K3J1ATAastPQIXnB9I8FCnZegyrk8wnZlY5yNPsuqXNDrJX3CzZeH+zPMh27LFyy+vjazG2s/a4
 iH3M3/G7PomrcSOwVkAfATnjNJGbWkJM+uWokxJc7P2JjUI08HwTX
X-Google-Smtp-Source: AGHT+IFJXge2FF4QxlXAI5UvZjV22Z+1M83QDBd9FeSMCirOpxgSI1NqchlYOK6ZB6QXkArDHrkKbA==
X-Received: by 2002:a05:622a:18a6:b0:4de:d9eb:8af2 with SMTP id
 d75a77b69052e-4e6ead630cemr6513221cf.63.1759858841522; 
 Tue, 07 Oct 2025 10:40:41 -0700 (PDT)
Received: from starry.com ([75.144.170.57]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e55a84a055sm165870341cf.15.2025.10.07.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 10:40:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Nevo Hed <nhed+github@starry.com>,
	Thomas Perale <thomas.perale@mind.be>
Date: Tue,  7 Oct 2025 13:40:35 -0400
Message-ID: <20251007174036.1178955-1-nhed+buildroot@starry.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google; t=1759858842; x=1760463642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unegnB/cNuGNH/ctighwWdW6+mVJnrzit05q/K634bI=;
 b=WHyT8Z7XvKSmJH9aL+Wm61vAlCQC9rEThKoCzbTgIFN0KmxC6vXc2vcIeIEgMaMX9a
 frdefEiurlxHyOm66bpBHLAYic7b6e6q3zEOoE/pgUAKBEuQJy8/rsVAKgO0fo1V8r+B
 QjhMpPZzSIFY9yJHOylypSx7kg9RVomhn5btg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=starry.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=starry.com header.i=@starry.com header.a=rsa-sha256
 header.s=google header.b=WHyT8Z7X
Subject: [Buildroot] [PATCH] utils/generate-cyclonedx: fix monotonically
 increasing dependency list
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nevo Hed <nhed+github@starry.com>

Having mutables as default args has unexpected behaviors.
br2_parse_deps_recursively had a default arg `deps` initialized to the
empty list (`[]`) except that on subsequent calls from `main` deps would
already be populated from prior components.
---
 utils/generate-cyclonedx | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 60983ac1ea..7d3ef57ab3 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -238,7 +238,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
+def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=None):
     """Parse dependencies from the show-info output. This function will
     recursively collect all dependencies, and return a list where each dependency
     is stated at most once.
@@ -258,6 +258,8 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
+    if deps is None:
+        deps = []
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
         if dep not in deps:
             if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
