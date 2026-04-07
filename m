Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E007FF512E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD1140C25;
	Tue,  7 Apr 2026 17:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DW3LnBD8rzSX; Tue,  7 Apr 2026 17:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C67640C32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583442;
	bh=Yry/kkUZi512H+ED7uALZvxRunyb7gT1xS0FcbB9E0o=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUKZJksJR+2InmMvzZBxj5mpkhT4LSJ2iUWDdGCMbvN9x2ihPxVbxWnuYgxHYRUlZ
	 31Ux0YBJCatnwPjFAhwFHyd92KFny0fovcIHkd+OV+GWOjLD+w2Tx9JQWYlSb5zXPm
	 mSmvbam9PMw3DHcv9VAY24Z/i6bK3HhCgwP++gaPxCWmhxhGvqyerjyViFSlNaPLrD
	 lbWqR3YICPE8WJc8g6k90vjCFRZQrf/NBff2lpaJQ6Q+9FOzV45sgAQ09Cdg9yaFvF
	 7/1VUy8ouQLRMDfQxKJVNuBSo4oYUVPajsqnxQmHgrvMOXG7Jt8VVFCprLuUeD9q1f
	 32quPJ7KZI+WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C67640C32;
	Tue,  7 Apr 2026 17:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FA882C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10FE860642
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6X8Lwg2_8Yxw for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.14;
 helo=smtp-190e.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F8C260DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8C260DC6
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch
 [185.125.25.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F8C260DC6
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:37:17 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fqtgH4fgWz8mB;
 Tue,  7 Apr 2026 19:37:15 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fqtgH0jdmz1hs; Tue,  7 Apr 2026 19:37:15 +0200 (CEST)
Date: Tue, 07 Apr 2026 19:37:08 +0200
MIME-Version: 1.0
Message-Id: <20260407-generate-cyclonedx-br-v1-2-03c45ccba2ed@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
In-Reply-To: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1775583435;
 bh=lQ2TgqAul7QHXgCy9/+A6Ob+iGNdKvufhgvB1Z3dDUM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aXLj/0nBXdeu+3F/0GZp9C9RgwPmrR/ZUs6AwpxgYr2udJmLqfve9U7a0STs4f85N
 3XwV1k/U4b+Dshl7PY/2AuXLcQH+b5Z0bjajgvUNZuV6QKh4xNijxO8+m2+HBcBvTl
 DJhvGP4i82uQHltso2xSqwih5+5u7LOMIYBv/FegT6p2f2vXcLI4momOC4L7CCuyYu
 yDJiVp05MndAT1av7sPuRIL/KYa6iZQ5NTKNvd6biT7ivX3UFyOdy1Ip0rFVBnGLJK
 B9+zlwK4UOD36ILtZ5JHgd9FtZptTQIW6227Gi/aJUlivQnX4rSAuBT3SVPH7TjPcQ
 JiYTZzqNcyuSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net
 header.a=rsa-sha256 header.s=20231125 header.b=aXLj/0nB
Subject: [Buildroot] [PATCH 2/4] utils/generate-cyclonedx: better error
 message when host Python is built without ssl
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

urllib will eventually complain that it does not know what https is:
Traceback (most recent call last):
  File "/buildroot/utils/generate-cyclonedx", line 53, in <module>
    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 212, in urlretrieve
    with contextlib.closing(urlopen(url, data)) as fp:
                            ~~~~~~~^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 187, in urlopen
    return opener.open(url, data, timeout)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 487, in open
    response = self._open(req, data)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 509, in _open
    return self._call_chain(self.handle_open, 'unknown',
           ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            'unknown_open', req)
                            ^^^^^^^^^^^^^^^^^^^^
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 464, in _call_chain
    result = func(*args)
  File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1397, in unknown_open
    raise URLError('unknown url type: %s' % type)
urllib.error.URLError: <urlopen error unknown url type: https>

It's quite confusing really but what it means is that host Python was
built without ssl support.

This adds an additional check importing _ssl and if the module is not
found, tell the user what to do. This still doesn't make Buildroot's
host Python3 fully usable for utils/generate-cyclonedx as it'll then
fail when trying to validate certificates, this will be handled in the
next few commits.

Note that ssl Python library is always built in CPython, but itself
imports the _ssl module which is the one that may be disabled with
py_cv_module__ssl=n/a (which is what happens when
BR2_PACKAGE_HOST_PYTHON3_SSL is not enabled), hence why _ssl is checked
and not ssl.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/generate-cyclonedx | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index d17aa805b7..045bf14caa 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -9,6 +9,7 @@
 
 
 import argparse
+import importlib.util
 import json
 import os
 from pathlib import Path
@@ -42,6 +43,11 @@ VULN_WITH_PEDIGREE = set()
 SPDX_LICENSES = []
 
 if not SPDX_SCHEMA_PATH.exists():
+    if not importlib.util.find_spec("_ssl"):
+        print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
+              file=sys.stderr)
+        exit(1)
+
     # Download the CycloneDX SPDX schema JSON, and cache it locally
     cyclonedxpath.mkdir(parents=True, exist_ok=True)
     urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
