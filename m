Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7529910BA432
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 06:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E4380AA5;
	Fri, 27 Mar 2026 06:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrqjuFjSh-Xp; Fri, 27 Mar 2026 06:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4982180385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774593886;
	bh=qlZdJZ6D5wx+/S3EnhQEHFm10pNJTNhBJ9fJ6iKRxTM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oUZJxZn/ut92cJs3205t/Sot9Ds2AxB2W7eATpcju+wur+UVU2bIjSBtpNPAPC6EP
	 MbupU7w6eoGYcKfeOt0PVM8V/nAhCMedEqlb69socKeAikBmR1LV3PbxGptSNNblK4
	 /RJRwqp/aZgiQuXl6EfZLsvXlKnxWRR7apqxHZhiotOM92Vx99rAuzFIpfM+se1mc7
	 jc/idjKxRqqKFZRyu4mYD+d5+fE90l2qzxhcVgh49DPAVQtu4CeJVAVE673mFGyorR
	 XClodhGNhNoPXB0jGTw+6g1+JT2iYJM88AxCKQS7TWzVmHqgpU3jY4Eez7MJzlt6lU
	 d5lOhGMhm+TiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4982180385;
	Fri, 27 Mar 2026 06:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F171D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 06:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C693340615
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 06:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMEyCFvpy1TO for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 06:44:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A167C40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A167C40126
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A167C40126
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 06:44:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so13976675e9.1
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 23:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774593881; x=1775198681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RsNC+AXvT6qI7KnNQQDPCYNXXMOSTqkefhmEijwkeso=;
 b=S84JYkdSDetXesyGf2XZ+CD+G48zOGi6ZpeOmSlB/162AVJokbIgIzOwab44KjZr87
 Wt741bg43FeXbGsnS5NEfEizDcAwWX/QCOpyw9EwqoMm/g56t0YFEhRHaR24KXcXprt1
 jZ4mL0rMhlm+rCrLRFebKqMaa5UfDzJ1hXs2WTDxyjhwbYlWLrSqYgysT0P1hYwyBPOp
 3reWtqDhjrIFxkGd/EGxDBJcMvrYdTvX3jAIWX2p5DXu1L7kKifEP4Fx3ZDdkSGhNOmP
 Ak46XIcFIY3VGY0GddO/mcTai5DRDpJl573MUDJy+CENpHgT8CIISeTWUQyVThl3+92F
 JezQ==
X-Gm-Message-State: AOJu0YycZAlgnaURo3crGzzz1MwKFI/UHJEmPNh2P7++gx30O2t9JVlP
 WHJvjHsP4cuVmsDScN3Jd883Eww4TP+Eu3lm5wG+EECdj8taOpctpIVeSEP3CQ==
X-Gm-Gg: ATEYQzys3bnJyNLn2JWSB14XFj6lsb/6iZzcPf7wJo/rgiKzrF/OXOegcaAiSX/vMVc
 Hs5WpxcaCZDE2/8b6db+zTjfUSVOH41I/1Q7iRQ2X6dWo20qHGuGsG51qW5LYBEHzpRWjcmkwMy
 mHPM1HrqFD4wqVWHJ6wGbGnHxSwzN0oz6VD7C9RHN/JJSQFL6G+JG9Yuf69TmSOw8rolVEYixUe
 UjFCDmODUGQQcGOA6z9im+vS3s9D64vANmJmhUnOKAH7QfiJHk7iLG9mzdok7nyDzr+YtvafDsW
 YJk8TLflI0g16IsuiULfZQP7lkBDxiqOXgM6rO3YgZWSPaWzj/+IPDikHY2db58gV1jGiV63M0t
 x3SqcuHdKrraXUIy24ZFCMwc+wSjjk2DC0K85WeGHjlpSezM88hd30U5RmfIWKQ/AbpOmny9gMs
 ARV2nimGWDSEiqtlXVju+VMuNP6TxTO0BjNFbyyr4QjcaEZLUDG3WuwypjUi+0swMbAQ2lHmwo
X-Received: by 2002:a05:600c:8b63:b0:482:f564:d613 with SMTP id
 5b1f17b1804b1-48727eafa46mr18212375e9.15.1774593881036; 
 Thu, 26 Mar 2026 23:44:41 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4872712b268sm9664725e9.16.2026.03.26.23.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 23:44:40 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 08:43:54 +0200
Message-ID: <20260327064354.5892-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327064354.5892-1-flaviu.nistor@gmail.com>
References: <20260327064354.5892-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774593881; x=1775198681; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RsNC+AXvT6qI7KnNQQDPCYNXXMOSTqkefhmEijwkeso=;
 b=FfnKeg0o3qr5a1wxLkulEz0pEaqy7qIqbiT1mAR1M3pRH9B+viSadHqkPy/kcMxNp5
 RJUoeQu7gA/rKO9hw1XOlCCkZ1S0t4ahLI1f/LzqAi1CT0Ltd2haIQKsSqesNS0VAlos
 jQ1f1SZFR8k5dXtSZfdajQbWOE46wdrInHmhr0FGlMbMp8nt4zQ76ebTDliIj9onhrVP
 9VfLf/fKpYWj1wBuG2XMfwzrkAp2E8r6gmyZW7vwULG2FIPYlBLlcm2iXHaCwYENe+sO
 bGc/Mlwb3wz5Hdd9LKpusA11sndnDOjxHdisIMgdP42frmKOJfzM3mmnQntWhQFkVq9Y
 8wcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FfnKeg0o
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: workaround for pypi project
 names
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a dictionary for buildroot packages that have a different
name compared to the pypi project name (e.g. smmap2 -> smmap).
Since it is not intended to change the buildroot package name,
this is a workaround in order to use the scanpypi utility for
this packages and still get correct generated files. Current
packages added in the dictionary by this commit are smmap2 and
gitdb2.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 utils/scanpypi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 61879e39d4..09899bfe0e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -189,6 +189,14 @@ class BuildrootPackage():
     create_config_in
 
     """
+
+    # Dictionary of python package names to their actual PyPI project names
+    # Used when a package's buildroot name differs from its PyPI name
+    PYPI_NAME_MAPPINGS = {
+        'smmap2': 'smmap',
+        'gitdb2': 'gitdb',
+    }
+
     setup_args = {}
 
     def __init__(self, real_name, pkg_folder):
@@ -216,8 +224,12 @@ class BuildrootPackage():
         """
         Fetch a package's metadata from the python package index
         """
+
+        # Check if there's a PyPI name in the dictionary for this package
+        pypi_name = self.PYPI_NAME_MAPPINGS.get(self.real_name, self.real_name)
+
         self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
-            pkg=self.real_name)
+            pkg=pypi_name)
         try:
             pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
         except urllib.error.HTTPError as error:
@@ -225,13 +237,13 @@ class BuildrootPackage():
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
-                  .format(pkg=self.real_name))
+                  .format(pkg=pypi_name))
             raise
         except urllib.error.URLError:
             print('ERROR: Could not find package {pkg}.\n'
                   'Check syntax inside the python package index:\n'
                   'https://pypi.python.org/pypi/ '
-                  .format(pkg=self.real_name))
+                  .format(pkg=pypi_name))
             raise
         self.metadata = json.loads(pkg_json)
         self.version = self.metadata['info']['version']
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
