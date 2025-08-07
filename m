Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA85EC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 06:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A846F5AD;
	Thu,  7 Aug 2025 06:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoqX1Z7OdAF4; Thu,  7 Aug 2025 06:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B164E6F4EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B164E6F4EC;
	Thu,  7 Aug 2025 06:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2D6BD79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A03A584C57
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94MG0Vlcl0Sz for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 06:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3944843FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3944843FC
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3944843FC
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 06:23:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so435350f8f.0
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 23:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754547816; x=1755152616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+aV7qrI0TbcIr2/PmKcWOlm9pzyc78WmH7oGVy/JkdY=;
 b=vEdYTD0UM3z2CQO6vBUufh9EVcFsWEU/4gMlc+stqvCj8IeTWYzNEoWNJ4LLvNKOHz
 pdjJyAwEPx271lVdVlT2YnUVSMP86Y7D7MuHSIgiPC40TM2pEHNKUtO1cfu0EJ9c788T
 jkP8QDOX92qTw7BuznZZ2fkvyo+Y/XakvOkDIM7Kvq61++THAstUFPXJhcjQmMXKnv5q
 goFkxYvClNNxtAxifb5N01Yuzz/wV5Igh9fHQIzb3pDtW0qx9QJ7FUdOaPwPwEAvBj5V
 OmzsMqJX1H7UCDns6pgC1cjDWpFr8FX+uohm2XCkz3gUAAoL6JQhqo454qRWiRigW6Mh
 nkXw==
X-Gm-Message-State: AOJu0YyOgr6Q5N1Iv1BBDPa+Mhw3rw/0ThEnJJk1Y2XC36BV8Dz2uaW3
 EOw/40zR17pMwUNDLT7Uue6pW3CM/zSKCZfkjnXhPi4UEKDIUn/veY1byDGHxvqC6yVvas4Nxcf
 AB8amXNzC9Q==
X-Gm-Gg: ASbGncvMptaW5NlyuV5snSuU35/owX/qzX1kAK4FmhOpD8ocXTLOpQx6YNJb5om3kHp
 yizbQIJR2Y7LUinMGVaGdgK4H7srutJD4BcmupldTtPfM6nfRRHQfKUSB0CsbyD6WwrjWV5pZqL
 0EKvcAmWwG65s+12bae8RtqnflNKMA+Mi0UjTkJTOBG+iNaW0xqJhyZwwgkljsx9X8Ok3ACErTC
 bdPRuDoouHzUdRXde9ATo0JnQRrp9oZdDlkA5/BhFsHEqtoY9v7b8YuGobPuw0AGHAMYzD1U6n/
 MM6BnyZRKl/GcwVTF3yFkXcVLboZN40X0ZdgFc4xj2qsybNRwZdQYSTTth1hP2rT0lj65Idb0U7
 JFw0SOK+NnOq+4HksCROcAWsOQxjSOUh07iA=
X-Google-Smtp-Source: AGHT+IGO8JTzxJvRYXBqnrjl3Iw75P+c1cVhiPAsCHHE++Z+yWUBAskOng1UmYjYRL5f7UvHjEjkEQ==
X-Received: by 2002:a5d:5f56:0:b0:3b7:735f:25c9 with SMTP id
 ffacd0b85a97d-3b8f4166ee7mr4215530f8f.21.1754547816361; 
 Wed, 06 Aug 2025 23:23:36 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:43e4:39a6:e147:9926])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm217803345e9.9.2025.08.06.23.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 23:23:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Thu,  7 Aug 2025 08:23:25 +0200
Message-ID: <20250807062327.1637333-3-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
References: <20250807062327.1637333-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754547816; x=1755152616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aV7qrI0TbcIr2/PmKcWOlm9pzyc78WmH7oGVy/JkdY=;
 b=yEvD2hOWHKDzLM9nyQOBA8mHr8bqtTaErzjcAJeAj/RTTnMpi5nlB2Woa7hKsItWer
 dTPCijSD+zw7Hv112EsfG+rITtC5zpGmAG+nK6AYMr69UuVDurmt68kriRygy/hykaYH
 CqCh+3l52BBMOTE5oyYislBykoWizI/x/SC8o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yEvD2hOW
Subject: [Buildroot] [PATCH 3/5] utils/generate-cyclonedx: update
 dependencies generation
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

dependencies must contains only direct dependencies of the component

https://cyclonedx.org/docs/1.6/json/#dependencies_items_dependsOn

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 7fa369d7c7..1f601aecd9 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -236,10 +236,9 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
+def br2_parse_deps(ref, show_info_dict, deps=[]):
     """Parse dependencies from the show-info output. This function will
-    recursively collect all dependencies, and return a list where each dependency
-    is stated at most once.
+    collect all dependencies of the package and return a list.
 
     Args:
         ref (str): The identifier of the package for which the dependencies have
@@ -254,13 +253,11 @@ def br2_parse_deps_recursively(ref, show_info_dict, deps=[]):
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
+    deps = deps or []
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
         # Only add "real" package dependency
         if show_info_dict.get(dep, {}).get("real", True):
-            if dep not in deps:
-                deps.append(dep)
-                br2_parse_deps_recursively(dep, show_info_dict, deps)
-
+            deps.append(dep)
     return deps
 
 
@@ -331,7 +328,7 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict))
+            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict))
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(filtered_show_info_dict),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
