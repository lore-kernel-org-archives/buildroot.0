Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CCBCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 07:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4CCE80F5B;
	Mon,  2 Sep 2024 07:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYNxx66HBCO3; Mon,  2 Sep 2024 07:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EEBB81028
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EEBB81028;
	Mon,  2 Sep 2024 07:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A91381BF33B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 07:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A30A8402E7
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 07:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gR9MsYqApJrW for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 07:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 673B940131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673B940131
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 673B940131
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 07:41:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bbd16fcf2so23948375e9.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 00:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725262875; x=1725867675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXdm54JQNIqgl3VuBrE5xN3/+r/tUNP/soME+SFsqlg=;
 b=huqfwqwo5uABMYwLPS/SWCRJl1FAmlvSPnv7b43w1Jpl3/lOnyWTCFBTsYVT+yOgfF
 XIIggCmgX8A+9fyaiaAhHcBxSWATXxDyvh87MJyhHo/OF1KicOagbdwucgjRQqe64FoV
 IgSfv+2EvwK6AzKVKemFOk5sjdDE9aHc0bZMjZP2HwYgvNYYXzDGYcg+QK8HToCfPqM2
 OIOvgUL9c4IxCC8bkPkWa0W5R1euIxt++SP/1q5gDlzLhSJpKzbeVx0217Q3mnCixi6a
 yvFKFhTW0tCn2WZUD/PW3j16tVIGV0Ez4Dm8oMeekFxG4XgkzUaG1to+LCy6DH4BoCWQ
 o57A==
X-Gm-Message-State: AOJu0Yx9LXSgw/E18XBJQNYGF08P51kp5UliBDHCix5L1za14FBOAZx2
 aa1pC3Xih1As3kT9pSj7/m+P7GAtvsvRWNYUr526LbWcIJAoPHGZ3wy6E8G7DCgCZlEvCZE2J6v
 STwo=
X-Google-Smtp-Source: AGHT+IEeZz0aRniE1i/KL516Hyuuk4frZRVGlR7arF+yJ8teA0cJJSDF5wVKa5HbO5hHt9ZK9NVR/Q==
X-Received: by 2002:a05:600c:a088:b0:42b:a3bc:8fc2 with SMTP id
 5b1f17b1804b1-42bb01fd8c1mr83798025e9.37.1725262874559; 
 Mon, 02 Sep 2024 00:41:14 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (93-35-133-65.ip55.fastwebnet.it. [93.35.133.65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e355dfsm127989565e9.46.2024.09.02.00.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:41:14 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 09:41:09 +0200
Message-ID: <20240902074109.50173-2-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902074109.50173-1-michael@amarulasolutions.com>
References: <20240902074109.50173-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725262875; x=1725867675;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXdm54JQNIqgl3VuBrE5xN3/+r/tUNP/soME+SFsqlg=;
 b=nkQ7Txz9OHb4CpPuTqxjyscHCJORuNHrjqpsC74hZGGBvDUTZmtAN5hBvjQ+MzF6Vg
 Cdp0zujqYfhS4jfpVIZVfVvA38bJQ711WAgeNKggYuk7tRpi57vvj4eKGZjiLd0caSzt
 8a5usRvvKilanvmWFWxrPs3jN8WDsuXAUacXU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nkQ7Txz9
Subject: [Buildroot] [PATCH 2/2] scripts/cve: Restart the clone if the pull
 generate an exception
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If we are not able to pull from the directory, restart from a clean
clone

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 support/scripts/cve.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 7d115a28b5..b205b72e65 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -21,6 +21,7 @@ import datetime
 import os
 import distutils.version
 import json
+import shutil
 import subprocess
 import sys
 import operator
@@ -69,15 +70,21 @@ class CVE:
 
     @staticmethod
     def download_nvd(nvd_git_dir):
+        done = False
         print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
-            subprocess.check_call(
-                ["git", "pull"],
-                cwd=nvd_git_dir,
-                stdout=subprocess.DEVNULL,
-                stderr=subprocess.DEVNULL,
-            )
-        else:
+            try:
+                subprocess.check_call(
+                    ["git", "pull"],
+                    cwd=nvd_git_dir,
+                    stdout=subprocess.DEVNULL,
+                    stderr=subprocess.DEVNULL,
+                )
+                done = True
+            except:
+                shutil.rmtree(nvd_git_dir)
+
+        if (not done):
             # Create the directory and its parents; git
             # happily clones into an empty directory.
             os.makedirs(nvd_git_dir)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
