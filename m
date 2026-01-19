Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0086FD29C33
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB96E40CEC;
	Mon, 19 Jan 2026 15:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hN9q_rPkhx0s; Mon, 19 Jan 2026 15:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF82B40C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768835815;
	bh=O5ZdEDMovejbvqqoeFOfSbQIrNF42qYCrSYCcupg7pk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sov/ZUWMVgo88bDwdUpyA21jdmckdfxd3ETq/UsIrokyznhFRKT4F0zNTnV0jKXyW
	 PGsm7LhnJtuep9nVhy0nVl5Km/cO8E8LO4NJrikoiiHoHILLX1WlaN3RKIlWSvw4oq
	 0lP8UTQV8M+Ib5Qfk5D9ZLud+WQLEC0aAiBmCiYTnPOHgrUaORWFkU5px/qIkdHTtN
	 3Jj8fOhwI7JV/gItIbBWnRMcYbge3cQbdw1EleG5bmk/zymQjydI8YZDGYtbBSUYZ7
	 FIMp5RhDT1sWuee1eT6/XTQgT0SFc/zxMOQjlZBC3uaP6LMqyk6C3g1v7Q3ZYCkRVy
	 MTZOnY2pm9tTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF82B40C0F;
	Mon, 19 Jan 2026 15:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 762E92A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0EA611F5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28qHvHbZdU2D for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEEEE611F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEEEE611F4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEEEE611F4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so31634275e9.0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 07:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768835807; x=1769440607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SknJstgc2n2XpmTFu6Q3Xb1ysmleJnnveiHkYDZe3ts=;
 b=r0/KWzx3PJnuwdzBeoyy936x/o8541icuVCcyLkO2tnZHX4jgSVPI67BHNaSGJ8w71
 +sHdo0PoCk3hW07uLK9pwJe9tQYCLushdF+GSpYqwjvBaZQc3KgjImLRFTmq8vFXCr0n
 30zphzyRepYzDNmP8EmbbzB47V1pc70H5jmengjcNQLZuiKIbfAoPworw4EiIPJpbp04
 BFb448tTOr2D8UMQtzJi2YdYveoBYZ6DToYeW/ECcf4n8GRaJdWn1pjurA0m1qIX9eF1
 3lM/T8WIvCTHzD/opn5tSEKu3j8wHzQOFZGkCOCwyOWDcAMKIXoy3sHaVtczvmVqQzHH
 U+Zg==
X-Gm-Message-State: AOJu0YyzrFuou6WxomsN+SiShZcnNYq9hWZB1qDoFAeWA3cStubSowOq
 /oTh0wuLbMy/0TGZtY/sSnZJvGYeHhJzwNCES7noUrKaxxchVGLLvG0FX6TCrpxU6bqlPhUOGw2
 Ut78b
X-Gm-Gg: AY/fxX7KiVLgj1Q2UvhZMgnLjeCFKjxhvBi+K2oIAO5Wh44qL5MoEVElDQrc2VdBSWX
 Pisd/pZEA/A2Di7vVLlmbRH+cVY7r3ny1yGQd/klDIYB9wFYp0qqJks4Gm36K5R3Et38oVqN4N3
 rNJ5sAqR/hzScPeDX62/5SENX9YBmjCQcfzeUVVlOWm2nzG7GgbGLZuKVdRC7Jn2Uxz9xmavx35
 Au3osUSeYjXqm+r6zJBUhg3G/MROjE4wadazi66bVdok+g1KJ+ltje53GEdAwmc4ok6o2/jRrtv
 6g0EvOW3VmV6tBdLhw6ftF0AYglFELI6aIqnYIvAgYSlWCc2HDsmwokE1+SkpmwtT00PN6GENYz
 ZguF4cexwMRYiMEUde9N5kpHFLTg/+nezHY9m/sRqwhwXnzg/H1CY9xrJuikaAGeMTiAiqsgJB9
 ur5gZEc30WjWDEBFYg8JYGCdOK8N7DHf7tVvVJ69aHp35N8NC9
X-Received: by 2002:a05:600c:1910:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-4801e67bceemr149651635e9.13.1768835806921; 
 Mon, 19 Jan 2026 07:16:46 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm253324295e9.6.2026.01.19.07.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 07:16:46 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 19 Jan 2026 16:16:40 +0100
Message-ID: <20260119151644.100529-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119151644.100529-1-thomas.perale@mind.be>
References: <20260119151644.100529-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768835807; x=1769440607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SknJstgc2n2XpmTFu6Q3Xb1ysmleJnnveiHkYDZe3ts=;
 b=UGpXhK+09Vbij3J22jktnnm+61C+EFj+PN8Xg8qkfJOAjBv8nFNw+fTZuymwaSIxNR
 VvbtaRU3gTcQng7yll+VnJrWnPrU5kJ/hcRnE//7WhPZWlJWQTWpbIycAlePfW0nHuvP
 5GEpZfuxNc0TosG1OI0v5l78MI0d9nS1bBYfERKS6nOURPDBbV4TRWGhV//6+GoEs/jI
 W5yMwPGrh+lD3D/RsMUFOgWQx2Or2lbW3HQbnD9gbLTFWiPQou4LWu3pJVh4qs/dDqgo
 63ZOqcu8IJ2PM17oCiVaPqRFQHSZmddhKt1jODej2dN5l+/U3qXSvy9+k9PxqA2VcXfS
 l3DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UGpXhK+0
Subject: [Buildroot] [PATCH 2/6] utils/generate-cyclonedx: use direct
 dependencies
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the introduction of the `generate-cyclonedx` script in [1] the
dependencies were 'recursive'. This means that the dependencies of a
package dependency were included.

The CycloneDX spec [2] states that only direct dependencies needs to be
included.

This patch drop the recursive dependencies.

[1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
[2] https://cyclonedx.org/docs/1.6/json/#dependencies

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e864edf181..04ce8fc3a1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -337,10 +337,9 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]
 
 
-def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
-    """Parse dependencies from the show-info output. This function will
-    recursively collect all dependencies, and return a list where each dependency
-    is stated at most once.
+def br2_parse_deps(ref, show_info_dict, virtual=False):
+    """This function will collect all dependencies from the show-info output.
+
     The dependency on virtual package will collect the final dependency without
     including the virtual one.
 
@@ -350,18 +349,14 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
         show_info_dict (dict): The JSON output of the show-info
             command, parsed into a Python dictionary.
 
-    Kwargs:
-        deps (list): A list, to which dependencies will be appended. If set to None,
-            a new empty list will be created. Defaults to None.
-
     Returns:
         list: A list of dependencies of the 'ref' package.
     """
+    deps = []
+
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
-        if dep not in deps:
-            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
-                deps.append(dep)
-            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
+            deps.append(dep)
 
     return deps
 
@@ -429,7 +424,7 @@ def main():
         ],
         "dependencies": [
             cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
-            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
+            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
               for ref in filtered_show_info_dict],
         ],
         "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
