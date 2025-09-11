Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A0CA1016
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 12:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661F7411C2;
	Thu, 11 Sep 2025 12:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_BOA4SgkdVQ; Thu, 11 Sep 2025 12:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7880241190
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7880241190;
	Thu, 11 Sep 2025 12:12:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFAB8443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C686383F6E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z22emBsG25-h for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 12:12:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::164; helo=mail-lf1-x164.google.com;
 envelope-from=anton.bengtsson@plejd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A213C83F55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A213C83F55
Received: from mail-lf1-x164.google.com (mail-lf1-x164.google.com
 [IPv6:2a00:1450:4864:20::164])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A213C83F55
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:12:50 +0000 (UTC)
Received: by mail-lf1-x164.google.com with SMTP id
 2adb3069b0e04-55f6bb0a364so734916e87.1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 05:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757592768; x=1758197568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rNa+Bul+d50IM6lzJB2lB/1C8FIm6PxH+5am8e+/Cck=;
 b=Nr5YZYE364muv47RWz6FBFTCfs1jZCX6ccMKq3rcOa90kQbU3qg8imENeger9iogau
 13m/xnwBmo3mQBKHNqpOPgLsT8xbJipmbiN5+50hyStGhra10WWROH1xXNjWk+L9j83j
 k7d1xXzmsMT/Q8+kk4aCJ9fnk9HXts2bbVblBVa5FGxEX1Wl5ajjxz64y8GAFAJedMIL
 OnYHvyGximrFgSzVU9M3c9ZPlA7oWMl0ddq2KlJ1pAwUI/68cEeT5Ex66mDz9Eb5h6VI
 gMQLRtfGknSLpcWP+4JMUh0jVBEoBQbiWKq2lhDMkmSGhB5OZ/Z+qZr/btt4wBkciXyD
 XMXw==
X-Gm-Message-State: AOJu0YyEzhGbPYVvVpVaivi1IMPc1r6ixeXLo1VlFwm7cI/FaBL9D4AB
 JO/ANObpzmf2PBKCihY5DcrMsGpSSgIJkw0vxjVhPeT7J1ICBRVC2gBHOvWlef0ZrShW7NUzK2/
 Mo8N8H/g9BJ808VvQnMtId6waa2Z/HEkXPaNWb0Ozz8VW
X-Gm-Gg: ASbGnctkQsJv+oXWAETjJ7Bl8auOzZ74oGAWHBKHNfNLXD5wGMsMXFsH1CZSDDJEMvD
 rC75LhAm9TY4X3M6ATBviiWAlJeeA3D3tI8zsmTrvz+9oVDz3RxmSVmiwvkQS+QbjRs1zFtoDWc
 cCQ6Kl2RrUYDD8LAICoP+rC+ga1TTw1bBpFRuIjY3pn3IZ1DwobSYeoBH0mDRUubXU0WI6K+HTl
 mHmZ1yWGAcmXZ9LwGxwlyTTAhcNfJDsevThsBBQVXhbjLutHPacszcbMd2rah7kMV7/Xoim0QL3
 VVAS1cNdmg1L1yVg9+9ocUUKHyNw44MXVUQS87CqFR33wikHTcjAvrvzyiY+ZqVfj+f63CO4N43
 3f6OMD6BWw7hksDuK
X-Google-Smtp-Source: AGHT+IH7BvQV1mEExOYY+VVKGdoVu0RoXS/QLR2RdMPcM66z5owEVHwMgaaQuFWqoz2yQGC453VPpCfRt9AY
X-Received: by 2002:a05:6512:b1c:b0:55f:4746:61ed with SMTP id
 2adb3069b0e04-562601b50b8mr6072033e87.22.1757592767931; 
 Thu, 11 Sep 2025 05:12:47 -0700 (PDT)
Received: from anton-b-thinkpad (h-213-164-192-18.NA.cust.bahnhof.se.
 [213.164.192.18]) by smtp-relay.gmail.com with ESMTPS id
 2adb3069b0e04-56e5eece8e0sm319476e87.43.2025.09.11.05.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:12:47 -0700 (PDT)
X-Relaying-Domain: plejd.com
To: buildroot@buildroot.org
Cc: Anton Bengtsson <anton.bengtsson@plejd.com>
Date: Thu, 11 Sep 2025 14:12:35 +0200
Message-ID: <20250911121235.3062715-1-anton.bengtsson@plejd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=plejd.com; s=plejd; t=1757592768; x=1758197568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rNa+Bul+d50IM6lzJB2lB/1C8FIm6PxH+5am8e+/Cck=;
 b=WvzuiD5dDPZIZFv5sG51NAyC+e4xQg9+LzGOP07kHDZxgE6+Q0EKm1pZQmGxcI9Hi+
 dyOgcyqVXuTnAVLZ0GWFfcYb5m2v96jkTYfWUQWegKA4IRK5jQYR/milYG9MDZA3W2Ue
 6qX4l10N2GAM3YpzNTB8yo7C7ISSK06mKIZto=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=plejd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=plejd.com header.i=@plejd.com header.a=rsa-sha256
 header.s=plejd header.b=WvzuiD5d
Subject: [Buildroot] [PATCH 1/1] support/scripts/cve: replace distutils with
 looseversion
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
From: Anton Bengtsson via buildroot <buildroot@buildroot.org>
Reply-To: Anton Bengtsson <anton.bengtsson@plejd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package 'distutils' was removed in Python 3.12 (https://docs.python.org/3/library/distutils.html)
and looseversion appears to be a good drop-in replacement for distutils.version.LooseVersion,
see https://pypi.org/project/looseversion/.

Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
---
 support/scripts/cve.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index ba41762fa0..63372c3273 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -19,11 +19,11 @@
 
 import datetime
 import os
-import distutils.version
 import json
 import subprocess
 import sys
 import operator
+from looseversion import LooseVersion
 
 sys.path.append('utils/')
 
@@ -190,7 +190,7 @@ class CVE:
         by this CVE.
         """
 
-        pkg_version = distutils.version.LooseVersion(version)
+        pkg_version = LooseVersion(version)
         if not hasattr(pkg_version, "version"):
             print("Cannot parse package '%s' version '%s'" % (name, version))
             pkg_version = None
@@ -202,7 +202,7 @@ class CVE:
         # version, as they might be different due to
         # <pkg>_CPE_ID_VERSION
         else:
-            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
+            pkg_version = LooseVersion(cpe_version(cpeid))
 
         for cpe in self.each_cpe():
             if not cpe_matches(cpe['id'], cpeid):
@@ -214,7 +214,7 @@ class CVE:
 
             if cpe['v_start']:
                 try:
-                    cve_affected_version = distutils.version.LooseVersion(cpe['v_start'])
+                    cve_affected_version = LooseVersion(cpe['v_start'])
                     inrange = ops.get(cpe['op_start'])(pkg_version, cve_affected_version)
                 except TypeError:
                     return self.CVE_UNKNOWN
@@ -226,7 +226,7 @@ class CVE:
 
             if cpe['v_end']:
                 try:
-                    cve_affected_version = distutils.version.LooseVersion(cpe['v_end'])
+                    cve_affected_version = LooseVersion(cpe['v_end'])
                     inrange = ops.get(cpe['op_end'])(pkg_version, cve_affected_version)
                 except TypeError:
                     return self.CVE_UNKNOWN
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
