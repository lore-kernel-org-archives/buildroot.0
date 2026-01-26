Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB61D13C01
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 13:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3691E402D3;
	Mon, 26 Jan 2026 13:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJtmpeQ4q1lI; Mon, 26 Jan 2026 13:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 637F4402D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769432664;
	bh=O5ZdEDMovejbvqqoeFOfSbQIrNF42qYCrSYCcupg7pk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MWkmY3uBSZQkV2JrVgLEpgFnVRpebZGwDAgfjzdtK61N6r1u8nadZzmbiqGcSO3tJ
	 jDnJ/0Y44jI9JMxe7bkCVguYMeV7O1GpKMozPQU4XjK77fBBPdVr8J6S8rH3klM0mv
	 pOADqLbvcw0ePcrhmmytkrZeVYCO4Uwlv/xvUfOL/4e6TGPgu6QjpN4C6mej6Kxwnf
	 h1cUiFKajvNTdeLxU4hMFJB3EVgLAT89lgi3xCibSE6Fjha4whoC2DA+LOODcGeV+6
	 jv6+qHPcOu+b8QoHr85C0zgLvgy8MVchdFBbMxKAVllRftDcHj7q7zHfDb2havfdET
	 kTTBXzDiSH+0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637F4402D5;
	Mon, 26 Jan 2026 13:04:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A3121CE
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 296FB808AA
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Bt3L8Xdu08t for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 13:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41D3C80894
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D3C80894
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41D3C80894
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:17 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801d7c72a5so33747525e9.0
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 05:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769432655; x=1770037455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SknJstgc2n2XpmTFu6Q3Xb1ysmleJnnveiHkYDZe3ts=;
 b=jQ+3xDcMFjzrYssj65ABD09s6cQsHEUf4cFHqMgTho57u97aXrgUiWFriuzEirOida
 RPpWIJuSYFBpzM5dB/pq24zz9+bT6nsCeBbnsaZAi1R82dGGZjpdOTQ2gK34Lq16bLUH
 +Z5je7R3XmN4Rw8aKQ3iEvlvIkODNC8g1mH0LwDNfuUCqB9uoGkW779WazImjxIT4ZlG
 9dR0II7ACiBWN165YoKsMc8JXkcQyn8I0biNPojiLqN1UZ6JlkSy77Qo1wK+++j5eEg9
 BGkipTjGZVggX7WgEsbt98qIdsb26+z0rc2fZrFPGmYJohvYHbijtBPmzydGsTp82N/V
 XZhA==
X-Gm-Message-State: AOJu0Yw0TRO2FJPBL2LPZ8bjom2YJEOjCLhFXxnrqWa06A4kf47kbbgR
 nHt4FpvVNjsgBNBdxdF/vH7dY6o6/RAjwA9roYlcFOaWY+Zm6yBo8+fUXGtApCVEFXNJcmVysT+
 IGz/y
X-Gm-Gg: AZuq6aIEY+3guFXMLexM/2oSHDQ/uMfkd+4Mmrk1PRnUZLogeplRk9S7W9ra/G/+OkI
 G5X7oNuCm8kg2AalmDNKgKugIGisKi/4MNSJcZ+f+EOdiBD3MkktpH9/YBlDdVbXOtAsQeJ76Im
 aP1Ux59b3yVBL1iVdE85vPDZ4yK3HD4ET8R9LdZtgugdl9E4JedPi3aBsX8PdJ2bppvMH90Uk8+
 WyB7AUmVqyaprFQekqyd1dQ715CZgJs+9SQJP4wf9k4ReK1n+BMMfc/OJhcQW/8YED58VVCKk8/
 c78wqBEXEX2IkgXCHHUMYJII2lrz2VtE/zZmM28GdN2PQ0khad+0p4fIdxVLMPDKw2WcHkDwCNZ
 H6tiHjzvCwrtPGkqyQFb0dPRwFS8zSX3m+mSZvt0HsKH35y0boraHijKHFW2K28Uk5tTSqGS6Ou
 V/G/nRY/gpsYvqs5ZKi9ZOFQQ3G9sddI2A/sem2JFignAIoCJr
X-Received: by 2002:a05:600c:5247:b0:47e:e779:36d with SMTP id
 5b1f17b1804b1-4805cf5fac8mr69884015e9.23.1769432655409; 
 Mon, 26 Jan 2026 05:04:15 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470cf1acsm359603435e9.14.2026.01.26.05.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 05:04:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 26 Jan 2026 14:04:12 +0100
Message-ID: <20260126130414.59175-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-1-thomas.perale@mind.be>
References: <20260126130414.59175-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769432655; x=1770037455; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SknJstgc2n2XpmTFu6Q3Xb1ysmleJnnveiHkYDZe3ts=;
 b=G2w/MUxdnQCgHYAkReib3ezi4nwKua0KB1j+JvnrL/QOKRCnl93Z92kyK9LT5tf5PZ
 o/NzdfNbFj3rT1cixrQn5+Hx5WdhFLujM1q9D6AIKyTSjXKB7jjOF/Sdad1jCl6VO+j9
 6cKEnnbS+xVlTfvlyypaGcG3AV1uXSJkIuuNrCR4XKWSOVPwm8WgJt5Uq5fJoxiEhmEr
 9QwcdvhpXUHynWlcVbj1jCWIHeLI1Uy0xOzW0+gHMLy4kQ1RLUnL+VNGml6Y3klA2f6b
 3CckwheQbApt8k2NBibyb3/R3HR0LzSRTMNhCU28zEKWEDkk9WozdvXhVrJxZ7XTi60e
 jEmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=G2w/MUxd
Subject: [Buildroot] [PATCH v2 2/4] utils/generate-cyclonedx: use direct
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
