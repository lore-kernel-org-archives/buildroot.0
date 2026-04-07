Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3843EFF512C
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0671740583;
	Tue,  7 Apr 2026 17:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3YRR4k3BsNX; Tue,  7 Apr 2026 17:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF0840C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583441;
	bh=p1End3LgdGLgZt9rt9Lgi++ke21a72sWd/UTpfmMX/U=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SlMufzScab3jFt3FUgPIS3Qb6Fn1/rfgpy9fWVA2SeLhpcpjvTDjG5FAkXww2zeJm
	 jyeZbSC+D9kYlBIzii6BqDPReYipA1cUq8LcXABKPTL4mLZ0oh0/8SQUm7sI1nF+Wy
	 EZZR9r35h8w1+oggNbzedLUVjMAOWlJkdYfJ0qEvHrf30GgfQPAhv8T/0ZbGBJkPfg
	 63cYSJ9mINWxZTLb9y1ZF3jCgNNhoOcYaeP8rVGRqMhu3WTbVRL9SgRPIWLA/mE0mu
	 UwAIUfzd0G4fZ0fC7pG3zxkRverO+Kw19Do+YIJmYb+ik4r8gkBSnTz3qO1ZKJkJhe
	 G5q4UCsExUyhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF0840C21;
	Tue,  7 Apr 2026 17:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E511237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848B7811C4
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9yCUQGts1Fn for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::42ac;
 helo=smtp-42ac.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8661281189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8661281189
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42ac])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8661281189
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:16 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fqtgH0CtKzBDn;
 Tue,  7 Apr 2026 19:37:15 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fqtgG3SHWzJ5; Tue,  7 Apr 2026 19:37:14 +0200 (CEST)
Date: Tue, 07 Apr 2026 19:37:07 +0200
MIME-Version: 1.0
Message-Id: <20260407-generate-cyclonedx-br-v1-1-03c45ccba2ed@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
In-Reply-To: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1775583434;
 bh=M12nU030M+gdaTdmzvpQGK3BOl4fZWgPtke/skEJdOA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KX5KfJPZhLKoWfitrE2zcZ1T1qHCic2GlW1ZANOEs4yPy9N/zQHxY09366VTMdIZZ
 U7TBqfcUxYnTd7u6De7ebDh6aHmFpIji63h2o4rqRXM+6p483cvi8t2NpgQv1/bgQJ
 y3/Q/c8KeLSth3eXjTMZQvOmXZ4Wtgac3ddnw1/MLatWr4oZztOOK/hQBCNrKKxlUX
 aXY/H3HAH+N0C5k/ZwiRHs7AYJ1SM7BULRkj/trKP03bsbndOQzZm2RnMxYM2biva7
 xZj7lxn/moM78v93aozo1+Sjg67nKTezpsEU9+wtZEEkTv2PR9KzrHcFjgWcTcZ74u
 95ErAGXvaag3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=KX5KfJPZ
Subject: [Buildroot] [PATCH 1/4] utils/generate-cyclonedx: remove "support"
 for bz2 and gzip compressed patches
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

Buildroot-local patches can only be suffixed by .patch, otherwise they
either need to be downloaded via <PKG>_PATCH or manually applied via
$(APPLY_PATCHES) in a <PKG>_{PRE,POST}_PATCH_HOOKS like in
linux/linux.mk. In the former case, they are then listed in the
show-info output with a full URL (prefixed by '<PKG>_SITE_METHOD+'). In
the latter case, they are simply not listed at all at the moment.

By removing "support" for those compressed patches, we can avoid the bz2
dependency and can now use Buildroot's host-python3 package without
BR2_PACKAGE_HOST_PYTHON3_BZIP2 to run utils/generate-cyclonedx (though
the initial downloading of the SPDX schema in JSON format doesn't work
yet, though that is something that one can handle with a simple
wget/curl to the appropriate place).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/generate-cyclonedx | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 35198a47cf..d17aa805b7 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -9,8 +9,6 @@
 
 
 import argparse
-import bz2
-import gzip
 import json
 import os
 from pathlib import Path
@@ -177,7 +175,7 @@ def patch_retrieve_header(content: str) -> str:
 
 
 def read_patch_file(patch_path: Path) -> str:
-    """Read the content of a patch file, handling compression.
+    """Read the content of a patch file.
 
     Args:
         patch_path (Path): Patch path.
@@ -185,16 +183,8 @@ def read_patch_file(patch_path: Path) -> str:
     Returns:
         str: Patch content.
     """
-    if patch_path.suffix == ".gz":
-        f = gzip.open(patch_path, mode="rt")
-    elif patch_path.suffix == ".bz":
-        f = bz2.open(patch_path, mode="rt")
-    else:
-        f = open(patch_path)
-
-    content = f.read()
-    f.close()
-    return content
+    with open(patch_path) as f:
+        return f.read()
 
 
 def cyclonedx_patches(patch_list: list[str]):

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
